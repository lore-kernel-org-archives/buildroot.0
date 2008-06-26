From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Jun 2008 23:51:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080626065100.3272A3C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-25 23:50:59 -0700 (Wed, 25 Jun 2008)
New Revision: 22513

Log:
buxybox: bump 1.10.x version


Removed:
   trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch
   trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-06-26 06:50:44 UTC (rev 22512)
+++ trunk/buildroot/package/busybox/Config.in	2008-06-26 06:50:59 UTC (rev 22513)
@@ -50,7 +50,7 @@
 	default "1.7.5"		if BR2_BUSYBOX_VERSION_1_7_X
 	default "1.8.3"		if BR2_BUSYBOX_VERSION_1_8_X
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
-	default "1.10.3"	if BR2_BUSYBOX_VERSION_1_10_X
+	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL

Deleted: trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch	2008-06-26 06:50:44 UTC (rev 22512)
+++ trunk/buildroot/package/busybox/busybox-1.10.3-tcpudp.patch	2008-06-26 06:50:59 UTC (rev 22513)
@@ -1,10 +0,0 @@
---- busybox-1.10.3/networking/tcpudp.c	Sat Apr 19 06:03:13 2008
-+++ busybox-1.10.3-tcpudp/networking/tcpudp.c	Fri Jun 13 11:38:54 2008
-@@ -31,6 +31,7 @@
- 
- #include "libbb.h"
- /* Wants <limits.h> etc, thus included after libbb.h: */
-+#include <linux/types.h> /* for __be32 etc */
- #include <linux/netfilter_ipv4.h>
- 
- // TODO: move into this file:

Deleted: trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch	2008-06-26 06:50:44 UTC (rev 22512)
+++ trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch	2008-06-26 06:50:59 UTC (rev 22513)
@@ -1,11 +0,0 @@
---- busybox-1.10.3/networking/udhcp/clientsocket.c	Sat Apr 19 06:03:13 2008
-+++ busybox-1.10.3-udhcpc/networking/udhcp/clientsocket.c	Fri Jun 20 16:48:32 2008
-@@ -76,7 +76,7 @@
- 		BPF_STMT(BPF_LD|BPF_W|BPF_IND, 0),
- 		BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, SERVER_AND_CLIENT_PORTS, 0, 1),	/* L3, L4 */
- 		/* returns */
--		BPF_STMT(BPF_RET|BPF_K, (~(uint32_t)0) ),               /* L3: pass */
-+		BPF_STMT(BPF_RET|BPF_K, 0x0fffffff),                    /* L3: pass */
- 		BPF_STMT(BPF_RET|BPF_K, 0),                             /* L4: reject */
- 	};
- 	static const struct sock_fprog filter_prog = {
