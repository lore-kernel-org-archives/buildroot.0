From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 08:52:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080616155242.96F0B3C973@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 08:52:41 -0700 (Mon, 16 Jun 2008)
New Revision: 22383

Log:
gdb: support external toolchain


Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-06-16 14:35:57 UTC (rev 22382)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-06-16 15:52:41 UTC (rev 22383)
@@ -20,21 +20,17 @@
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
-else
-GDB_SITE:=$(VENDOR_SITE)
-endif
-
 GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GDB_RELEASE)
 
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
-else
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
+GDB_SITE:=$(VENDOR_SITE)
 GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
+else
+GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
+GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 endif
 
 GDB_DIR:=$(TOOL_BUILD_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
