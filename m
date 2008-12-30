From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 30 Dec 2008 19:15:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081230191522.CD2DB76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-30 19:15:22 +0000 (Tue, 30 Dec 2008)
New Revision: 24616

Log:
busybox: 1.13.1 dc fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch	2008-12-30 19:15:22 UTC (rev 24616)
@@ -0,0 +1,13 @@
+--- busybox-1.13.1/miscutils/dc.c	Sun Nov  9 18:28:16 2008
++++ busybox-1.13.1-dc/miscutils/dc.c	Tue Dec 30 11:36:52 2008
+@@ -19,7 +19,9 @@
+ #define pointer   (G.pointer   )
+ #define base      (G.base      )
+ #define stack     (G.stack     )
+-#define INIT_G() do { } while (0)
++#define INIT_G() do { \
++	base = 10; \
++} while (0)
+ 
+ 
+ static void push(double a)
