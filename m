Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22604C61DB3
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2603828D1;
	Fri, 27 Jan 2023 12:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2603828D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3_rsyIS_eOM; Fri, 27 Jan 2023 12:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE91828F2;
	Fri, 27 Jan 2023 12:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE91828F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3971BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396F981E2A
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396F981E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xUnwXdpZ4Yz for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:48:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1BA81E16
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1BA81E16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B8187EB2; Fri, 27 Jan 2023 12:48:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:45:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33703b32bf5fbb18a25546403527e7140292eba0
X-Git-Newrev: ef2af4b67f3403fc0feaca8a07d1733f17c6b316
X-Patchwork-Hint: ignore
Message-Id: <20230127124857.B9B8187EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: bump to version 1.8.9
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7160425759137264568=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7160425759137264568==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef2af4b67f3403fc0feaca8a07d1733f17c6b316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://netfilter.org/projects/iptables/files/changes-iptables-1.8.9.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-build-for-missing-ETH_ALEN-definition.patch |  69 ---------
 .../0002-treewide-use-uint-instead-of-u_int.patch  | 167 ---------------------
 package/iptables/0003-netfilter-add-nf_log.h.patch |  38 -----
 package/iptables/iptables.hash                     |   2 +-
 package/iptables/iptables.mk                       |   4 +-
 5 files changed, 3 insertions(+), 277 deletions(-)

