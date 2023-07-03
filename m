Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52090C001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2C460D78;
	Mon,  3 Jul 2023 18:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2C460D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xmznis6XK90u; Mon,  3 Jul 2023 18:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4929560BCC;
	Mon,  3 Jul 2023 18:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4929560BCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 221111BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED9AB4098F
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED9AB4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2POzyjhfXNYQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA734098A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AA734098A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:55:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 300212003F6;
 Mon,  3 Jul 2023 20:55:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 20:55:32 +0200
Date: Mon, 3 Jul 2023 20:55:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20230703185532.GC2510@scaer>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
 <20230629053130.3976-2-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629053130.3976-2-jeanmichel.hautbois@yoseli.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688410539;
 bh=MAibJM0CYrHNNs7Bi+QDL+w/hv3p4AuvU1lIBP8ydbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mb3KywZ5ICKX7liKtY0mYMa9vh/h4fZJJ9FP/cswqPmeAWWH1wrTM4SvcBbKIVXPC
 hy7OPe/32M0Yr9nx57RHjyG4bHsKL1u5Mc7XTRNw4X/lx+EIryP5siVa/f5xE2Xvb7
 xg7VuaUOPumdP0zW8UHi1tPg6EKulxWCAVaDvpxxQ1mXpsbDrlXUmSOfopi11hfKxn
 cd/66lb/VG2tZEZRehOyJMe1aFH3l4V0ImDO+ByW119Jqf3/Nav/uERi8qyJ359BXq
 ceGt+uVbH84l3tnQ5KaIdDgtn0U9iYmgPSFjjbkmm8KfFg/cVBZrxSzygoWih9oWo1
 nt9Eecv3YjI2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mb3KywZ5
Subject: Re: [Buildroot] [PATCH 1/3] arch: add support for mcf54418 Colfdire
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jean-Michel, All,

On 2023-06-29 07:31 +0200, Jean-Michel Hautbois spake thusly:
> The m68k family ony has one Coldfire variant, namely the 5208. Add the
> support for the MCF54418 CPU in the configuration file.

As your cover-letter said, eda11417beaf (m68k: remove
BR2_GCC_TARGET_ARCH), setting it breaks use of external toolchains.

Granted, the commit log was not very expansive in why it did break them
which required dropping setting m68k/cf.

However, it did state that the m68k/cf defconfigs where working
perfectly well without it.

So, your commit log should explain how/why it is safe to re-introduce
BR2_GCC_TARGET_ARCH. I see you only set ig for this new CPU variant, so
maybe that's enough of a reason.

Still, it'd be nice to have it explained in plain letters.

Also, it'd be nice if you could try with an external toolchain, and
explain that in the commit log. If you do not have an external toolchain
available, you can generate one with Buildroot, and re-use it as an
external toolchain.

Regards,
Yann E. MORIN.

> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  arch/Config.in.m68k | 9 +++++++++
>  toolchain/Config.in | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
> index 9fd22aaf1e..6aa409b272 100644
> --- a/arch/Config.in.m68k
> +++ b/arch/Config.in.m68k
> @@ -33,11 +33,20 @@ config BR2_m68k_cf5208
>  	select BR2_m68k_cf
>  	select BR2_SOFT_FLOAT
>  
> +config BR2_m68k_cf54418
> +	bool "54418"
> +	select BR2_m68k_cf
> +	select BR2_USE_MMU
> +	select BR2_SOFT_FLOAT
>  endchoice
>  
>  config BR2_GCC_TARGET_CPU
>  	default "68040"		if BR2_m68k_68040
>  	default "5208"		if BR2_m68k_cf5208
> +	default "54455"		if BR2_m68k_cf54418
> +
> +config BR2_GCC_TARGET_ARCH
> +	default "cf"            if BR2_m68k_cf54418
>  
>  config BR2_READELF_ARCH_NAME
>  	default "MC68000"
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index ff0eb93017..ec2185cb39 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -95,6 +95,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_ARM_CPU_ARMV5
>  	depends on !BR2_sparc_v8
>  	depends on !BR2_m68k_cf5208
> +	depends on !BR2_m68k_cf54418
>  
>  # GCC uses thunk functions to adjust the 'this' pointer when calling
>  # C++ member functions in classes derived with multiple inheritance.
> -- 
> 2.39.2
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
