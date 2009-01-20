From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 08:11:27 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090120081127.7E2DA77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 08:11:26 +0000 (Tue, 20 Jan 2009)
New Revision: 24918

Log:
U_BOOT_ARCH_PATCH_DIR should contain a value or should not be defined, empty string is not allowed

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-20 06:17:12 UTC (rev 24917)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-20 08:11:26 UTC (rev 24918)
@@ -88,7 +88,7 @@
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
-ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),"")
+ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_ARCH_PATCH_DIR) \*.patch
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
