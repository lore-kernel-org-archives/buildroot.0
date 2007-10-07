From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  7 Oct 2007 10:22:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071007172256.F0C54A685A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-07 10:22:56 -0700 (Sun, 07 Oct 2007)
New Revision: 20193

Log:
Do not create directories, if they exist

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-07 17:06:26 UTC (rev 20192)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-07 17:22:56 UTC (rev 20193)
@@ -277,7 +277,7 @@
 	-C $(GCC_BUILD_DIR2) install
 	if [ -d "$(STAGING_DIR)/usr/lib64" ]; then \
 		if [ ! -e "$(STAGING_DIR)/usr/lib" ]; then \
-			mkdir "$(STAGING_DIR)/usr/lib"; \
+			mkdir -p "$(STAGING_DIR)/usr/lib"; \
 		fi; \
 		mv "$(STAGING_DIR)/usr/lib64/"* "$(STAGING_DIR)/usr/lib/"; \
 		rmdir "$(STAGING_DIR)/usr/lib64"; \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-07 17:06:26 UTC (rev 20192)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-07 17:22:56 UTC (rev 20193)
@@ -290,7 +290,7 @@
 		-C $(GCC_BUILD_DIR2) install
 	if [ -d "$(STAGING_DIR)/lib64" ]; then \
 		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
-			mkdir "$(STAGING_DIR)/lib"; \
+			mkdir -p "$(STAGING_DIR)/lib"; \
 		fi; \
 		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
 		rmdir "$(STAGING_DIR)/lib64"; \
