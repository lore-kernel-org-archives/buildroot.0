From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:51:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070729175133.3B88EA6047@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:51:32 -0700 (Sun, 29 Jul 2007)
New Revision: 19334

Log:
Add AVR32 options to gcc

Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-07-29 17:47:27 UTC (rev 19333)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-07-29 17:51:32 UTC (rev 19334)
@@ -10,6 +10,12 @@
 #"))
 EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
 #"))
+
+# AVR32 GCC configuration
+ifeq ($(strip $(BR2_GCC_AVR32_CONFIGURATION)),y)
+EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+endif
+
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
 #"))
 GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
@@ -79,5 +85,10 @@
 endif
 endif # BR2_PREFER_IMA=y
 
+# AVR32 target GCC configuration
+ifeq ($(strip $(BR2_GCC_TARGET_AVR32_CONFIGURATION)),y)
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+endif
+
 TARGETS+=gcc_target
 endif
