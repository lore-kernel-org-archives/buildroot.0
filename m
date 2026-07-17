Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A80C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 17:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125B940788;
	Fri, 17 Jul 2026 17:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lz5d1kBmbRan; Fri, 17 Jul 2026 17:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B334081C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307746;
	bh=qRUeXivJysYet/NbXCqACcQ7Z7WLTK2gvnR36Nku0uc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNNKuZ0RWBVSIX2zxZzlB7qecLxTUB3MbI4X+gxjewdKsPDQAER4etOPJ4CV+/9Cf
	 x5GRNRDyec4P8AUgbKLjLH8c9Etm0uynJNNKUQHRsTJNRJKpzdxAh1UIpfe0I3yoVN
	 Nm/WbnQrJAe2+zBuTfk+AfqghxI6EAnNasBOhqEuF3uL/O5OC3pyXJN1gpyYECFA+W
	 5DT4r0r1GzwSTv/13VPZiDB+FpEffvA8uMD4y1MbUbw7TQfFUFmLNFngcVKbpZPJHm
	 y9xolpaEPz/OjFgbEV21X4T+us3O1D4PhE562m3io7mvktkOXs6bluUb4k2ReDqIS9
	 h73ZvZt8Jc5qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B334081C;
	Fri, 17 Jul 2026 17:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB3D1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F3CA810DC
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNatKL1W0nO3 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 17:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9239580EF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9239580EF0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47ED688E52; Fri, 17 Jul 2026 17:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 19:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12077e4d4957b4b34d43a7da1267018fa2510c47
X-Git-Newrev: ac4e557628d9d9d1c6f1b520e5e7a4581476d923
X-Patchwork-Hint: ignore
Message-Id: <20260717170146.47ED688E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: bump version to 2.5.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4087313591187615451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4087313591187615451==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac4e557628d9d9d1c6f1b520e5e7a4581476d923
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ppp-project/ppp/releases/tag/v2.5.3

Removed patch 0001 which is not needed anymore due to fixes committed to
all relevant kernel versions:
https://github.com/ppp-project/ppp/pull/504#issuecomment-2337005682

Removed patches 0002 & 0003 which are included in this release.

Added new patch to fix build errors seen with older gcc versions
detected by the Gitlab pipelines. These build errors are introduced in
the new dhcpv6relay plugin which was added to pppd 2.5.3, no backport to
buildroot LTS branches necessary.

Switched back to upstream tarball which now contains the previously
missing license files added by upstream commit
https://github.com/ppp-project/ppp/commit/9f612dc02c34509f062ed63b60bcc7e937e25178
and drop autoreconf as well.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-dhcpv6relay-fix-build-with-gcc-9.x.patch  | 184 ++++++++++++
 ...ppd-workaround-sparc-asm-termbits.h-issue.patch | 316 ---------------------
 ...2-pppd-Fix-building-session.c-with-GCC-15.patch |  36 ---
 .../0003-pppdump-Fixed-building-with-GCC-15.patch  |  76 -----
 package/pppd/pppd.hash                             |   2 +-
 package/pppd/pppd.mk                               |   8 +-
 6 files changed, 188 insertions(+), 434 deletions(-)

