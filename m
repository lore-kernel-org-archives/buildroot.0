From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 17 Aug 2007 06:17:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20070817131725.E1BB9A4711@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-17 06:17:25 -0700 (Fri, 17 Aug 2007)
New Revision: 19542

Log:
Update atngw100 device table

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/device_table.txt


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/device_table.txt
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/device_table.txt	2007-08-17 13:16:36 UTC (rev 19541)
+++ trunk/buildroot/target/device/Atmel/atngw100/device_table.txt	2007-08-17 13:17:25 UTC (rev 19542)
@@ -1,31 +1,31 @@
-# When building a target filesystem, it is desirable to not have to
-# become root and then run 'mknod' a thousand times.  Using a device 
-# table you can create device nodes and directories "on the fly".
+# When building a target filesystem, it is desirable to not have to become
+# root and then run 'mknod' a thousand times.  Using a device table you can
+# create device nodes and directories "on the fly".
 #
-# This is a sample device table file for use with genext2fs.  You can
-# do all sorts of interesting things with a device table file.  For
-# example, if you want to adjust the permissions on a particular file
-# you can just add an entry like:
+# This is a sample device table file for use with genext2fs.  You can do all
+# sorts of interesting things with a device table file.  For example, if you
+# want to adjust the permissions on a particular file you can just add an
+# entry like:
 #   /sbin/foobar        f       2755    0       0       -       -       -       -       -
-# and (assuming the file /sbin/foobar exists) it will be made setuid
-# root (regardless of what its permissions are on the host filesystem.
+# and (assuming the file /sbin/foobar exists) it will be made setuid root
+# (regardless of what its permissions are on the host filesystem.
 # Furthermore, you can use a single table entry to create a many device
-# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
-# I could just use the following two table entries:
+# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15] I
+# could just use the following two table entries:
 #   /dev/hda    b       640     0       0       3       0       0       0       -
 #   /dev/hda    b       640     0       0       3       1       1       1       15
-# 
+#
 # Device table entries take the form of:
 # <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
-# where name is the file name,  type can be one of: 
+# where name is the file name,  type can be one of:
 #       f       A regular file
 #       d       Directory
 #       c       Character special device file
 #       b       Block special device file
 #       p       Fifo (named pipe)
-# uid is the user id for the target file, gid is the group id for the
-# target file.  The rest of the entries (major, minor, etc) apply only 
-# to device special files.
+# uid is the user id for the target file, gid is the group id for the target
+# file.  The rest of the entries (major, minor, etc) apply only to device
+# special files.
 
 # Have fun
 # -Erik Andersen <andersen@codepoet.org>
@@ -41,9 +41,10 @@
 /config		d	755	0	0	-	-	-	-	-
 /proc		d	755	0	0	-	-	-	-	-
 /lost+found	d	700	0	0	-	-	-	-	-
-/var/tmp	d	1777	0	0	-	-	-	-	-
 /var/lock	d	1777	0	0	-	-	-	-	-
+/var/log	d	755	0	0	-	-	-	-	-
 /var/run	d	1777	0	0	-	-	-	-	-
+/var/tmp	d	1777	0	0	-	-	-	-	-
 /home/avr32	d	2755	500	500	-	-	-	-	-
 /home/default	d	2755	1000	1000	-	-	-	-	-
 /www		d	755	0	0	-	-	-	-	-
@@ -61,7 +62,7 @@
 # Normal system devices
 #/dev/mem	c	640	0	0	1	1	0	0	-
 #/dev/kmem	c	640	0	0	1	2	0	0	-
-#/dev/null	c	666	0	0	1	3	0	0	-
+/dev/null	c	666	0	0	1	3	0	0	-
 #/dev/zero	c	666	0	0	1	5	0	0	-
 #/dev/random	c	666	0	0	1	8	0	0	-
 #/dev/urandom	c	666	0	0	1	9	0	0	-
