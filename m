From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sat, 10 Jan 2009 13:47:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20090110134719.B1C2B76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-10 13:47:18 +0000 (Sat, 10 Jan 2009)
New Revision: 24744

Log:
Get rid of a host-dependency.


Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-01-10 12:45:27 UTC (rev 24743)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-01-10 13:47:18 UTC (rev 24744)
@@ -11,7 +11,7 @@
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 # This package does not like using the target cflags for some reason.
-FONTCONFIG_CONF_ENV = CFLAGS=
+FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
