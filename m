Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18371C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81446106F;
	Tue, 10 May 2022 19:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2A1CS3aUc_8; Tue, 10 May 2022 19:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5F361047;
	Tue, 10 May 2022 19:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1CDA1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFDB580F3D
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPXpVsY3FbEw for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:32:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95B6680F05
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:32:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t5so21165374edw.11
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QlwBJa6A6Q52yzWBj/hyegJky4YG/k8MzE+fLYgDJhQ=;
 b=CvemaBK4prNeiIF2AfgXC2LP/Pe+jenCGT3wIBUEzzEFi209/9mIU2ksE3nVa7T0SS
 DiIAlmOTifo6OZs8BTgYs17N18jmfqE/3jJ20ER4HdIb8G+HnxeW8/kS+u9jlTXZr907
 QHYgVqaU7sBjrksE63XaUfwWO7wfWUq73T4+yvnwInRC7D81UJAr9zCpX0ZByFwHMTSs
 TIErgdjoEPU5Q1wzkKUAWjGNUVQrK64K7pOHAH+0p8TZbLnG6gHgZolp4VgtPeOzqQYP
 slP5yxqq8dzHi6CSKxiFYxXmVEQbcDF1wchZbB+mU6986IMoM1UEy0PFdN+dk1MAW1Lh
 aOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QlwBJa6A6Q52yzWBj/hyegJky4YG/k8MzE+fLYgDJhQ=;
 b=Av7589a2OrH0aUYs4ZFcPPS44tC67Ar6yBmnIzC9nwAcc9vtVGoaZz0Dbpi6L4y9/g
 U+rVIPJSGoIWrKdKnsVn3inTSjDrK1l3wNRrMbrMadQbZpKza9Z+zLtFW4kl/HfGoWYy
 MyYCIwMwkgo7SV8Q1W3ZCvUt5CtKWhUoQ707HuGiGE6Jxv9Wt62MD82u4JJVeZXFb5g8
 FIoT8ww8Yo5C8UZlnxBR33UgmSn0cQNcshwrjX7IDJ+bkXNM/Aa14c59bTOwpTb/Z3Iw
 UyPjffAhKhWyRYV2D8J1ACqXNvuJlGsbLOMtwItHUxpoZUfy5tS2aEql0tSpBt7Ngxzz
 XH2g==
X-Gm-Message-State: AOAM530q2ZQKTi50S0wwDq5pI0huwLCwsQsYWA8xva1Kd95C4sXsTRRz
 IihLGEJCRtrOyBE4Plujc/odmQ==
X-Google-Smtp-Source: ABdhPJxlfnFS12Y4248jOaAn3xkO3rc3f0x7vwwtpgDir4tP+XRWXx05VjDZzWyqgY2ACBk06Qil7A==
X-Received: by 2002:a05:6402:520e:b0:428:22d0:e996 with SMTP id
 s14-20020a056402520e00b0042822d0e996mr24524456edd.250.1652211124736; 
 Tue, 10 May 2022 12:32:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a50e68c000000b0042617ba63b7sm26749edm.65.2022.05.10.12.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:32:04 -0700 (PDT)
Message-ID: <daca77a5-b780-3675-e43f-820f03bc9cda@mind.be>
Date: Tue, 10 May 2022 21:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220506054651.2853406-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220506054651.2853406-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/05/2022 07:46, James Hilliard wrote:
> It is currently possible to select BR2_STATIC_LIBS while
> BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
> toolchains that support BR2_STATIC_LIBS for the selected architecture.

  Good catch!

> 
> Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS so that we can
> disable the selection of BR2_STATIC_LIBS when using an unsupported
> architecture.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
>   - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
>   - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   Config.in                               |   2 +
>   toolchain/toolchain-buildroot/Config.in | 119 ++++++++++++++++++------
>   2 files changed, 90 insertions(+), 31 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index f0cd6f48ed..5daca3adce 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -601,6 +601,8 @@ choice
>   
>   config BR2_STATIC_LIBS
>   	bool "static only"
> +	depends on !BR2_TOOLCHAIN_BUILDROOT || \
> +		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS

  However, I don't think this is the right approach.

  Instead, I think there should be a blind option 
