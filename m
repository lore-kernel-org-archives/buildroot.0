From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 00:24:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/x86/i386
	toolchain/kernel- etc...
Message-ID: <20070820072410.B3791A4596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 00:24:10 -0700 (Mon, 20 Aug 2007)
New Revision: 19588

Log:
Ensure KERNEL_HEADER_PATCH_DIR is always defined + empty dir for x86

Added:
   trunk/buildroot/target/device/x86/i386/kernel-header-patches/
   trunk/buildroot/toolchain/kernel-headers/empty/

Modified:
   trunk/buildroot/target/device/x86/i386/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/i386/Makefile.in	2007-08-20 06:24:28 UTC (rev 19587)
+++ trunk/buildroot/target/device/x86/i386/Makefile.in	2007-08-20 07:24:10 UTC (rev 19588)
@@ -15,3 +15,5 @@
 else
 LINUX26_FORMAT=$(strip $(BR2_PACKAGE_LINUX_FORMAT))
 endif
+
+KERNEL_HEADERS_PATCH_DIR:=$(BR2_BOARD_PATH)/kernel-header-patches

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-20 06:24:28 UTC (rev 19587)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-20 07:24:10 UTC (rev 19588)
@@ -49,6 +49,9 @@
 endif
 
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
+# Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
+# board specific kernel headers 
+KERNEL_HEADERS_PATCH_DIR:=toolchain/kernel-headers/empty
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
