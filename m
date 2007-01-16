From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 16 Jan 2007 00:10:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070116081028.268424856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-16 00:10:27 -0800 (Tue, 16 Jan 2007)
New Revision: 17323

Log:
Add in a few useful bits for font handling


Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-16 01:29:38 UTC (rev 17322)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-16 08:10:27 UTC (rev 17323)
@@ -59,6 +59,12 @@
 	mkdir -p $(TARGET_DIR)/etc/fonts
 	cp $(STAGING_DIR)/etc/fonts/fonts.conf $(TARGET_DIR)/etc/fonts/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfontconfig.so
+	mkdir -p $(TARGET_DIR)/var/cache/fontconfig
+	mkdir -p $(TARGET_DIR)/usr/bin
+	cp -a $(STAGING_DIR)/usr/bin/fc-cache $(TARGET_DIR)/usr/bin/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-cache
+	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-list
 
 fontconfig: uclibc freetype $(TARGET_DIR)/lib/libfontconfig.so
 
