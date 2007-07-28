From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 10:14:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20070728171407.3D333A493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 10:14:06 -0700 (Sat, 28 Jul 2007)
New Revision: 19302

Log:
Use correct path for alsa-lib

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-07-28 17:09:44 UTC (rev 19301)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-07-28 17:14:06 UTC (rev 19302)
@@ -45,7 +45,7 @@
 
 $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
-	touch -c $@
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libasound.la
 
 $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/usr/share/alsa
