From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Mon, 17 Dec 2007 03:37:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071217113751.1B47C1200F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-17 03:37:47 -0800 (Mon, 17 Dec 2007)
New Revision: 20655

Log:
revert 20646 rev (gcc-cc_links-fix.diff), it's broken for arm as mentioned in 1764 issue

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-16 17:22:33 UTC (rev 20654)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-17 11:37:47 UTC (rev 20655)
@@ -293,8 +293,8 @@
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
 			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc; \
+	if [ ! -e $(STAGING_DIR)/usr/bin/gcc ]; then \
+		ln -snf gcc $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-16 17:22:33 UTC (rev 20654)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-17 11:37:47 UTC (rev 20655)
@@ -306,8 +306,8 @@
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
 			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/cc; \
+	if [ ! -e $(STAGING_DIR)/usr/bin/cc ]; then \
+		ln -snf gcc $(STAGING_DIR)/usr/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
