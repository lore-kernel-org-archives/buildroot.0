From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 22 Jul 2007 10:04:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	DataFlashBoot at91bootstrap u-boot
Message-ID: <20070722170413.9879EA455C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-22 10:04:11 -0700 (Sun, 22 Jul 2007)
New Revision: 19193

Log:
Use a single ATMEL_MIRROR declaration + cleanup

Modified:
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-21 22:29:26 UTC (rev 19192)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-22 17:04:11 UTC (rev 19193)
@@ -5,7 +5,6 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-21 22:29:26 UTC (rev 19192)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-22 17:04:11 UTC (rev 19193)
@@ -1,9 +1,14 @@
 # *******************************************************************
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
+
 ifeq ($(strip $(BR2_TARGET_ATMEL)),y)
 ATMEL_PATH:=target/device/Atmel
 
 BOARD_NAME:=$(strip  $(subst ",, $(BR2_BOARD_NAME)))
+#"))
 BOARD_PATH:=$(strip  $(subst ",, $(BR2_BOARD_PATH)))
+#"))
 
 ATMEL_TARGET:=$(ATMEL_PATH)/root
 TARGET_SKELETON:=$(ATMEL_TARGET)/target_skeleton
@@ -14,9 +19,13 @@
 
 # These are set by Config.in
 DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
+#"))
 LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
+#"))
 LINUX26_RC_PATCH:=$(strip  $(subst ",, $(BR2_LINUX26_RC_PATCH)))
+#"))
 LINUX_BSP_PATCH:=$(strip  $(subst ",, $(BR2_LINUX_BSP_ATMEL_PATCH)))
+#"))
 
 # These are set by "new" Config.in
 LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-07-21 22:29:26 UTC (rev 19192)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-07-22 17:04:11 UTC (rev 19193)
@@ -5,16 +5,16 @@
 #############################################################
 AT91BOOTSTRAP_VERSION:=2.3
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)/Source
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP)))
+#"))
 AT91BOOTSTRAP_ZCAT:=bzcat
 
 AT91BOOTSTRAP_MEMORY:=$(strip  $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
+#"))
 
-
 AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_VERSION).bin
 
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-21 22:29:26 UTC (rev 19192)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-22 17:04:11 UTC (rev 19193)
@@ -12,7 +12,6 @@
 UBOOT_BUILD_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(UBOOT_VERSION)
 UBOOT_SOURCE:=u-boot-$(UBOOT_VERSION).tar.bz2
 #UBOOT_SOURCE:=u-boot-1.1.5-atmel.tar.bz2
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 #UBOOT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/u-boot
 UBOOT_SITE:=$(ATMEL_MIRROR)/Source
 UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)/Source
@@ -30,10 +29,15 @@
 
 UBOOT_SCR=$(BINARIES_DIR)/autoscript
 TARGET_UBOOT_IPADDR:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
+#"))
 TARGET_UBOOT_SERVERIP:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_SERVERIP)))
+#"))
 TARGET_UBOOT_GATEWAY:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_GATEWAY)))
+#"))
 TARGET_UBOOT_NETMASK:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_NETMASK)))
+#"))
 TARGET_UBOOT_ETHADDR:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_ETHADDR)))
+#"))
 UBOOT_CUSTOM:=$(UBOOT_DIR)/include/custom.h
 
 $(DL_DIR)/$(UBOOT_SOURCE):
