Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20512CA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A713A614CC;
	Fri, 29 Aug 2025 07:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-v829KbI4Sg; Fri, 29 Aug 2025 07:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFBF2614DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFBF2614DD;
	Fri, 29 Aug 2025 07:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B82DB69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92F4E40242
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRTohNVGPdHF for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CB8540E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB8540E01
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CB8540E01
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99EF2439C4;
 Fri, 29 Aug 2025 07:12:40 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:12:38 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829091238.0a71da92@booty>
In-Reply-To: <20250826072652.1581813-1-neal.frager@amd.com>
References: <20250826072652.1581813-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756451561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfAjztmUYYTHL9J5tYKkGf7Z2g68PZinOJUgwPnN5fc=;
 b=PETGyYrkFzmGMgX8FPhR87dOysohHvoLv6DkhdqasN6T7HJex7FXLhWQsCgCqM0kElBMPj
 tGgYXK011oe2pAYTcef9S2daIWEj74cfpIEtFTRWu6rZxrEURIbJOs1K7fzM0VcDPutPaO
 LAooMUk8HP5SIB+j3B668TeuSTrLaIG4Ul2qQikgP6FGbvHNmbTf8qR7tGJ3h1t0f+cPaJ
 +3N3Uj7FEtObZuhMwx2j3U2q72VLQfos0YySIpBwJgokbsPpHI56t3VbW6M/de7MTMzC16
 CArK85mzqWNVfCmqQC/HByMLplLW0w8rnpiz/Wnoai/44c6jtNNyBR2bEKUJrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PETGyYrk
Subject: Re: [Buildroot] [PATCH v1 1/2] board/zynqmp: increase vfat
 partition to 64M
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Aug 2025 08:26:51 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Now that the qspi.bin file is included for zynqmp images, the 32M vfat
> partition is getting dangerously close to being full.
> 
> In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
> default Linux kernel Image file for zynqmp products is increasing from 23.4M
> to 26.9M. This is leaving less than 1M of free space in the vfat partition
> meaning users may unknowingly exceed the 32M size by just adding Linux kernel
> configs.
> 
> To avoid potential problems, this patch doubles the size of the vfat partition
> to 64M, which should be plenty of space for any configuration.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
