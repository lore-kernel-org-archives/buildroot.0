Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FDAE6688F
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 22:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDAF84962;
	Sat, 23 Nov 2024 22:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXLH0fEwwj_5; Sat, 23 Nov 2024 22:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C7348497F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C7348497F;
	Sat, 23 Nov 2024 22:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF6E31D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 22:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFEE742AF1
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 22:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2-aAvfm5yKf for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 22:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA288428C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA288428C4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA288428C4
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 22:52:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D5E320002;
 Sat, 23 Nov 2024 22:52:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tEyyw-00E6iF-2x;
 Sat, 23 Nov 2024 23:52:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 23:51:55 +0100
Message-Id: <20241123225155.3362363-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/quagga: fetch from sources.buildroot.net
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

Fixes https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/

Upstream is no longer accessible, so use s.b.n instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 5d8d52263a..dd921552f1 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QUAGGA_VERSION = 1.2.4
-QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
+# upstream (http://download.savannah.gnu.org/releases/quagga) dead
+QUAGGA_SITE = http://sources.buildroot.net/quagga
 QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
