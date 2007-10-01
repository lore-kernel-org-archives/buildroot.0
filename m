From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  1 Oct 2007 14:12:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071001211254.B1D12A680F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-01 14:12:54 -0700 (Mon, 01 Oct 2007)
New Revision: 20166

Log:
Use the right Config for AVR32 gcc build

Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-10-01 21:06:50 UTC (rev 20165)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-10-01 21:12:54 UTC (rev 20166)
@@ -14,9 +14,9 @@
 # AVR32 GCC configuration
 ifeq ($(strip $(BR2_avr32)),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-#EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
+EXTRA_GCC_CONFIG_OPTIONS+=--disable-libssp
+EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
+#EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
@@ -84,7 +84,7 @@
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-#EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
 
