From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 02:55:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20070923095517.D4BD83007D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 02:55:17 -0700 (Sun, 23 Sep 2007)
New Revision: 19958

Log:
Do not use $(STAGING_DIR)/include for freetype, for now

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-09-23 09:53:43 UTC (rev 19957)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-09-23 09:55:17 UTC (rev 19958)
@@ -50,8 +50,9 @@
 $(STAGING_DIR)/usr/include/freetype:
 	ln -sf ./freetype2/freetype $(STAGING_DIR)/usr/include/freetype
 
-$(STAGING_DIR)/include/freetype:
-	ln -sf ../usr/include/freetype2/freetype $(STAGING_DIR)/include/freetype
+#$(STAGING_DIR)/include/freetype:
+#	mkdir -p $(STAGING_DIR)/include
+#	ln -sf ../usr/include/freetype2/freetype $(STAGING_DIR)/include/freetype
 
 $(STAGING_DIR)/lib/libfreetype.so: $(FREETYPE_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FREETYPE_DIR) install
@@ -96,7 +97,7 @@
 
 freetype-source: $(DL_DIR)/$(FREETYPE_SOURCE)
 
-freetype-links: $(STAGING_DIR)/usr/include/freetype $(STAGING_DIR)/include/freetype
+freetype-links: $(STAGING_DIR)/usr/include/freetype # $(STAGING_DIR)/include/freetype
 
 freetype-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FREETYPE_DIR) uninstall
