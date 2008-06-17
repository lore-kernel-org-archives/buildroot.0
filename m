From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 05:54:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080617125437.0554F3C70D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-17 05:54:36 -0700 (Tue, 17 Jun 2008)
New Revision: 22399

Log:
toolchain/gcc-3.x: strip cross libgcc / libstdc++ with cross-strip, not host.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-06-17 12:45:39 UTC (rev 22398)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-06-17 12:54:36 UTC (rev 22399)
@@ -336,12 +336,12 @@
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* \
 		$(TARGET_DIR)/lib/
-	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
-	-strip --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
