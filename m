From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:48:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/pixman
Message-ID: <20080306184844.097E31201F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:48:43 -0800 (Thu, 06 Mar 2008)
New Revision: 21250

Log:
fixed pixman install

Modified:
   trunk/buildroot/package/x11r7/pixman/pixman.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman.mk	2008-03-06 18:46:36 UTC (rev 21249)
+++ trunk/buildroot/package/x11r7/pixman/pixman.mk	2008-03-06 18:48:43 UTC (rev 21250)
@@ -10,6 +10,8 @@
 PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
+PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
+
 PIXMAN_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,pixman))
