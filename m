From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20080826204719.B6D8F3C808@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:19 -0700 (Tue, 26 Aug 2008)
New Revision: 23221

Log:
neon: uses pkgconfig so select it

Modified:
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/Config.in
===================================================================
--- trunk/buildroot/package/neon/Config.in	2008-08-26 20:47:15 UTC (rev 23220)
+++ trunk/buildroot/package/neon/Config.in	2008-08-26 20:47:19 UTC (rev 23221)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NEON
 	bool "libneon"
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  HTTP and WebDAV client library, with a C interface.
 

Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:15 UTC (rev 23220)
+++ trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:19 UTC (rev 23221)
@@ -11,6 +11,8 @@
 
 NEON_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
+NEON_DEPENDENCIES:=pkgconfig
+
 ifeq ($(strip $(BR2_PACKAGE_NEON_LIBXML2)),y)
 NEON_CONF_OPT+=--with-libxml2=yes
 NEON_CONF_OPT+=--with-expat=no
