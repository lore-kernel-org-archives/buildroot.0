Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D34DCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 21:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA45C61556;
	Sat, 16 Aug 2025 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaMOgvorJbva; Sat, 16 Aug 2025 21:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350E86155C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350E86155C;
	Sat, 16 Aug 2025 21:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE3B8197
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 943AE83F84
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usNcYtrrE88l for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 21:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9183083F7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9183083F7E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9183083F7E
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:07:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22B4644367;
 Sat, 16 Aug 2025 21:07:00 +0000 (UTC)
Date: Sat, 16 Aug 2025 23:06:59 +0200
To: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Florian Larysch <fl@n621.de>, Julien
 Olivain <ju.o@free.fr>
Message-ID: <20250816230659.2134186f@windsurf>
In-Reply-To: <20250811153257.3746260-1-yann.morin.1998@free.fr>
References: <20250811153257.3746260-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrhdprhgtphhtthhopegru
 ggrmhdrughushhkvghtthesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755378421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+IW8QbgaFwxEBHblIW0VnyEOu7X0AsuVOF6zghrSRE=;
 b=C1LhxCjDIFkE4NXso8jTTiKuw96xiahjv15w6tLdEYgCDv+NqovPme2/bnWAe2LzbDpLYC
 4Tcc+nhz7KRzEh9Putnv8+IcM8Q5dj6p7VrK/PP5RVKf2ozczWnNyeWAxZTdfEVeiR/R1V
 jrNSoJWfOqtS5sl/gOlIE9P+xMFFOVd8Hy0oxvqW3BDiVLSAJbWWB2fymlW6+x8cuoJAlb
 d5naiCPD1xZnwEyQrstLHiOSZgjQ0c6TFrJyEJVyBLAKu6KbS/N3tlyGb5zpK1nDwokvkQ
 m2BO7ED1q3rWnMdG1TqsAdsJy/IR7dAMM/2362Yg5uXwS45MA0sRjRxEdqfqbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C1LhxCjD
Subject: Re: [Buildroot] [PATCH] package/bash: fix build with gcc 15
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

Hello Yann,

Thanks for the patch!

On Mon, 11 Aug 2025 17:32:57 +0200
"Yann E. MORIN via buildroot" <buildroot@buildroot.org> wrote:

> Commit 6d09b25d08fe (package/bash: fix build with host GCC 15) did
> apply a workaround for when the host gcc is gcc-15 (or later), but
> missed the fact that the target compiler also exhibits build issues.
> 
> For the same reasons as explained in 6d09b25d08fe, don't try and fix
> those issues, but just paper over the problem by using an older C
> standard.
> 
> Fixes: b7882d024ae484c52473955fbbcbf3b5f0717c2f

This "Fixes" didn't make much sense. You're not really fixing a
previous commit here. Rather you're fixing an autobuilder issue, so
I've added a reference to the autobuilder issue being fixed instead.

> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
> +BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> +endif

Added a comment above this indicating that it can be dropped when
bumping to bash 5.3.

Applied to master with those fixes. Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
