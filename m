From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 22 Oct 2008 13:12:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xapp_xclock
Message-ID: <20081022201229.12EE73C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-22 13:12:28 -0700 (Wed, 22 Oct 2008)
New Revision: 23768

Log:
x11r7/xclock: don't force libiconv link

Closes #5654.

Modified:
   trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk
===================================================================
--- trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk	2008-10-22 15:28:30 UTC (rev 23767)
+++ trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk	2008-10-22 20:12:28 UTC (rev 23768)
@@ -10,6 +10,4 @@
 XAPP_XCLOCK_AUTORECONF = NO
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
-XAPP_XCLOCK_CONF_OPT = LDFLAGS="-liconv"
-
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xclock))
