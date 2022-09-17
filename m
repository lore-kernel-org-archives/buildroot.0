Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A79EC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F7384316;
	Sat, 17 Sep 2022 12:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F7384316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0x82dbGS2mml; Sat, 17 Sep 2022 12:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE0E83F7D;
	Sat, 17 Sep 2022 12:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE0E83F7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8E151BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B0883F75
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94B0883F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LVKxEG_6HWo for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:36:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B3783F7D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89B3783F7D
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:36:10 +0000 (UTC)
Received: from booty.lan (unknown [80.233.62.104])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CADF5240007;
 Sat, 17 Sep 2022 12:36:08 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:36:02 +0200
Message-Id: <20220917123602.961826-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
References: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663418169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4Jg2OxcQ5k/DmjCF9In70qyKoHgO9PskSAk6/IKvrM=;
 b=HL7HeBf2Uxi9g5t56fM0w1kSIrqkeDwaFhN/ni6Lt9cm6OxqsHIZ2kRMvUYLcSI4ZeKMH0
 KeQ8arKsUNWGfS/B7cnIDzIvJxEVjcbQPJP6PdXQMK4THrhllQQuWZk4V88Bq/w8p1WcgZ
 wHN93UTYqrJmDIf1kxhmjDpdHgG4I7HPA9/Oadwv/DBMXbt4GAWRAozaTnn+b7stqUk4dC
 sCZHsqBecCA2PASTBozol9dvWdfibHy53zg3GCJ9c+WIh7bRnmteVreGmOfd6x4CiYFGk2
 pMzUZq0mJuk6HewWzkaev0StEsi+ekx0TW6DRuLqXhlm0Ps+QOtyGnraG7aqsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HL7HeBf2
Subject: [Buildroot] [PATCH 4/4] package/agentpp: fix broken URL in help text
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/agentpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 8c6b11d644e4..cc7537519aba 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_AGENTPP
 
 	  SNMPv3 support is enabled if SNMP++ enables it.
 
-	  http://www.agentpp.com/agentpp3_5/agentpp3_5.html
+	  https://www.agentpp.com/api/cpp/agent_pp.html
 
 comment "agent++ needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
