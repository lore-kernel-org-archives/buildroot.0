Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F60C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A941160B2F;
	Sun,  9 Jan 2022 10:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hinq8yfHtNXI; Sun,  9 Jan 2022 10:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8A7260B28;
	Sun,  9 Jan 2022 10:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7BE1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153E7404EF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hc9QPyVjNOJK for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9390540465
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:36:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9D10F13F85F;
 Sun,  9 Jan 2022 11:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641724569;
 bh=O1DhjeZkCYDGYYauNt69ZMgnOm1dqFGHvOsMIBnPk/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8ZdyA3prfHNrO9nOxHlV5xCXPnfQQrONcgJMAAMORjJeCPc8VSikpFoIwgZfK9PC
 +P5asAvR2jj51qFNv8E7eoPXq2LJWFLrdiPpsGZZq1SfY/qrmLf+Y0wuZmF84yU5Ta
 yOYBTeczybI8GMPnk69193UTGuvFS8DP6lP1K+mB7uflwAS9473Y9aNw8ko11DALib
 TLwPsjeDisdruk4H4+wwkycnQJqNThPKerz4yN4ZmRkqHg7/GS1qhLcho0NlJDUKo7
 2ZNjgHT04JKa49JbIveha+swDU8vTIstj3t/bxpiVBp8GKyiMhkyo4UpwidUpljEHU
 /Mm+PtZUPVjpg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 11:36:07 +0100
Date: Sun, 9 Jan 2022 11:36:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220109103607.GK1881783@scaer>
References: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
 <20220109080124.2271241-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109080124.2271241-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] arch/Config.in.x86: add support for
 x86-64-v2, x86-64-v3, x86-64-v4
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

On 2022-01-09 09:01 +0100, Thomas Petazzoni spake thusly:
> In the face of the vast amount of x86-64 CPU architecture variants,
> Linux distributions have worked together to define "micro-architecture
> levels" in the x86-64 psABI, called x86-64-v2, x86-64-v3 and
> x86-64-v4. They standardize a set of CPU features, and GCC since its
> version 11.x has support for these micro-architecture levels as
> -march= options.
> 
> It makes sense to support them in Buildroot, especially for those who
> want to build toolchains that aim at targeting a reasonably broad
> family of x86-64 processors.

As for x86-64, I've added a dependency on BR2_x86_64.

> More details:
> 
>  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex
>  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
>  https://www.phoronix.com/scan.php?page=news_item&px=GCC-11-x86-64-Feature-Levels

I've added a URL to the upstream commit too.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.x86 | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 794d808d96..153c8bad38 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -91,6 +91,63 @@ config BR2_x86_x86_64
>  	  "Generic CPU with 64-bit extensions" by the GCC
>  	  documentation. It is a 64-bit CPU with MMX, SSE and SSE2
>  	  support.
> +config BR2_x86_x86_64_v2
> +	bool "x86-64-v2"
> +	select BR2_X86_CPU_HAS_MMX
> +	select BR2_X86_CPU_HAS_SSE
> +	select BR2_X86_CPU_HAS_SSE2
> +	select BR2_X86_CPU_HAS_SSE3
> +	select BR2_X86_CPU_HAS_SSSE3
> +	select BR2_X86_CPU_HAS_SSE4
> +	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
> +	help
> +	  This option corresponds to the x86-64-v2 micro-architecture
> +	  level, as defined by the x86-64 psABI document, see
> +	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
> +
> +	  It is close to the Nehalem CPU architecture, and is
> +	  applicable for CPUs that support CMPXCHG16B, LAHF-SAHF,
> +	  POPCNT, SSE3, SSE4.1, SSE4.2, SSSE3.
> +config BR2_x86_x86_64_v3
> +	bool "x86-64-v3"
> +	select BR2_X86_CPU_HAS_MMX
> +	select BR2_X86_CPU_HAS_SSE
> +	select BR2_X86_CPU_HAS_SSE2
> +	select BR2_X86_CPU_HAS_SSE3
> +	select BR2_X86_CPU_HAS_SSSE3
> +	select BR2_X86_CPU_HAS_SSE4
> +	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_X86_CPU_HAS_AVX
> +	select BR2_X86_CPU_HAS_AVX2
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
> +	help
> +	  This option corresponds to the x86-64-v3 micro-architecture
> +	  level, as defined by the x86-64 psABI document, see
> +	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
> +
> +	  It is close to the Haswell CPU architecture, and is
> +	  applicable for CPUs that support all of x86-64-v2 plus AVX,
> +	  AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.
> +config BR2_x86_x86_64_v4
> +	bool "x86-64-v4"
> +	select BR2_X86_CPU_HAS_MMX
> +	select BR2_X86_CPU_HAS_SSE
> +	select BR2_X86_CPU_HAS_SSE2
> +	select BR2_X86_CPU_HAS_SSE3
> +	select BR2_X86_CPU_HAS_SSSE3
> +	select BR2_X86_CPU_HAS_SSE4
> +	select BR2_X86_CPU_HAS_SSE42
> +	select BR2_X86_CPU_HAS_AVX
> +	select BR2_X86_CPU_HAS_AVX2
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
> +	help
> +	  This option corresponds to the x86-64-v4 micro-architecture
> +	  level, as defined by the x86-64 psABI document, see
> +	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
> +
> +	  It is applicable for CPUs that support all of x86-64-v3 plus
> +	  AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL.
>  config BR2_x86_nocona
>  	bool "nocona"
>  	select BR2_X86_CPU_HAS_MMX
> @@ -292,6 +349,9 @@ config BR2_GCC_TARGET_ARCH
>  	default "pentium4"	if BR2_x86_pentium4
>  	default "prescott"	if BR2_x86_prescott
>  	default "x86-64"	if BR2_x86_x86_64
> +	default "x86-64-v2"	if BR2_x86_x86_64_v2
> +	default "x86-64-v3"	if BR2_x86_x86_64_v3
> +	default "x86-64-v4"	if BR2_x86_x86_64_v4
>  	default "nocona"	if BR2_x86_nocona
>  	default "core2"		if BR2_x86_core2
>  	default "corei7"	if BR2_x86_corei7
> -- 
> 2.33.1
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
