Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0016C001DE
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FD081498;
	Sun, 13 Aug 2023 16:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FD081498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upSH2p-QlLiB; Sun, 13 Aug 2023 16:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDB3814BA;
	Sun, 13 Aug 2023 16:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDB3814BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88A901BF293
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 16:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D079409B3
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 16:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D079409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vF1qlsCtuSP3 for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 16:08:01 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D82408F0
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 16:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D82408F0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1CC7E780304;
 Sun, 13 Aug 2023 18:07:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 18:07:52 +0200
Date: Sun, 13 Aug 2023 18:07:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230813160752.GZ421096@scaer>
References: <20230813044750.5567-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230813044750.5567-1-vfazio@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691942878;
 bh=GZDj0o+9vsOo5ZOmh8RYGtTnZruoQhhnkN6pO/zmKK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcF2576098FJNeILm/DijcpQX6FT7LS44pj5vs6XDiXLLJTJFrdr9D8UqSIkTFA6q
 K+ckvirHyMfZAW5OOYzKq+3gHPIHikt0FWSaXisnSgDqiUYxtRj2sC+xnyIGhZIdCR
 j98c9a8tozJrNp7+1jtQuny6edISR8tbeFErM00dRl/iQ4SRr0HF4Nw3QYWqOg95nh
 JfzPMyDCEitR/B+23CR59/ECFWtFoFjj2UtW8vvNZ5HD3YaDycw14xi2C2421eEjWa
 bOJoINRDsq+52JP1kbTo4KYByeVnf+EsEmw9BUiS5DMKnGCQ8qopr2kXbjfyayjhEq
 EhQc+oi84ceZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pcF25760
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-08-12 23:47 -0500, Vincent Fazio spake thusly:
> Previously, it was possible to select an external toolchain that did not
> support the GCC arch tuning the user had selected. This is problematic
> because it can lead to confusing error messages during builds [0].
> 
> Now, external toolchain selections will be filtered to only those that
> support the required GCC version specified by the target arch tuning.
> 
> Note: this patch does not touch the Bootlin toolchain config file as it
> is generated by a script.
> 
> Additional note: there is "soft" support for toolchains prior to GCC 4.8
> but there are no accompanying BR2_ARCH_NEEDS_GCC_AT_LEAST_X symbols.
> Instead of adding those, just use BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8 which
> is the minimum GCC version with claimed support [1].
> 
> [0]: https://lists.buildroot.org/pipermail/buildroot/2023-August/671877.html
> [1]: https://buildroot.org/downloads/manual/manual.html#requirement-mandatory
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Semantically, this is a fix, so Thomas and I agreed to apply it to
master.

Make it so: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../toolchain-external-arm-aarch64-be/Config.in  |  1 +
>  .../toolchain-external-arm-aarch64/Config.in     |  1 +
>  .../toolchain-external-arm-arm/Config.in         |  1 +
>  .../toolchain-external-custom/Config.in.options  | 16 ++++++++++++++++
>  .../Config.in                                    |  1 +
>  .../toolchain-external-linaro-aarch64/Config.in  |  1 +
>  .../toolchain-external-linaro-arm/Config.in      |  1 +
>  .../toolchain-external-linaro-armeb/Config.in    |  1 +
>  .../toolchain-external-synopsys-arc/Config.in    |  1 +
>  9 files changed, 24 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> index 62e5ea8667..466b1587c3 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
>  	bool "Arm AArch64 BE 12.2.rel1"
>  	depends on BR2_aarch64_be
>  	depends on BR2_HOSTARCH = "x86_64"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> index 0c2e64192d..fc62b759e5 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
>  	bool "Arm AArch64 12.2.rel1"
>  	depends on BR2_aarch64
>  	depends on BR2_HOSTARCH = "x86_64"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> index 4aab41693d..9b314795cb 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> @@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
>  	depends on BR2_ARM_CPU_HAS_NEON
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
>  	depends on BR2_ARM_EABIHF
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index d82c9b8a41..0f4f5eef2e 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -52,66 +52,82 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_13
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_12
>  	bool "12.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_11
>  	bool "11.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_10
>  	bool "10.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_9
>  	bool "9.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_8
>  	bool "8.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_7
>  	bool "7.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_6
>  	bool "6.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_5
>  	bool "5.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
>  	bool "4.9.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
>  	bool "4.8.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
>  	bool "4.7.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
>  	bool "4.6.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
>  	bool "4.5.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
>  	bool "4.4.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
>  	bool "4.3.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
>  	bool "older"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	help
>  	  Use this option if your GCC version is older than any of the
>  	  above.
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> index 53d5dfd8f2..295a8987f1 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
>  	bool "Linaro AArch64 BE 2018.05"
>  	depends on BR2_aarch64_be
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> index c9b84b1d30..1b0ec7cd9f 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  	bool "Linaro AArch64 2018.05"
>  	depends on BR2_aarch64
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> index 015e92f17c..8b3b4c844e 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> @@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABIHF
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> index b338a72bff..b143ee5e24 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> @@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABIHF
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> index c3483f331c..985e7b1710 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>  	bool "Synopsys ARC 2019.09 toolchain"
>  	depends on BR2_arc
>  	depends on BR2_HOSTARCH = "x86_64"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_ENABLE_LOCALE
> -- 
> 2.25.1
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
