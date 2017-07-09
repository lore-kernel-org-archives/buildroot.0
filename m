From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:04:37 +0200
Subject: [Buildroot] [git commit] uclibc: fix issues with udp.h,
	missing stdint.h
Message-ID: <20170709160118.16AC681933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e91f959e840f94df12d6df19907a8e8c4a067f93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/3e4/3e468c7b1be376024422e2f06750571f64f433a2/
  http://autobuild.buildroot.net/results/8c6/8c629a1c5c4a1d78c8bf09a091a332a424a0f757/

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-udp.h-sync-completely-with-GNU-C-library.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/uclibc/0002-udp.h-sync-completely-with-GNU-C-library.patch b/package/uclibc/0002-udp.h-sync-completely-with-GNU-C-library.patch
new file mode 100644
index 0000000..2eb2a27
--- /dev/null
+++ b/package/uclibc/0002-udp.h-sync-completely-with-GNU-C-library.patch
@@ -0,0 +1,52 @@
+From fcf3a1950dbdbcf7a600cf8ae0e4ea92c20f5af1 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Wed, 5 Jul 2017 23:02:59 +0200
+Subject: [PATCH] udp.h: sync completely with GNU C library
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ include/netinet/udp.h | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/include/netinet/udp.h b/include/netinet/udp.h
+index ac6f23413..a4eb32d76 100644
+--- a/include/netinet/udp.h
++++ b/include/netinet/udp.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 1991-1993,1995-1997,2004,2009 Free Software Foundation, Inc.
++/* Copyright (C) 1991-2017 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -47,9 +47,8 @@
+ #ifndef __NETINET_UDP_H
+ #define __NETINET_UDP_H    1
+ 
+-#include <features.h>
+ #include <sys/types.h>
+-
++#include <stdint.h>
+ 
+ /* UDP header as specified by RFC 768, August 1980. */
+ 
+@@ -78,11 +77,17 @@ struct udphdr
+ #define UDP_CORK	1	/* Never send partially complete segments.  */
+ #define UDP_ENCAP	100	/* Set the socket to accept
+ 				   encapsulated packets.  */
++#define UDP_NO_CHECK6_TX 101	/* Disable sending checksum for UDP
++				   over IPv6.  */
++#define UDP_NO_CHECK6_RX 102	/* Disable accepting checksum for UDP
++				   over IPv6.  */
+ 
+ /* UDP encapsulation types */
+ #define UDP_ENCAP_ESPINUDP_NON_IKE 1	/* draft-ietf-ipsec-nat-t-ike-00/01 */
+ #define UDP_ENCAP_ESPINUDP	2	/* draft-ietf-ipsec-udp-encaps-06 */
+ #define UDP_ENCAP_L2TPINUDP	3	/* rfc2661 */
++#define UDP_ENCAP_GTP0		4	/* GSM TS 09.60 */
++#define UDP_ENCAP_GTP1U		5	/* 3GPP TS 29.060 */
+ 
+ #define SOL_UDP            17      /* sockopt level for UDP */
+ 
+-- 
+2.11.0
+
