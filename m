From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:53:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070821105340.0A218A45BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:53:39 -0700 (Tue, 21 Aug 2007)
New Revision: 19606

Log:
- fix whitespace damage..


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-21 10:42:05 UTC (rev 19605)
+++ trunk/buildroot/Makefile	2007-08-21 10:53:39 UTC (rev 19606)
@@ -249,7 +249,7 @@
 	@mkdir -p $(STAGING_DIR)/usr/include
 
 $(PROJECT_BUILD_DIR)/.root:
-	mkdir	-p $(TARGET_DIR)
+	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ] ; then \
 		if [ -d "$(TARGET_SKELETON)" ] ; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
@@ -258,7 +258,7 @@
 		-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf ; \
 		-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf ; \
 	fi;
-	touch	$@
+	touch $@
 
 $(TARGET_DIR):	$(PROJECT_BUILD_DIR)/.root
 
