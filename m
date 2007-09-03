From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  2 Sep 2007 23:26:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070903062608.3D391A65E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-02 23:26:06 -0700 (Sun, 02 Sep 2007)
New Revision: 19770

Log:
Cleanup handling of gccbug script

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-03 06:10:01 UTC (rev 19769)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-03 06:26:06 UTC (rev 19770)
@@ -282,7 +282,7 @@
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-03 06:10:01 UTC (rev 19769)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-03 06:26:06 UTC (rev 19770)
@@ -290,7 +290,7 @@
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
