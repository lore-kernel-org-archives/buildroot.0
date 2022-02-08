Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FB0410D0;
	Tue,  8 Feb 2022 19:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njiOhaCbLYXP; Tue,  8 Feb 2022 19:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DB1410CA;
	Tue,  8 Feb 2022 19:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 148651BF5AE
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A62410C4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdIwAGergOqK for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 19:21:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1766410C1
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 19:21:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so1862998wme.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ojbBzGYejJa3PuKngNCLrabEcUPeYpj0IbRbg70/qs=;
 b=UOLhLrkz4dHQ2mOe164mrITtbF+jibfCyOxliQE0jkMJSDyt2Xa5IGxszFdKdAHM6b
 gtUVcyC8gTfWI7O7MDIKvGQ7NQo2RsHUBB98x4qsvXoVH4o3Up5pwm7WYqf1Uerjz5+D
 WcnQonGT1dkQLoOc35QBiOW9fOvzBh3cCsy+bl7HmiklLwlRzPQXuuaMpxMMliyR3IdF
 fdLXsx1apijkwNx6uhP7b+a+zu3O3WYHRTGPRYTT0K1r6xCjtthtRbmcWqZPACykEJCg
 IXl7Z/XMWcQepM4t6u/R3eFXalGNM9hy+JLJME1cgW5VWhDgcCuCh2f1RiUUXJej2N0e
 tDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ojbBzGYejJa3PuKngNCLrabEcUPeYpj0IbRbg70/qs=;
 b=XqEjixN2GYPwMJYWyNWWwjHMzM1YDxPsiPM6ef4AXErhuLuJtPi98MBZRS0rXD07MN
 9WMCe8ZK1yky+D76RWDJegzpoe0uH9OCeSda3pliBWbHBJQPTWoDn8xMuUQPDg5WyJQl
 tD3mbuLS5hRrPyfrZg1m4+XDFwMdKxOSQzCf1llw6RQ+PzRvbZrCsJUn3ATyZ1NutVKt
 m3LOGfDiCY2AlqT8HTy6gGXyNXS2ZT6jdElfwAMiakhm/KZ6fR8xKx86whYh3JXo8/J1
 RLrvw/4/YtnTZpehDW3BQ0EeGTeIv14VbsWA1ZFaXFPm89BVL/ukm+bCytuASJGsNgHO
 O4Mw==
X-Gm-Message-State: AOAM531AmNz/z+Cyr6EIPt+me/3+RvS673dnGe6u3QR03rytPzDJbShw
 Rbm9CAaGMCOV3sVeZpUgSOsSOQXXzu4=
X-Google-Smtp-Source: ABdhPJz0GkU4AI2X79eo8aEY2v4Qne9AqKnzrE0d44QK7mCRd9CA5cOOEZIxHgtQ4ZdWGW/IOC7yMw==
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr2284051wmi.141.1644348084456; 
 Tue, 08 Feb 2022 11:21:24 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l20sm3030074wmq.22.2022.02.08.11.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:21:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 20:21:56 +0100
Message-Id: <20220208192157.4058193-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/keepalived: fix build with kernel < 3.14
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel < 3.14 raised since bump to
version 2.27 in commit 79f631000fe6846e72f44810452bb764c228ad44:

vrrp_nftables.c: In function 'setup_rule_move_igmp':
vrrp_nftables.c:1226:15: error: 'NFT_META_L4PROTO' undeclared (first use in this function)
   add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
               ^

Fixes:
 - http://autobuild.buildroot.org/results/2132570fb0407abc0e70146d771471e13ef10237

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix kernel version (4.13 -> 3.14)

 ...upport-meta-l4proro-until-Linux-3-14.patch | 76 +++++++++++++++++++
 ...upport-meta-l4proro-until-Linux-3-14.patch | 40 ++++++++++
 package/keepalived/keepalived.mk              |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
 create mode 100644 package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch

