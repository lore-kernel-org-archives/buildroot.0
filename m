From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 04:53:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070801115326.A67C9A4940@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 04:53:25 -0700 (Wed, 01 Aug 2007)
New Revision: 19388

Log:
Use PROJECT related kernel name for Atmel boards

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-01 11:52:15 UTC (rev 19387)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-01 11:53:25 UTC (rev 19388)
@@ -39,7 +39,7 @@
 # This should be part of target/linux/Makefile.in
 LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
 
-#LINUX26_BINLOC=$(LINUX26_FORMAT)
+LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
 
 LINUX26_COPYTO:=/tftpboot
@@ -53,6 +53,7 @@
 
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
+LINUX26_KERNEL=$(BINARIES_DIR)/$(PROJECT)-linux-$(LINUX26_VERSION)
 
 # Update things in board specific makefiles
 include target/device/Atmel/*/Makefile.in
