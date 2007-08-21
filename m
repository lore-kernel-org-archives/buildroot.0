From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:28:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070821102843.A2E07A4622@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:28:43 -0700 (Tue, 21 Aug 2007)
New Revision: 19602

Log:
- put libstdc++.so into the correct place (usr/lib) and make sure that the dir exists


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 10:26:55 UTC (rev 19601)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 10:28:43 UTC (rev 19602)
@@ -309,6 +309,7 @@
 	#
 	# Ok... that's enough of that.
 	#
+	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 10:26:55 UTC (rev 19601)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 10:28:43 UTC (rev 19602)
@@ -333,6 +333,7 @@
 	#
 	# Ok... that's enough of that.
 	#
+	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
@@ -342,7 +343,7 @@
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
 	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
