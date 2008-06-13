From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 13:49:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080613204936.C323A3C885@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 13:49:35 -0700 (Fri, 13 Jun 2008)
New Revision: 22330

Log:
busybox 1.10.3 patch


Added:
   trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch	2008-06-13 20:49:35 UTC (rev 22330)
@@ -0,0 +1,10 @@
+--- busybox-1.10.3/networking/tcpudp.c	Sat Apr 19 06:03:13 2008
++++ busybox-1.10.3-tcpudp/networking/tcpudp.c	Fri Jun 13 11:38:54 2008
+@@ -31,6 +31,7 @@
+ 
+ #include "libbb.h"
+ /* Wants <limits.h> etc, thus included after libbb.h: */
++#include <linux/types.h> /* for __be32 etc */
+ #include <linux/netfilter_ipv4.h>
+ 
+ // TODO: move into this file:
