Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E4EC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34395404C4;
	Wed,  3 Aug 2022 21:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34395404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53GfGtdFj7uu; Wed,  3 Aug 2022 21:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4703E40438;
	Wed,  3 Aug 2022 21:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4703E40438
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99E9E1BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63518401DF
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63518401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztozw87Y_-pk for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:22:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F171740113
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F171740113
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:22:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6397660003;
 Wed,  3 Aug 2022 21:22:22 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:22:21 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220803232221.691911fe@windsurf>
In-Reply-To: <20220729211755.GE1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-2-joel@jms.id.au>
 <20220729211755.GE1554632@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659561744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hQyGoSe481c0CXzcv91SnrIsJmS5sDU7t7LkfO0A4w=;
 b=lCTzrNBN7iKDQodUtbgLHnakyuQDmN1p1xpdaNe1nBW9ShkfMKbW5sbFHPUoBdEN9vZKFG
 YB/fRega7aLFFF0u3C54tHXtKYOnGX+WOoAzuD5YJrvTVDPOjcOytp0f1Cupqw7ICfjuFe
 M0KlgoXfOZulTuCXpaegXkQKdLhv1rsRmJEI9fEgriwdxPK2qcDUTwfpV0INLpT4zTK2k8
 hgQzQGeSDbMja/ck0oFloHD/ui2PzhKwNAdccf2EpWovb/sKhqte4BRRur13ZmhE2mcM9m
 1ZGJzPQwec+tpJHjv1tFrWbq3njiLlFBKLaF8wohrHdCSkKNdkg8ALcZKNL1JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lCTzrNBN
Subject: Re: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU
 type
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
 Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 29 Jul 2022 23:17:55 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I don't understand this change. Currently we have:
> 
>  1. If BR2_POWERPC_CPU_HAS_SPE=y:
>     BR2_powerpc_CLASSIC is not selectable
>     BR2_powerpc_SPE is the only choice
> 
>   2. if BR2_POWERPC_CPU_HAS_SPE is not set:
>     BR2_powerpc_CLASSIC is the only choice
>     BR2_powerpc_SPE is not selectable
> 
> This means that the choice was really nt a choice, because the value of
> HAS_SPE implies which option is settable or not.
> 
> With your change, the BR2_powerpc_CLASSIC will never be selectable at
> all, and BR2_powerpc_SPE will be forcibly set when
> BR2_POWERPC_CPU_HAS_SPE=y
> 
> So we should just drop the choice altogether, and use the SPE ABI when
> the CPu has SPE.

I agree with your analysis here. I would like to go one step further:
SPE is only used by two PowerPC cores:

config BR2_powerpc_8540
        bool "8540 / e500v1"
        depends on !BR2_ARCH_IS_64
        select BR2_POWERPC_CPU_HAS_SPE
config BR2_powerpc_8548
        bool "8548 / e500v2"
        depends on !BR2_ARCH_IS_64
        select BR2_POWERPC_CPU_HAS_SPE

and SPE is no longer supported by upstream GCC. For now, we have kept
GCC 8.x around just to support this SPE ABI, but it is clearly not a
future proof solution.

Can we drop support for SPE entirely?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
