From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 02:14:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils ccache
	gcc gdb
Message-ID: <20081026091403.518EA3C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 02:14:02 -0700 (Sun, 26 Oct 2008)
New Revision: 23795

Log:
toolhain/: confgure: respect quiet option

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-10-26 06:19:43 UTC (rev 23794)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-10-26 09:14:02 UTC (rev 23795)
@@ -113,6 +113,7 @@
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
+		$(QUIET) \
 	)
 	touch $@
 

Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-26 06:19:43 UTC (rev 23794)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-10-26 09:14:02 UTC (rev 23795)
@@ -40,6 +40,7 @@
 		--host=$(GNU_HOST_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
+		$(QUIET) \
 	)
 	touch $@
 
@@ -152,6 +153,7 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		$(DISABLE_NLS) \
+		$(QUIET) \
 	)
 	touch $@
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-26 06:19:43 UTC (rev 23794)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-10-26 09:14:02 UTC (rev 23795)
@@ -197,6 +197,7 @@
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
+		$(QUIET) \
 	)
 	touch $@
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-26 06:19:43 UTC (rev 23794)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-10-26 09:14:02 UTC (rev 23795)
@@ -220,6 +220,7 @@
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC1_CONFIG_OPTIONS) \
+		$(QUIET) \
 	)
 	touch $@
 

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-10-26 06:19:43 UTC (rev 23794)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-10-26 09:14:02 UTC (rev 23795)
@@ -104,6 +104,7 @@
 		--disable-sim --enable-gdbserver \
 		--without-included-gettext \
 		--disable-werror \
+		$(QUIET) \
 	)
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
