From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20080826204723.D59DF3C808@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:23 -0700 (Tue, 26 Aug 2008)
New Revision: 23222

Log:
neon: use := assignments

Modified:
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:19 UTC (rev 23221)
+++ trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:23 UTC (rev 23222)
@@ -3,14 +3,12 @@
 # neon
 #
 #############################################################
-NEON_VERSION = 0.28.3
-NEON_SITE = http://www.webdav.org/neon/
-NEON_INSTALL_STAGING = YES
+NEON_VERSION:=0.28.3
+NEON_SITE:=http://www.webdav.org/neon/
+NEON_INSTALL_STAGING:=YES
+NEON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
+NEON_CONF_OPT:=--enable-shared --without-gssapi --disable-rpath
 
-NEON_CONF_OPT+=--enable-shared --without-gssapi --disable-rpath
-
-NEON_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
-
 NEON_DEPENDENCIES:=pkgconfig
 
 ifeq ($(strip $(BR2_PACKAGE_NEON_LIBXML2)),y)
