From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 16 Aug 2008 12:13:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20080816191353.DD48B3C822@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-16 12:13:53 -0700 (Sat, 16 Aug 2008)
New Revision: 23093

Log:
fontconfig: remove redundant configure args

Patch by antialize / bug #4524.

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-08-16 12:32:57 UTC (rev 23092)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-08-16 19:13:53 UTC (rev 23093)
@@ -12,9 +12,7 @@
 
 FONTCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-FONTCONFIG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --with-arch=$(GNU_TARGET_NAME) \
-		--prefix=/usr --sysconfdir=/etc \
+FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \
