From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 Apr 2008 00:02:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080409070224.369323C4B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-09 00:02:20 -0700 (Wed, 09 Apr 2008)
New Revision: 21678

Log:
u-boot: fix custom patch handling


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-09 07:02:16 UTC (rev 21677)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-09 07:02:20 UTC (rev 21678)
@@ -40,7 +40,7 @@
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	@mkdir -p $(U_BOOT_PATCH_DIR)
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) *.patch
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) \*.patch
 endif
 	touch $@
 
