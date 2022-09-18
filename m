Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0ABC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88B6941B75;
	Sun, 18 Sep 2022 12:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B6941B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMT-4NaONsUY; Sun, 18 Sep 2022 12:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD824097E;
	Sun, 18 Sep 2022 12:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD824097E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9921BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB58D84036
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB58D84036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBav-M4NLzOm for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB7D8402E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AB7D8402E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:43:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 21EE213F8CC;
 Sun, 18 Sep 2022 14:43:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 14:43:12 +0200
Date: Sun, 18 Sep 2022 14:43:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220918124312.GE1419013@scaer>
References: <20220918103248.31667-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918103248.31667-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663504995;
 bh=rugpPCegvIJVy6i0OD+QXUef+e2RGFIKLOq4dCao3Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVzbO0XVNdpZUX6ixXGwQgoS15vuWfo6a9F10J+FLVcoskVS+QSrjsk7tE74hStiS
 aGxcoKvMvDzhzoVi/GsQsE95AalX4+95b9QoWufQa0FGnoSjSQX7V8uHZR9WTJks2E
 kXwlT9iHoZGnmZaV4oL+8ySKKBTkYLOxY9tGZ9k7isn+LOxfOaZtxZEDkPl3bcl6Lp
 JFfghDWJHFHznCxJQ72e0FWYKJuIXb8OKjsd6iCL8jitCfqoNmj9zr5+K10nI1Vecm
 3SEb7RnGTS56iqo6Eyz0ZjRJNXPl4x3AXTFPbWIhArGjBsJ4sqe9mWCbmvmnX1HNix
 Lqq1ldrdGSeog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HVzbO0XV
Subject: Re: [Buildroot] [PATCH] arch/Config.in.powerpc: change conditions
 to positive logic
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-18 12:32 +0200, Arnout Vandecappelle spake thusly:
> The conditions in the target CPU choice mostly use negative logic, i.e.
> "depends on !<something>". This makes it more difficult to understand
> exactly on which ARCH variants the CPU _is_ supported. Therefore, change
> all of the conditions to positive logic.
> 
> Since there is no little-endian variant of the 32-bit PowerPC, the
> conditions are:
> 
> !BR2_ARCH_IS_64 <==> BR2_powerpc
> !BR2_powerpc64le <==> BR2_powerpc || BR2_powerpc64
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.powerpc | 70 +++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 949995d037..52802f6693 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -16,118 +16,118 @@ choice
>  config BR2_generic_powerpc
>  	bool "generic"
>  	# No C library supports this variant on ppc64le
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_401
>  	bool "401"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_403
>  	bool "403"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_405
>  	bool "405"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_405fp
>  	bool "405 with FPU"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_440
>  	bool "440"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_440fp
>  	bool "440 with FPU"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_464
>  	bool "464"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_464fp
>  	bool "464 with FPU"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_476
>  	bool "476"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_476fp
>  	bool "476 with FPU"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_505
>  	bool "505"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_602
>  	bool "602"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_603
>  	bool "603"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_603e
>  	bool "603e"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_604
>  	bool "604"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_604e
>  	bool "604e"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_620
>  	bool "620"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_630
>  	bool "630"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_740
>  	bool "740"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_7400
>  	bool "7400"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_7450
>  	bool "7450"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_750
>  	bool "750"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_821
>  	bool "821"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_823
>  	bool "823"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_860
>  	bool "860"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_970
>  	bool "970"
>  	depends on BR2_powerpc || BR2_powerpc64
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_8540
>  	bool "8540 / e500v1"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  	select BR2_POWERPC_CPU_HAS_SPE
>  config BR2_powerpc_8548
>  	bool "8548 / e500v2"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  	select BR2_POWERPC_CPU_HAS_SPE
>  config BR2_powerpc_e300c2
>  	bool "e300c2"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_e300c3
>  	bool "e300c3"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_e500mc
>  	bool "e500mc"
> -	depends on !BR2_ARCH_IS_64
> +	depends on BR2_powerpc
>  config BR2_powerpc_e5500
>  	bool "e5500"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_e6500
>  	bool "e6500"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  	select BR2_POWERPC_CPU_HAS_ALTIVEC
>  config BR2_powerpc_power4
>  	bool "power4"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_power5
>  	bool "power5"
> -	depends on !BR2_powerpc64le
> +	depends on BR2_powerpc || BR2_powerpc64
>  config BR2_powerpc_power6
>  	bool "power6"
>  	depends on BR2_powerpc || BR2_powerpc64
> -- 
> 2.37.3
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
