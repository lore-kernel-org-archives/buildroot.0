From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 06:24:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXt
Message-ID: <20080630132412.2D5343C67D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 06:24:04 -0700 (Mon, 30 Jun 2008)
New Revision: 22573

Log:
libXt: don't install host makestrs in target


Modified:
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-06-30 13:18:32 UTC (rev 22572)
+++ trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-06-30 13:24:04 UTC (rev 22573)
@@ -14,3 +14,7 @@
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXt))
+
+# the host makestrs shouldn't get installed in target
+$(XLIB_LIBXT_HOOK_POST_INSTALL):
+	rm -f $(TARGET_DIR)/usr/bin/makestrs
