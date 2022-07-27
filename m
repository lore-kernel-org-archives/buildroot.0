Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975F0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE5881271;
	Wed, 27 Jul 2022 07:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE5881271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24ARSyB7ouQ2; Wed, 27 Jul 2022 07:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC7880C98;
	Wed, 27 Jul 2022 07:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC7880C98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1AC01BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA527403E9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA527403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VegZYY2pktzQ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC31401C5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC31401C5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:58:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EF2AE780516;
 Wed, 27 Jul 2022 09:58:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 09:58:42 +0200
Date: Wed, 27 Jul 2022 09:58:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220727075842.GC1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726163951.2111731-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658908725;
 bh=FML913jLf634rPSHR7e6ChNjkTmIxLZs7gWOJjaSIWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1Zai9Dbpw8tEPhXCRthtQqzRc8LNE0yaSXILsu5s5ok1wJUEvFcVNDJm4gHVQokf
 h1VyWRkzm4zJiUJuUQ2rKpzfU6djjaBllMwqyL949hA/NsITBbUVxxoo/8Y81tWnID
 1jkPNVEZvE9ePQPjKhoYb4Snj5W+X+qm7UEqMm5PJHBoVSp14lWG6IzhPjBZ2KaCx3
 vX1mt8cd8OinDVhravTGXd4zbhE91XrQ/oVbtz6x5zfc3sMI8Ms3F5dKG4gF9C7MZD
 4qG33E988UCJuKdXkujbeAhlpzClzaCYjqOpwVEhxtwv1a0m0mVy2e0h1whOv9nxLD
 zXXj+qjnirADg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G1Zai9Db
Subject: Re: [Buildroot] [PATCH v2 3/4] arch/Config.in: move the binary
 format selection further down
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

Thomas, All,

On 2022-07-26 18:39 +0200, Thomas Petazzoni via buildroot spake thusly:
> Right now the "Target options" menu looks like this:
> 
>  Target architecture (....)
>  ... options related to the binary format selection ...
>  ... options related to the architecture variant selection ...
> 
> This doesn't make much sense: the architecture variant selection
> should be just below the target architecture selection. With this
> commit, things will now be presented this way:
> 
>  Target architecture (....)
>  ... options related to the architecture variant selection ...
>  ... options related to the binary format selection ...
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in | 100 ++++++++++++++++++++++++-------------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 9135df9def..095036f1aa 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -371,56 +371,6 @@ config BR2_BINFMT_SUPPORTS_SHARED
>  config BR2_READELF_ARCH_NAME
>  	string
>  
> -# Set up target binary format
> -choice
> -	prompt "Target Binary Format"
> -	default BR2_BINFMT_ELF if BR2_USE_MMU
> -	default BR2_BINFMT_FLAT
> -
> -config BR2_BINFMT_ELF
> -	bool "ELF"
> -	depends on BR2_USE_MMU
> -	select BR2_BINFMT_SUPPORTS_SHARED
> -	help
> -	  ELF (Executable and Linkable Format) is a format for libraries
> -	  and executables used across different architectures and
> -	  operating systems.
> -
> -config BR2_BINFMT_FLAT
> -	bool "FLAT"
> -	depends on !BR2_USE_MMU
> -	help
> -	  FLAT binary is a relatively simple and lightweight executable
> -	  format based on the original a.out format. It is widely used
> -	  in environment where no MMU is available.
> -
> -endchoice
> -
> -# Set up flat binary type
> -choice
> -	prompt "FLAT Binary type"
> -	default BR2_BINFMT_FLAT_ONE
> -	depends on BR2_BINFMT_FLAT
> -
> -config BR2_BINFMT_FLAT_ONE
> -	bool "One memory region"
> -	help
> -	  All segments are linked into one memory region.
> -
> -config BR2_BINFMT_FLAT_SHARED
> -	bool "Shared binary"
> -	depends on BR2_m68k
> -	# Even though this really generates shared binaries, there is no libdl
> -	# and dlopen() cannot be used. So packages that require shared
> -	# libraries cannot be built. Therefore, we don't select
> -	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
> -	# Although this adds -static to the compilation, that's not a problem
> -	# because the -mid-shared-library option overrides it.
> -	help
> -	  Allow to load and link indiviual FLAT binaries at run time.
> -
> -endchoice
> -
>  if BR2_arcle || BR2_arceb
>  source "arch/Config.in.arc"
>  endif
> @@ -481,4 +431,54 @@ if BR2_xtensa
>  source "arch/Config.in.xtensa"
>  endif
>  
> +# Set up target binary format
> +choice
> +	prompt "Target Binary Format"
> +	default BR2_BINFMT_ELF if BR2_USE_MMU
> +	default BR2_BINFMT_FLAT
> +
> +config BR2_BINFMT_ELF
> +	bool "ELF"
> +	depends on BR2_USE_MMU
> +	select BR2_BINFMT_SUPPORTS_SHARED
> +	help
> +	  ELF (Executable and Linkable Format) is a format for libraries
> +	  and executables used across different architectures and
> +	  operating systems.
> +
> +config BR2_BINFMT_FLAT
> +	bool "FLAT"
> +	depends on !BR2_USE_MMU
> +	help
> +	  FLAT binary is a relatively simple and lightweight executable
> +	  format based on the original a.out format. It is widely used
> +	  in environment where no MMU is available.
> +
> +endchoice
> +
> +# Set up flat binary type
> +choice
> +	prompt "FLAT Binary type"
> +	default BR2_BINFMT_FLAT_ONE
> +	depends on BR2_BINFMT_FLAT
> +
> +config BR2_BINFMT_FLAT_ONE
> +	bool "One memory region"
> +	help
> +	  All segments are linked into one memory region.
> +
> +config BR2_BINFMT_FLAT_SHARED
> +	bool "Shared binary"
> +	depends on BR2_m68k
> +	# Even though this really generates shared binaries, there is no libdl
> +	# and dlopen() cannot be used. So packages that require shared
> +	# libraries cannot be built. Therefore, we don't select
> +	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
> +	# Although this adds -static to the compilation, that's not a problem
> +	# because the -mid-shared-library option overrides it.
> +	help
> +	  Allow to load and link indiviual FLAT binaries at run time.
> +
> +endchoice
> +
>  endmenu # Target options
> -- 
> 2.37.1
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
