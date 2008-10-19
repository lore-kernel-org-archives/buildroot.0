From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 14:48:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libX11
Message-ID: <20081019214849.2F63C3C84C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 14:48:48 -0700 (Sun, 19 Oct 2008)
New Revision: 23725

Log:
x11r7/libX11: use install-strip for target install

Saves ~11 MB

Modified:
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2008-10-19 19:54:49 UTC (rev 23724)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2008-10-19 21:48:48 UTC (rev 23725)
@@ -10,7 +10,7 @@
 XLIB_LIBX11_AUTORECONF = NO
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_INSTALL_TARGET = YES
-XLIB_LIBX11_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
+XLIB_LIBX11_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
 XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static
