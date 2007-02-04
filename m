From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 13:59:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070204215941.1A35B48661@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 13:59:39 -0800 (Sun, 04 Feb 2007)
New Revision: 17773

Log:
- add missing hunk from fix for #1191


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-04 21:30:35 UTC (rev 17772)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-04 21:59:39 UTC (rev 17773)
@@ -309,6 +309,7 @@
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
 	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
+	touch $@
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
 	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
@@ -333,7 +334,7 @@
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.installed $(GCC_TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.libs_installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 
