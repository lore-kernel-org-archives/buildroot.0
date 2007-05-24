From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 May 2007 01:41:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070524084150.AC11248003@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-24 01:41:49 -0700 (Thu, 24 May 2007)
New Revision: 18679

Log:
fontconfig requires expat

Modified:
   trunk/buildroot/package/fontconfig/Config.in
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/Config.in
===================================================================
--- trunk/buildroot/package/fontconfig/Config.in	2007-05-24 04:37:20 UTC (rev 18678)
+++ trunk/buildroot/package/fontconfig/Config.in	2007-05-24 08:41:49 UTC (rev 18679)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_EXPAT
 	default n
 	help
 

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-05-24 04:37:20 UTC (rev 18678)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-05-24 08:41:49 UTC (rev 18679)
@@ -79,7 +79,7 @@
 	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-list
 
-fontconfig: uclibc freetype host-freetype $(TARGET_DIR)/lib/libfontconfig.so
+fontconfig: uclibc freetype host-freetype expat $(TARGET_DIR)/lib/libfontconfig.so
 
 fontconfig-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall
