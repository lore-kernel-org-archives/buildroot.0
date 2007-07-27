From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:53:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel: Linux
Message-ID: <20070727075326.DE0D2A495B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:53:26 -0700 (Fri, 27 Jul 2007)
New Revision: 19271

Log:
Use linux headers version, if linux is not defined

Added:
   trunk/buildroot/target/device/Atmel/Linux/linux.mk

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Added: trunk/buildroot/target/device/Atmel/Linux/linux.mk
===================================================================

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-27 07:48:56 UTC (rev 19270)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-27 07:53:26 UTC (rev 19271)
@@ -18,8 +18,16 @@
 # These are set by Config.in
 DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
 #"))
+ifeq ($(DOWNLOAD_LINUX26_VERSION),)
+DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
+endif
+
 LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
 #"))
+ifeq ($(LINUX26_VERSION),)
+LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
+endif
+
 LINUX26_RC_PATCH:=$(strip  $(subst ",, $(BR2_LINUX26_RC_PATCH)))
 #"))
 LINUX_BSP_PATCH:=$(strip  $(subst ",, $(BR2_LINUX_BSP_ATMEL_PATCH)))
@@ -55,7 +63,7 @@
 UBOOT_CONFIG_FILE:=$(BOARD_PATH)/u-boot/$(UBOOT_BOARD_NAME).h
 
 ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
-#include $(ATMEL_PATH)/Linux/linux.mk
+include $(ATMEL_PATH)/Linux/linux.mk
 endif
 
 ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
