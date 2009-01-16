From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 11:47:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils ccache
	gcc gdb kernel-headers u etc...
Message-ID: <20090116114706.459F1774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 11:47:05 +0000 (Fri, 16 Jan 2009)
New Revision: 24870

Log:
toolchain/: convert to DOWNLOAD helper

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -84,7 +84,7 @@
 
 $(DL_DIR)/$(BINUTILS_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(BINUTILS_SITE)/$(BINUTILS_SOURCE)
+	$(call DOWNLOAD,$(BINUTILS_SITE),$(BINUTILS_SOURCE))
 
 binutils-unpacked: $(BINUTILS_DIR)/.patched
 $(BINUTILS_DIR)/.unpacked: $(DL_DIR)/$(BINUTILS_SOURCE)

Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -13,7 +13,7 @@
 CCACHE_TARGET_BINARY:=usr/bin/ccache
 
 $(DL_DIR)/$(CCACHE_SOURCE):
-	$(WGET) -P $(DL_DIR) $(CCACHE_SITE)/$(CCACHE_SOURCE)
+	$(call DOWNLOAD,$(CCACHE_SITE),$(CCACHE_SOURCE))
 
 $(CCACHE_DIR1)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
 	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -138,7 +138,7 @@
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(GCC_SITE)/$(GCC_SOURCE)
+	$(call DOWNLOAD,$(GCC_SITE),$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -149,7 +149,7 @@
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(GCC_SITE)/$(GCC_SOURCE)
+	$(call DOWNLOAD,$(GCC_SITE),$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -41,7 +41,7 @@
 endif
 
 $(DL_DIR)/$(GDB_SOURCE):
-	$(WGET) -P $(DL_DIR) $(GDB_SITE)/$(GDB_SOURCE)
+	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -31,7 +31,7 @@
 include toolchain/kernel-headers/kernel-headers-old.makefile
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
-	$(WGET) -P $(DL_DIR) $(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE)
+	$(call DOWNLOAD,$(LINUX_HEADERS_SITE),$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-16 11:42:52 UTC (rev 24869)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-16 11:47:05 UTC (rev 24870)
@@ -94,14 +94,14 @@
 #"))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
+	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
 
 ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
 UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
 UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
 
 $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
-	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE_LOCALE)/$(UCLIBC_SOURCE_LOCALE)
+	$(call DOWNLOAD,$(UCLIBC_SITE_LOCALE),$(UCLIBC_SOURCE_LOCALE))
 
 UCLIBC_LOCALE_DATA:=$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
 else
