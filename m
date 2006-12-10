From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 10 Dec 2006 05:24:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061210132404.9A2904859C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-10 05:24:03 -0800 (Sun, 10 Dec 2006)
New Revision: 16832

Log:
- revert r16800.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-10 02:52:19 UTC (rev 16831)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-10 13:24:03 UTC (rev 16832)
@@ -115,7 +115,7 @@
 # fixed, so we need to actually have working C library header files prior to
 # the step or libgcc will not build...
 
-$(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched uclibc-configured
+$(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); PATH=$(TARGET_PATH) \
 		CC="$(HOSTCC)" \
