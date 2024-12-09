Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D291E7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECD480ABD;
	Mon,  9 Dec 2024 08:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gMLWB2Z7qG0; Mon,  9 Dec 2024 08:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0898780AC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0898780AC7;
	Mon,  9 Dec 2024 08:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58598ED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE2CD80A85
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w4MvJEmVp34 for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BAC180A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAC180A7E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BAC180A7E
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A7C820002;
 Mon,  9 Dec 2024 08:27:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ74-00CnRI-2e;
 Mon, 09 Dec 2024 09:27:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:13 +0100
Message-Id: <20241209082722.3049825-15-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 15/23] package/tcf-agent: fix 'will not' and
 'unmodified' typos
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcf-agent/tcf-agent.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index cc998d82d6..e90334c783 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -15,7 +15,7 @@ TCF_AGENT_DEPENDENCIES = util-linux
 TCF_AGENT_SUBDIR = agent
 
 # there is not much purpose for the shared lib,
-# if wont be used (unmodifed) outside the tcf-agent application
+# it will not be used (unmodified) outside the tcf-agent application
 TCF_AGENT_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
