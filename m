From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  4 Jul 2007 22:15:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070705051548.7E456A6134@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-04 22:15:47 -0700 (Wed, 04 Jul 2007)
New Revision: 19002

Log:
This was for when I was building a toolchain without BR2_TOOLCHAIN_SYSROOT set. Maybe when it is set the C++ libraries get put into $(TARGET_DIR)/lib. If that is the case, then an 'if-else' block will need to be placed to strip the right location.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-07-05 05:13:46 UTC (rev 19001)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-07-05 05:15:47 UTC (rev 19002)
@@ -306,7 +306,7 @@
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libstdc++.so*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
