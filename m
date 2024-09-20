Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4405DCF9C69
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A13540DD7;
	Fri, 20 Sep 2024 21:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2kpYK9uoaWQ; Fri, 20 Sep 2024 21:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B204104D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B204104D;
	Fri, 20 Sep 2024 21:29:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790E21BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CE5A40245
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfly9oMAjsSP for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB9D7400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB9D7400E4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB9D7400E4
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:28:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48E1D60003;
 Fri, 20 Sep 2024 21:28:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srlBK-00HCPZ-0s;
 Fri, 20 Sep 2024 23:28:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:28:42 +0200
Message-Id: <20240920212848.4099245-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920212848.4099245-1-peter@korsgaard.com>
References: <20240920212848.4099245-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/8] boot/barebox/barebox.mk: fix 'allows' typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index fe366989b9..929ed48ada 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -26,7 +26,7 @@ else ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
 $(1)_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 $(1)_SITE_METHOD = git
 # Override the default value of _SOURCE to 'barebox-*' so that it is not
-# downloaded a second time for barebox-aux; also alows avoiding the hash
+# downloaded a second time for barebox-aux; also allows avoiding the hash
 # check:
 $(1)_SOURCE = barebox-$$($(1)_VERSION)$$(BR_FMT_VERSION_git).tar.gz
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
