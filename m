Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36126D59D64
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 23:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E092B85145;
	Mon, 25 Nov 2024 23:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhSJExc0_ARw; Mon, 25 Nov 2024 23:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DA985146
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DA985146;
	Mon, 25 Nov 2024 23:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DA504961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DEEF4AE77
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Upxr8jpte_0O for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 23:00:40 +0000 (UTC)
X-Greylist: delayed 527 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Nov 2024 23:00:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51EA84ADD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EA84ADD2
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.63.98; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EA84ADD2
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:00:39 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4Xy1D633Pdz6328
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:51:50 +0100 (CET)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4Xy1D62LMfz4xLG
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:51:50 +0100 (CET)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Xy1D60WsPz8sZP
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 23:51:50 +0100 (CET)
Received: from localhost.localdomain (ip5b4132a0.dynamic.kabel-deutschland.de
 [91.65.50.160])
 by mxe217.netcup.net (Postfix) with ESMTPSA id B33C1842BF;
 Mon, 25 Nov 2024 23:51:44 +0100 (CET)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Cc: Torben Voltmer <mail@t-voltmer.net>
Date: Mon, 25 Nov 2024 23:51:32 +0100
Message-ID: <20241125225132.1476605-1-mail@t-voltmer.net>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: B33C1842BF
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: DnIks7MvsfaBfeg/76d2L+/nwxNArPvE5CcepWw0YFYyCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-2501.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH 1/1] package/espflash: bump version to 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index 0b1e160a47..e079fdf322 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f91a3e33e874bac0d7687d87c3cd692a54325c0dceaf35c983bd3d94519dee25  espflash-3.1.1-cargo2.tar.gz
+sha256  de65d1d9efa0561aae1a0fe476860402139f8a7ebbf28948d2ef7e4b68b21373  espflash-3.2.0-cargo2.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index bcb343fc58..dae852fad4 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 3.1.1
+ESPFLASH_VERSION = 3.2.0
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
