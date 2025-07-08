Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F46CC8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31937406CA;
	Tue,  8 Jul 2025 20:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va-tVY1sn4-K; Tue,  8 Jul 2025 20:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D1240594
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D1240594;
	Tue,  8 Jul 2025 20:55:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C33D1BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825854020B
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqd9CBvnVMdR for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:55:56 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.63.162; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C4C2400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4C2400F6
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C4C2400F6
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:55:56 +0000 (UTC)
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4bcD0V4tsbz425c
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:55:54 +0200 (CEST)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4bcD0V48Dyz41q5
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:55:54 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4bcD0V2GZnz8sh8
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:55:54 +0200 (CEST)
Received: from ws-linux (ipb21a3d04.dynamic.kabel-deutschland.de [178.26.61.4])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 1D79B86261;
 Tue,  8 Jul 2025 22:55:48 +0200 (CEST)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Cc: Torben Voltmer <mail@t-voltmer.net>
Date: Tue,  8 Jul 2025 22:55:42 +0200
Message-ID: <20250708205542.2287385-1-mail@t-voltmer.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1D79B86261
X-NC-CID: 04fqpXEnNTD+InhJ5VtEaRew5xT1wjvenpoGm+Z/WxWw3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-8201.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH 1/1] package/espflash: bump to version 4.0.1
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

Release notes:
https://github.com/esp-rs/espflash/releases/tag/v4.0.1

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index 61297f2a50..4eb63d6fda 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  02060e2a2d84d21679c1676a715beda468fcf75525ca6ee7560b3161c61fb148  espflash-3.2.0-cargo4.tar.gz
+sha256  5edf94cd55daceffd08278f7789ea58b24de2051f0e15d8b7ba441bc94337d87  espflash-4.0.1-cargo4.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index dae852fad4..da15535670 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 3.2.0
+ESPFLASH_VERSION = 4.0.1
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
