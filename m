From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 12:16:50 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080501191650.1204C3C68B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 12:16:49 -0700 (Thu, 01 May 2008)
New Revision: 21914

Log:
fix broken patch

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch	2008-05-01 19:07:58 UTC (rev 21913)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch	2008-05-01 19:16:49 UTC (rev 21914)
@@ -6,4 +6,6 @@
      KDRIVE_STUB_LIB='$(top_builddir)/hw/kdrive/src/libkdrivestubs.a'
 -    KDRIVE_LOCAL_LIBS="$DIX_LIB $CONFIG_LIB $KDRIVE_LIB $TSLIB_LIBS $KDRIVE_OS_LIB $KDRIVE_PURE_LIBS $KDRIVE_STUB_LIB"
 +    KDRIVE_LOCAL_LIBS="$DIX_LIB $CONFIG_LIB $KDRIVE_LIB $KDRIVE_OS_LIB $KDRIVE_PURE_LIBS $KDRIVE_STUB_LIB"
-     KDRIVE_LIBS="$XSERVERLIBS_LIBS $KDRIVE_LOCAL_LIBS"
\ No newline at end of file
+     KDRIVE_LIBS="$XSERVERLIBS_LIBS $KDRIVE_LOCAL_LIBS"
+ 
+     # check if we can build Xephyr
