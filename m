From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Aug 2007 02:26:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20070824092651.5378BA4656@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-24 02:26:50 -0700 (Fri, 24 Aug 2007)
New Revision: 19673

Log:
- fix wrong src-path of libasound (Simon Pasch)


Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-08-24 08:11:17 UTC (rev 19672)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-08-24 09:26:50 UTC (rev 19673)
@@ -48,9 +48,8 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libasound.la
 
 $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/usr/share/alsa
-	mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
-	cp -dpf $(STAGING_DIR)/lib/libasound.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(TARGET_DIR)/usr/share/alsa $(TARGET_DIR)/usr/lib/alsa-lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libasound.so* $(TARGET_DIR)/usr/lib/
 	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
 	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
