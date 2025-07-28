Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFDC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E797740F30;
	Mon, 28 Jul 2025 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9oeDGo_rAaf; Mon, 28 Jul 2025 20:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED5240F33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED5240F33;
	Mon, 28 Jul 2025 20:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5973591D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4014740F30
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w37GCZaQyVoB for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAB6840F33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB6840F33
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAB6840F33
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:52:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B40D0442F4;
 Mon, 28 Jul 2025 20:52:06 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:52:05 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250728225205.2c22044b@windsurf>
In-Reply-To: <20250725184609.3794-1-fl@n621.de>
References: <20250725184609.3794-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeffvdetgfetudeffefhuedtudehtefgvedtuefhjefhheevjeejtddtfffhgfeinecuffhomhgrihhnpehrshgtrggurgdrshgvpdgrrhgthhhivhgvrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehflhesnheivddurdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WMvHYZPEP3TKDY0j+RH88s8xq19/BAat8e1hb98N5M=;
 b=XVo1Lqa83RaPgkEyVJ8+Za7VYMls/T8RigE1MG/FdBOqbiHScn0YfiiER3qwTF2DR1sp9V
 /ytG5nExY/nw4CsFM+IOleSzNJB9cVYMDPTXsdKlICsu4CRUwUpcKkLH1tqW+qh/aJmuQH
 fT2qsfsbFFlkzwD8h61nh0ADl609hEod9Y6Pn4MQMVgYcxXplTgDA5fMGcrj3zT/IvzgWN
 X6KE3Vq7n1EtlwE5VkrVET+x9A1W+gx9tSo9tkswieilyPtyNld+0ZcBV5ur8ZldBv1LtW
 KA7cq0xn1r9an6/3OTsTO18lO8yGbfPimIucUAVvFXpEhXDGZ+v2tsVRvg6oIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XVo1Lqa8
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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

Hello Florian,

On Fri, 25 Jul 2025 20:46:08 +0200
Florian Larysch <fl@n621.de> wrote:

> www.rscada.se has been offline for a long time, causing build failures.
> However, there is an official[1] GitHub repo. This also seems to be
> where new releases are happening rather than the old site.
> 
> Switch to git for fetching the source code. Unlike the tarball,
> the repo only ships partial autotools files (Makefile.in is missing, for
> example), so we need to do an autoreconf, which also requires a patch
> for modern Automake versions.
> 
> [1] https://web.archive.org/web/20250122102111/http://www.rscada.se/libmbus/index.php
> 
> Fixes: https://autobuild.buildroot.org/results/11d/11d9e371033f7cdd3b24a9c1feb85b6aa921f96a
> Signed-off-by: Florian Larysch <fl@n621.de>

Thanks a lot for the patch, which looks good. However, shouldn't we
also update the link in package/libmbus/Config.in?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
