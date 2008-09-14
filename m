From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 14 Sep 2008 12:35:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20080915150246.CDCD83C729@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-14 12:35:45 -0700 (Sun, 14 Sep 2008)
New Revision: 23397

Log:
fontconfig: use install-strip for target install

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-09-14 19:31:36 UTC (rev 23396)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-09-14 19:35:45 UTC (rev 23397)
@@ -10,7 +10,7 @@
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 
-FONTCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+FONTCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
