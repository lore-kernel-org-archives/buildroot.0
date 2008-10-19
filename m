From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 14:48:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXt
Message-ID: <20081019214853.1DEDB3C85E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 14:48:52 -0700 (Sun, 19 Oct 2008)
New Revision: 23726

Log:
x11r7/libXt: use install-strip for target install

Saves ~1.4 MB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-19 21:48:48 UTC (rev 23725)
+++ trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-19 21:48:52 UTC (rev 23726)
@@ -9,6 +9,8 @@
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = NO
 XLIB_LIBXT_INSTALL_STAGING = YES
+XLIB_LIBXT_INSTALL_TARGET = YES
+XLIB_LIBXT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb
 XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
