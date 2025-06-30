Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D524C8302B
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 15:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D7D8472D;
	Mon, 30 Jun 2025 15:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4qtzu92I4pS; Mon, 30 Jun 2025 15:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4618474C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C4618474C;
	Mon, 30 Jun 2025 15:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1FC9223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B7F40AD9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqcfs0s0cMdU for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 15:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC81840AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC81840AD8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC81840AD8
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 15:14:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E6BA44202;
 Mon, 30 Jun 2025 15:14:13 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 30 Jun 2025 17:14:10 +0200
Message-ID: <20250630151412.341903-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
References: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751296453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7jsbpRH6vlEF5Q9alYOqSm6QrnZ1KsuLjVJ41PAksM=;
 b=HGFE93PoMu2KyTxEO0T94qI0pN6RrxVt5OSfUYzzINO+FfuZaexb6WdzCnNfTGv+X4pm+9
 NohbIvKPkHqIsB9NF1y9rimU++gydp30nQuwxkdgrBwyLIOxNJQ3WMnjKBX9QUmWAQ3fY2
 2jX5muE66YkSchEVJjjQatt6wyP1yp08mjsTioETGRitNwoORVCmdnE99+QNU9uslq1gSu
 wPgyqXgI/qBG9JGjWIo0VMzVuw4e8L7ZbzItA5TlWDlEsGLwiEf3/sQcpwnkI6XxQwugX2
 bvX4uQTXreWaXOF/yd7CITxOKOdqzxmRxRM4pp4E80ikuooYwSK8nQCtCdkXVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HGFE93Po
Subject: [Buildroot] [PATCH v2 1/2] package/elfutils: Show a comment
 explaining that elfutils progs need glibc
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

The elfutils programs require Glibc to be used as the C library. Show a
comment when this libc isn't used in the toolchain.

Suggested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/elfutils/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index c355048c6d..9608ef4905 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -28,4 +28,7 @@ config BR2_PACKAGE_ELFUTILS_PROGS
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
+comment "elfutils programs needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
