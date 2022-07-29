Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEBFC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0A660B63;
	Fri, 29 Jul 2022 21:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0A660B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVx2_hWnFkXr; Fri, 29 Jul 2022 21:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788BD60B10;
	Fri, 29 Jul 2022 21:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788BD60B10
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A46C1BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1560940566
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1560940566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8c-lDof2B0Yb for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197D44038B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 197D44038B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:43:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 00D5513F86F;
 Fri, 29 Jul 2022 23:42:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:42:59 +0200
Date: Fri, 29 Jul 2022 23:42:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220729214259.GJ1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-6-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-6-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659130987;
 bh=Cwfvq9WK1MdxYniyXIEmTExcbkYdF2BjupmomTRQNCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWEqp0GV+Aivmi/6r8Yb0OpbjSjsG+UF4gEk3aojHE3Vo5juL6GqCfXDiUxD/qDYD
 XDdQcBqx2RBOF6aCgDjlGxaowyIfQ2hMWHzBE6ikL+IigaDen4Ss5NOuhG3sdSMw2T
 Og4AQndtEnHyZPXHueF8l4vPFxEfp3PQY8HRiSam4BxnzB05c9m8RVUUE66iyM5A48
 MFZyxU/lVxAX9uGdiztX2L7qT5JMX0903r8BjPtJAtuvIhQisJyiDgIZ/gq37kYXFt
 ssoB1XqRK8mWeQPMfUcBb/sZ4by8zB+NJhAnGWzlj4dGgmTNfnZvq67YNQY+mrvXab
 NWhnFGY27UF0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QWEqp0GV
Subject: Re: [Buildroot] [PATCH 5/9] arch/powerpc: Add Power9 CPU type
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-07-29 09:39 +0930, Joel Stanley spake thusly:
> The Power9 CPU was released by IBM in 2016. It is a 64-bit CPU
> implementing ISA v3.0. It runs in big and little endian modes, and
> supports VSX and AltiVec.
> 
> Power9 is supported as of GCC 6.1 and Binutils 2.26.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.powerpc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 7c6ae84348e9..4c633c338d86 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -149,6 +149,12 @@ config BR2_powerpc_power8
>  	depends on BR2_ARCH_IS_64
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  	select BR2_POWERPC_CPU_HAS_VSX
> +config BR2_powerpc_power9
> +	bool "power9"
> +	depends on BR2_ARCH_IS_64
> +	select BR2_POWERPC_CPU_HAS_ALTIVEC
> +	select BR2_POWERPC_CPU_HAS_VSX
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  endchoice
>  
>  if BR2_POWERPC_CPU_HAS_SPE
> @@ -228,6 +234,7 @@ config BR2_GCC_TARGET_CPU
>  	default "power6"	if BR2_powerpc_power6
>  	default "power7"	if BR2_powerpc_power7
>  	default "power8"	if BR2_powerpc_power8
> +	default "power9"	if BR2_powerpc_power9
>  	default "powerpc64"	if BR2_generic_powerpc64
>  	default "powerpc"	if BR2_generic_powerpc
>  
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
