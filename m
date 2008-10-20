From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 02:40:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXfont
Message-ID: <20081020094041.D9EBC3C6DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 02:40:41 -0700 (Mon, 20 Oct 2008)
New Revision: 23736

Log:
x11r7/libXfont: use install-strip for target install

Saves ~800 KB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk	2008-10-20 09:04:49 UTC (rev 23735)
+++ trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk	2008-10-20 09:40:41 UTC (rev 23736)
@@ -9,6 +9,8 @@
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = NO
 XLIB_LIBXFONT_INSTALL_STAGING = YES
+XLIB_LIBXFONT_INSTALL_TARGET = YES
+XLIB_LIBXFONT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static
 
