Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845B7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF0F60629;
	Wed,  8 Dec 2021 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLGCfAUFL3eV; Wed,  8 Dec 2021 18:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301B66063B;
	Wed,  8 Dec 2021 18:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B961BF2BF
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 18:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2C0681AF4
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 18:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3EkI4Inr1j2 for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 18:55:13 +0000 (UTC)
X-Greylist: delayed 00:06:03 by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79DCB81AEA
 for <buildroot@busybox.net>; Wed,  8 Dec 2021 18:55:13 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id D31FF440588;
 Wed,  8 Dec 2021 20:48:47 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1638989328;
 bh=BHCNTyPLG/kMMzEFsyuGUxneUlCvzsv887cSuQayy5A=;
 h=From:To:Cc:Subject:Date:From;
 b=BYhuT36UFV2lcP57uD899gakE10+3cTyaWJne3CK7VlLeajf0WIFR8r28K7fe3G9Z
 hzCfryg0O1q0U8t/vHnngz2gH3wGFSqci2wEJsZnDpUuf6Ms399w03x4WlF/+J1xlj
 bKi6BRkeeh4vJs6f3aVY+Y9TlhJ35932J9WFRpEmYicnz3CaBPydVzcSlPnYjSI6+l
 vPHFTDASmpQL/NAKMjRRrth5yW6MoGwV7WYSXNnjQqVXrAO17JYeCj7PkEFBUGq7Uc
 O1OXQavzBQAZdQO5JfUdb9irwpt1uLfwqLt51W2Jwm872jTzgkX3/9WXjKlBJiJ2eG
 8jxmz4HO162fw==
To: buildroot@busybox.net
Date: Wed,  8 Dec 2021 20:48:37 +0200
Message-Id: <87bfa0d89421fbc984426606c6736fae94bcfbb8.1638989317.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-Avoid-relying-on-presence-of-ipx-h.patch | 149 ------------------
 package/strace/strace.hash                    |   4 +-
 package/strace/strace.mk                      |   4 +-
 3 files changed, 3 insertions(+), 154 deletions(-)
 delete mode 100644 package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch

