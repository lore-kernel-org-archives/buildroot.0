Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0418BECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 15:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8058660D6A;
	Sun, 28 Aug 2022 15:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8058660D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOZ9jFQ51VSk; Sun, 28 Aug 2022 15:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1C860D5C;
	Sun, 28 Aug 2022 15:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C1C860D5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0A91BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 842AD81A34
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 842AD81A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnGhSncIdCG5 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 15:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFAB819BE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CFAB819BE
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 15:29:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 56CE0780511;
 Sun, 28 Aug 2022 17:29:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 17:29:06 +0200
Date: Sun, 28 Aug 2022 17:29:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220828152906.GE2569@scaer>
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661700554;
 bh=QWM1o7EZUhDeHkpDxr58UlF3qdLQS8n5tdCXIFGFgTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qt+uj6pYaGjOpgipO+uIvhAg00LRIMnfi5z21Wz/RzRbJ/5c+6hFqFKWaYFWBdult
 ZpFXvM91Kzyhnb2FjPd/WX8JK/jnmY1sPrzGpDY9PLWs/D2xyGYukd3K2Edytdpk83
 VqSzkoc6gws7mDq753nBerrY9tmnH0fMjczqeZ4ROoEh1wpytSSpuImgX8uTDxrKHw
 EkOVvWmSjWLily5dfhbWYghaCIpdAxsEyGUuOXvlgG8eON3m5tr1y6U1O0V2OtSDF8
 UijYQVZugHK+JswDYopMEyyxC5IxvLI9PIzx0MmswQt4Y5Kl5BJg+JY4hNk4qb2P7q
 b0N0MlAXP6Qjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qt+uj6pY
Subject: Re: [Buildroot] [PATCH 1/7] toolchain/toolchain-external: update
 Arm AArch64 toolchain 11.2-2022.02
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chris, All,

On 2022-08-24 12:25 -0700, Chris Dimich spake thusly:
> Updated to gcc 11.2, gdb 11, binutils 2.37, glibc 2.34.

Thomas already applied that patch from a previous iteration of your
series, as far as I can see:
    https://lore.kernel.org/buildroot/20220824131545.3f3d245e@windsurf/
    https://git.buildroot.org/buildroot/commit/?h=next&id=34cf3a15c9da81afb6cab6c56babd5a2096e44ca

Regards,
Yann E. MORIN.

> See "Release Note":
> https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads-1
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  .../toolchain-external-arm-aarch64/Config.in                | 2 +-
>  .../toolchain-external-arm-aarch64.hash                     | 6 +++---
>  .../toolchain-external-arm-aarch64.mk                       | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> index 9eb5d64a9d..b5b4d137b8 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> @@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
>  	help
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> index ca1ea48bcb..6d81f58594 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> @@ -1,4 +1,4 @@
> -# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
> -md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz
> +md5  712ee3fa6247ac3f619dd193f714fbc1  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
>  # locally calculated
> -sha256  1e33d53dea59c8de823bbdfe0798280bdcd138636c7060da9d77a97ded095a84  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
> +sha256  52dbac3eb71dbe0916f60a8c5ab9b7dc9b66b3ce513047baa09fae56234e53f3  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> index 356e0810b3..3d340ea0d7 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2021.07
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2022.02
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
>  
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
>  
>  $(eval $(toolchain-external-package))
> -- 
> 2.34.1
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
