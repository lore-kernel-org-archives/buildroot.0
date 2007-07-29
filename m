From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:32:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070729073245.36FB5A461B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:32:44 -0700 (Sun, 29 Jul 2007)
New Revision: 19321

Log:
Cleanup of Atmel Makefile

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-29 07:22:12 UTC (rev 19320)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-29 07:32:44 UTC (rev 19321)
@@ -39,7 +39,7 @@
 # This should be part of target/linux/Makefile.in
 LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
 
-LINUX26_BINLOC=$(LINUX26_FORMAT)
+#LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
 
 LINUX26_COPYTO:=/tftpboot
@@ -51,7 +51,7 @@
 UBOOT_BOARD_NAME:=$(BOARD_NAME)
 DFB_BOARD_NAME:=$(BOARD_NAME)
 
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
 
 # Update things in board specific makefiles
@@ -78,17 +78,15 @@
 include $(ATMEL_PATH)/at91bootstrap/at91bootstrap.mk
 endif
 
+atmel_status:
+	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
+	@echo BOARD_NAME=$(BOARD_NAME)
+	@echo BR2_BOARD_PATH=$(BR2_BOARD_PATH)
+	@echo BR2_MAJOR_MINOR=$(BR2_LINUX_MAJOR_VERSION)$(BR2_LINUX_MINOR_VERSION)
+	@echo MAJOR_MINOR=$(LINUX_MAJOR_VER)$(LINUX_MINOR_VER)
+	@echo DOWNLOAD_LINUX26_VERSION=$(DOWNLOAD_LINUX26_VERSION)
+	@echo LINUX_SOURCE=$(LINUX_SOURCE)
+	@echo TARGETS=$(TARGETS)
 
-testa:
-	echo	boardname=$(BOARD_NAME)
-	echo 	boardpath=$(BR2_BOARD_PATH)
-	echo 	BR2_MAJOR_MINOR=$(BR2_LINUX_MAJOR_VERSION)$(BR2_LINUX_MINOR_VERSION)
-	echo 	MAJOR_MINOR=$(LINUX_MAJOR_VER)$(LINUX_MINOR_VER)
-	echo	DOWNLOAD_LINUX_VERSION=$(DOWNLOAD_LINUX26_VERSION)
-	echo	LINUX_SOURCE=$(LINUX_SOURCE)
-	echo	$(TESTA)
-	echo	$(TESTA2)
-	echo	$(TARGETS)
-
-#TARGETS+=testa
+#TARGETS+=atmel_status
 endif
