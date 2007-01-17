From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 03:34:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070117113421.04D804858B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 03:34:20 -0800 (Wed, 17 Jan 2007)
New Revision: 17335

Log:
- move the X packages into a separate menu
  I'll do this for "graphic libraries" and "networking" too unless someone complains..


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 11:27:14 UTC (rev 17334)
+++ trunk/buildroot/package/Config.in	2007-01-17 11:34:20 UTC (rev 17335)
@@ -38,14 +38,12 @@
 source "package/boa/Config.in"
 source "package/bridge/Config.in"
 source "package/bsdiff/Config.in"
-source "package/cairo/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
-source "package/dillo/Config.in"
 source "package/directfb/Config.in"
 source "package/distcc/Config.in"
 source "package/dm/Config.in"
@@ -58,8 +56,6 @@
 source "package/e2fsprogs/Config.in"
 source "package/fakeroot/Config.in"
 source "package/file/Config.in"
-source "package/fontconfig/Config.in"
-source "package/freetype/Config.in"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
 source "package/mpfr/Config.in"
@@ -82,10 +78,6 @@
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
-source "package/libglib12/Config.in"
-source "package/libglib2/Config.in"
-source "package/libgtk12/Config.in"
-source "package/libgtk2/Config.in"
 source "package/libmad/Config.in"
 source "package/libpcap/Config.in"
 source "package/libpng/Config.in"
@@ -106,10 +98,8 @@
 source "package/m4/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
-source "package/metacity/Config.in"
 source "package/microcom/Config.in"
 source "package/microperl/Config.in"
-source "package/microwin/Config.in"
 source "package/mkdosfs/Config.in"
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
@@ -132,7 +122,6 @@
 source "package/openssl/Config.in"
 source "package/openvpn/Config.in"
 source "package/openswan/Config.in"
-source "package/pango/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/pkgconfig/Config.in"
@@ -149,7 +138,6 @@
 source "package/readline/Config.in"
 source "package/rsync/Config.in"
 source "package/ruby/Config.in"
-source "package/rxvt/Config.in"
 source "package/samba/Config.in"
 source "package/sdl/Config.in"
 source "package/sfdisk/Config.in"
@@ -168,7 +156,6 @@
 source "package/thttpd/Config.in"
 source "package/tiff/Config.in"
 source "package/tinylogin/Config.in"
-source "package/tinyx/Config.in"
 source "package/tn5250/Config.in"
 source "package/ttcp/Config.in"
 source "package/udev/Config.in"
@@ -184,8 +171,35 @@
 source "package/wipe/Config.in"
 source "package/wireless-tools/Config.in"
 source "package/xfsprogs/Config.in"
-source "package/xorg/Config.in"
 source "package/zlib/Config.in"
 
+config BR2_X_WINDOW_SYSTEM
+	bool "X Window System"
+	default n
+	help
+	  Support for X and related packages
 
+if BR2_X_WINDOW_SYSTEM
+menu "X11"
+comment "X server"
+source "package/xorg/Config.in"
+source "package/tinyx/Config.in"
+comment "X libraries and helper libraries"
+source "package/cairo/Config.in"
+source "package/pango/Config.in"
+source "package/libglib12/Config.in"
+source "package/libglib2/Config.in"
+source "package/libgtk12/Config.in"
+source "package/libgtk2/Config.in"
+source "package/fontconfig/Config.in"
+source "package/freetype/Config.in"
+comment "Window managers"
+source "package/microwin/Config.in"
+source "package/metacity/Config.in"
+comment "X applications"
+source "package/rxvt/Config.in"
+source "package/dillo/Config.in"
 endmenu
+endif
+
+endmenu
