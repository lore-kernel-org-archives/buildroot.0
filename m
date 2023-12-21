Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E64C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E5B83926;
	Thu, 21 Dec 2023 08:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E5B83926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWkbC0r7Qdwh; Thu, 21 Dec 2023 08:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13570838B3;
	Thu, 21 Dec 2023 08:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13570838B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 167571BF4D5
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3F7043766
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F7043766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ontZTRPh2t2W for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 08:35:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96E354367D
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 08:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96E354367D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A13264000B;
 Thu, 21 Dec 2023 08:35:12 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:35:12 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231221093512.0130c521@windsurf>
In-Reply-To: <20231221001924.1356215-6-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
 <20231221001924.1356215-6-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703147712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+99zdooK4vm2XMvk6s00fnbqFT2PiO5vXIIIDNjeC8=;
 b=X9j9ShKBjNRkpY1UeXFfAHVZN7kSaRwluKwAVEdEEuemU1UaKbMaBZdOZ+a5pU9NNOYwUN
 mAKUVNix/2pkHZhiytLvmj8BuZA83ZKxJgYTJ4b/4u/YiZa6vPtuWbv2lwpxv2f1L608lu
 aPQc49aeuJZRcfzEtA9x1j3wLWip0BmiLJr8LYqHniEkM2b9Csdcf9qaB5pLq8dtwFMhnn
 C15BARKHP2Dq4w9iT1JAw/aX8K96msbuO25njUCSIjhK53GkyNeOWpF0hb0iBTruasN5dF
 h0xDWAwbWaZc7Pkt5xo9zfhK+pe6vTLuKJArjJZcKoVdYcecLXGVfI1qtVROuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X9j9ShKB
Subject: Re: [Buildroot] [PATCH v3 06/10] package/sway: enable
 default-wallpaper support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 20 Dec 2023 17:19:20 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> +if BR2_PACKAGE_SWAY
> +
> +config BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER
> +	bool "Install default wallpaper"
> +	select BR2_PACKAGE_SWAYBG

I don't have a hard feeling on this one, but why isn't this handled
like this:

ifeq ($(BR2_PACKAGE_SWAYBG),y)
SWAY_CONF_OPTS += -Ddefault-wallpaper=true
else
SWAY_CONF_OPTS += -Ddefault-wallpaper=false
endif

The swaybg package anyway has:

	default y if BR2_PACKAGE_SWAY

So users are not likely to miss it "by default".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
