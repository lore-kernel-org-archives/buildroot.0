From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 10:38:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: linux u-boot
Message-ID: <20090126103804.AB33277458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 10:38:00 +0000 (Mon, 26 Jan 2009)
New Revision: 25048

Log:
Revert bad patch to fix linux rebuild problem

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 09:22:52 UTC (rev 25047)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 10:38:00 UTC (rev 25048)
@@ -481,7 +481,7 @@
 	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
 	echo LINUX_MODULES=`$(LINUX26_VERSION_PROBED)`
 
-$(LINUX26_MKIMAGE_DIR)/mkimage:	$(MKIMAGE)
+$(LINUX26_MKIMAGE_DIR)/mkimage:	u-boot
 	mkdir -p $(LINUX26_MKIMAGE_DIR)
 	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
 

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 09:22:52 UTC (rev 25047)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 10:38:00 UTC (rev 25048)
@@ -22,6 +22,7 @@
 U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
 U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
+#U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN)
 
 ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
 #"))
@@ -289,7 +290,7 @@
 #
 #############################################################
 ifeq ($(BR2_TARGET_UBOOT),y)
-TARGETS+=u-boot
+TARGETS+=u-boot mkimage
 endif
 
 u-boot-status:
