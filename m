From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 14 Nov 2006 22:52:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/AMD/DBAu1500
	target/devic etc...
Message-ID: <20061115065201.4570048583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-14 22:52:00 -0800 (Tue, 14 Nov 2006)
New Revision: 16532

Log:
subversion makes it so we do not need a separate tarball
to store empty directories and symlinks for the target_skeleton.


Added:
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/bin/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/log
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/pts/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/mtab
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/home/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/lib/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/mnt/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/opt/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/proc/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/sbin/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/tmp/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/bin/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/lib/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/sbin/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/pcmcia
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lock
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/log
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/pcmcia
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/run
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/spool
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/tmp
   trunk/buildroot/target/device/jp/q5/target_skeleton/bin/
   trunk/buildroot/target/device/jp/q5/target_skeleton/dev/
   trunk/buildroot/target/device/jp/q5/target_skeleton/dev/log
   trunk/buildroot/target/device/jp/q5/target_skeleton/dev/pts/
   trunk/buildroot/target/device/jp/q5/target_skeleton/etc/mtab
   trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/jp/q5/target_skeleton/home/
   trunk/buildroot/target/device/jp/q5/target_skeleton/lib/
   trunk/buildroot/target/device/jp/q5/target_skeleton/mnt/
   trunk/buildroot/target/device/jp/q5/target_skeleton/opt/
   trunk/buildroot/target/device/jp/q5/target_skeleton/proc/
   trunk/buildroot/target/device/jp/q5/target_skeleton/sbin/
   trunk/buildroot/target/device/jp/q5/target_skeleton/tmp/
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/bin/
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/lib/
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/sbin/
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/pcmcia
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/lock
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/log
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/pcmcia
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/run
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/spool
   trunk/buildroot/target/device/jp/q5/target_skeleton/var/tmp
   trunk/buildroot/target/generic/target_skeleton/bin/
   trunk/buildroot/target/generic/target_skeleton/dev/
   trunk/buildroot/target/generic/target_skeleton/dev/log
   trunk/buildroot/target/generic/target_skeleton/dev/pts/
   trunk/buildroot/target/generic/target_skeleton/etc/mtab
   trunk/buildroot/target/generic/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/generic/target_skeleton/home/
   trunk/buildroot/target/generic/target_skeleton/lib/
   trunk/buildroot/target/generic/target_skeleton/mnt/
   trunk/buildroot/target/generic/target_skeleton/opt/
   trunk/buildroot/target/generic/target_skeleton/proc/
   trunk/buildroot/target/generic/target_skeleton/sbin/
   trunk/buildroot/target/generic/target_skeleton/tmp/
   trunk/buildroot/target/generic/target_skeleton/usr/bin/
   trunk/buildroot/target/generic/target_skeleton/usr/lib/
   trunk/buildroot/target/generic/target_skeleton/usr/sbin/
   trunk/buildroot/target/generic/target_skeleton/var/
   trunk/buildroot/target/generic/target_skeleton/var/lib/
   trunk/buildroot/target/generic/target_skeleton/var/lib/pcmcia
   trunk/buildroot/target/generic/target_skeleton/var/lock
   trunk/buildroot/target/generic/target_skeleton/var/log
   trunk/buildroot/target/generic/target_skeleton/var/pcmcia
   trunk/buildroot/target/generic/target_skeleton/var/run
   trunk/buildroot/target/generic/target_skeleton/var/spool
   trunk/buildroot/target/generic/target_skeleton/var/tmp

Removed:
   trunk/buildroot/target/device/AMD/DBAu1500/skel.tar.gz
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/device/jp/q5/skel.tar.gz
   trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf
   trunk/buildroot/target/generic/skel.tar.gz

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
   trunk/buildroot/target/device/Sharp/LNode80/Makefile.in
   trunk/buildroot/target/device/jp/q5/Makefile.in
   trunk/buildroot/target/generic/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/Makefile	2006-11-15 06:52:00 UTC (rev 16532)
@@ -103,12 +103,9 @@
 	@ln -snf ../lib $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib
 
 $(TARGET_DIR):
-	if [ -f "$(TARGET_SKELETON)" ] ; then \
-		$(ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf -; \
+	if [ -d "$(TARGET_SKELETON)" ] ; then \
+		cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 	fi;
-	if [ -d "$(TARGET_SKEL_DIR)" ] ; then \
-		cp -fa $(TARGET_SKEL_DIR)/* $(TARGET_DIR)/; \
-	fi;
 	touch $(STAGING_DIR)/.fakeroot.00000
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf

Modified: trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2006-11-15 06:52:00 UTC (rev 16532)
@@ -3,8 +3,7 @@
 BR2_PACKAGE_BUSYBOX_CONFIG=$(ALCHEMY_DBAU1500_PATH)/busybox.config
 UCLIBC_CONFIG_FILE=$(ALCHEMY_DBAU1500_PATH)/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(ALCHEMY_DBAU1500_PATH)/skel.tar.gz
-TARGET_SKEL_DIR=$(ALCHEMY_DBAU1500_PATH)/target_skeleton
+TARGET_SKELETON=$(ALCHEMY_DBAU1500_PATH)/target_skeleton
 TARGET_DEVICE_TABLE=$(ALCHEMY_DBAU1500_PATH)/device_table.txt
 
 TARGETS+=linux

Deleted: trunk/buildroot/target/device/AMD/DBAu1500/skel.tar.gz
===================================================================
(Binary files differ)

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/log
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/log
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/mtab
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/mtab	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/mtab	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../proc/mounts
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/mtab
___________________________________________________________________
Name: svn:special
   + *

Deleted: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf	2006-11-15 06:52:00 UTC (rev 16532)
@@ -1,2 +0,0 @@
-domain dev.null
-nameserver 127.0.0.1

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/resolv.conf
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/etc/resolv.conf
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/pcmcia
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lib/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lock
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lock	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lock	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/lock
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/log
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/pcmcia
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/run
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/run	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/run	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/run
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/spool
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/spool	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/spool	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/spool
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/tmp
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/tmp	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/tmp	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/var/tmp
___________________________________________________________________
Name: svn:special
   + *

Modified: trunk/buildroot/target/device/Sharp/LNode80/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/Makefile.in	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/Sharp/LNode80/Makefile.in	2006-11-15 06:52:00 UTC (rev 16532)
@@ -1,6 +1,6 @@
 SHARP_LNODE80_PATH=target/device/Sharp/LNode80
 
-TARGET_SKEL_DIR=$(SHARP_LNODE80_PATH)/target_skeleton
+TARGET_SKELETON=$(SHARP_LNODE80_PATH)/target_skeleton
 TARGET_DEVICE_TABLE=$(SHARP_LNODE80_PATH)/device_table.txt
 
 TARGETS+=linux

Modified: trunk/buildroot/target/device/jp/q5/Makefile.in
===================================================================
--- trunk/buildroot/target/device/jp/q5/Makefile.in	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/Makefile.in	2006-11-15 06:52:00 UTC (rev 16532)
@@ -3,8 +3,7 @@
 BR2_PACKAGE_BUSYBOX_CONFIG=$(JP_Q5_PATH)/busybox.config
 UCLIBC_CONFIG_FILE=$(JP_Q5_PATH)/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(JP_Q5_PATH)/skel.tar.gz
-TARGET_SKEL_DIR=$(JP_Q5_PATH)/target_skeleton
+TARGET_SKELETON=$(JP_Q5_PATH)/target_skeleton
 TARGET_DEVICE_TABLE=$(JP_Q5_PATH)/device_table.txt
 
 TARGETS+=linux

Deleted: trunk/buildroot/target/device/jp/q5/skel.tar.gz
===================================================================
(Binary files differ)

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/dev/log
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/dev/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/dev/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/log
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/dev/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/etc/mtab
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/etc/mtab	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/etc/mtab	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../proc/mounts
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/etc/mtab
___________________________________________________________________
Name: svn:special
   + *

Deleted: trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf	2006-11-15 06:52:00 UTC (rev 16532)
@@ -1,2 +0,0 @@
-domain dev.null
-nameserver 127.0.0.1

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/resolv.conf
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/etc/resolv.conf
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/pcmcia
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/lib/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/lock
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/lock	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/lock	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/lock
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/log
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/pcmcia
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/run
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/run	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/run	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/run
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/spool
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/spool	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/spool	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/spool
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/var/tmp
===================================================================
--- trunk/buildroot/target/device/jp/q5/target_skeleton/var/tmp	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/device/jp/q5/target_skeleton/var/tmp	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/device/jp/q5/target_skeleton/var/tmp
___________________________________________________________________
Name: svn:special
   + *

Modified: trunk/buildroot/target/generic/Makefile.in
===================================================================
--- trunk/buildroot/target/generic/Makefile.in	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/Makefile.in	2006-11-15 06:52:00 UTC (rev 16532)
@@ -1,4 +1,3 @@
 # Default target skeleton stuff, may be overridden
-TARGET_SKELETON=target/generic/skel.tar.gz
-TARGET_SKEL_DIR=target/generic/target_skeleton
+TARGET_SKELETON=target/generic/target_skeleton
 TARGET_DEVICE_TABLE=target/generic/device_table.txt

Deleted: trunk/buildroot/target/generic/skel.tar.gz
===================================================================
(Binary files differ)

Added: trunk/buildroot/target/generic/target_skeleton/dev/log
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/dev/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/dev/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/log
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/dev/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/etc/mtab
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/mtab	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/etc/mtab	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../proc/mounts
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/etc/mtab
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/etc/resolv.conf
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/resolv.conf	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/etc/resolv.conf	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp/resolv.conf
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/etc/resolv.conf
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/lib/pcmcia
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/lib/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/lib/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/lib/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/lock
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/lock	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/lock	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/lock
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/log
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/log	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/log	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/log
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/pcmcia
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/pcmcia	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/pcmcia	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/pcmcia
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/run
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/run	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/run	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/run
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/spool
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/spool	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/spool	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/spool
___________________________________________________________________
Name: svn:special
   + *

Added: trunk/buildroot/target/generic/target_skeleton/var/tmp
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/var/tmp	2006-11-14 23:22:15 UTC (rev 16531)
+++ trunk/buildroot/target/generic/target_skeleton/var/tmp	2006-11-15 06:52:00 UTC (rev 16532)
@@ -0,0 +1 @@
+link ../tmp
\ No newline at end of file


Property changes on: trunk/buildroot/target/generic/target_skeleton/var/tmp
___________________________________________________________________
Name: svn:special
   + *
