From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 02:52:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXft
Message-ID: <20081020095215.2D8963C7BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 02:52:14 -0700 (Mon, 20 Oct 2008)
New Revision: 23739

Log:
x11r7/libXft: use install-strip for target install

Saves ~400 KB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk	2008-10-20 09:52:11 UTC (rev 23738)
+++ trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk	2008-10-20 09:52:14 UTC (rev 23739)
@@ -9,6 +9,8 @@
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_AUTORECONF = NO
 XLIB_LIBXFT_INSTALL_STAGING = YES
+XLIB_LIBXFT_INSTALL_TARGET = YES
+XLIB_LIBXFT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 XLIB_LIBXFT_CONF_OPT = --enable-shared --disable-static
 
