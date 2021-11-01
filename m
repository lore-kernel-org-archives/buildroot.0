Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD3BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 10:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE13B60E9B
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 10:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE13B60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=go-sys.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F0B880CE1;
	Mon,  1 Nov 2021 10:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stUt-ESGu7sd; Mon,  1 Nov 2021 10:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B637D80C71;
	Mon,  1 Nov 2021 10:12:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 038AD1BF3A9
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 10:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0044780C71
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 10:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5-5a0aBMRCX for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 10:12:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.18.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B01E180C5A
 for <buildroot@busybox.net>; Mon,  1 Nov 2021 10:12:23 +0000 (UTC)
Received: from [84.191.225.2] (helo=exchange.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1mhUI9-0006E7-Fk; Mon, 01 Nov 2021 11:11:49 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2106.2; Mon, 1 Nov
 2021 11:12:19 +0100
Received: from go-sys.de (192.168.1.112) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2106.2 via Frontend Transport;
 Mon, 1 Nov 2021 11:12:19 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 1 Nov 2021 11:12:17 +0100
Message-ID: <20211101101217.23328-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.34.1
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
Cc: Michael Fischer <mf@go-sys.de>, Denys Vlasenko <vda.linux@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

patch 0003: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...003-udhcp-fix-build-breakage-on-MIPS.patch | 39 -------------------
 package/busybox/busybox.hash                  |  4 +-
 package/busybox/busybox.mk                    |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch

diff --git a/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch b/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch
deleted file mode 100644
index d54d45da43..0000000000
--- a/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 56824284b749e5b9d568b75d5c5bc471b1814d46 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 20 Aug 2021 13:33:50 +0200
-Subject: [PATCH] udhcp: fix build breakage on MIPS
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
-upstream status: 00adcdb64 ("udhcp: fix build breakage on MIPS")
-
- networking/udhcp/common.h | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
-index 8c678dd32..ca778dab8 100644
---- a/networking/udhcp/common.h
-+++ b/networking/udhcp/common.h
-@@ -304,18 +304,6 @@ void udhcp_dump_packet(struct dhcp_packet *packet) FAST_FUNC;
- # define log3s(msg) ((void)0)
- #endif
-
--#if defined(__mips__)
--/*
-- * The 'simple' message functions have a negative impact on the size of the
-- * DHCP code when compiled for MIPS, so don't use them in this case.
-- */
--#define bb_simple_info_msg bb_info_msg
--#define bb_simple_error_msg bb_error_msg
--#define bb_simple_perror_msg_and_die bb_perror_msg_and_die
--#undef log1s
--#define log1s log1
--#endif
--
- /*** Other shared functions ***/
-
- /* 2nd param is "uint32_t*" */
---
-2.33.0
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 4782f68819..1f34651d7b 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.34.0.tar.bz2.sha256
-sha256  ec8d1615edb045b83b81966604759c4d4ac921434ab4011da604f629c06074ce  busybox-1.34.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.34.1.tar.bz2.sha256
+sha256  415fbd89e5344c96acf449d94a6f956dbed62e18e835fc83e064db33a34bd549  busybox-1.34.1.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 08b5c55c50..3523cf21d0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.34.0
+BUSYBOX_VERSION = 1.34.1
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
