From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 May 2007 04:17:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070522111728.C534648561@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-22 04:17:27 -0700 (Tue, 22 May 2007)
New Revision: 18667

Log:
Fixup joystick.h include with modern kernel headers. Patch from #1217.


Added:
   trunk/buildroot/package/xorg/xorg-6.8.2-joystick_h.patch


Changeset:
Added: trunk/buildroot/package/xorg/xorg-6.8.2-joystick_h.patch
===================================================================
--- trunk/buildroot/package/xorg/xorg-6.8.2-joystick_h.patch	                        (rev 0)
+++ trunk/buildroot/package/xorg/xorg-6.8.2-joystick_h.patch	2007-05-22 11:17:27 UTC (rev 18667)
@@ -0,0 +1,10 @@
+--- xc/programs/Xserver/hw/xfree86/input/ur98/xf86Ur-98.c.orig	2007-02-13 21:17:02.000000000 -0800
++++ xc/programs/Xserver/hw/xfree86/input/ur98/xf86Ur-98.c	2007-02-13 21:17:32.000000000 -0800
+@@ -1,5 +1,7 @@
+ /* $XFree86: xc/programs/Xserver/hw/xfree86/input/ur98/xf86Ur-98.c,v 1.1tsi Exp $ */
+ 
++#undef __STRICT_ANSI__
++
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <string.h>
