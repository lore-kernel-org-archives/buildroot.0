From: Srijan Nandi - Gmail <srijan.nandi@gmail.com>
Date: Fri, 3 Jul 2020 09:59:08 +0530
Subject: [Buildroot] New user creation
Message-ID: <5AE4C154-18AF-43FA-A345-E048486EAC37@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am facing issues creating a new users. I already have the following set:

BR2_ROOTFS_USERS_TABLES="x86_64/users"

/opt/buildroot-2020.05$ cat x86_64/users 
# <username> <uid> <group> <gid> <password> <home> <shell> <groups> <comment>
test       8000  wheel    -1    =           -                /bin/bash    -    Test user

But when I check under passwd, I am not able to see the new user

/opt/buildroot-2020.05$ cat output/target/etc/passwd 
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/false
bin:x:2:2:bin:/bin:/bin/false
sys:x:3:3:sys:/dev:/bin/false
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/false
www-data:x:33:33:www-data:/var/www:/bin/false
operator:x:37:37:Operator:/var:/bin/false
nobody:x:65534:65534:nobody:/home:/bin/false

Is there something I am missing


-=Srijan Nandi
