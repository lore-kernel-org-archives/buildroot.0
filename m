From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 05:30:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071012123015.A7931A45CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 05:30:14 -0700 (Fri, 12 Oct 2007)
New Revision: 20226

Log:
Cannot copy shared c++ lib, if one has not been created

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-11 19:53:10 UTC (rev 20225)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-12 12:30:14 UTC (rev 20226)
@@ -349,9 +349,11 @@
 		$(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 endif
+endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
 	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
