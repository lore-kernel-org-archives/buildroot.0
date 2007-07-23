From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:01:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070723120109.A56FFA6879@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:01:05 -0700 (Mon, 23 Jul 2007)
New Revision: 19221

Log:
Undo conditional configuration for fbv and fbset

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-23 11:37:25 UTC (rev 19220)
+++ trunk/buildroot/package/Config.in	2007-07-23 12:01:05 UTC (rev 19221)
@@ -285,10 +285,6 @@
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || BR2_avr32
-source "package/fbv/Config.in"
-source "package/fbset/Config.in"
-endif
 source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"
 source "package/libpng/Config.in"
@@ -296,6 +292,11 @@
 source "package/sdl/Config.in"
 source "package/tiff/Config.in"
 
+comment "busybox graphic applications" 
+comment "--> (May be broken in busybox)"
+source "package/fbv/Config.in"
+source "package/fbset/Config.in"
+
 comment "other GUIs"
 source "package/qte/Config.in"
 source "package/qtopia4/Config.in"
