From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 08:14:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071012151446.0D3FEA683A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 08:14:46 -0700 (Fri, 12 Oct 2007)
New Revision: 20233

Log:
Do not copy shared C++ lib, unless one is built

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-12 15:12:55 UTC (rev 20232)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-12 15:14:46 UTC (rev 20233)
@@ -337,9 +337,11 @@
 	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
 	-strip --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
+endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/usr/lib/
