From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 07:05:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070628140531.AF4F2A4676@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 07:05:29 -0700 (Thu, 28 Jun 2007)
New Revision: 18964

Log:
- work around bug in gcc (or rather libiberty) for parallel install


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-28 14:03:04 UTC (rev 18963)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-28 14:05:29 UTC (rev 18964)
@@ -400,7 +400,7 @@
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
-		$(MAKE) -C $(GCC_BUILD_DIR3) install
+		$(MAKE1) -C $(GCC_BUILD_DIR3) install
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 	#
