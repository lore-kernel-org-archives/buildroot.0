Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE66C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069A381453;
	Sat, 31 Dec 2022 17:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 069A381453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxkVLLWm6wzK; Sat, 31 Dec 2022 17:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAD181451;
	Sat, 31 Dec 2022 17:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAD181451
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A050E1BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A66F403A9
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A66F403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBhi6dolfm9u for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:32:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE2040190
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DE2040190
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:32:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C3FF13F846;
 Sat, 31 Dec 2022 18:32:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 18:32:35 +0100
Date: Sat, 31 Dec 2022 18:32:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221231173235.GS2498764@scaer>
References: <20221206231034.48408-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221206231034.48408-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672507957;
 bh=mBqE8mZ/8gR0v81vP+XG9oQcD+MnWzjLOHYJART+dwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss8t++JHWBYd206gUX9vCCtVB9Ydac58D2MsFmeBQVaWMASOxs5oMWJMYTYQx3io4
 IrpXQimPWFD0aqipi9BRrM8mY4+Utch7T8wq3p/xPdZ+pEJCadgjWw4QXY7LwxHfAE
 moUfFhq9JHpf5AswhrJo8oX0XUQuSu5kwCCr1ehHoVA6cBMKPKFXOtDXYWozXvfoxm
 ivPpGHzQV7ic4OANbyL+5SFrl7foLlrBD14+4uKDXGLoyIak0BLihGsDHuzbnyyhPB
 +zBOXt/n2p9iwtco9wCW4I8ju7GOMHWq1GIBAcYqOts12sYnlrM/9mi2etkdSvH0Xm
 WUcrw98YgmFsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ss8t++JH
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: introduce _ARCH_SUPPORTS
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

Julien, All,

On 2022-12-07 00:10 +0100, Julien Olivain spake thusly:
> z3 package was initially added with a depends on !BR2_nios2. This was
> detected by testing with "./utils/test-pkg -a -p z3". It turned out that
> few other architectures are also not supported. The actual z3
> requirement is to have a libc that provides <fenv.h> AND also provides
> all the four macros: FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO,
> FE_UPWARD.
> 
> Quoting glibc manual, or "man fenv":
> https://www.gnu.org/software/libc/manual/html_node/Rounding.html
> 
> "fenv.h defines constants which you can use to refer to the various
> rounding modes. Each one will be defined if and only if the FPU
> supports the corresponding rounding mode."
> 
> This patch introduces _ARCH_SUPPORTS to limit only to the architectures
> with a FPU that has those rounding modes.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/2809dd1ae2f3ada8ee7b3f3e388341c7cfb633fb
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Great explanations, thanks!

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/z3/Config.in | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/package/z3/Config.in b/package/z3/Config.in
> index 55b0e8bb3b..8cd3128687 100644
> --- a/package/z3/Config.in
> +++ b/package/z3/Config.in
> @@ -1,11 +1,33 @@
> +# z3 supports arch for which libc fenv.h provides all four macros:
> +# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
> +# See for example in glibc https://sourceware.org/git/glibc.git
> +# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
> +config BR2_PACKAGE_Z3_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_arceb || BR2_arcle
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_m68k
> +	# BR2_microblaze has only FE_TONEAREST
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	# BR2_nios2 has only FE_TONEAREST
> +	default y if BR2_or1k
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_riscv
> +	default y if BR2_s390x
> +	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
> +	default y if BR2_sparc || BR2_sparc64
> +	default y if BR2_x86_64
> +	# BR2_xtensa supports only uclibc which does not have fenv.h
> +
>  config BR2_PACKAGE_Z3
>  	bool "z3"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
>  	# z3 needs fenv.h which is not provided by uclibc
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> -	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
> -	depends on !BR2_nios2
> +	depends on BR2_PACKAGE_Z3_ARCH_SUPPORTS
>  	help
>  	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
>  	  satisfiability modulo theories (SMT) solver.
> -- 
> 2.38.1
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