diff --git a/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch b/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch
deleted file mode 100644
index 4f3831d9e4..0000000000
--- a/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 0e7cf0ad306cdf95dc3c28d15a254532206a888e Mon Sep 17 00:00:00 2001
-Message-Id: <0e7cf0ad306cdf95dc3c28d15a254532206a888e.1656908815.git.baruch@tkos.co.il>
-From: Phil Sutter <phil@nwl.cc>
-Date: Wed, 18 May 2022 16:04:09 +0200
-Subject: [PATCH] Revert "fix build for missing ETH_ALEN definition"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit c5d9a723b5159a28f547b577711787295a14fd84 as it broke
-compiling against musl libc. Might be a bug in the latter, but for the
-time being try to please both by avoiding the include and instead
-defining ETH_ALEN if unset.
-
-While being at it, move netinet/ether.h include up.
-
-Fixes: 1bdb5535f561a ("libxtables: Extend MAC address printing/parsing support")
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Reviewed-by: Maciej Żenczykowski <maze@google.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 0e7cf0ad306cdf95dc3c28d15a254532206a888e
-
- libxtables/xtables.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/libxtables/xtables.c b/libxtables/xtables.c
-index 96fd783a066c..0638f9271c60 100644
---- a/libxtables/xtables.c
-+++ b/libxtables/xtables.c
-@@ -28,6 +28,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-+#include <netinet/ether.h>
- #include <sys/socket.h>
- #include <sys/stat.h>
- #include <sys/statfs.h>
-@@ -45,7 +46,6 @@
- 
- #include <xtables.h>
- #include <limits.h> /* INT_MAX in ip_tables.h/ip6_tables.h */
--#include <linux/if_ether.h> /* ETH_ALEN */
- #include <linux/netfilter_ipv4/ip_tables.h>
- #include <linux/netfilter_ipv6/ip6_tables.h>
- #include <libiptc/libxtc.h>
-@@ -72,6 +72,10 @@
- #define PROC_SYS_MODPROBE "/proc/sys/kernel/modprobe"
- #endif
- 
-+#ifndef ETH_ALEN
-+#define ETH_ALEN 6
-+#endif
-+
- /* we need this for ip6?tables-restore.  ip6?tables-restore.c sets line to the
-  * current line of the input file, in order  to give a more precise error
-  * message.  ip6?tables itself doesn't need this, so it is initialized to the
-@@ -2245,8 +2249,6 @@ void xtables_print_num(uint64_t number, unsigned int format)
- 	printf(FMT("%4lluT ","%lluT "), (unsigned long long)number);
- }
- 
--#include <netinet/ether.h>
--
- static const unsigned char mac_type_unicast[ETH_ALEN] =   {};
- static const unsigned char msk_type_unicast[ETH_ALEN] =   {1};
- static const unsigned char mac_type_multicast[ETH_ALEN] = {1};
--- 
-2.35.1
-
diff --git a/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch b/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch
deleted file mode 100644
index e254c061af..0000000000
--- a/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From f319389525b066b7dc6d389c88f16a0df3b8f189 Mon Sep 17 00:00:00 2001
-Message-Id: <f319389525b066b7dc6d389c88f16a0df3b8f189.1656908915.git.baruch@tkos.co.il>
-From: Nick Hainke <vincent@systemli.org>
-Date: Mon, 16 May 2022 18:16:41 +0200
-Subject: [PATCH] treewide: use uint* instead of u_int*
-
-Gcc complains about missing types. Some commits introduced u_int* instead
-of uint*. Use uint treewide.
-
-Fixes errors in the form of:
-In file included from xtables-legacy-multi.c:5:
-xshared.h:83:56: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
-    83 | set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
-        |                                                        ^~~~~~~~~
-        |                                                        uint16_t
-make[6]: *** [Makefile:712: xtables_legacy_multi-xtables-legacy-multi.o] Error 1
-
-Avoid libipq API breakage by adjusting libipq.h include accordingly. For
-arpt_mangle.h kernel uAPI header, apply same change as in kernel commit
-e91ded8db5747 ("uapi: netfilter_arp: use __u8 instead of u_int8_t").
-
-Signed-off-by: Nick Hainke <vincent@systemli.org>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit f319389525b066b7dc6d389c88f16a0df3b8f189
-
- extensions/libxt_conntrack.c              | 2 +-
- include/libipq/libipq.h                   | 8 ++++----
- include/libiptc/libxtc.h                  | 2 +-
- include/linux/netfilter_arp/arpt_mangle.h | 2 +-
- iptables/xshared.c                        | 2 +-
- iptables/xshared.h                        | 2 +-
- libipq/ipq_create_handle.3                | 2 +-
- libipq/ipq_set_mode.3                     | 2 +-
- 8 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/extensions/libxt_conntrack.c b/extensions/libxt_conntrack.c
-index 64018ce152b7..234085c5211c 100644
---- a/extensions/libxt_conntrack.c
-+++ b/extensions/libxt_conntrack.c
-@@ -778,7 +778,7 @@ matchinfo_print(const void *ip, const struct xt_entry_match *match, int numeric,
- 
- static void
- conntrack_dump_ports(const char *prefix, const char *opt,
--		     u_int16_t port_low, u_int16_t port_high)
-+		     uint16_t port_low, uint16_t port_high)
- {
- 	if (port_high == 0 || port_low == port_high)
- 		printf(" %s%s %u", prefix, opt, port_low);
-diff --git a/include/libipq/libipq.h b/include/libipq/libipq.h
-index 3cd1329217a0..dd0cb205179c 100644
---- a/include/libipq/libipq.h
-+++ b/include/libipq/libipq.h
-@@ -24,7 +24,7 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
--#include <sys/types.h>
-+#include <stdint.h>
- #include <sys/socket.h>
- #include <sys/uio.h>
- #include <asm/types.h>
-@@ -48,19 +48,19 @@ typedef unsigned long ipq_id_t;
- struct ipq_handle
- {
- 	int fd;
--	u_int8_t blocking;
-+	uint8_t blocking;
- 	struct sockaddr_nl local;
- 	struct sockaddr_nl peer;
- };
- 
--struct ipq_handle *ipq_create_handle(u_int32_t flags, u_int32_t protocol);
-+struct ipq_handle *ipq_create_handle(uint32_t flags, uint32_t protocol);
- 
- int ipq_destroy_handle(struct ipq_handle *h);
- 
- ssize_t ipq_read(const struct ipq_handle *h,
-                 unsigned char *buf, size_t len, int timeout);
- 
--int ipq_set_mode(const struct ipq_handle *h, u_int8_t mode, size_t len);
-+int ipq_set_mode(const struct ipq_handle *h, uint8_t mode, size_t len);
- 
- ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf);
- 
-diff --git a/include/libiptc/libxtc.h b/include/libiptc/libxtc.h
-index 37010188b64f..a1d16ef996d7 100644
---- a/include/libiptc/libxtc.h
-+++ b/include/libiptc/libxtc.h
-@@ -10,7 +10,7 @@ extern "C" {
- #endif
- 
- #ifndef XT_MIN_ALIGN
--/* xt_entry has pointers and u_int64_t's in it, so if you align to
-+/* xt_entry has pointers and uint64_t's in it, so if you align to
-    it, you'll also align to any crazy matches and targets someone
-    might write */
- #define XT_MIN_ALIGN (__alignof__(struct xt_entry))
-diff --git a/include/linux/netfilter_arp/arpt_mangle.h b/include/linux/netfilter_arp/arpt_mangle.h
-index 250f502902bb..8c2b16a1f5a0 100644
---- a/include/linux/netfilter_arp/arpt_mangle.h
-+++ b/include/linux/netfilter_arp/arpt_mangle.h
-@@ -13,7 +13,7 @@ struct arpt_mangle
- 	union {
- 		struct in_addr tgt_ip;
- 	} u_t;
--	u_int8_t flags;
-+	__u8 flags;
- 	int target;
- };
- 
-diff --git a/iptables/xshared.c b/iptables/xshared.c
-index a8512d380815..9b5e5b5bddc2 100644
---- a/iptables/xshared.c
-+++ b/iptables/xshared.c
-@@ -1025,7 +1025,7 @@ static const int inverse_for_options[NUMBER_OF_OPT] =
- };
- 
- void
--set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
-+set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
- 	   bool invert)
- {
- 	if (*options & option)
-diff --git a/iptables/xshared.h b/iptables/xshared.h
-index 14568bb00fb6..f82129883968 100644
---- a/iptables/xshared.h
-+++ b/iptables/xshared.h
-@@ -80,7 +80,7 @@ struct xtables_target;
- #define IPT_INV_ARPHRD		0x0800
- 
- void
--set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
-+set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
- 	   bool invert);
- 
- /**
-diff --git a/libipq/ipq_create_handle.3 b/libipq/ipq_create_handle.3
-index 11ef95c4b79f..ebe46daab92d 100644
---- a/libipq/ipq_create_handle.3
-+++ b/libipq/ipq_create_handle.3
-@@ -24,7 +24,7 @@ ipq_create_handle, ipq_destroy_handle \(em create and destroy libipq handles.
- .br
- .B #include <libipq.h>
- .sp
--.BI "struct ipq_handle *ipq_create_handle(u_int32_t " flags ", u_int32_t " protocol ");"
-+.BI "struct ipq_handle *ipq_create_handle(uint32_t " flags ", uint32_t " protocol ");"
- .br
- .BI "int ipq_destroy_handle(struct ipq_handle *" h );
- .SH DESCRIPTION
-diff --git a/libipq/ipq_set_mode.3 b/libipq/ipq_set_mode.3
-index 0edd3c00a84f..e206886c8c62 100644
---- a/libipq/ipq_set_mode.3
-+++ b/libipq/ipq_set_mode.3
-@@ -24,7 +24,7 @@ ipq_set_mode \(em set the ip_queue queuing mode
- .br
- .B #include <libipq.h>
- .sp
--.BI "int ipq_set_mode(const struct ipq_handle *" h ", u_int8_t " mode ", size_t " range );
-+.BI "int ipq_set_mode(const struct ipq_handle *" h ", uint8_t " mode ", size_t " range );
- .SH DESCRIPTION
- The
- .B ipq_set_mode
--- 
-2.35.1
-
diff --git a/package/iptables/0003-netfilter-add-nf_log.h.patch b/package/iptables/0003-netfilter-add-nf_log.h.patch
deleted file mode 100644
index 50112faf86..0000000000
--- a/package/iptables/0003-netfilter-add-nf_log.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 15ea3fa147dea25d8cae3c2ac417142f2e0f029e Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@broadcom.com>
-To: Netfilter Mailing List <netfilter-devel@vger.kernel.org>
-Date: Thu, 16 Jun 2022 15:29:58 -0700
-Subject: [PATCH] netfilter: add nf_log.h
-
-Since libxt_NFLOG is now using the UAPI version of nf_log.h, it should
-be bundled alongside the other netfilter kernel headers.
-
-This copy of nf_log.h was taken from Linux 5.18.
-
-Signed-off-by: Markus Mayer <mmayer@broadcom.com>
-Upstream: https://git.netfilter.org/iptables/commit/?id=9ea7e6aa638d0dfa14613f6f97e6dc06c857e609
----
-diff --git a/include/linux/netfilter/nf_log.h b/include/linux/netfilter/nf_log.h
-new file mode 100644
-index 000000000000..2ae00932d3d2
---- /dev/null
-+++ b/include/linux/netfilter/nf_log.h
-@@ -0,0 +1,15 @@
-+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-+#ifndef _NETFILTER_NF_LOG_H
-+#define _NETFILTER_NF_LOG_H
-+
-+#define NF_LOG_TCPSEQ		0x01	/* Log TCP sequence numbers */
-+#define NF_LOG_TCPOPT		0x02	/* Log TCP options */
-+#define NF_LOG_IPOPT		0x04	/* Log IP options */
-+#define NF_LOG_UID		0x08	/* Log UID owning local socket */
-+#define NF_LOG_NFLOG		0x10	/* Unsupported, don't reuse */
-+#define NF_LOG_MACDECODE	0x20	/* Decode MAC header */
-+#define NF_LOG_MASK		0x2f
-+
-+#define NF_LOG_PREFIXLEN	128
-+
-+#endif /* _NETFILTER_NF_LOG_H */
--- 
-2.25.1
-
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index f4e5ae1593..a908b9cbc1 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f  iptables-1.8.8.tar.bz2
+sha256  ef6639a43be8325a4f8ea68123ffac236cb696e8c78501b64e8106afb008c87f  iptables-1.8.9.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a6143677d1..561c82ca0b 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.8
-IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
+IPTABLES_VERSION = 1.8.9
+IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.xz
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
 IPTABLES_DEPENDENCIES = host-pkgconf

--===============7160425759137264568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7160425759137264568==--
