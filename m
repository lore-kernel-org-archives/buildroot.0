From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 11:44:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [26192] trunk/buildroot/package/dbus-glib
Message-ID: <20090423114455.30F7476454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 11:44:54 +0000 (Thu, 23 Apr 2009)
New Revision: 26192

Log:
dbus-glib: needs expat

Even though dbus can use libxml2 for XML support, dbus-glib cannot -
So make sure expat is available.

Modified:
   trunk/buildroot/package/dbus-glib/Config.in
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	2009-04-23 11:44:48 UTC (rev 26191)
+++ trunk/buildroot/package/dbus-glib/Config.in	2009-04-23 11:44:54 UTC (rev 26192)
@@ -2,6 +2,7 @@
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_EXPAT
 	help
 	  GLib bindings for D-Bus.
 

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-04-23 11:44:48 UTC (rev 26191)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-04-23 11:44:54 UTC (rev 26192)
@@ -23,7 +23,7 @@
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2
+DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2 expat
 
 $(eval $(call AUTOTARGETS,package,dbus-glib))
 
