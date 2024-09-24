Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E3CF9C6F
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 12:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B033640F7B;
	Tue, 24 Sep 2024 12:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLyDGmREfXpS; Tue, 24 Sep 2024 12:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 547CA40DC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 547CA40DC8;
	Tue, 24 Sep 2024 12:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17A101BF966
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A693541A08
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FI01J6ARP-44 for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 12:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7A1641947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A1641947
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A1641947
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:24:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18B0D60004;
 Tue, 24 Sep 2024 12:24:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1st4aU-004ind-13;
 Tue, 24 Sep 2024 14:24:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 14:23:58 +0200
Message-Id: <20240924122406.1125261-15-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
References: <20240924122406.1125261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 15/22] package/smcroute: fix 'assume' typo
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index f7476f1100..f8866f6672 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -30,7 +30,7 @@ endef
 
 SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
 
-# We will asume that CONFIG_NET and CONFIG_INET are already
+# We will assume that CONFIG_NET and CONFIG_INET are already
 # set in the kernel configuration provided by the user.
 define SMCROUTE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
