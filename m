From: Srijan Nandi - Gmail <srijan.nandi@gmail.com>
Date: Sun, 5 Jul 2020 18:18:49 +0530
Subject: [Buildroot] New user creation
In-Reply-To: <5E7DB804-CAA1-4B54-8414-F13B3C7C8AF2@gmail.com>
References: <5AE4C154-18AF-43FA-A345-E048486EAC37@gmail.com>
 <5E7DB804-CAA1-4B54-8414-F13B3C7C8AF2@gmail.com>
Message-ID: <00E7C720-2916-4AB0-8DC5-EB9DF91799B9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I even did a make clean and make, but still facing the same issue. Can't figure out what I am missing here.


Thanks and Regards,
-=Srijan Nandi

> On 3 Jul 2020, at 1:41 pm, Srijan Nandi - Gmail <srijan.nandi@gmail.com> wrote:
> 
> I created a new user and renamed the table. Now my .config reads as:
> 
> BR2_ROOTFS_USERS_TABLES="x86_64/users_table.txt"
> 
> The user table is:
> 
> /opt/buildroot-2020.05$ cat x86_64/users_table.txt 
> gladmin -1 wheel -1 =a**** /home/gladmin /bin/sh - Builtin User
> 
> Then I also checked the following file and it looks the users is getting listed here:
> 
> /opt/buildroot-2020.05$ cat /opt/buildroot-2020.05/output/build/buildroot-fs/full_users_table.txt
>   	named -1 named -1 * /etc/bind - - BIND daemon
> 	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
> 	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
> 	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
> 	- - sudo -1 - - - -
> 	- - input -1 * - - - Input device group
> 	- - systemd-journal -1 * - - - Journal
> 	- - render -1 * - - - DRI rendering nodes
> 	- - kvm -1 * - - - kvm nodes
> 	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
> 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
> 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
> 	systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
> 	
> 	systemd-network -1 systemd-network -1 * - - - Network Manager
> 	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
> 	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
> 
> gladmin -1 wheel -1 =a**** /home/gladmin /bin/sh - Builtin User
> 
> But then when I look under output/target/etc/passwd or output/target/etc/shadow, I do not see the new user getting created.
> 
> Any assistance will be appreciated.
> 
> 
> Thanks and Regards,
> -=Srijan Nandi
> 
>> On 3 Jul 2020, at 9:59 am, Srijan Nandi - Gmail <srijan.nandi@gmail.com> wrote:
>> 
>> I am facing issues creating a new users. I already have the following set:
>> 
>> BR2_ROOTFS_USERS_TABLES="x86_64/users"
>> 
>> /opt/buildroot-2020.05$ cat x86_64/users 
>> # <username> <uid> <group> <gid> <password> <home> <shell> <groups> <comment>
>> test       8000  wheel    -1    =           -                /bin/bash    -    Test user
>> 
>> But when I check under passwd, I am not able to see the new user
>> 
>> /opt/buildroot-2020.05$ cat output/target/etc/passwd 
>> root:x:0:0:root:/root:/bin/bash
>> daemon:x:1:1:daemon:/usr/sbin:/bin/false
>> bin:x:2:2:bin:/bin:/bin/false
>> sys:x:3:3:sys:/dev:/bin/false
>> sync:x:4:100:sync:/bin:/bin/sync
>> mail:x:8:8:mail:/var/spool/mail:/bin/false
>> www-data:x:33:33:www-data:/var/www:/bin/false
>> operator:x:37:37:Operator:/var:/bin/false
>> nobody:x:65534:65534:nobody:/home:/bin/false
>> 
>> Is there something I am missing
>> 
>> 
>> -=Srijan Nandi
> 
