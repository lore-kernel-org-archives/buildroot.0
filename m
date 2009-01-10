From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 Jan 2009 00:20:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
Message-ID: <20090110002007.601A97697D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-10 00:20:05 +0000 (Sat, 10 Jan 2009)
New Revision: 24736

Log:
liberation internal dependencies are corrected

Modified:
   trunk/buildroot/package/liberation/liberation.mk


Changeset:
Modified: trunk/buildroot/package/liberation/liberation.mk
===================================================================
--- trunk/buildroot/package/liberation/liberation.mk	2009-01-10 00:18:04 UTC (rev 24735)
+++ trunk/buildroot/package/liberation/liberation.mk	2009-01-10 00:20:05 UTC (rev 24736)
@@ -18,7 +18,7 @@
 	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LIBERATION_DIR)/.unpacked
 
-$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
+$(STAGING_DIR)/usr/share/fonts/.ttf: $(LIBERATION_DIR)/.unpacked
 	-mkdir -p $(STAGING_DIR)/usr/share/fonts/liberation
 	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(STAGING_DIR)/usr/share/fonts/liberation/
 	touch -c $(STAGING_DIR)/usr/share/fonts/.ttf
