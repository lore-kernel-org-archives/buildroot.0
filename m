From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 21 Jun 2008 12:47:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080621194717.98BEF3C725@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-21 12:47:17 -0700 (Sat, 21 Jun 2008)
New Revision: 22463

Log:
toolchain/gcc: use --disable-decimal-float for 4.3.x


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-20 21:45:27 UTC (rev 22462)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-21 19:47:17 UTC (rev 22463)
@@ -141,6 +141,10 @@
 EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
 endif
 
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+GCC_DECIMAL_FLOAT:=--disable-decimal-float
+endif
+
 HOST_SOURCE+=gcc-source
 
 $(DL_DIR)/$(GCC_SOURCE):
@@ -211,6 +215,7 @@
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
+		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
@@ -284,6 +289,7 @@
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
+		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
@@ -429,6 +435,7 @@
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
+		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
