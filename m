From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 16:56:52 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton: etc var
Message-ID: <20070114005652.7CBE44858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 16:56:52 -0800 (Sat, 13 Jan 2007)
New Revision: 17269

Log:
Make '/var/cache' and symbolic link to '/tmp' like the others. We'll need this for Samba and friends. Also, change mount order of filesystems during boot.


Added:
   trunk/buildroot/target/generic/target_skeleton/var/cache

Modified:
   trunk/buildroot/target/generic/target_skeleton/etc/inittab


Changeset:
Modified: trunk/buildroot/target/generic/target_skeleton/etc/inittab
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/inittab	2007-01-14 00:55:25 UTC (rev 17268)
+++ trunk/buildroot/target/generic/target_skeleton/etc/inittab	2007-01-14 00:56:52 UTC (rev 17269)
@@ -14,8 +14,8 @@
 # process   == program to run
 
 # Startup the system
+null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/sbin/ifconfig lo 127.0.0.1 up

Added: trunk/buildroot/target/generic/target_skeleton/var/cache
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/cache	                        (rev 0)
+++ trunk/buildroot/target/generic/target_skeleton/var/cache	2007-01-14 00:56:52 UTC (rev 17269)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/cache
___________________________________________________________________
Name: svn:special
   + *
