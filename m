From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 26 Aug 2008 08:43:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lite
Message-ID: <20080826154310.9D7A53C870@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-26 08:43:10 -0700 (Tue, 26 Aug 2008)
New Revision: 23209

Log:
Clean up LiTE

Modified:
   trunk/buildroot/package/lite/lite.mk
   trunk/buildroot/package/lite/no_tests.patch


Changeset:
Modified: trunk/buildroot/package/lite/lite.mk
===================================================================
--- trunk/buildroot/package/lite/lite.mk	2008-08-26 14:52:17 UTC (rev 23208)
+++ trunk/buildroot/package/lite/lite.mk	2008-08-26 15:43:10 UTC (rev 23209)
@@ -18,8 +18,8 @@
 
 $(LITE_HOOK_POST_INSTALL):
 	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
-	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype/
 	$(INSTALL) -m0644 $(LITE_DIR)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
 	$(INSTALL) -m0644 $(LITE_DIR)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
-	$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/ 
-	touch $@
\ No newline at end of file
+	$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/
+	touch $@

Modified: trunk/buildroot/package/lite/no_tests.patch
===================================================================
--- trunk/buildroot/package/lite/no_tests.patch	2008-08-26 14:52:17 UTC (rev 23208)
+++ trunk/buildroot/package/lite/no_tests.patch	2008-08-26 15:43:10 UTC (rev 23209)
@@ -1,6 +1,3 @@
---- package/lite/no-examples-no-tests.patch	(revision 0)
-+++ package/lite/no-examples-no-tests.patch	(revision 0)
-@@ -0,0 +1,11 @@
 --- Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
 +++ Makefile.in	2008-07-07 13:07:05.000000000 +0200
 @@ -202,7 +202,7 @@
