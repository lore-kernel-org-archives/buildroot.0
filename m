From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 04:10:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071213121000.C92621200F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 04:09:56 -0800 (Thu, 13 Dec 2007)
New Revision: 20646

Log:
fix gcc 3.x/4.x symlinks to cc

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-13 12:01:48 UTC (rev 20645)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-13 12:09:56 UTC (rev 20646)
@@ -293,8 +293,8 @@
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
 			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/bin/gcc ]; then \
-		ln -snf gcc $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
+	if [ ! -e $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-13 12:01:48 UTC (rev 20645)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-13 12:09:56 UTC (rev 20646)
@@ -306,8 +306,8 @@
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
 			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/usr/bin/cc; \
+	if [ ! -e $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
