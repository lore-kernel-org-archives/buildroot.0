Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FE1C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C56B583330;
	Wed,  5 Feb 2025 08:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0nBQOgjclbH; Wed,  5 Feb 2025 08:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8FD883396
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FD883396;
	Wed,  5 Feb 2025 08:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A760412F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9677D60849
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5pVw9PXxuoI for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BC83606AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC83606AE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BC83606AE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:11:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C008442DE;
 Wed,  5 Feb 2025 08:11:13 +0000 (UTC)
Date: Wed, 5 Feb 2025 09:11:13 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20250205091113.425c8c8b@windsurf>
In-Reply-To: <CAEyMn7anXmCe7QAWnJDVsoYpMinb-=RxQMAQtHUuKjgGMQyr0Q@mail.gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
 <20250114072947.284965-3-heiko.thiery@gmail.com>
 <20250203234100.6c0a6835@windsurf>
 <CAEyMn7anXmCe7QAWnJDVsoYpMinb-=RxQMAQtHUuKjgGMQyr0Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehhvghikhhordhthhhivghrhiesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepjhgrnhdrkhhunhgurhgrthestggvshhnv
 ghtrdgtii
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738743074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FCYiQ9/4wF44CLTLF/ge9nbKGOgxBrOGLepGjtOOxo=;
 b=I79Q45qg0jSZ/I+jPwHxkmy1yFeB0w27Ggy6ZtEVoNwKCY/p0hVqcBjv9rks5eErVTVHnO
 usW29/nCDQOUhDlrmvYAwAVMjEadNplBNJ240EpYCpIygDhkd1Pee+hgtlocRVmihFXa5l
 lBXOSDiZNww4F+NmFZ9ahx0Igr8NdAzCDlm+be3+XWEl7ywlrZaBeHnxAtfSnHXku/bogD
 c56JxRscsq1WQXO1mqjm2ecJ4i0LOoPOwze4V+ozpY//BLWSwOBVvj0YV7wuKLG1/DwMrT
 1zxjhiIDIZVP+7/VNPNVvZeuL/yQaDKCbywnrXDGwovEwmuJmFNpgX9p/unG0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I79Q45qg
Subject: Re: [Buildroot] [PATCH v5 2/9] package/libnetconf2: bump version to
 3.5.5
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

On Wed, 5 Feb 2025 07:49:50 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I reported that to upstream libnetconf2. It is already fixed and I
> will add the patch to the iteration. When updating next time it should
> already be included.
> 
> see: https://github.com/CESNET/libnetconf2/commit/1ca2f07fe4f638af4cd30e7b18ee17a8e13919bd

Nice!

> > However, as that's tricky, I think we could also accept a sub-option in
> > libnetconf2/Config.in:
> >
> > config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
> >         bool "SSH/TLS support"
> >         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
> >         select BR2_PACKAGE_LIBCURL
> >         select BR2_PACKAGE_LIBSSH  
> 
> When using the sub-option then we can use
> "ifeq ($(BR2_PACKAGE_LIBNETCONF2_SSH_TLS),y)"
> instead of
> "ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_PACKAGE_MBEDTLS):$(BR2_PACKAGE_LIBSSH)$(BR2_PACKAGE_LIBCURL),y:yy)"
> for the check in libnetconf2.mk..

Absolutely, yes.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
