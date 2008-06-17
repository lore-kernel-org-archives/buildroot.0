From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 06:28:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080617132838.0F32E3C74D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-17 06:28:37 -0700 (Tue, 17 Jun 2008)
New Revision: 22400

Log:
toolchain/gcc-4.x: strip cross libgcc / libstdc++


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-17 12:54:36 UTC (rev 22399)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-17 13:28:37 UTC (rev 22400)
@@ -349,11 +349,13 @@
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* \
 		$(TARGET_DIR)/lib/
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
