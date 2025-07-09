Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC650C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 10:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F53881F32;
	Wed,  9 Jul 2025 10:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKC24JZ79RKZ; Wed,  9 Jul 2025 10:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DCC081CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DCC081CE7;
	Wed,  9 Jul 2025 10:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D75512E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3386D608C2
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2sePJ-O_akd for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 10:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E16E96075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16E96075B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E16E96075B
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 10:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 541CF1FCF0;
 Wed,  9 Jul 2025 10:17:10 +0000 (UTC)
Date: Wed, 9 Jul 2025 12:16:46 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20250709121646.761ed714@booty>
In-Reply-To: <20250618145857.1206836-1-giulio.benetti@benettiengineering.com>
References: <20250618145857.1206836-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiueffveehgeekgfejleekkefhleehtdeikeetvdehieduveekuefhgeeliedufeenucffohhmrghinheplhifnhdrnhgvthdpghhithhhuhgsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752056230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K08ZUMDZQZlDdPG89fBuej/givJUHxeUvhMeBkzwCv0=;
 b=HKSxDhVfvUPf7YSSgoYlw29Pur4PM045B1peCU6Rtf54dlNIaUj5GqJuj86LlY0+wWf5l2
 a8owgO3BciBGikJtPlsV3TSuniB8T1okix2SDc+SguvPldEg+fsoUq/2qhXmi8jtWB58cU
 2koDOWPHcC3CemZpVmdBBHmZ+BWEyF4/WH3/yM8uhjM01CoXQ3muNGeSSD6Yzf5mt2AedA
 6gO/3U6A/OYTw5yg2KOFZ6XHAuayn7KUyIMYyXuwDWYSRIyQVV42sBIuX6n42ifIRgMamC
 luAH+kfC+xHyl+lMK/m/MsZqkfHzoU3ruwsbjQxyN7+nYmdUB8lT1hUtJMUGqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HKSxDhVf
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: move upstream to Benetti
 Engineering Github to fix Linux 6.15 build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed, 18 Jun 2025 16:58:57 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Benetti Engineering just took over Larry Finger(lwfinger)'s repository
> rtl8188eu since Larry unfortunately passed away[0](RIP) and there are
> pending PRs that will never be checked as stated here[1]. So basically move
> github user to benetti-engineering-sas and update version with latest that
> fixes build failure with Linux version 6.15. And let's drop local patches
> that are now upstreamed as well. Let's also drop obsolete Config.in
> informations since as stated here[2]: "This driver is under development
> and has a limited feature set. In particular it does not yet support 40MHz
> channels and power management". At the same time drop other suggestions
> like enabling CONFIG_WIRELESS_EXT or "this package needs a firmware loading
> mechanism to load the binary blob for the chip to work" since they are now
> part of the package. And of course let's update package's URL due to the
> moving.
> 
> [0]: https://lwn.net/Articles/979419/
> [1]: https://github.com/lwfinger/rtl8188eu/pull/464
> 
> Fixes:
> https://autobuild.buildroot.org/results/d59537da8eb27d737718885dc81ec257a2791455/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> NOTE: Luca Ceresoli, do you want to remain listed in the DEVELOPERS file as
> maintainer of this driver?

I'm not using this package since ages and you are clearly maintaining
carefully, so I think I can remove myself.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
