Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C28DC77B7F
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE39660906;
	Mon, 23 Jun 2025 11:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J5oJ8c0AUra; Mon, 23 Jun 2025 11:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FA060724
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FA060724;
	Mon, 23 Jun 2025 11:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3877B154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 11:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A29A407C6
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 11:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0TqBbK9SOjA for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 11:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C24E407CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C24E407CB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C24E407CB
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 11:51:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AE6643913;
 Mon, 23 Jun 2025 11:51:04 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andreas Ziegler <br015@umbiko.net>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 23 Jun 2025 13:51:01 +0200
Message-ID: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdehueefuedtkeduleefvdefgfeiudevteevuefhgfffkeekheeuffeuhefhueenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegsrhdtudehsehumhgsihhkohdrnhgvthdprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750679465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d7CUOYLBu/lJAtZCKKJmS7Fepjv6ZeSwy22bjn+c72U=;
 b=Z1Zgn2cfXfWx40TT4cKhCJ0PWIBM5MGpJmu4cyqwM3zdp3PbEBmkHPdt3SUDXlUavRPNbb
 tYu+iPk/5h5mj3ZdzYN+XNOOGYJGccd0xtAXQ2HvHLbr8eHLvtSO+OdNJ7zlmeby1M8w9P
 1SbHSWGVpe1bpuKD9JNP8UchJDF9nC4YHSWUYuBo7MqC2ZzUv/c0deVe592XeojmJn7LuB
 DqlGrEDGDiHNhTlt1YDEB2EJozp88YFCdpNaEUsCLunGSbSJ0oGwOZz7vj6gRzOE/pCg5z
 2Ay57XvHS/0LMhOYsHRkC+JGIzZ8lL1e4WJI6itHL5//TjGSz8mcb9F2b+NVOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z1Zgn2cf
Subject: [Buildroot] [PATCH] package/linux-tools: rtla: Pass TARGET_LD to
 the make arguments
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Linux v6.8,  the rtla Makefile was rewritten :

  01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")

The new Makefile uses default linker values, so the host linker being used to
produce the final rtla binary.

This results in the following error :

ld: [...] trace.o: error adding symbols: file in wrong format

Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla cross-compilation.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/linux-tools/linux-tool-rtla.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
index 449371ddfe..d9bdcc3016 100644
--- a/package/linux-tools/linux-tool-rtla.mk.in
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -9,6 +9,7 @@ LINUX_TOOLS += rtla
 RTLA_DEPENDENCIES = host-pkgconf libtracefs
 RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 	CC=$(TARGET_CC) \
+	LD=$(TARGET_LD) \
 	EXTRA_CFLAGS="-D_GNU_SOURCE" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
