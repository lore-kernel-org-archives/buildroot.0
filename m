From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20080907143139.B5AD23C654@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:39 -0700 (Sun, 07 Sep 2008)
New Revision: 23354

Log:
jffs2: cleanup

Patch by Markus Heidelberg <markus.heidelberg@web.de>

* remove needless help in invisible config options
* correct wrong indenting
* remove unused BR2 variables for default pagesize and devfile

Modified:
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2008-09-07 14:31:36 UTC (rev 23353)
+++ trunk/buildroot/target/jffs2/Config.in	2008-09-07 14:31:39 UTC (rev 23354)
@@ -56,8 +56,6 @@
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	help
-	  Set to pagesize of memory
 
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
@@ -67,8 +65,6 @@
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	help
-	  Set to Erase Size of memory
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
@@ -114,9 +110,9 @@
 config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 	bool "Produce a summarized JFFS2 image"
 	depends on BR2_TARGET_ROOTFS_JFFS2
-    help
-      A summarised image can be mounted faster if support is
-      enabled in the kernel (CONFIG_JFFS2_SUMMARY)
+	help
+	  A summarised image can be mounted faster if support is
+	  enabled in the kernel (CONFIG_JFFS2_SUMMARY)
 
 config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
 	string "Output File"

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2008-09-07 14:31:36 UTC (rev 23353)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2008-09-07 14:31:39 UTC (rev 23354)
@@ -30,19 +30,15 @@
 SUMTOOL_OPTS += -b
 endif
 
-ifneq ($(BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE),y)
 JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE)
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER),y)
 JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
-endif
 
 JFFS2_TARGET := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT)))
 #"))
-JFFS2_DEVFILE = $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_DEVFILE)))
-#"))
-ifneq ($(JFFS2_DEVFILE)$(TARGET_DEVICE_TABLE),)
+ifneq ($(TARGET_DEVICE_TABLE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
 
