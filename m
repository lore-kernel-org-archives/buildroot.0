From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  9 Sep 2008 01:50:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080909085018.D77743C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-09 01:50:18 -0700 (Tue, 09 Sep 2008)
New Revision: 23362

Log:
busybox: 1.11.2 patch

Added:
   trunk/buildroot/package/busybox/busybox-1.11.2-kbdmode.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.11.2-kbdmode.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.2-kbdmode.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.2-kbdmode.patch	2008-09-09 08:50:18 UTC (rev 23362)
@@ -0,0 +1,21 @@
+--- busybox-1.11.2/console-tools/kbd_mode.c	Thu Aug 21 21:40:12 2008
++++ busybox-1.11.2-kbdmode/console-tools/kbd_mode.c	Wed Sep  3 23:52:26 2008
+@@ -2,7 +2,7 @@
+ /*
+  * Mini kbd_mode implementation for busybox
+  *
+- * Copyright (C) 2007 Lo?c Greni? <loic.grenie@gmail.com>
++ * Copyright (C) 2007 Loic Grenie <loic.grenie@gmail.com>
+  *   written using Andries Brouwer <aeb@cwi.nl>'s kbd_mode from
+  *   console-utils v0.2.3, licensed under GNU GPLv2
+  *
+@@ -46,7 +46,8 @@
+ 		printf("The keyboard is in %s mode\n", mode);
+ 	} else {
+ 		opt = opt & UNICODE ? 3 : opt >> 1;
+-		xioctl(fd, KDSKBMODE, opt);
++		/* double cast prevents warnings about widening conversion */
++		xioctl(fd, KDSKBMODE, (void*)(ptrdiff_t)opt);
+ 	}
+ 
+ 	if (ENABLE_FEATURE_CLEAN_UP)
