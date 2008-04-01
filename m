From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 03:00:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080401100000.510D63C51B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 03:00:00 -0700 (Tue, 01 Apr 2008)
New Revision: 21607

Log:
busybox: additional 1.10.0 fix


Added:
   trunk/buildroot/package/busybox/busybox-1.10.0-tcpudp.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.0-tcpudp.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.0-tcpudp.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.0-tcpudp.patch	2008-04-01 10:00:00 UTC (rev 21607)
@@ -0,0 +1,16 @@
+--- busybox-1.10.0/networking/tcpudp.c	Thu Mar 20 12:46:42 2008
++++ busybox-1.10.0-tcpudp/networking/tcpudp.c	Mon Mar 31 21:27:38 2008
+@@ -29,10 +29,10 @@
+  * - don't know how to retrieve ORIGDST for udp.
+  */
+ 
+-#include <limits.h>
+-#include <linux/netfilter_ipv4.h> /* wants <limits.h> */
+-
+ #include "libbb.h"
++/* Wants <limits.h> etc, thus included after libbb.h: */
++#include <linux/netfilter_ipv4.h>
++
+ // TODO: move into this file:
+ #include "tcpudp_perhost.h"
+ 
