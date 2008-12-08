From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:15:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: ccache elf2flt
	gcc gdb mklibs sstrip uCl etc...
Message-ID: <20081208081543.35C363C96F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:15:42 -0800 (Mon, 08 Dec 2008)
New Revision: 24308

Log:
toolchain/: get rid of unneeded $(strip ..)

Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/mklibs/mklibs.mk
   trunk/buildroot/toolchain/sstrip/sstrip.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -191,9 +191,9 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_CCACHE)),y)
+ifeq ($(BR2_CCACHE),y)
 TARGETS+=ccache
 endif
-ifeq ($(strip $(BR2_PACKAGE_CCACHE_TARGET)),y)
+ifeq ($(BR2_PACKAGE_CCACHE_TARGET),y)
 TARGETS+=ccache_target
 endif

Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -48,6 +48,6 @@
 elf2flt-dirclean:
 	rm -rf $(ELF2FLT_SOURCE)
 
-ifeq ($(strip $(BR2_ELF2FLT)),y)
+ifeq ($(BR2_ELF2FLT),y)
 TARGETS+=elf2flt
 endif

Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2008-12-08 08:15:42 UTC (rev 24308)
@@ -20,7 +20,7 @@
 endif
 #")))
 
-ifeq ($(strip $(BR2_GCC_USE_SJLJ_EXCEPTIONS)),y)
+ifeq ($(BR2_GCC_USE_SJLJ_EXCEPTIONS),y)
 GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
 endif
 
@@ -71,7 +71,7 @@
 endif
 
 # AVR32 GCC configuration
-ifeq ($(strip $(BR2_avr32)),y)
+ifeq ($(BR2_avr32),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 SOFT_FLOAT_CONFIG_OPTION:=
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libssp
@@ -84,11 +84,11 @@
 	CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 	BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)"
 
-ifeq ($(strip $(BR2_PACKAGE_GCC_TARGET)),y)
+ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS:=
 
 # AVR32 target GCC configuration
-ifeq ($(strip $(BR2_avr32)),y)
+ifeq ($(BR2_avr32),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -173,7 +173,7 @@
 	$(STRIPCMD) $(GDB_SERVER_DIR)/gdbserver
 
 $(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
-ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
+ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
 	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(GDB_SERVER_DIR)/gdbserver \
 		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
@@ -240,14 +240,14 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_GDB)),y)
+ifeq ($(BR2_PACKAGE_GDB),y)
 TARGETS+=gdb_target
 endif
 
-ifeq ($(strip $(BR2_PACKAGE_GDB_SERVER)),y)
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 TARGETS+=gdbserver
 endif
 
-ifeq ($(strip $(BR2_PACKAGE_GDB_HOST)),y)
+ifeq ($(BR2_PACKAGE_GDB_HOST),y)
 TARGETS+=gdbhost
 endif

Modified: trunk/buildroot/toolchain/mklibs/mklibs.mk
===================================================================
--- trunk/buildroot/toolchain/mklibs/mklibs.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/mklibs/mklibs.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -44,6 +44,6 @@
 #
 #############################################################
 
-ifeq ($(strip $(BR2_MKLIBS)),y)
+ifeq ($(BR2_MKLIBS),y)
 mklibs: $(STAGING_DIR)/mklibs-stamp
 endif

Modified: trunk/buildroot/toolchain/sstrip/sstrip.mk
===================================================================
--- trunk/buildroot/toolchain/sstrip/sstrip.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/sstrip/sstrip.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -61,10 +61,10 @@
 #
 #############################################################
 
-ifeq ($(strip $(BR2_PACKAGE_SSTRIP_HOST)),y)
+ifeq ($(BR2_PACKAGE_SSTRIP_HOST),y)
 TARGETS+=sstrip_host
 endif
 
-ifeq ($(strip $(BR2_PACKAGE_SSTRIP_TARGET)),y)
+ifeq ($(BR2_PACKAGE_SSTRIP_TARGET),y)
 TARGETS+=sstrip_target
 endif

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-08 08:15:27 UTC (rev 24307)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-08 08:15:42 UTC (rev 24308)
@@ -545,7 +545,7 @@
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
-ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
+ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
 	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/ldd \
 		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/ldd
