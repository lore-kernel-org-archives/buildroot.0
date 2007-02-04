From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 07:23:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070204152327.9A7E34856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 07:23:26 -0800 (Sun, 04 Feb 2007)
New Revision: 17759

Log:
- allow intermodule also for 4.1


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-02-04 11:16:21 UTC (rev 17758)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-02-04 15:23:26 UTC (rev 17759)
@@ -60,12 +60,11 @@
 #"))
 
 ifeq ($(BR2_PREFER_IMA),y)
-# >= 4.2
-ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
+# >= 4.1
+ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
+ifneq ($(findstring 4.0,$(GCC_VERSION)),4.0)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
 endif
-ifeq ($(findstring 4.3,$(GCC_VERSION)),4.3)
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
 endif
 endif # BR2_PREFER_IMA=y
 
