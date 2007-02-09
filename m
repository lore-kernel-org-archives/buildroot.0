From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 05:43:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070209134337.B89C348633@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 05:43:36 -0800 (Fri, 09 Feb 2007)
New Revision: 17836

Log:
- 4.0.4 *seems* to support this too, so just exclude anything that is even older than that one.


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-02-09 13:35:41 UTC (rev 17835)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-02-09 13:43:36 UTC (rev 17836)
@@ -60,12 +60,10 @@
 #"))
 
 ifeq ($(BR2_PREFER_IMA),y)
-# >= 4.1
-ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
-ifneq ($(findstring 4.0,$(GCC_VERSION)),4.0)
+# >= 4.x
+ifneq ($(findstring 3.,$(GCC_VERSION)),3.)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
 endif
-endif
 endif # BR2_PREFER_IMA=y
 
 TARGETS+=gcc_target
