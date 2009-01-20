From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 22:38:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus-glib
Message-ID: <20090120223840.3A76B770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 22:38:39 +0000 (Tue, 20 Jan 2009)
New Revision: 24930

Log:
Fix circular dependency

Modified:
   trunk/buildroot/package/dbus-glib/Config.in


Changeset:
Modified: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	2009-01-20 22:25:55 UTC (rev 24929)
+++ trunk/buildroot/package/dbus-glib/Config.in	2009-01-20 22:38:39 UTC (rev 24930)
@@ -3,7 +3,6 @@
 	depends on BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PKGCONFIG
-	select BR2_PACKAGE_EXPAT
 	help
 	  GLib bindings for D-Bus.
 
