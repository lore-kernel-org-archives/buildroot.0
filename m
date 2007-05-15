From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 15 May 2007 06:58:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070515135835.AFEA94807F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-15 06:58:35 -0700 (Tue, 15 May 2007)
New Revision: 18630

Log:
Strip libraries

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-05-15 12:50:04 UTC (rev 18629)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-05-15 13:58:35 UTC (rev 18630)
@@ -292,9 +292,11 @@
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libstc++.so*
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
