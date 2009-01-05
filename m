From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 Jan 2009 15:52:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090105155245.159C577404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-05 15:52:44 +0000 (Mon, 05 Jan 2009)
New Revision: 24692

Log:
u-boot: unbreak build after r24646

Unset variables aren't the same as "".

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 15:47:00 UTC (rev 24691)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 15:52:44 UTC (rev 24692)
@@ -33,7 +33,7 @@
 
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
-ifeq ($(UBOOT_BOARD_NAME),"")
+ifeq ($(UBOOT_BOARD_NAME),)
 UBOOT_BOARD_NAME:=$(strip $(subst ",,$(BR2_TARGET_UBOOT_BOARDNAME)))
 #"))
 endif
