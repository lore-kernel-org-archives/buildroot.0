From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 07:03:21 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080501140321.2D54D3C649@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 07:03:20 -0700 (Thu, 01 May 2008)
New Revision: 21905

Log:
patch for xserver tslib support

Added:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch


Changeset:
Added: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch	2008-05-01 14:03:20 UTC (rev 21905)
@@ -0,0 +1,9 @@
+--- a/configure	2008-03-18 12:07:31.000000000 -0400
++++ b/configure	2008-03-18 16:13:03.000000000 -0400
+@@ -35720,7 +35720,7 @@ _ACEOF
+ 	    ;;
+     esac
+     KDRIVE_STUB_LIB='$(top_builddir)/hw/kdrive/src/libkdrivestubs.a'
+-    KDRIVE_LOCAL_LIBS="$DIX_LIB $CONFIG_LIB $KDRIVE_LIB $TSLIB_LIBS $KDRIVE_OS_LIB $KDRIVE_PURE_LIBS $KDRIVE_STUB_LIB"
++    KDRIVE_LOCAL_LIBS="$DIX_LIB $CONFIG_LIB $KDRIVE_LIB $KDRIVE_OS_LIB $KDRIVE_PURE_LIBS $KDRIVE_STUB_LIB"
+     KDRIVE_LIBS="$XSERVERLIBS_LIBS $KDRIVE_LOCAL_LIBS"
\ No newline at end of file