BR2_TOOLCHAIN_STATIC_LIBS_SUPPORTS that gets selected by toolchain that do 
support static libs (i.e. using uClibc or musl), and remove all the 'depends on 
!STATIC' from the toolchain options.

  Regards,
  Arnout


>   	help
>   	  Build and use only static libraries. No shared libraries will
>   	  be installed on the target. This potentially increases your
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index be89f68ab5..287253b11f 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -20,6 +20,91 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>   
>   	  If you're not sure, just leave the default "buildroot" value.
>   
> +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_aarch64_be
> +	default y if BR2_arcle
> +	default y if BR2_arceb
> +	default y if BR2_arm
> +	default y if BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_m68k
> +	default y if BR2_microblaze
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_or1k
> +	default y if BR2_powerpc
> +	default y if BR2_RISCV_64
> +	default y if BR2_sh4
> +	default y if BR2_sh4eb
> +	default y if BR2_sparc
> +	default y if BR2_xtensa
> +	default y if BR2_x86_64
> +
> +config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm
> +	default y if BR2_armeb
> +	default y if BR2_aarch64
> +	default y if BR2_aarch64_be
> +	default y if BR2_i386
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_powerpc
> +	default y if BR2_powerpc64
> +	default y if BR2_powerpc64le
> +	default y if BR2_riscv
> +	default y if BR2_s390x
> +	default y if BR2_sh
> +	default y if BR2_sparc64
> +	default y if BR2_x86_64
> +	default y if BR2_microblaze
> +	default y if BR2_nios2
> +	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
> +	default y if BR2_csky
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> +	depends on !BR2_powerpc_SPE
> +	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> +
> +config BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_microblaze
> +	default y if BR2_mips
> +	default y if BR2_mipsel
> +	default y if BR2_mips64
> +	default y if BR2_mips64el
> +	default y if BR2_or1k
> +	default y if BR2_powerpc
> +	default y if BR2_powerpc64
> +	default y if BR2_powerpc64le
> +	default y if BR2_RISCV_64
> +	default y if BR2_sh
> +	default y if BR2_x86_64
> +	depends on !BR2_powerpc_SPE # not supported, build breaks
> +	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
> +	# sh2 nommu is supported by musl, but we don't have support
> +	# for it in Buildroot.
> +	depends on BR2_USE_MMU
> +
> +config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> +	default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> +
>   choice
>   	prompt "C library"
>   	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> @@ -27,13 +112,7 @@ choice
>   
>   config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>   	bool "uClibc-ng"
> -	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> -		   BR2_arm     || BR2_armeb    || \
> -		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
> -		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> -		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
> -		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
> -		   BR2_x86_64
> +	depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
>   	select BR2_TOOLCHAIN_USES_UCLIBC
>   	help
>   	  This option selects uClibc-ng as the C library for the
> @@ -43,22 +122,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>   
>   config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   	bool "glibc"
> -	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
> -		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
> -		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
> -		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> -		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
> -		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
> -		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
> -	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
>   	depends on !BR2_STATIC_LIBS
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> -	depends on !BR2_powerpc_SPE
> -	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
>   	select BR2_TOOLCHAIN_USES_GLIBC
>   	help
>   	  This option selects glibc as the C library for the
> @@ -82,15 +147,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
>   
>   config BR2_TOOLCHAIN_BUILDROOT_MUSL
>   	bool "musl"
> -	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
> -		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
> -		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
> -		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
> -	depends on !BR2_powerpc_SPE # not supported, build breaks
> -	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
> -	# sh2 nommu is supported by musl, but we don't have support
> -	# for it in Buildroot.
> -	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
>   	select BR2_TOOLCHAIN_USES_MUSL
>   	help
>   	  This option selects musl as the C library for the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