diff --git a/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch b/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch
new file mode 100644
index 0000000000..b7dfd87e8a
--- /dev/null
+++ b/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch
@@ -0,0 +1,184 @@
+From 56f6f09035b034b96c84637160729aabf07f3460 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 17 Jun 2026 20:45:19 +0200
+Subject: [PATCH] dhcpv6relay: fix build with gcc 9.x
+
+Fixes various build errors seen with gcc 9.x:
+
+Making all in dhcpv6relay
+  CC       dhcpv6relay_la-dhcpv6relay.lo
+dhcpv6relay.c: In function 'dhcpv6relay_down':
+dhcpv6relay.c:193:1: error: parameter name omitted
+ void dhcpv6relay_down(void*, int)
+ ^~~~
+dhcpv6relay.c:193:1: error: parameter name omitted
+dhcpv6relay.c: In function 'dhcpv6relay_release_route':
+dhcpv6relay.c:265:45: error: parameter name omitted
+ void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, uint32_t /* lifetime */)
+                                             ^~~~~~~~
+dhcpv6relay.c: In function 'dhcpv6relay_process_ia_pd':
+dhcpv6relay.c:343:2: error: label at end of compound statement
+  default:
+  ^~~~~~~
+dhcpv6relay.c: In function 'dhcpv6relay_process_ia_na':
+dhcpv6relay.c:380:2: error: label at end of compound statement
+  default:
+  ^~~~~~~
+dhcpv6relay.c: In function 'dhcpv6relay_process_packet_for_routes':
+dhcpv6relay.c:422:2: error: a label can only be part of a statement and a declaration is not a statement
+  dhcpv6relay_route_func func;
+  ^~~~~~~~~~~~~~~~~~~~~~
+dhcpv6relay.c:449:6: error: label at end of compound statement
+      default:
+      ^~~~~~~
+dhcpv6relay.c: In function 'dhcpv6relay_server_event':
+dhcpv6relay.c:463:1: error: parameter name omitted
+ void dhcpv6relay_server_event(int fd, void*)
+ ^~~~
+dhcpv6relay.c:558:2: error: label at end of compound statement
+  default:
+  ^~~~~~~
+dhcpv6relay.c: In function 'dhcpv6relay_client_event':
+dhcpv6relay.c:619:1: error: parameter name omitted
+ void dhcpv6relay_client_event(int fd, void*)
+ ^~~~
+dhcpv6relay.c: In function 'dhcpv6relay_send_router_advertisement_timed':
+dhcpv6relay.c:795:1: error: parameter name omitted
+ void dhcpv6relay_send_router_advertisement_timed(void*)
+ ^~~~
+dhcpv6relay.c: In function 'dhcpv6relay_router_solicitation':
+dhcpv6relay.c:802:1: error: parameter name omitted
+ void dhcpv6relay_router_solicitation(int fd, void*)
+ ^~~~
+dhcpv6relay.c: In function 'dhcpv6relay_up':
+dhcpv6relay.c:855:1: error: parameter name omitted
+ void dhcpv6relay_up(void*, int)
+ ^~~~
+dhcpv6relay.c:855:1: error: parameter name omitted
+
+Upstream: https://github.com/ppp-project/ppp/pull/598
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pppd/plugins/dhcpv6relay/dhcpv6relay.c | 22 ++++++++++++----------
+ 1 file changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/pppd/plugins/dhcpv6relay/dhcpv6relay.c b/pppd/plugins/dhcpv6relay/dhcpv6relay.c
+index e9ebba1..e416720 100644
+--- a/pppd/plugins/dhcpv6relay/dhcpv6relay.c
++++ b/pppd/plugins/dhcpv6relay/dhcpv6relay.c
+@@ -190,7 +190,7 @@ void routes_remove_all()
+ }
+ 
+ static
+-void dhcpv6relay_down(void*, int)
++void dhcpv6relay_down(__attribute__((unused)) void* unused, __attribute__((unused)) int unusedint)
+ {
+     routes_remove_all();
+     if (dhcpv6relay_sock_ll >= 0) {
+@@ -262,7 +262,7 @@ void dhcpv6relay_route_timeout(void* _r)
+ }
+ 
+ static
+-void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, uint32_t /* lifetime */)
++void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, __attribute__((unused)) uint32_t lifetime)
+ {
+     char in6addr[INET6_ADDRSTRLEN];
+ 
+@@ -341,7 +341,7 @@ void dhcpv6relay_process_ia_pd(const unsigned char *bfr, uint16_t len, dhcpv6rel
+ 	    routefunc((const struct in6_addr*)(bfr + 9), bfr[8], ntohl(*(const uint32_t*)(bfr+4)));
+ 	    break;
+ 	default:
+-	    /* nothing */
++	    break;
+ 	}
+ 
+ 	bfr += optlen;
+@@ -378,7 +378,7 @@ void dhcpv6relay_process_ia_na(const unsigned char *bfr, uint16_t len, dhcpv6rel
+ 	    routefunc((const struct in6_addr*)bfr, 128, ntohl(*(const uint32_t*)(bfr+20)));
+ 	    break;
+ 	default:
+-	    /* nothing */
++	    break;
+ 	}
+ 
+ 	bfr += optlen;
+@@ -392,6 +392,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
+     if (len < 1)
+ 	return;
+     uint8_t pkttype = *bfr;
++    dhcpv6relay_route_func func;
+ 
+     switch (pkttype) {
+     case DHCPv6_MSGTYPE_RELAY_FORW:
+@@ -419,7 +420,6 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
+ 	break;
+     case DHCPv6_MSGTYPE_REPLY:
+     case DHCPv6_MSGTYPE_RELEASE:
+-	dhcpv6relay_route_func func;
+ 	if (pkttype == DHCPv6_MSGTYPE_RELEASE)
+ 	    func = dhcpv6relay_release_route;
+ 	else
+@@ -447,6 +447,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
+ 		dhcpv6relay_process_ia_na(bfr, optlen, func);
+ 		break;
+ 	    default:
++		break;
+ 	    }
+ 	    bfr += optlen;
+ 
+@@ -460,7 +461,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
+ }
+ 
+ static
+-void dhcpv6relay_server_event(int fd, void*)
++void dhcpv6relay_server_event(int fd, __attribute__((unused)) void* unused)
+ {
+     unsigned char buffer[1024];
+     unsigned char *options = buffer + 34; /* skip fixed header */
+@@ -558,6 +559,7 @@ void dhcpv6relay_server_event(int fd, void*)
+ 	default:
+ 	    /* notice("DHCPv6 relay: Skipping processing of option %u of length %u.",
+ 		    type, len); */
++	    break;
+ 	}
+ 	options += len;
+ 	r -= len;
+@@ -616,7 +618,7 @@ int dhcpv6relay_init_upstream()
+ }
+ 
+ static
+-void dhcpv6relay_client_event(int fd, void*)
++void dhcpv6relay_client_event(int fd, __attribute__((unused)) void* unused)
+ {
+     unsigned char buffer[1024];
+     unsigned char fwd_head[256];
+@@ -792,14 +794,14 @@ void dhcpv6relay_send_router_advertisement(const struct sockaddr* da)
+ }
+ 
+ static
+-void dhcpv6relay_send_router_advertisement_timed(void*)
++void dhcpv6relay_send_router_advertisement_timed(__attribute__((unused)) void* unused)
+ {
+     dhcpv6relay_send_router_advertisement(NULL);
+     ppp_timeout(dhcpv6relay_send_router_advertisement_timed, NULL, dhcpv6relay_ra_interval, 0);
+ }
+ 
+ static
+-void dhcpv6relay_router_solicitation(int fd, void*)
++void dhcpv6relay_router_solicitation(int fd, __attribute__((unused)) void* unused)
+ {
+     unsigned char bfr[1]; /* kernel will truncate packets in case of overflow,
+ 			     and we don't care about the content.  Will
+@@ -852,7 +854,7 @@ int dhcpv6relay_populate_ll(struct sockaddr_in6* res)
+ }
+ 
+ static
+-void dhcpv6relay_up(void*, int)
++void dhcpv6relay_up(__attribute__((unused)) void* unused, __attribute__((unused)) int unusedint)
+ {
+     struct sockaddr_in6 sa;
+     struct ipv6_mreq mreq;
+-- 
+2.47.3
+
diff --git a/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch b/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch
deleted file mode 100644
index 923c047743..0000000000
--- a/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch
+++ /dev/null
@@ -1,316 +0,0 @@
-From ef37e5b112734f551132b613438788fd4ef8797a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 12 Jul 2024 20:24:22 +0200
-Subject: [PATCH] pppd: workaround sparc <asm/termbits.h> issue
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The SPARC version of the <asm/termbits.h> kernel header has an issue:
-it defines "struct termio", which conflicts with the definition in
-<bits/ioctl-types.h>, causing a build failure in pppd.
-
-This issue was fixed in the upstream Linux kernel in commit
-c32d18e7942d7589b62e301eb426b32623366565 ("sparc: move struct termio
-to asm/termios.h"), which is going to appear in Linux 6.10.
-
-In order to support building with older toolchains, this patch
-includes in the pppd source code a copy of the fixed SPARC
-<asm/termbits.h> in the pppd code base, and uses it if we're on SPARC
-with kernel headers older than 6.10.
-
-Fixes:
-
-In file included from termios_linux.h:39:
-/home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/asm/termbits.h:17:8: error: redefinition of ‘struct termio’
-   17 | struct termio {
-      |        ^~~~~~
-  CC       pppd-ipv6cp.o
-In file included from /home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/sys/ioctl.h:29,
-                 from sys-linux.c:76:
-/home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/bits/ioctl-types.h:36:8: note: originally defined here
-   36 | struct termio
-      |        ^~~~~~
-
-Upstream: https://github.com/ppp-project/ppp/pull/504
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- pppd/sparc-termbits.h | 247 ++++++++++++++++++++++++++++++++++++++++++
- pppd/termios_linux.h  |   6 +
- 2 files changed, 253 insertions(+)
- create mode 100644 pppd/sparc-termbits.h
-
-diff --git a/pppd/sparc-termbits.h b/pppd/sparc-termbits.h
-new file mode 100644
-index 0000000..f92a27a
---- /dev/null
-+++ b/pppd/sparc-termbits.h
-@@ -0,0 +1,247 @@
-+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-+#ifndef _SPARC_TERMBITS_H
-+#define _SPARC_TERMBITS_H
-+
-+#include <linux/posix_types.h>
-+
-+typedef unsigned char   cc_t;
-+typedef unsigned int    speed_t;
-+
-+#if defined(__sparc__) && defined(__arch64__)
-+typedef unsigned int    tcflag_t;
-+#else
-+typedef unsigned long   tcflag_t;
-+#endif
-+
-+#define NCCS 17
-+struct termios {
-+	tcflag_t c_iflag;		/* input mode flags */
-+	tcflag_t c_oflag;		/* output mode flags */
-+	tcflag_t c_cflag;		/* control mode flags */
-+	tcflag_t c_lflag;		/* local mode flags */
-+	cc_t c_line;			/* line discipline */
-+	cc_t c_cc[NCCS];		/* control characters */
-+};
-+
-+struct termios2 {
-+	tcflag_t c_iflag;		/* input mode flags */
-+	tcflag_t c_oflag;		/* output mode flags */
-+	tcflag_t c_cflag;		/* control mode flags */
-+	tcflag_t c_lflag;		/* local mode flags */
-+	cc_t c_line;			/* line discipline */
-+	cc_t c_cc[NCCS+2];		/* control characters */
-+	speed_t c_ispeed;		/* input speed */
-+	speed_t c_ospeed;		/* output speed */
-+};
-+
-+struct ktermios {
-+	tcflag_t c_iflag;		/* input mode flags */
-+	tcflag_t c_oflag;		/* output mode flags */
-+	tcflag_t c_cflag;		/* control mode flags */
-+	tcflag_t c_lflag;		/* local mode flags */
-+	cc_t c_line;			/* line discipline */
-+	cc_t c_cc[NCCS+2];		/* control characters */
-+	speed_t c_ispeed;		/* input speed */
-+	speed_t c_ospeed;		/* output speed */
-+};
-+
-+/* c_cc characters */
-+#define VINTR    0
-+#define VQUIT    1
-+#define VERASE   2
-+#define VKILL    3
-+#define VEOF     4
-+#define VEOL     5
-+#define VEOL2    6
-+#define VSWTC    7
-+#define VSTART   8
-+#define VSTOP    9
-+
-+
-+
-+#define VSUSP    10
-+#define VDSUSP   11  /* SunOS POSIX nicety I do believe... */
-+#define VREPRINT 12
-+#define VDISCARD 13
-+#define VWERASE  14
-+#define VLNEXT   15
-+
-+/* Kernel keeps vmin/vtime separated, user apps assume vmin/vtime is
-+ * shared with eof/eol
-+ */
-+#define VMIN     VEOF
-+#define VTIME    VEOL
-+
-+/* c_iflag bits */
-+#define IGNBRK	0x00000001
-+#define BRKINT	0x00000002
-+#define IGNPAR	0x00000004
-+#define PARMRK	0x00000008
-+#define INPCK	0x00000010
-+#define ISTRIP	0x00000020
-+#define INLCR	0x00000040
-+#define IGNCR	0x00000080
-+#define ICRNL	0x00000100
-+#define IUCLC	0x00000200
-+#define IXON	0x00000400
-+#define IXANY	0x00000800
-+#define IXOFF	0x00001000
-+#define IMAXBEL	0x00002000
-+#define IUTF8   0x00004000
-+
-+/* c_oflag bits */
-+#define OPOST	0x00000001
-+#define OLCUC	0x00000002
-+#define ONLCR	0x00000004
-+#define OCRNL	0x00000008
-+#define ONOCR	0x00000010
-+#define ONLRET	0x00000020
-+#define OFILL	0x00000040
-+#define OFDEL	0x00000080
-+#define NLDLY	0x00000100
-+#define   NL0	0x00000000
-+#define   NL1	0x00000100
-+#define CRDLY	0x00000600
-+#define   CR0	0x00000000
-+#define   CR1	0x00000200
-+#define   CR2	0x00000400
-+#define   CR3	0x00000600
-+#define TABDLY	0x00001800
-+#define   TAB0	0x00000000
-+#define   TAB1	0x00000800
-+#define   TAB2	0x00001000
-+#define   TAB3	0x00001800
-+#define   XTABS	0x00001800
-+#define BSDLY	0x00002000
-+#define   BS0	0x00000000
-+#define   BS1	0x00002000
-+#define VTDLY	0x00004000
-+#define   VT0	0x00000000
-+#define   VT1	0x00004000
-+#define FFDLY	0x00008000
-+#define   FF0	0x00000000
-+#define   FF1	0x00008000
-+#define PAGEOUT 0x00010000  /* SUNOS specific */
-+#define WRAP    0x00020000  /* SUNOS specific */
-+
-+/* c_cflag bit meaning */
-+#define CBAUD	  0x0000100f
-+#define  B0	  0x00000000   /* hang up */
-+#define  B50	  0x00000001
-+#define  B75	  0x00000002
-+#define  B110	  0x00000003
-+#define  B134	  0x00000004
-+#define  B150	  0x00000005
-+#define  B200	  0x00000006
-+#define  B300	  0x00000007
-+#define  B600	  0x00000008
-+#define  B1200	  0x00000009
-+#define  B1800	  0x0000000a
-+#define  B2400	  0x0000000b
-+#define  B4800	  0x0000000c
-+#define  B9600	  0x0000000d
-+#define  B19200	  0x0000000e
-+#define  B38400	  0x0000000f
-+#define EXTA      B19200
-+#define EXTB      B38400
-+#define  CSIZE    0x00000030
-+#define   CS5	  0x00000000
-+#define   CS6	  0x00000010
-+#define   CS7	  0x00000020
-+#define   CS8	  0x00000030
-+#define CSTOPB	  0x00000040
-+#define CREAD	  0x00000080
-+#define PARENB	  0x00000100
-+#define PARODD	  0x00000200
-+#define HUPCL	  0x00000400
-+#define CLOCAL	  0x00000800
-+#define CBAUDEX   0x00001000
-+/* We'll never see these speeds with the Zilogs, but for completeness... */
-+#define  BOTHER   0x00001000
-+#define  B57600   0x00001001
-+#define  B115200  0x00001002
-+#define  B230400  0x00001003
-+#define  B460800  0x00001004
-+/* This is what we can do with the Zilogs. */
-+#define  B76800   0x00001005
-+/* This is what we can do with the SAB82532. */
-+#define  B153600  0x00001006
-+#define  B307200  0x00001007
-+#define  B614400  0x00001008
-+#define  B921600  0x00001009
-+/* And these are the rest... */
-+#define  B500000  0x0000100a
-+#define  B576000  0x0000100b
-+#define B1000000  0x0000100c
-+#define B1152000  0x0000100d
-+#define B1500000  0x0000100e
-+#define B2000000  0x0000100f
-+/* These have totally bogus values and nobody uses them
-+   so far. Later on we'd have to use say 0x10000x and
-+   adjust CBAUD constant and drivers accordingly.
-+#define B2500000  0x00001010
-+#define B3000000  0x00001011
-+#define B3500000  0x00001012
-+#define B4000000  0x00001013  */
-+#define CIBAUD	  0x100f0000  /* input baud rate (not used) */
-+#define CMSPAR	  0x40000000  /* mark or space (stick) parity */
-+#define CRTSCTS	  0x80000000  /* flow control */
-+
-+#define IBSHIFT	  16		/* Shift from CBAUD to CIBAUD */
-+
-+/* c_lflag bits */
-+#define ISIG	0x00000001
-+#define ICANON	0x00000002
-+#define XCASE	0x00000004
-+#define ECHO	0x00000008
-+#define ECHOE	0x00000010
-+#define ECHOK	0x00000020
-+#define ECHONL	0x00000040
-+#define NOFLSH	0x00000080
-+#define TOSTOP	0x00000100
-+#define ECHOCTL	0x00000200
-+#define ECHOPRT	0x00000400
-+#define ECHOKE	0x00000800
-+#define DEFECHO 0x00001000  /* SUNOS thing, what is it? */
-+#define FLUSHO	0x00002000
-+#define PENDIN	0x00004000
-+#define IEXTEN	0x00008000
-+#define EXTPROC	0x00010000
-+
-+/* modem lines */
-+#define TIOCM_LE	0x001
-+#define TIOCM_DTR	0x002
-+#define TIOCM_RTS	0x004
-+#define TIOCM_ST	0x008
-+#define TIOCM_SR	0x010
-+#define TIOCM_CTS	0x020
-+#define TIOCM_CAR	0x040
-+#define TIOCM_RNG	0x080
-+#define TIOCM_DSR	0x100
-+#define TIOCM_CD	TIOCM_CAR
-+#define TIOCM_RI	TIOCM_RNG
-+#define TIOCM_OUT1	0x2000
-+#define TIOCM_OUT2	0x4000
-+#define TIOCM_LOOP	0x8000
-+
-+/* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
-+#define TIOCSER_TEMT    0x01	/* Transmitter physically empty */
-+
-+
-+/* tcflow() and TCXONC use these */
-+#define	TCOOFF		0
-+#define	TCOON		1
-+#define	TCIOFF		2
-+#define	TCION		3
-+
-+/* tcflush() and TCFLSH use these */
-+#define	TCIFLUSH	0
-+#define	TCOFLUSH	1
-+#define	TCIOFLUSH	2
-+
-+/* tcsetattr uses these */
-+#define	TCSANOW		0
-+#define	TCSADRAIN	1
-+#define	TCSAFLUSH	2
-+
-+#endif /* _SPARC_TERMBITS_H */
-diff --git a/pppd/termios_linux.h b/pppd/termios_linux.h
-index a234d30..9812017 100644
---- a/pppd/termios_linux.h
-+++ b/pppd/termios_linux.h
-@@ -32,7 +32,13 @@
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <asm/ioctls.h>
-+#include <linux/version.h>
-+
-+#if defined(__sparc__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,10,0)
-+#include "sparc-termbits.h"
-+#else
- #include <asm/termbits.h>
-+#endif
- 
- #if defined(BOTHER) && defined(TCGETS2)
- #define termios termios2
--- 
-2.45.2
-
diff --git a/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch b/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch
deleted file mode 100644
index 4fcd492562..0000000000
--- a/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fb769c380eeacf23b64cb3bf7860ba49a0e0eed5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Apr 2025 00:15:57 -0700
-Subject: [PATCH] pppd: Fix building session.c with GCC 15 (#553)
-
-Fixed building with GCC 15 which defaults to C23
-and find conflicting declration of getspnam() here
-with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
-
-Fixes
-../../ppp-2.5.2/pppd/session.c: In function 'session_start':
-../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
-  185 |     struct spwd *getspnam();
-      |                  ^~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/ppp-project/ppp/commit/fb769c380eeacf23b64cb3bf7860ba49a0e0eed5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppd/session.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pppd/session.c b/pppd/session.c
-index f08d8e19..9cc75389 100644
---- a/pppd/session.c
-+++ b/pppd/session.c
-@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
-     char *cbuf;
- #ifdef HAVE_SHADOW_H
-     struct spwd *spwd;
--    struct spwd *getspnam();
-     long now = 0;
- #endif /* #ifdef HAVE_SHADOW_H */
- #endif /* #ifdef PPP_WITH_PAM */
diff --git a/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch b/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch
deleted file mode 100644
index ab7c94e506..0000000000
--- a/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 05361692ee7d6260ce5c04c9fa0e5a1aa7565323 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
-Date: Thu, 27 Feb 2025 23:00:16 +0100
-Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-GCC 15 defaults to C23 which does not allow K&R declarations.
-
-Credit Yaakov Selkowitz in:
-https://src.fedoraproject.org/rpms/ppp/pull-request/12
-
-Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
-
-Upstream: https://github.com/ppp-project/ppp/commit/05361692ee7d6260ce5c04c9fa0e5a1aa7565323
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppdump/pppdump.c | 20 +++++++-------------
- 1 file changed, 7 insertions(+), 13 deletions(-)
-
-diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
-index c24208af..1534036c 100644
---- a/pppdump/pppdump.c
-+++ b/pppdump/pppdump.c
-@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
- extern int optind;
- extern char *optarg;
- 
--void dumplog();
--void dumpppp();
--void show_time();
-+void dumplog(FILE *);
-+void dumpppp(FILE *);
-+void show_time(FILE *, int);
- 
- int
--main(ac, av)
--    int ac;
--    char **av;
-+main(int ac, char **av)
- {
-     int i;
-     char *p;
-@@ -97,8 +95,7 @@ main(ac, av)
- }
- 
- void
--dumplog(f)
--    FILE *f;
-+dumplog(FILE *f)
- {
-     int c, n, k, col;
-     int nb, c2;
-@@ -241,8 +238,7 @@ struct pkt {
- unsigned char dbuf[8192];
- 
- void
--dumpppp(f)
--    FILE *f;
-+dumpppp(FILE *f)
- {
-     int c, n, k;
-     int nb, nl, dn, proto, rv;
-@@ -375,9 +371,7 @@ dumpppp(f)
- }
- 
- void
--show_time(f, c)
--    FILE *f;
--    int c;
-+show_time(FILE *f, int c)
- {
-     time_t t;
-     int n;
diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index 1aec3f037c..a79f73fe93 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d7457f0ff409cb2d7a0d8382ef6302520d664895ac5568cb3dce727d71a2a1f5  pppd-2.5.2.tar.gz
+sha256  ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c5509158e99e148f572d4f  ppp-2.5.3.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 24dcb85387..f8b68f39b7 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,16 +4,14 @@
 #
 ################################################################################
 
-# The tarball provided at https://download.samba.org/pub/ppp/ does not
-# include the license files yet so we use the github tarball.
-PPPD_VERSION = 2.5.2
-PPPD_SITE = $(call github,ppp-project,ppp,v$(PPPD_VERSION))
+PPPD_VERSION = 2.5.3
+PPPD_SITE = https://download.samba.org/pub/ppp
+PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
 PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
 PPPD_CPE_ID_PRODUCT = point-to-point_protocol
 PPPD_SELINUX_MODULES = ppp
-PPPD_AUTORECONF = YES
 PPPD_INSTALL_STAGING = YES
 PPPD_CONF_OPTS = --enable-multilink
 

--===============4087313591187615451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4087313591187615451==--
