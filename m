From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 08:46:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmpc
Message-ID: <20081229084626.38A7B76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 08:46:25 +0000 (Mon, 29 Dec 2008)
New Revision: 24588

Log:
gmpc: needs libglade as well

Modified:
   trunk/buildroot/package/gmpc/Config.in
   trunk/buildroot/package/gmpc/gmpc.mk


Changeset:
Modified: trunk/buildroot/package/gmpc/Config.in
===================================================================
--- trunk/buildroot/package/gmpc/Config.in	2008-12-29 01:03:17 UTC (rev 24587)
+++ trunk/buildroot/package/gmpc/Config.in	2008-12-29 08:46:25 UTC (rev 24588)
@@ -7,7 +7,9 @@
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBMPD
-	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCUR
+	select BR2_PACKAGE_LIBGLADE
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Gnome Music Player Client is a GNOME/GTK2.2 client for
 	  Music Player Daemon.

Modified: trunk/buildroot/package/gmpc/gmpc.mk
===================================================================
--- trunk/buildroot/package/gmpc/gmpc.mk	2008-12-29 01:03:17 UTC (rev 24587)
+++ trunk/buildroot/package/gmpc/gmpc.mk	2008-12-29 08:46:25 UTC (rev 24588)
@@ -11,7 +11,7 @@
 GMPC_CONF_OPT = --disable-mmkeys $(DISABLE_NLS)
 
 
-GMPC_DEPENDENCIES = libglib2 libgtk2 libcurl libmpd
+GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd
 
 
 $(eval $(call AUTOTARGETS,package,gmpc))
