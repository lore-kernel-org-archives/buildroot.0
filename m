From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Dec 2008 22:29:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20081226222920.A39B176F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-26 22:29:19 +0000 (Fri, 26 Dec 2008)
New Revision: 24560

Log:
libglib2: bump version

Added:
   trunk/buildroot/package/libglib2/libglib2-mkenums-nowarn.patch
   trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch

Removed:
   trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch
   trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Deleted: trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch	2008-12-26 19:08:55 UTC (rev 24559)
+++ trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch	2008-12-26 22:29:19 UTC (rev 24560)
@@ -1,8 +0,0 @@
---- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
-+++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
-@@ -1,4 +1,4 @@
--#!@PERL_PATH@ -w
-+#!@PERL_PATH@
- 
- # glib-mkenums.pl 
- # Information about the current enumeration

Deleted: trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch	2008-12-26 19:08:55 UTC (rev 24559)
+++ trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch	2008-12-26 22:29:19 UTC (rev 24560)
@@ -1,15 +0,0 @@
---- a/glib-2.0.pc.in	2007-01-16 18:24:39.000000000 -0500
-+++ b/glib-2.0.pc.in	2008-02-09 09:25:28.000000000 -0500
-@@ -3,9 +3,9 @@ exec_prefix=@exec_prefix@
- libdir=@libdir@
- includedir=@includedir@
- 
--glib_genmarshal=glib-genmarshal
--gobject_query=gobject-query
--glib_mkenums=glib-mkenums
-+glib_genmarshal=/usr/bin/glib-genmarshal
-+gobject_query=/usr/bin/gobject-query
-+glib_mkenums=/usr/bin/glib-mkenums
- 
- Name: GLib
- Description: C Utility Library

Copied: trunk/buildroot/package/libglib2/libglib2-mkenums-nowarn.patch (from rev 24553, trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch)
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-mkenums-nowarn.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2-mkenums-nowarn.patch	2008-12-26 22:29:19 UTC (rev 24560)
@@ -0,0 +1,8 @@
+--- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
++++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
+@@ -1,4 +1,4 @@
+-#!@PERL_PATH@ -w
++#!@PERL_PATH@
+ 
+ # glib-mkenums.pl 
+ # Information about the current enumeration

Copied: trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch (from rev 24553, trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch)
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	2008-12-26 22:29:19 UTC (rev 24560)
@@ -0,0 +1,15 @@
+--- a/glib-2.0.pc.in	2007-01-16 18:24:39.000000000 -0500
++++ b/glib-2.0.pc.in	2008-02-09 09:25:28.000000000 -0500
+@@ -3,9 +3,9 @@ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
+ 
+-glib_genmarshal=glib-genmarshal
+-gobject_query=gobject-query
+-glib_mkenums=glib-mkenums
++glib_genmarshal=/usr/bin/glib-genmarshal
++gobject_query=/usr/bin/gobject-query
++glib_mkenums=/usr/bin/glib-mkenums
+ 
+ Name: GLib
+ Description: C Utility Library

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-12-26 19:08:55 UTC (rev 24559)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-12-26 22:29:19 UTC (rev 24560)
@@ -3,7 +3,7 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION = 2.15.4
+LIBGLIB2_VERSION = 2.16.6
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/2.15
 LIBGLIB2_AUTORECONF = NO
