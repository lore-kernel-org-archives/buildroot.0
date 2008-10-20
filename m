From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 02:52:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXext
Message-ID: <20081020095211.75A5D3C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 02:52:11 -0700 (Mon, 20 Oct 2008)
New Revision: 23738

Log:
x11r7/libXext: use install-strip for target install

Saves ~400 KB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk	2008-10-20 09:40:45 UTC (rev 23737)
+++ trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk	2008-10-20 09:52:11 UTC (rev 23738)
@@ -9,6 +9,8 @@
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_AUTORECONF = NO
 XLIB_LIBXEXT_INSTALL_STAGING = YES
+XLIB_LIBXEXT_INSTALL_TARGET = YES
+XLIB_LIBXEXT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
 
