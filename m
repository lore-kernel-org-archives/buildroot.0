Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB66C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D84D80E98;
	Sat, 17 May 2025 16:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3E7G8ZhuvBXw; Sat, 17 May 2025 16:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0AB812D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0AB812D4;
	Sat, 17 May 2025 16:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54BD4E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45501608B9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMXuCgGChDWo for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C2EB60662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C2EB60662
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C2EB60662
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:34:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7040043A3E;
 Sat, 17 May 2025 16:34:24 +0000 (UTC)
Date: Sat, 17 May 2025 18:34:23 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250517183423.07951665@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkohfogggtgfesthejfedtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeetffekudffvddtgedutdevfeetleekffffueffheevhefgteejfeeuhedtjeenucffohhmrghinhepuggvsghirghnrdhorhhgpdgvgihimhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepnhhvugesnhhishhtrdhgohhvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747499664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ePoEcSDgDs6Mrh0zPexdMnX20CVpMJagJfk1vQb8Q8Y=;
 b=oghYqnmfyXAuHvUKqm5vB/GJcwpRvp0cqloRkntgS1cbVvvGc+bkvvMtepx12ManTfb7pH
 NuitxelrNHP0RHTWx8l3ObX/ent1p0g1y8UHRPKSfkqJ4mJ5QSSwOej31p/gsLuTwYj8n0
 pGeRPBxc/fU87IP5eRYkX0azlRXf67xzcXMbQPT2/caBqcuzdhh+AWi0TlYdnrS/hVaBj8
 KglBcbBzF02Jtc77qnpFODHTDsh1F1M37XNycxoJYzMK2q5nuUJvHrWidVpisDqHZzoh1O
 YEm/ncUaO3ryr+T3aMdF+cl6aEpG40+OeDMm4peoKmYnQ4J2/mBxp9G17G6P1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oghYqnmf
Subject: [Buildroot] CVE-2022-3559 version range fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The NVD database entry for CVE-2022-3559 indicates that "unknown"
versions of exim is affected, with a "-" in the CPE version field:

  cpe:2.3:a:exim:exim:-:*:*:*:*:*:*:*

However, the Debian Security Tracker at
https://security-tracker.debian.org/tracker/CVE-2022-3559 gives us some
details on which commits fix the issue:

https://git.exim.org/exim.git/commit/4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2 (exim-4.97-RC0)
Important follow-up fixes:
https://git.exim.org/exim.git/commit/d8ecc7bf97934a1e2244788c610c958cacd740bd (exim-4.97-RC0)
https://git.exim.org/exim.git/commit/158dff9936e36a2d31d037d3988b9353458d6471 (exim-4.97-RC0)
https://git.exim.org/exim.git/commit/32da6327e434e986a18b75a84f2d8c687ba14619 (exim-4.97-RC0)

So while we cannot identify easily when the vulnerability was
introduced, we can for sure say it was fixed in exim 4.97.

Would it be possible to update your CVE entry to indicate that the
issue only exists up to (excluding) exim 4.97 ?

Thanks in advance!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
