Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F189C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2866D81C40;
	Wed,  3 Aug 2022 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2866D81C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxPcag4H9R2L; Wed,  3 Aug 2022 21:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A4281B53;
	Wed,  3 Aug 2022 21:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A4281B53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D29C01BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC66340294
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC66340294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbn00r5pMowj for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:32:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEE74028C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEEE74028C
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:32:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22342240006;
 Wed,  3 Aug 2022 21:32:22 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:32:21 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220803233221.34e098da@windsurf>
In-Reply-To: <20220729000904.1295295-4-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659562344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeaLfFjMfYhV68QuJLeAVVqEX7N2k7zTmp2344DMzdA=;
 b=OHNUYjOqLCrNaeqHCWdu+9WVmHRuVvrXnGkIP04LjVjE64kGQA29gwTAn40lk4EUQxbjDO
 ebjI844fQyR9Ng8yxB7DcwcTNKmWZM2FT7OTNXStVaVhv3RRUJxkY6B7nILfTqsVKvUbrd
 6stgVnqSJ1tTxoQywlkCfpZnb4Xq7A87gaRIyek13zjUSen0DbTGspx3aSPxSvlx89QoF5
 ldvbBL/x8nIUvuhvJWV0QLa9UcNibpznK/tkc3PxnFY+RDVgkOXEM2Z92uvfEeXf0SObbh
 QCprhymjdOAxBeTYC2XU7vyzO81SOQ7t+C54nxI1FC3Sx2yOi3DkFOgGk9t9lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OHNUYjOq
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Can we try to use positive logic here? See below what I mean.

On Fri, 29 Jul 2022 09:38:58 +0930
Joel Stanley <joel@jms.id.au> wrote:

> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 8d392bfde814..7c6ae84348e9 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -71,11 +71,9 @@ config BR2_powerpc_604e
>  	depends on !BR2_ARCH_IS_64
>  config BR2_powerpc_620
>  	bool "620"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le

So powerpc_620 is usable as PowerPC 32-bit, or PowerPC 64-bit BE ? If
so, then:

	depends on BR2_powerpc || BR2_powerpc64

>  config BR2_powerpc_630
>  	bool "630"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le

Ditto.

>  config BR2_powerpc_740
>  	bool "740"
> @@ -102,6 +100,7 @@ config BR2_powerpc_860
>  	depends on !BR2_ARCH_IS_64

Ditto.

>  config BR2_powerpc_970
>  	bool "970"
> +	depends on !BR2_powerpc64le

Ditto.

>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_8540
>  	bool "8540 / e500v1"
> @@ -129,21 +128,25 @@ config BR2_powerpc_e6500
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_power4
>  	bool "power4"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
>  config BR2_powerpc_power5
>  	bool "power5"
> -	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

And here:

	depends on BR2_powerpc64

>  config BR2_powerpc_power6
>  	bool "power6"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

Ditto:

	depends on BR2_powerpc64

>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_power7
>  	bool "power7"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

Ditto:

	depends on BR2_powerpc64

>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  	select BR2_POWERPC_CPU_HAS_VSX
>  config BR2_powerpc_power8
>  	bool "power8"
> +	depends on BR2_ARCH_IS_64

And hgere:

	depends on BR2_powerpc64 || BR2_powerpc64le

It would be useful to do that in a consistent way for all PowerPC cores
in this choice, so that it is very clear for which of powerpc,
powerpc64 and powerpc64le each PowerPC core is valid.

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
