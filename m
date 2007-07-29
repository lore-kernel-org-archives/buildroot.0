From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:05:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070729070516.A15AEA461B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:05:13 -0700 (Sun, 29 Jul 2007)
New Revision: 19312

Log:
Reintroduce ATMEL_MIRROR in u-boot

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-29 06:51:35 UTC (rev 19311)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-29 07:05:13 UTC (rev 19312)
@@ -8,6 +8,8 @@
 #
 #############################################################
 UBOOT_VERSION:=1.2.0-atmel
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
 UBOOT_DIR:=$(BUILD_DIR)/u-boot-$(UBOOT_VERSION)
 UBOOT_BUILD_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(UBOOT_VERSION)
 UBOOT_SOURCE:=u-boot-$(UBOOT_VERSION).tar.bz2
@@ -41,10 +43,10 @@
 UBOOT_CUSTOM:=$(UBOOT_DIR)/include/custom.h
 
 $(DL_DIR)/$(UBOOT_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(UBOOT_SITE)/$(UBOOT_SOURCE)
+	$(WGET) -P $(DL_DIR) $(UBOOT_SITE)/$(UBOOT_SOURCE)
 
 $(DL_DIR)/$(UBOOT_PATCH_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(UBOOT_PATCH_SITE)/$(UBOOT_PATCH_SOURCE)
+	$(WGET) -P $(DL_DIR) $(UBOOT_PATCH_SITE)/$(UBOOT_PATCH_SOURCE)
 
 $(UBOOT_DIR)/.unpacked: $(DL_DIR)/$(UBOOT_SOURCE)
 	mkdir -p   $(BUILD_DIR)
