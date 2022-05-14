Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E38C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C31812AB;
	Sat, 14 May 2022 19:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtuDX-AbPwG8; Sat, 14 May 2022 19:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E73E81285;
	Sat, 14 May 2022 19:02:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3952B1BF584
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 19:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25784408E4
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 19:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vX5Efy_jsECM for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 19:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8464408D9
 for <buildroot@buildroot.org>; Sat, 14 May 2022 19:02:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 80AF85FF33;
 Sat, 14 May 2022 21:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652554939;
 bh=s63khDDfi0YkPM0adYFTN75XNvK/tp6+/fooFlxD/iE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kXzEpGYrYTV+FD8BavGT04BkFDjVQqGLDX+oXubFm+jnuGfcza95QEhvz4Uxvpvap
 Rrn+in4SbSUqJhGE4jWsa7U0phBVAtn7g04OWPXBxoLCgvUTtMVqCbnQP5dcHNC6D3
 vT9LbG+oKkgPTK+2Sped94gbUz+rKML/yiUdkaWu/iHTivUIa/TRtq16hIkB5NfJQt
 SDLXKPXJTcvENcnK6fK1CZPpRJ7Lhdx2L6w+z/l7TO8o9e/qzx8vnx/lDtgDTR79AA
 AbwA5mX64cA1KbkR11s4K76eirMoN7ZIdplNUm0de4oZzkGMmZpBqU0thBTSe9m2dF
 5oj42gkj883jg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 21:02:13 +0200
Date: Sat, 14 May 2022 21:02:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220514190213.GB1597494@scaer>
References: <20220514155301.4901-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514155301.4901-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot: glibc
 can't be built with Optimize for fast
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

Fabrice, All,

On 2022-05-14 17:53 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> In file included from <command-line>:
> ./../include/libc-symbols.h:82:3: error: #error "glibc must not be compiled with -ffast-math"
>    82 | # error "glibc must not be compiled with -ffast-math"
>       |   ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 8d9cf4cc68..8838cc48ff 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -60,6 +60,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
>  	depends on !BR2_powerpc_SPE
>  	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> +	depends on !BR2_OPTIMIZE_FAST

I think in this case, we stil lwant to be able to select glibc, but we
would override with -O2  (or -O3 ?) in glibc.mk

Ditto for your second patch, for which we'd use -O1 maybe.

We already for -O2 for nios2 for example.

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  This option selects glibc as the C library for the
> @@ -81,6 +82,9 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
>  	depends on BR2_MIPS_NAN_2008
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>  
> +comment "glibc can't be built with Optimize for fast"
> +	depends on BR2_OPTIMIZE_FAST
> +
>  config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  	bool "musl"
>  	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
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
