Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB37C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4C7606F8;
	Fri, 10 Jul 2026 16:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QB16DQCQeOkI; Fri, 10 Jul 2026 16:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254C3607C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783702489;
	bh=GcyNqGIc06cNvHPTDmSFCS73iShnFIfvqTqGCW48KTc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aBVcVyexPxHM2ptTn/Ztf0eZ5zmKNstyZJVqnhCmOFrmRjtYxZCeAtOlHo3w7iyOw
	 7aedQ+lvvCDiXau2hBBzuC8Z3UcnNPH6/u7SKAQKYE3lXdcU7MgDrCITb416iWB7Im
	 ApTzEN5Ex9YdpheAMUvMjKMJJUs+QBr15CChu4CeNG9DR6rPrE+HiPtuJ3zdE/S9pq
	 4ikSNBYe3yEnsbdAD2tQ3ljuRrpZLhd0JKEjz+h89lAKFxNQhJbqemQLnLmid5oVbG
	 ZCd68hhDWO1JYBXXCoNM28y5WA9tR6iAGVG+YbUoFdShL2ELdoUy6spHIwJyB6aqVT
	 b0neiO0etmWrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254C3607C7;
	Fri, 10 Jul 2026 16:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA425320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B845C4033D
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wx3IbQy6AJ36 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C7240375
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C7240375
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:54:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9CC6886A2; Fri, 10 Jul 2026 16:54:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:52:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 138713f39a999c30adec7f2e2829aa67af87a110
X-Git-Newrev: 92abb11ee4f574981eb194d283b97afad5dec004
X-Patchwork-Hint: ignore
Message-Id: <20260710165414.B9CC6886A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odhcp6c: bump version to git
 10a52220ae
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
Content-Type: multipart/mixed; boundary="===============5112691350378385337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5112691350378385337==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92abb11ee4f574981eb194d283b97afad5dec004
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/openwrt/odhcp6c/compare/f19dd37fb467c9cf10cad57aefa0d048312d7dfd...10a52220aec9d45803518d8cc4d63e552484ed61

Removed patches which are included in this release.

Please note that upstream committed
https://git.openwrt.org/project/odhcp6c/commit/?id=10a52220aec9d45803518d8cc4d63e552484ed61
instead of patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-odhcp6c-const-cast-for-c23-compatibility.patch | 102 ---------------------
 .../0002-dhcpv6-use-stable-IAID-for-IA_NA.patch    |  95 -------------------
 package/odhcp6c/odhcp6c.hash                       |   2 +-
 package/odhcp6c/odhcp6c.mk                         |   2 +-
 4 files changed, 2 insertions(+), 199 deletions(-)

