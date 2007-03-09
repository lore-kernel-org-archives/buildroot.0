From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Mar 2007 04:32:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_busybox_skeleton/etc
Message-ID: <20070309123209.7B2B94807A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-09 04:32:09 -0800 (Fri, 09 Mar 2007)
New Revision: 18052

Log:
- add homedir


Modified:
   trunk/buildroot/target/generic/mini_device_table.txt
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab


Changeset:
Modified: trunk/buildroot/target/generic/mini_device_table.txt
===================================================================
--- trunk/buildroot/target/generic/mini_device_table.txt	2007-03-09 10:08:53 UTC (rev 18051)
+++ trunk/buildroot/target/generic/mini_device_table.txt	2007-03-09 12:32:09 UTC (rev 18052)
@@ -41,6 +41,7 @@
 /config		d	755	0	0	-	-	-	-	-
 /proc		d	755	0	0	-	-	-	-	-
 /home/default	d	2755	1000	1000	-	-	-	-	-
+/root		d	750	0	0	-	-	-	-	-
 #<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
 /bin/busybox				f	4755	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-

Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab	2007-03-09 10:08:53 UTC (rev 18051)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab	2007-03-09 12:32:09 UTC (rev 18052)
@@ -14,18 +14,18 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -t proc none /proc
-null::sysinit:/bin/mount -t sysfs none /sys
-null::sysinit:/bin/mount -t tmpfs -o size=512k,mode=0755 none /dev
-null::sysinit:/bin/mkdir /dev/pts
-null::sysinit:/bin/mount -t devpts devpts /dev/pts
-null::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
-null::sysinit:/sbin/mdev -s
-null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
-null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
+::sysinit:/bin/mount -t proc none /proc
+::sysinit:/bin/mount -t sysfs none /sys
+::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
+::sysinit:/bin/mkdir /dev/pts
+::sysinit:/bin/mount -t devpts devpts /dev/pts
+::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
+::sysinit:/sbin/mdev -s
+::sysinit:/bin/mount -o remount,rw /
+::sysinit:/bin/mount -a
+::sysinit:/bin/hostname -F /etc/hostname
+::sysinit:/sbin/ifconfig lo 127.0.0.1 up
+::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