diff --git a/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch b/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
new file mode 100644
index 0000000000..9d5f3f7905
--- /dev/null
+++ b/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
@@ -0,0 +1,76 @@
+From edc71b19c619fdc1d71df10a2d0e8f5822965d69 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Tue, 8 Feb 2022 14:58:49 +0000
+Subject: [PATCH] vrrp: nft didn't support meta l4proro until Linux 3.14
+
+For Linux 3.13 (first version to support nftables), we instead specify:
+@nh,48,8 58
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+[Retrieved (and updated to drop update of README.kernel_versions) from:
+https://github.com/acassen/keepalived/commit/edc71b19c619fdc1d71df10a2d0e8f5822965d69]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ README.kernel_versions          |  1 +
+ configure.ac                    |  5 +++++
+ keepalived/vrrp/vrrp_nftables.c | 16 ++++++++++++++--
+ 3 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 350a9f4e9..bc643dbf1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1754,6 +1754,11 @@ if test .${enable_nftables} != .no; then
+ 	],[
+ 	  AC_MSG_RESULT(no)
+ 	])
++
++      # nft l4proto from Linux 3.14
++      AC_CHECK_DECLS([NFT_META_L4PROTO], [], [],
++        [#include <linux/netfilter/nf_tables.h>])
++
+       # nft dup from Linux 4.3
+       AC_CHECK_DECLS([NFTA_DUP_MAX], [], [],
+         [#include <linux/netfilter/nf_tables.h>])
+diff --git a/keepalived/vrrp/vrrp_nftables.c b/keepalived/vrrp/vrrp_nftables.c
+index d3ea39db3..8b5095ad4 100644
+--- a/keepalived/vrrp/vrrp_nftables.c
++++ b/keepalived/vrrp/vrrp_nftables.c
+@@ -1191,6 +1191,8 @@ setup_rule_move_igmp(uint8_t family, const char *table,
+ 	   otherwise:
+ 	     nft add rule ip keepalived out ip protocol igmp [meta oifkind macvlan] oif @vmac_set drop
+ 	     nft add rule ip6 keepalived out icmpv6 type mld2-listener-report [meta oifkind macvlan] oif @vmac_set drop
++	 *
++	 * Note: on 3.13 kernels, icmpv6 is specified as @nh,48,8 58
+ 	 */
+ 	struct nftnl_rule *r = NULL;
+ 	uint64_t handle_num;
+@@ -1223,7 +1225,12 @@ setup_rule_move_igmp(uint8_t family, const char *table,
+ 			    offsetof(struct iphdr, daddr), sizeof(struct in_addr));
+ #endif
+ 	} else {
+-		add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
++#if HAVE_DECL_NFT_META_L4PROTO
++		add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
++#else
++		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
++			    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
++#endif
+ 		protocol = IPPROTO_ICMPV6;
+ 		add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &protocol, sizeof(protocol));
+ 		add_payload(r, NFT_PAYLOAD_TRANSPORT_HEADER, NFT_REG_1,
+@@ -1279,7 +1286,12 @@ setup_rule_drop_router_solicit(const char *table, const char *chain,
+ 		nftnl_rule_set_u64(r, NFTNL_RULE_POSITION, handle_num);
+ 	}
+ 
+-	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
++#if HAVE_DECL_NFT_META_L4PROTO
++	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
++#else
++	add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
++		    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
++#endif
+ 	protocol = IPPROTO_ICMPV6;
+ 	add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &protocol, sizeof(protocol));
+ 	add_payload(r, NFT_PAYLOAD_TRANSPORT_HEADER, NFT_REG_1,
diff --git a/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch b/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
new file mode 100644
index 0000000000..3713de37c2
--- /dev/null
+++ b/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
@@ -0,0 +1,40 @@
+From 50e8a8d56cd5a3d7184b035708865302bbc7ef69 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Tue, 8 Feb 2022 17:43:49 +0000
+Subject: [PATCH] ipvs: nft didn't support meta l4proro until Linux 3.14
+
+For Linux 3.13 (first version to support nftables), we instead specify:
+ipv4: @nh,72,8 PROTO
+ipv6: @nh,48,8 PROTO
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/50e8a8d56cd5a3d7184b035708865302bbc7ef69]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/check/check_nftables.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/keepalived/check/check_nftables.c b/keepalived/check/check_nftables.c
+index 2d163ac14..45831203b 100644
+--- a/keepalived/check/check_nftables.c
++++ b/keepalived/check/check_nftables.c
+@@ -150,7 +150,16 @@ setup_rule_set_mark(uint8_t family, const char *table,
+ 		nftnl_rule_set_u64(r, NFTNL_RULE_POSITION, handle_num);
+ 	}
+ 
+-	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
++#if HAVE_DECL_NFT_META_L4PROTO
++	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
++#else
++	if (family == NFPROTO_IPV4)
++		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
++			    offsetof(struct iphdr, protocol), sizeof(((struct iphdr *)NULL)->protocol));
++	else
++		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
++			    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
++#endif
+ 	add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &l4_protocol, sizeof(l4_protocol));
+ 	if (family == NFPROTO_IPV4)
+ 		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 7a1123b4dd..c7e8c3e2ec 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -11,6 +11,8 @@ KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
+# We're patching configure.ac
+KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
