From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 16 Aug 2007 04:18:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070816111833.548F4A4563@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-16 04:18:29 -0700 (Thu, 16 Aug 2007)
New Revision: 19529

Log:
Dont create TARGET_DIR if it exists

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-16 10:41:24 UTC (rev 19528)
+++ trunk/buildroot/Makefile	2007-08-16 11:18:29 UTC (rev 19529)
@@ -246,7 +246,7 @@
 	@mkdir -p $(STAGING_DIR)/usr/include
 
 $(PROJECT_BUILD_DIR)/.root:
-	mkdir	$(TARGET_DIR)
+	mkdir	-p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ] ; then \
 		if [ -d "$(TARGET_SKELETON)" ] ; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
