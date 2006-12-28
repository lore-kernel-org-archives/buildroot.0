From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Dec 2006 00:48:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061228084831.95CA9485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-28 00:48:31 -0800 (Thu, 28 Dec 2006)
New Revision: 17098

Log:
- Pass largefile support down to the cross- and the native target compiler.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-28 08:47:36 UTC (rev 17097)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-28 08:48:31 UTC (rev 17098)
@@ -207,6 +207,7 @@
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
+		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
 	touch $(GCC_BUILD_DIR2)/.configured
 
@@ -335,6 +336,7 @@
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
+		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
 	touch $(GCC_BUILD_DIR3)/.configured
 
