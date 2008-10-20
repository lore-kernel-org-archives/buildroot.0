From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 02:40:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXi
Message-ID: <20081020094045.82BB03C767@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 02:40:45 -0700 (Mon, 20 Oct 2008)
New Revision: 23737

Log:
x11r7/libXi: use install-strip for target install

Saves ~900 KB

Modified:
   trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk	2008-10-20 09:40:41 UTC (rev 23736)
+++ trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk	2008-10-20 09:40:45 UTC (rev 23737)
@@ -9,6 +9,8 @@
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_AUTORECONF = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
+XLIB_LIBXI_INSTALL_TARGET = YES
+XLIB_LIBXI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
 
