Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A563C10DCE
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 21:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F236FA60;
	Fri,  8 Dec 2023 21:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F236FA60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRSxc8mMLnjW; Fri,  8 Dec 2023 21:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61446FA6D;
	Fri,  8 Dec 2023 21:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61446FA6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5DF1BF417
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 128FD40A18
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128FD40A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUIls-Yr8SZT for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 21:35:44 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46ECF40463
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 21:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46ECF40463
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3E69113F8AE;
 Fri,  8 Dec 2023 22:35:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 22:35:39 +0100
Date: Fri, 8 Dec 2023 22:35:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZXOMK-rkxeV_xmOy@landeda>
References: <20231208135329.1352567-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208135329.1352567-1-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702071342;
 bh=TEU1ahyR/aR/TZ8uHu6DqBCSDtPaZ2EeodtCHYb2w1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VInsdgxzSKnb/O7cfR3MRsdFez0Znz8/1UxmCDFpnLsacBnINrZBKLl6IPOB/A+aw
 pu+x/F8erDolMbiv3oBlRFLclxmlsgzynIZ+r+IGbjdfyowIghDwrlj9ILl86KgBAz
 hbgKoXwVU2ylwwzKpDOBTXnDd13BRKT72L5bogusWCs1+RlQMtUzINsNao5VqxR6qU
 3Zpd8byoyKW0fkcCGodeiPe+YUARGOIA4xjGAIy/mBcgWgg1eiPlRtMTF22Rjtonuq
 TUcZa4jqYwsdkEp4/e4px76NaU8jI0BlBXWc+WHZ14rb6e2vqk0uTDatlAE4ouavCE
 UUUv1SBz1pG8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VInsdgxz
Subject: Re: [Buildroot] [PATCH 1/3]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to version
 13.2-rel1
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

Antoine, All,

On 2023-12-08 14:53 +0100, Antoine Coutant spake thusly:
> Updated to gcc 13.2, gdb 13, binutils 2.41, glibc 2.38.
> 
> The x86_64 host variant prebuilt toolchain is built on RHEL7
> (glibc 2.17) and is likely also be useable on OS versions like
> RHEL8, Ubuntu 18.04 or later.
> 
> The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
> (glibc 2.27) is likely also be useable on OS versions like RHEL8,
> Ubuntu 18.04 or later.
> 
> Tested with qemu_arm_vexpress_defconfig.
> 
> Release note:
> https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>

All three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../toolchain-external-arm-arm/Config.in                  | 8 ++++----
>  .../toolchain-external-arm-arm.hash                       | 8 ++++----
>  .../toolchain-external-arm-arm.mk                         | 2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> index 9b314795cb..bee8d61164 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> @@ -3,7 +3,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
>  	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
>  
>  config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
> -	bool "Arm ARM 12.2.rel1"
> +	bool "Arm ARM 13.2.rel1"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>  	depends on BR2_ARM_CPU_HAS_NEON
> @@ -14,12 +14,12 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
>  	help
> -	  Arm toolchain for the ARM architecture. It uses GCC 12.2,
> -	  GDB 12, glibc 2.36, Binutils 2.39. It generates code
> +	  Arm toolchain for the ARM architecture. It uses GCC 13.2,
> +	  GDB 13, glibc 2.38, Binutils 2.41. It generates code
>  	  that runs on all Cortex-A profile devices. The code
>  	  generated uses the hard floating point calling convention,
>  	  and uses the NEON FPU instructions.
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> index 2c1af4cfcc..e979e5f508 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> @@ -1,4 +1,4 @@
> -# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
> -sha256  d73f230bb946231b648a960b719f2cc1afc792ec2e36f9abc25552f00923a926  arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
> -# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
> -sha256  860f49bc60d559f06408f07a24bc2a09e5b8f9118cfe1daed521ab321c03c78e  arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
> +sha256  df0f4927a67d1fd366ff81e40bd8c385a9324fbdde60437a512d106215f257b3  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
> +sha256  8ad384bb328bccc44396d85c8f8113b7b8c5e11bcfef322e77cda3ebe7baadb5  arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> index 164b60e6ca..5962121af6 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 12.2.rel1
> +TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 13.2.rel1
>  TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
>  
>  TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
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
