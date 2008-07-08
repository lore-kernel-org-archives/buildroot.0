From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  8 Jul 2008 12:31:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080708193134.AA8693C6B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-08 12:31:30 -0700 (Tue, 08 Jul 2008)
New Revision: 22693

Log:
Fix AVR32 gcc patching, when sysroot option is not enabled

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-07-08 14:14:36 UTC (rev 22692)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-07-08 19:31:30 UTC (rev 22693)
@@ -36,7 +36,7 @@
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
-GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
+GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/$(GCC_OFFICIAL_VERSION)
 endif
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
