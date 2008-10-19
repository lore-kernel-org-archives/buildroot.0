From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 14:48:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXt
Message-ID: <20081019214859.33F103C874@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 14:48:58 -0700 (Sun, 19 Oct 2008)
New Revision: 23728

Log:
x11r7/libXt: don't install makestrs

Don't install makestrs in the first place, instead of removing it
afterwards. Fixes cross-strip issue.

Modified:
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-19 21:48:55 UTC (rev 23727)
+++ trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-19 21:48:58 UTC (rev 23728)
@@ -13,10 +13,6 @@
 XLIB_LIBXT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb
 XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
-XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static --disable-install-makestrs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXt))
-
-# the host makestrs shouldn't get installed in target
-$(XLIB_LIBXT_HOOK_POST_INSTALL):
-	rm -f $(TARGET_DIR)/usr/bin/makestrs
