From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:34:33 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton/etc
Message-ID: <20061202183433.94F80485F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:34:32 -0800 (Sat, 02 Dec 2006)
New Revision: 16760

Log:
- eventually mount the crap /proc before remounting to make busybox's mount that incorrectly may rely on /proc work.


Modified:
   trunk/buildroot/target/generic/target_skeleton/etc/inittab


Changeset:
Modified: trunk/buildroot/target/generic/target_skeleton/etc/inittab
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/inittab	2006-12-02 18:32:33 UTC (rev 16759)
+++ trunk/buildroot/target/generic/target_skeleton/etc/inittab	2006-12-02 18:34:32 UTC (rev 16760)
@@ -14,8 +14,8 @@
 # process   == program to run
 
 # Startup the system
+null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
