From: Hebbar <gururajakr@sanyo.co.in>
Date: Sun, 20 Apr 2008 23:14:31 -0700 (PDT)
Subject: [Buildroot] Improper device nodes created inside
 project_build_arm/uclibc/root/dev/
Message-ID: <16803332.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to build arm9 toolchain using recent buildroot toolchain.
everything works fine except the device nodes inside my
project_build_arm/uclibc/root/dev/ directory.

oot at guru_vlinux:/opt/buildroot_plain# ls -la
project_build_arm/uclibc/root/dev/
total 0
drwxr-xr-x  3 root root 192 Apr 17 23:23 .
drwxr-xr-x 16 root root 408 Apr 17 22:44 ..
-rw-rw-rw-  1 root root   0 Apr 18 00:36 console
lrwxrwxrwx  1 root root  10 Apr 17 22:14 log -> ../tmp/log
-rw-rw-rw-  1 root root   0 Apr 18 00:36 null
drwxr-xr-x  2 root root  48 Apr 17 22:14 pts
-rw-rw-rw-  1 root root   0 Apr 18 00:36 ttyAMA0
-rw-rw-rw-  1 root root   0 Apr 18 00:36 zero

While it should be 

root at guru_vlinux:/opt/buildroot_plain# ls -la /dev/console /dev/null
/dev/zero
crw------- 1 root root 5, 1 Apr 18 12:10 /dev/console
crw-rw-rw- 1 root root 1, 3 Apr 18 08:08 /dev/null
crw-rw-rw- 1 root root 1, 5 Apr 18 08:08 /dev/zero

I have to manualy delete them and cp the basic one from my system root/dev.
Once i copy from root device nodes, i am able to load the root using nfs
mount or by compressing the root directory.

Why are the device nodes not properly cretaed. I have logged into console
with root privileges.

Thanks in advance

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Improper-device-nodes-created-inside-project_build_arm-uclibc-root-dev--tp16803332p16803332.html
Sent from the BuildRoot mailing list archive at Nabble.com.
