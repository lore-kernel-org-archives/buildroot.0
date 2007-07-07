From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 05:58:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070707125816.AFD96A67F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 05:58:15 -0700 (Sat, 07 Jul 2007)
New Revision: 19021

Log:
- use correct path to libstdc++


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 12:28:25 UTC (rev 19020)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 12:58:15 UTC (rev 19021)
@@ -303,7 +303,7 @@
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/usr/lib/libstdc++.so* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
