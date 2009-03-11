From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 15:43:52 +0000 (UTC)
Subject: [Buildroot] svn commit: [25611] trunk/buildroot/package/fontconfig
Message-ID: <20090311154352.4D2937645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 15:43:52 +0000 (Wed, 11 Mar 2009)
New Revision: 25611

Log:
fontconfig: store font cache in /var/cache/fontconfig, and not in /usr/var/..

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-11 15:43:47 UTC (rev 25610)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-11 15:43:52 UTC (rev 25611)
@@ -15,6 +15,7 @@
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
+		--with-cache-dir=/var/cache/fontconfig
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \
 		--with-expat-includes=$(STAGING_DIR)/usr/include \
