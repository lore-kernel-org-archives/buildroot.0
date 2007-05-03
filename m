From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 May 2007 01:25:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/fakeroot
	target/cpio target/cram etc...
Message-ID: <20070503082519.4E4D64859E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-03 01:25:17 -0700 (Thu, 03 May 2007)
New Revision: 18549

Log:
s/FAKEROUTE/FAKEROOT/

Modified:
   trunk/buildroot/package/fakeroot/Config.in
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/target/cpio/Config.in
   trunk/buildroot/target/cramfs/Config.in
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/iso9660/Config.in
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/squashfs/Config.in
   trunk/buildroot/target/tar/Config.in


Changeset:
Modified: trunk/buildroot/package/fakeroot/Config.in
===================================================================
--- trunk/buildroot/package/fakeroot/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/package/fakeroot/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -7,6 +7,6 @@
 	  http://joostje.op.het.net/fakeroot/
 
 # dummy for fakeroot-source
-config BR2_HOST_FAKEROUTE
+config BR2_HOST_FAKEROOT
 	bool
 	default n

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-05-03 08:25:17 UTC (rev 18549)
@@ -123,6 +123,6 @@
 TARGETS+=fakeroot
 endif
 
-ifeq ($(strip $(BR2_HOST_FAKEROUTE)),y)
+ifeq ($(strip $(BR2_HOST_FAKEROOT)),y)
 HOST_SOURCE+=fakeroot-source
 endif

Modified: trunk/buildroot/target/cpio/Config.in
===================================================================
--- trunk/buildroot/target/cpio/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/cpio/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_CPIO
 	bool "cpio the root filesystem"
 	default n
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build a cpio archive of the root filesystem
 

Modified: trunk/buildroot/target/cramfs/Config.in
===================================================================
--- trunk/buildroot/target/cramfs/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/cramfs/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_CRAMFS
 	bool "cramfs root filesystem"
 	default n
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build a cramfs root filesystem
 

Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/ext2/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2 root filesystem"
 	default y
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build an ext2 root filesystem
 

Modified: trunk/buildroot/target/iso9660/Config.in
===================================================================
--- trunk/buildroot/target/iso9660/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/iso9660/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -4,7 +4,7 @@
 	depends on BR2_i386
 	select BR2_TARGET_ROOTFS_EXT2
 	select BR2_TARGET_GRUB
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build a bootable iso9660 image
 

Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/jffs2/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_JFFS2
 	bool "jffs2 root filesystem"
 	default n
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	select BR2_PACKAGE_MTD
 	help
 	  Build a jffs2 root filesystem

Modified: trunk/buildroot/target/squashfs/Config.in
===================================================================
--- trunk/buildroot/target/squashfs/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/squashfs/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_SQUASHFS
 	bool "squashfs root filesystem"
 	default n
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build a squashfs root filesystem
 

Modified: trunk/buildroot/target/tar/Config.in
===================================================================
--- trunk/buildroot/target/tar/Config.in	2007-05-02 23:39:04 UTC (rev 18548)
+++ trunk/buildroot/target/tar/Config.in	2007-05-03 08:25:17 UTC (rev 18549)
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_TAR
 	bool "tar the root filesystem"
 	default n
-	select BR2_HOST_FAKEROUTE
+	select BR2_HOST_FAKEROOT
 	help
 	  Build a tar archive of the root filesystem
 
