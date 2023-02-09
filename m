Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC617C636CC
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 00:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890BB410D5;
	Thu,  9 Feb 2023 00:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890BB410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sTAKSTnsrMr; Thu,  9 Feb 2023 00:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A4E414D1;
	Thu,  9 Feb 2023 00:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A4E414D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03AFD1BF318
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 00:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D266D40359
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 00:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D266D40359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvhiA8X5J_Mq for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 00:56:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 522F8400CE
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 522F8400CE
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 00:56:21 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PvEYpK4PxpJHIPvEYpdUIv; Thu, 09 Feb 2023 01:56:18 +0100
Message-ID: <d5496dd8-89ff-2d98-26e5-da2dd32f46fc@benettiengineering.com>
Date: Thu, 9 Feb 2023 01:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfBksvsfls1dap5xzuvGuodkWHA4ZNzwNYENnOVZm3utNq3B38/SuOdLk3VqvbU9+pYgwiY4g22U70Z2qcjrpVTftz+rr6MAaI5+Du5lCKWksor/8osIR
 JGMvLuQRi7epJbiC+xSSOvPB+V1AUzRJZ7rlMY5ZJNLX5z8blh/aqjPB48gz+rWji+Q2QLk43REwdnddGl4xdM8h+AVFPcpIKeT/lNaNMycqR55XtCUMcHgz
 zf90e3gROYn6T72Jk6K25A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675904178; bh=yAk6xoUgHAY1u6sHbyO5sHr8oq7uxRHeyE3JfXw4wtM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XqZpJNuYZVu6LOMGmeP7scefoUIWCAC2al0fXoO0WW9frLo+I7Bp/6qQcstwWhsan
 gEqbd6WC21AU8JJin1Ur7kihkf2eVUQfTMX+FKLv3rSQk3U2+OZFRIHOOab3Y7Ack+
 S3nmUtkpAKkBzBMrvjahpf0Zqfj/oQY2uFXfpKPbwexNKkpJ/e80TU1R8nmq0BZDm/
 Lbq8Ter01SzBfMCj9TKEoY7vnjHZNBrJZRmM3wGHih20CWTtGu8VGvh5D8WS364EUe
 VYkkzpaqmOkgpvkVGsLtj2dAT9KrgGxNVdvvSXnv08OPUwauIO5QopnWZTVXiNkyfB
 +JKxFjWmKU3pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XqZpJNuY
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon, this had to be a RFC, I've forgotten to add it.

Some architecture still lacks some float rounding but is listed.
Let me know if it's possible to apply this patch and catch the other
architecture failures on Autobuilder rather than check all the
architectures' FPU implementation by hand(I can do it anyway if
requested).

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 09/02/23 01:48, Giulio Benetti wrote:
> Package quickjs fails to build on architectures that don't support full
> float rounding. To support all kind of float rounding FE_DOWNWARD,
> FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD must be defined in fenv.h.
> Since package z3 locally implements this check let's make it global,
> rename it to be generic and use it for both package quickjs and z3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b6/0b67381e3643c134c92cbcd1c5dc258fd760cd7e/
> http://autobuild.buildroot.net/results/cf2/cf249a82c83d3c8503205f4c3c5859dd9d52afdf/
> http://autobuild.buildroot.net/results/9b3/9b37c6c55a5b468657af26ef9b57d4fe24d8fde2/
> http://autobuild.buildroot.net/results/4f1/4f13cf7d353260c6b8934dbdcf267bea884b356b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   arch/Config.in            | 24 ++++++++++++++++++++++++
>   package/quickjs/Config.in |  4 ++--
>   package/z3/Config.in      | 25 +------------------------
>   3 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 1c0c400a98..90846861ca 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -253,6 +253,30 @@ config BR2_xtensa
>   
>   endchoice
>   
> +# Not all architectures support float rounding. This can be found while
> +# checking if fenv.h provides all four macros:
> +# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
> +# See for example in glibc https://sourceware.org/git/glibc.git
> +# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
> +config BR2_PACKAGE_ARCH_HAS_ALL_FLOAT_ROUNDING
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
>   # For some architectures or specific cores, our internal toolchain
>   # backend is not suitable (like, missing support in upstream gcc, or
>   # no ChipCo fork exists...)
> diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
> index dc466241ba..6f24787333 100644
> --- a/package/quickjs/Config.in
> +++ b/package/quickjs/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_QUICKJS
>   	bool "quickjs"
> -	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
> +	depends on BR2_PACKAGE_ARCH_HAS_ALL_FLOAT_ROUNDING # fenv.h lacks FE_{DOWN,UP}WARD
>   	depends on !BR2_STATIC_LIBS
>   	# No way to check for fenv support.
>   	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_QUICKJS
>   	  https://bellard.org/quickjs/
>   
>   comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
> -	depends on !BR2_nios2
> +	depends on BR2_PACKAGE_ARCH_HAS_ALL_FLOAT_ROUNDING
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
> diff --git a/package/z3/Config.in b/package/z3/Config.in
> index 8cd3128687..5ceca5dbe2 100644
> --- a/package/z3/Config.in
> +++ b/package/z3/Config.in
> @@ -1,33 +1,10 @@
> -# z3 supports arch for which libc fenv.h provides all four macros:
> -# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
> -# See for example in glibc https://sourceware.org/git/glibc.git
> -# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
> -config BR2_PACKAGE_Z3_ARCH_SUPPORTS
> -	bool
> -	default y if BR2_aarch64 || BR2_aarch64_be
> -	default y if BR2_arceb || BR2_arcle
> -	default y if BR2_arm || BR2_armeb
> -	default y if BR2_i386
> -	default y if BR2_m68k
> -	# BR2_microblaze has only FE_TONEAREST
> -	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> -	# BR2_nios2 has only FE_TONEAREST
> -	default y if BR2_or1k
> -	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> -	default y if BR2_riscv
> -	default y if BR2_s390x
> -	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
> -	default y if BR2_sparc || BR2_sparc64
> -	default y if BR2_x86_64
> -	# BR2_xtensa supports only uclibc which does not have fenv.h
> -
>   config BR2_PACKAGE_Z3
>   	bool "z3"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
>   	# z3 needs fenv.h which is not provided by uclibc
>   	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> -	depends on BR2_PACKAGE_Z3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_ARCH_HAS_ALL_FLOAT_ROUNDING
>   	help
>   	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
>   	  satisfiability modulo theories (SMT) solver.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
