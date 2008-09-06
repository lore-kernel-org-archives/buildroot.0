From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 6 Sep 2008 12:26:55 +0200
Subject: [Buildroot] [PATCH] jffs2: cleanup
Message-ID: <200809061226.56529.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* remove needless help in invisible config options
* correct wrong indenting
* remove unused BR2 variables for default pagesize and devfile


diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index e30754b..23503a9 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -56,8 +56,6 @@ config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	help
-	  Set to pagesize of memory
 
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
@@ -67,8 +65,6 @@ config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	help
-	  Set to Erase Size of memory
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
@@ -114,9 +110,9 @@ config BR2_TARGET_ROOTFS_JFFS2_SQUASH
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
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index b58e5d2..41b129d 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -30,19 +30,15 @@ JFFS2_OPTS += -b
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
 
