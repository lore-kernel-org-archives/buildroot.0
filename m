Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F2AC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E504053F;
	Fri, 29 Jul 2022 21:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E504053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJTuwl2HIOpr; Fri, 29 Jul 2022 21:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14D754038B;
	Fri, 29 Jul 2022 21:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D754038B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 526181BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 322ED4170A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322ED4170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7Im7Eymr8Ri for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36655416F6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36655416F6
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:25:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 02B5B13F8A2;
 Fri, 29 Jul 2022 23:25:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:25:49 +0200
Date: Fri, 29 Jul 2022 23:25:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220729212549.GF1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-3-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659129957;
 bh=RlVr1JubMA2EXm2YNnDqWxkVKY3E2WjdR5G2n4K31qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZSwmAjqSvb/nQrGwHnGYDONd/QMe4KrUWdDOBsqzWsplqnXNEXTlzJqJfAMSrPSF
 ytxwkobUnRPElMKEhtrVRYDpNK/lynrMiV6WWDvCqTgSSa4sHcL9TCAo9w+uwcIgus
 x4fcl7jFBhZvUllBuy6DJK6cWKUWbS9XDne7RGMLKxn6eYrANldFtTACMPXVef5x7m
 h5tAibZIhp6zDl0jr/3gW2wggPx/qWQqrSBqzOL5K/6Y9WVTIyfIwT3vAnRxioo4Fx
 BchpgU2V5MejnvdbVWgJ0xmPR3auKCfoSOm7yk/r1YsoZh9Uqxz9qzT6hyQxQaRewc
 AcJI7JEP8PYCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MZSwmAjq
Subject: Re: [Buildroot] [PATCH 2/9] arch/powerpc: Clarify generic CPUs
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

On 2022-07-29 09:38 +0930, Joel Stanley spake thusly:
> In the case where a specific CPU is not selected, set an appropriate
> gcc target for the architecture.

Sorry, I am not sure I understood this. Currently, there is always at
least one CPU variant that is available in the variant choice; it is
never empty.

So, how come we can have a situation where "a specific CPU is not
selected"?

> For clarity this introduces a BR2_generic_powerpc64 as a generic 64 bit
> CPU as this makes the it clearer when browsing menuconfig.
> 
> We can't have a generic ppc64le GCC, as attempting to configure glibc
> for powerpc64le fails:
> 
>  configure: error: ***  POWER8 or newer is required on powerpc64le.
>  __builtin_signbit is broken.  GCC 7.4 or newer is required to resolve
>  (PR83862). The compiler must support -mabi=ieeelongdouble and
>  -mlong-double-128 simultaneously.
> 
> Hence set Power8 as the default CPU for powerpc64le.

If the other CPUs are not valid for ppc64le, then they should not be
selectable, like is already dine e.g. for e5500 or e6500 (among others).
Currently, ppc64le allows:
    970
    power6
    power7
    power8

So, maybe all but power8 should be hidden?

Also, it looks like it should be a separate, previous patch in the
series.

Regards,
Yann E. MORIN.

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/Config.in.powerpc | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index ef0e85fec680..8d392bfde814 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -9,12 +9,17 @@ config BR2_POWERPC_CPU_HAS_SPE
>  
>  choice
>  	prompt "Target Architecture Variant"
> -	default BR2_generic_powerpc
> +	default BR2_generic_powerpc if !BR2_ARCH_IS_64
> +	default BR2_generic_powerpc64 if BR2_ARCH_IS_64
> +	default BR2_powerpc_power8 if BR2_powerpc64le
>  	help
>  	  Specific CPU variant to use
>  config BR2_generic_powerpc
> -	bool "generic"
> -	# No C library supports this variant on ppc64le
> +	bool "generic (32 bit)"
> +	depends on !BR2_ARCH_IS_64
> +config BR2_generic_powerpc64
> +	bool "generic (64 bit)"
> +	depends on BR2_ARCH_IS_64
>  	depends on !BR2_powerpc64le
>  config BR2_powerpc_401
>  	bool "401"
> @@ -220,6 +225,8 @@ config BR2_GCC_TARGET_CPU
>  	default "power6"	if BR2_powerpc_power6
>  	default "power7"	if BR2_powerpc_power7
>  	default "power8"	if BR2_powerpc_power8
> +	default "powerpc64"	if BR2_generic_powerpc64
> +	default "powerpc"	if BR2_generic_powerpc
>  
>  config BR2_READELF_ARCH_NAME
>  	default "PowerPC"	if BR2_powerpc
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
