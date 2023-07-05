Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096C0EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 05:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CE0409A1;
	Wed,  5 Jul 2023 05:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CE0409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bi_VNdjYjAO1; Wed,  5 Jul 2023 05:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF6B4099B;
	Wed,  5 Jul 2023 05:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF6B4099B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE9B01BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E14360A70
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E14360A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OltWEsFTtOcZ for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 05:30:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA82860A62
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA82860A62
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 05:30:17 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id A46B31C0006;
 Wed,  5 Jul 2023 05:30:14 +0000 (UTC)
Message-ID: <0bc3ae44-0a96-4a72-ee9a-8620cb474c3d@yoseli.org>
Date: Wed, 5 Jul 2023 07:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, fr
To: Nick Betteridge <lists.nick.betteridge@gmail.com>, buildroot@buildroot.org
References: <be0548f0-8762-0e55-6441-02897a7b22df@gmail.com>
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <be0548f0-8762-0e55-6441-02897a7b22df@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688535015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NIoqvT7DlYZ5bKlEf5y/p/3HdiDDC9GxbewURu/1rE=;
 b=Koj6QJYdjtpq5w1wy1tLzcLcuqZzre14GBZijOUFymlnL7fzeavShDmX30fRG3w4Fzp91M
 /YRKE2Hpoh+EgyHxDd0+Funuq8mN1FAmBZ4A/yY8i8b9gai7z4J+b0XCaSoOB/aH2uKFLw
 fETDUz2oOiOYfD+X1kz5cvaOJzYtoVLI0h1cRmEIjqqjtIdAU6f9pKH3JYmy/PuE6jI4Tx
 E+0Xa4Z5e2tYh0+gUhteiolx384UWOS5Eu99Muc35ltkLSJDsEnHqGn3dXUDp8Hmu2djpG
 sAWQtcibDKSoGafc8nmgUQvj5B2Ytr18AyOsFgQL0Fr227fKcg1xeuw+XYNOCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Koj6QJYd
Subject: Re: [Buildroot] Linux kernel make target
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick,

On 05/07/2023 07:21, Nick Betteridge wrote:
> Hi,
> 
> I'm unable to find an option in menuconfig which allows me to specify a 
> kernel target for 'make' - is this possible? In other words, I can see 
> how to specify the kernel source location, the defconfig etc, but I also 
> need to specify the target - in my case it's 'make nanopi6-images'.

If this target is a defconfig, you can use BR2_LINUX_KERNEL_DEFCONFIG.
But I think this is a custom target in a non-upstream kernel.
In this case, I don't think you will be able to do it directly and will 
probably need to modify linux/Config.in and linux/linux.mk files.

I would suggest you avoid doing that as this is not upstream, though.

Can you be a bit more precise about what this target does ? Is it a 
post-install target somehow ? I don't know nanopi6 nor the kernel you 
are using ;-).

Regards,
JM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
