From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:15:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070819211504.AE6C5A612F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:15:02 -0700 (Sun, 19 Aug 2007)
New Revision: 19570

Log:
gcc-4 cleanup

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-19 21:13:08 UTC (rev 19569)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-19 21:15:02 UTC (rev 19570)
@@ -309,7 +309,7 @@
 		cd usr/bin; \
 		for app in $(REAL_GNU_TARGET_NAME)-* ; do \
 			ln -snf $${app} \
-		   	$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
+			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
 		done; \
 	);
 	#
@@ -342,7 +342,7 @@
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/usr/lib/libstdc++.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
