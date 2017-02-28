From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Feb 2017 21:15:37 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-i8dSe9FA4N@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #10 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to paulstewartis at gmail.com from comment #8)

Still no luck in trying to reproduce the issue with your users table
(minus the dummy user) and the following defconfig:

BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_ROOTFS_USERS_TABLES="/home/ymorin/users.list"
# BR2_PACKAGE_BUSYBOX is not set

Here is the /etc/passwd the gets me:

root:x:0:0:root:/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/false
bin:x:2:2:bin:/bin:/bin/false
sys:x:3:3:sys:/dev:/bin/false
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/false
www-data:x:33:33:www-data:/var/www:/bin/false
operator:x:37:37:Operator:/var:/bin/false
nobody:x:65534:65534:nobody:/home:/bin/false
paul:x:1000:100::/home/paul:/bin/sh
git:x:1001:100::/home/git:/usr/bin/git-shell

So as you can see, both the paul and git users are there.

What is your bash version:

/usr/bin/env bash --version

-- 
You are receiving this mail because:
You are on the CC list for the bug.