diff --git a/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch b/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
deleted file mode 100644
index cdb26a7434..0000000000
--- a/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 3b69378125aba61b3391bf5fe607983ce75b839c Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Wed, 8 Apr 2026 14:14:56 -0700
-Subject: [PATCH] odhcp6c: const cast for c23 compatibility
-
-strpbrk is now a macro that returns const based on the parameter. Cast
-it away when we don't want const.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-
-Upstream: https://github.com/openwrt/odhcp6c/pull/156
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/config.c | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/config.c b/src/config.c
-index 54e2d35..c1a3a99 100644
---- a/src/config.c
-+++ b/src/config.c
-@@ -338,7 +338,7 @@ static int config_parse_opt_u8(const char *src, uint8_t **dst)
- static int config_parse_opt_string(const char *src, uint8_t **dst, const bool array)
- {
- 	int o_len = 0;
--	char *sep = strpbrk(src, ARRAY_SEP);
-+	char *sep = strpbrk((char*)src, ARRAY_SEP);
- 
- 	if (sep && !array)
- 		return -1;
-@@ -362,7 +362,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
- 		src = sep;
- 
- 		if (sep)
--			sep = strpbrk(src, ARRAY_SEP);
-+			sep = strpbrk((char*)src, ARRAY_SEP);
- 	} while (src);
- 
- 	return o_len;
-@@ -371,7 +371,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
- static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const bool array)
- {
- 	int o_len = 0;
--	char *sep = strpbrk(src, ARRAY_SEP);
-+	char *sep = strpbrk((char*)src, ARRAY_SEP);
- 
- 	if (sep && !array)
- 		return -1;
-@@ -399,7 +399,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
- 		src = sep;
- 
- 		if (sep)
--			sep = strpbrk(src, ARRAY_SEP);
-+			sep = strpbrk((char*)src, ARRAY_SEP);
- 	} while (src);
- 
- 	return o_len;
-@@ -408,7 +408,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
- static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array)
- {
- 	int o_len = 0;
--	char *sep = strpbrk(src, ARRAY_SEP);
-+	char *sep = strpbrk((char*)src, ARRAY_SEP);
- 
- 	if (sep && !array)
- 		return -1;
-@@ -433,7 +433,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
- 		src = sep;
- 
- 		if (sep)
--			sep = strpbrk(src, ARRAY_SEP);
-+			sep = strpbrk((char*)src, ARRAY_SEP);
- 	} while (src);
- 
- 	return o_len;
-@@ -442,7 +442,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
- static int config_parse_opt_user_class(const char *src, uint8_t **dst, const bool array)
- {
- 	int o_len = 0;
--	char *sep = strpbrk(src, ARRAY_SEP);
-+	char *sep = strpbrk((char*)src, ARRAY_SEP);
- 
- 	if (sep && !array)
- 		return -1;
-@@ -471,7 +471,7 @@ static int config_parse_opt_user_class(const char *src, uint8_t **dst, const boo
- 		src = sep;
- 
- 		if (sep)
--			sep = strpbrk(src, ARRAY_SEP);
-+			sep = strpbrk((char*)src, ARRAY_SEP);
- 	} while (src);
- 
- 	return o_len;
-@@ -555,7 +555,7 @@ int config_parse_opt(const char *opt)
- 	struct odhcp6c_opt *dopt = NULL;
- 	int ret = -1;
- 
--	data = strpbrk(opt, ":");
-+	data = strpbrk((char*)opt, ":");
- 	if (!data)
- 		return -1;
- 
diff --git a/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch b/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch
deleted file mode 100644
index fc70205ccc..0000000000
--- a/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 9a4d6fe802d21e4fc1b84f7d55b5c3c23e71d6ba Mon Sep 17 00:00:00 2001
-From: Paul Donald <newtwen+github@gmail.com>
-Date: Thu, 18 Dec 2025 15:10:24 +0100
-Subject: [PATCH] dhcpv6: use stable IAID for IA_NA
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-https://www.rfc-editor.org/rfc/rfc8415.html#section-12
-
-   ........  The IAID is chosen by the client.  For any given use of an
-   IA by the client, the IAID for that IA MUST be consistent across
-   restarts of the DHCP client.  The client may maintain consistency by
-   either storing the IAID in non-volatile storage or using an algorithm
-   that will consistently produce the same IAID as long as the
-   configuration of the client has not changed.
-
-Signed-off-by: Paul Donald <newtwen+github@gmail.com>
-Link: https://github.com/openwrt/odhcp6c/pull/140
-Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
-
-Upstream: https://github.com/openwrt/odhcp6c/commit/9a4d6fe802d21e4fc1b84f7d55b5c3c23e71d6ba
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/dhcpv6.c  | 15 +++++++++++++--
- src/odhcp6c.h |  1 +
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/dhcpv6.c b/src/dhcpv6.c
-index d8bb8be..97860b1 100644
---- a/src/dhcpv6.c
-+++ b/src/dhcpv6.c
-@@ -262,6 +262,9 @@ static struct dhcpv6_stats dhcpv6_stats = {0};
- // config
- static struct config_dhcp* config_dhcp = NULL;
- 
-+// store unique ifname hash to use as IA->IAID
-+static uint32_t ifname_hash_iaid = 0;
-+
- static uint32_t ntohl_unaligned(const uint8_t *data)
- {
- 	uint32_t buf;
-@@ -542,6 +545,12 @@ void dhcpv6_reset_stats(void)
- 	memset(&dhcpv6_stats, 0, sizeof(dhcpv6_stats));
- }
- 
-+uint32_t hash_ifname(const char *s) {
-+	uint32_t h = 0;
-+	while (*s) h = h * 31 + *s++;
-+	return h;
-+}
-+
- int init_dhcpv6(const char *ifname)
- {
- 	config_dhcp = config_dhcp_get();
-@@ -566,6 +575,8 @@ int init_dhcpv6(const char *ifname)
- 	if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0)
- 		goto failure;
- 
-+	ifname_hash_iaid = hash_ifname(ifname);
-+
- 	ifindex = ifr.ifr_ifindex;
- 
- 	// Set the socket to non-blocking mode
-@@ -838,7 +849,7 @@ static void dhcpv6_send(enum dhcpv6_msg req_msg_type, uint8_t trid[3], uint32_t
- 	struct dhcpv6_ia_hdr hdr_ia_na = {
- 		.type = htons(DHCPV6_OPT_IA_NA),
- 		.len = htons(sizeof(hdr_ia_na) - DHCPV6_OPT_HDR_SIZE),
--		.iaid = htonl(ifindex),
-+		.iaid = htonl(ifname_hash_iaid),
- 		.t1 = 0,
- 		.t2 = 0,
- 	};
-@@ -1392,7 +1403,7 @@ static int dhcpv6_handle_reply(enum dhcpv6_msg orig, _o_unused const int rc,
- 						continue;
- 
- 					// Test ID
--					if (ia_hdr->iaid != htonl(ifindex) && otype == DHCPV6_OPT_IA_NA)
-+					if (ia_hdr->iaid != htonl(ifname_hash_iaid) && otype == DHCPV6_OPT_IA_NA)
- 						continue;
- 
- 					uint16_t code = DHCPV6_Success;
-diff --git a/src/odhcp6c.h b/src/odhcp6c.h
-index aa73bbc..c57f885 100644
---- a/src/odhcp6c.h
-+++ b/src/odhcp6c.h
-@@ -540,6 +540,7 @@ struct odhcp6c_opt {
- 	const char *str;
- };
- 
-+uint32_t hash_ifname(const char *s);
- int init_dhcpv6(const char *ifname);
- int dhcpv6_get_ia_mode(void);
- int dhcpv6_promote_server_cand(void);
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 86c9c659c4..1e0b829b7a 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9cfddfcc12c4ca0bf8d8211bb72c7018c0e0f8da6903d680da122b4ce551c56  odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd-git4.tar.gz
+sha256  d2f48c57adbe2c2304ca7a8900429797e46267c6f2e376ac0166fceb85095847  odhcp6c-10a52220aec9d45803518d8cc4d63e552484ed61-git4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 92688b7237..b935596312 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = f19dd37fb467c9cf10cad57aefa0d048312d7dfd
+ODHCP6C_VERSION = 10a52220aec9d45803518d8cc4d63e552484ed61
 ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
 ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0

--===============5112691350378385337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5112691350378385337==--
