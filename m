From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 14:07:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070828210733.7B8DBA4668@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 14:07:32 -0700 (Tue, 28 Aug 2007)
New Revision: 19721

Log:
Fix bad regexp in u-boot.mk

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-28 20:04:15 UTC (rev 19720)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-28 21:07:32 UTC (rev 19721)
@@ -59,7 +59,7 @@
 	touch $@
 
 $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE): $(UBOOT_DIR)/.unpacked $(UBOOT_PATCHES)/.unpacked
-	toolchain/patch-kernel.sh $(UBOOT_DIR) $(UBOOT_PATCHES) *.patch
+	toolchain/patch-kernel.sh $(UBOOT_DIR) $(UBOOT_PATCHES) \*.patch
 	touch $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
 # cp $(UBOOT_CONFIG_FILE) $(UBOOT_DIR)/include/configs/.
 # cp $(UBOOT_PATCHES)/cmd_defenv.c $(UBOOT_DIR)/common/.