diff --git a/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch b/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
deleted file mode 100644
index 2e9fa24ed50f..000000000000
--- a/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 568ee52f885c463e7a283240f5ef6bbf9351bdb3 Mon Sep 17 00:00:00 2001
-From: Eugene Syromyatnikov <evgsyr@gmail.com>
-Date: Wed, 3 Nov 2021 00:48:59 +0100
-Subject: [PATCH] Avoid relying on presence of ipx.h
-
-After Linux has broken UAPI in commit v5.15-rc1~157^2~207, it is well
-possible that neither kernel nor libc (such as musl, for example)
-provides an IPX-related header.  Avoid relying on its presence
-in the strace's code and conditionalise the relevant checks in the tests.
-
-* configure.ac (AC_CHECK_HEADERS): Add linux/ipx.h.
-* src/net.c: Remove <netipx/ipx.h>/<linux/ipx.h> includes.
-* src/sockaddr.c: Likewise.
-(IPX_NODE_LEN): New macro constant.
-(struct sockaddr_ipx): New type definition.
-* src/xlat/sock_ipx_options.in (IPX_TYPE): Provide a fallback value.
-* tests/net-sockaddr.c [!HAVE_LINUX_IPX_H]: Do not include
-<linux/ipx.h>.
-[!HAVE_LINUX_IPX_H && HAVE_NETIPX_IPX_H]: Include <netipx/ipx.h>.
-[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)] (check_ipx): Do not
-define.
-(main) [!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)]: Do not call
-check_ipx.
-
-Closes: https://github.com/strace/strace/issues/201
-
-[Retrieved (and backported) from:
-https://github.com/strace/strace/commit/568ee52f885c463e7a283240f5ef6bbf9351bdb3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac                 |  1 +
- src/net.c                    |  5 -----
- src/sockaddr.c               | 16 ++++++++++------
- src/xlat/sock_ipx_options.in |  2 +-
- tests/net-sockaddr.c         | 10 +++++++++-
- 5 files changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b5053b7aff..c074a70c01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -424,6 +424,7 @@ AC_CHECK_HEADERS(m4_normalize([
- 	elf.h
- 	gcov.h
- 	iconv.h
-+	linux/ipx.h
- 	mqueue.h
- 	netinet/sctp.h
- 	netipx/ipx.h
-diff --git a/src/net.c b/src/net.c
-index bc2b1ad048..42696bfe89 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -28,11 +28,6 @@
- #include <arpa/inet.h>
- #include <net/if.h>
- #include <asm/types.h>
--#ifdef HAVE_NETIPX_IPX_H
--# include <netipx/ipx.h>
--#else
--# include <linux/ipx.h>
--#endif
- 
- #include <linux/ip_vs.h>
- #include "netlink.h"
-diff --git a/src/sockaddr.c b/src/sockaddr.c
-index bdd5a5bb7a..27fda59f26 100644
---- a/src/sockaddr.c
-+++ b/src/sockaddr.c
-@@ -24,12 +24,6 @@
- #include <linux/if_ether.h>
- #include <linux/x25.h>
- 
--#ifdef HAVE_NETIPX_IPX_H
--# include <netipx/ipx.h>
--#else
--# include <linux/ipx.h>
--#endif
--
- #include "xlat/addrfams.h"
- #include "xlat/arp_hardware_types.h"
- #include "xlat/ethernet_protocols.h"
-@@ -42,6 +36,16 @@
- 
- #define SIZEOF_SA_FAMILY sizeof_field(struct sockaddr, sa_family)
- 
-+#define IPX_NODE_LEN	6
-+struct sockaddr_ipx {
-+	uint16_t sipx_family;
-+	uint16_t sipx_port;
-+	uint32_t sipx_network;
-+	unsigned char sipx_node[IPX_NODE_LEN];
-+	uint8_t sipx_type;
-+	unsigned char sipx_zero;
-+};
-+
- static void
- print_sockaddr_data_un(struct tcb *tcp, const void *const buf, const int addrlen)
- {
-diff --git a/src/xlat/sock_ipx_options.in b/src/xlat/sock_ipx_options.in
-index eba97fd719..b09be117e4 100644
---- a/src/xlat/sock_ipx_options.in
-+++ b/src/xlat/sock_ipx_options.in
-@@ -1 +1 @@
--IPX_TYPE
-+IPX_TYPE	1
-diff --git a/tests/net-sockaddr.c b/tests/net-sockaddr.c
-index f1f9b01cdd..c8049fd68b 100644
---- a/tests/net-sockaddr.c
-+++ b/tests/net-sockaddr.c
-@@ -24,7 +24,11 @@
- #include <linux/if_ether.h>
- #include <linux/if_packet.h>
- #include <linux/x25.h>
--#include <linux/ipx.h>
-+#if defined HAVE_LINUX_IPX_H
-+# include <linux/ipx.h>
-+#elif defined HAVE_NETIPX_IPX_H
-+# include <netipx/ipx.h>
-+#endif
- #ifdef HAVE_BLUETOOTH_BLUETOOTH_H
- # include <bluetooth/bluetooth.h>
- # include <bluetooth/hci.h>
-@@ -269,6 +273,7 @@ check_in6(void)
- 	printf("connect(-1, %p, %u) = %d EBADF (%m)\n", in6, len, ret);
- }
- 
-+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
- static void
- check_ipx(void)
- {
-@@ -295,6 +300,7 @@ check_ipx(void)
- 	       c_ipx.sipx_node[4], c_ipx.sipx_node[5],
- 	       c_ipx.sipx_type, len, ret);
- }
-+#endif /* HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H */
- 
- /* for a bit more compact AX.25 address definitions */
- #define AX25_ADDR(c_, s_) \
-@@ -773,7 +779,9 @@ main(void)
- 	check_un();
- 	check_in();
- 	check_in6();
-+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
- 	check_ipx();
-+#endif
- 	check_ax25();
- 	check_x25();
- 	check_nl();
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index eb3e97424f5a..ff89447bfd5a 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.14/strace-5.14.tar.xz.asc
-sha256  901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73  strace-5.14.tar.xz
+# https://strace.io/files/5.15/strace-5.15.tar.xz.asc
+sha256  ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc  strace-5.15.tar.xz
 sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 78d08404f9cc..4b70531aa708 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.14
+STRACE_VERSION = 5.15
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
-# We're patching configure.ac
-STRACE_AUTORECONF = YES
 STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
