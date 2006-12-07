From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Dec 2006 09:02:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061207170233.0C7C8485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-07 09:02:32 -0800 (Thu, 07 Dec 2006)
New Revision: 16800

Log:
- The sysroot requires an existing argument, so make sure that we did configure
  uClibc properly before attempting to use it.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-07 16:31:21 UTC (rev 16799)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-07 17:02:32 UTC (rev 16800)
@@ -115,7 +115,7 @@
 # fixed, so we need to actually have working C library header files prior to
 # the step or libgcc will not build...
 
-$(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
+$(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched uclibc-configured
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); PATH=$(TARGET_PATH) \
 		CC="$(HOSTCC)" \
