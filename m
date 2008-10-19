From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 14:48:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXaw
Message-ID: <20081019214856.2D3043C86A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 14:48:55 -0700 (Sun, 19 Oct 2008)
New Revision: 23727

Log:
x11r7/libXaw: use install-strip for target install

Saves ~3 MB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk	2008-10-19 21:48:52 UTC (rev 23726)
+++ trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk	2008-10-19 21:48:55 UTC (rev 23727)
@@ -9,6 +9,8 @@
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_AUTORECONF = NO
 XLIB_LIBXAW_INSTALL_STAGING = YES
+XLIB_LIBXAW_INSTALL_TARGET = YES
+XLIB_LIBXAW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
 XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static
 
