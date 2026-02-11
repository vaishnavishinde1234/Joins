create database try4;
use try4;

create table emp
(emp_id int primary key,
name varchar(50),
dept varchar(50),
salary int
);

create table emp_backup
(emp_id int primary key,
name varchar(50),
dept varchar(50),
salary int,
action varchar(50),
action_time timestamp default current_timestamp
);

insert into emp values
(1,"Vaishnavi","DA",65000),
(2,"Tanuja","DS",45000),
(3,"sakshi","web developement",60000);

select* from emp;

DELIMITER //
create trigger trg_emp_backup_on_delete
before delete on emp
for each row
begin
	insert into emp_backup values
    (OLD.emp_id, OLD.name, OLD.dept, OLD.salary,'delete',now());
end //

select *from emp;

select * from emp_backup;

delete from emp
where emp_id =2;
    
    