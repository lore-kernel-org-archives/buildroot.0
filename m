Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A754C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 03:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8CC241B39;
	Thu,  9 Jun 2022 03:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCyBPlmWkcf3; Thu,  9 Jun 2022 03:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CFB41974;
	Thu,  9 Jun 2022 03:25:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2C21BF982
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 03:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0346E40253
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 03:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7SS7BJKcq_k for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 03:25:29 +0000 (UTC)
X-Greylist: delayed 00:12:35 by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87B7940126
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 03:25:29 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 2593PJCj093206;
 Thu, 9 Jun 2022 11:25:19 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from Thinkpad-L14 (192.168.21.66) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 9 Jun 2022
 11:25:18 +0800
Date: Thu, 9 Jun 2022 11:27:03 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, <buildroot@buildroot.org>
Message-ID: <YqFoh3njptKJTZlK@Thinkpad-L14>
References: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
 <20220607205921.3312256-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607205921.3312256-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/2.2.5 (a8c7fba1) (2022-05-16)
X-Originating-IP: [192.168.21.66]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 2593PJCj093206
Subject: Re: [Buildroot] [PATCH 2/3]
 toolchain/toolchain-external/toolchain-external-andes-nds32: remove package
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
Cc: alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jun 07, 2022 at 10:59:19PM +0200, Thomas Petazzoni wrote:
> As we're about to remove the nds32 architecture support from
> Buildroot, drop the toolchain-external-andes-nds32 external toolchain
> package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

Regards,
Peter Lin

> ---
>  DEVELOPERS                                        |  1 -
>  .../config-fragments/autobuild/andes-nds32.config |  3 ---
>  .../autobuild/toolchain-configs.csv               |  1 -
>  toolchain/toolchain-external/Config.in            |  6 ------
>  .../toolchain-external-andes-nds32/Config.in      | 15 ---------------
>  .../Config.in.options                             |  9 ---------
>  .../toolchain-external-andes-nds32.hash           |  2 --
>  .../toolchain-external-andes-nds32.mk             | 10 ----------
>  8 files changed, 47 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/andes-nds32.config
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 25a5f82e79..078fa8a03e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2165,7 +2165,6 @@ N:	Yu Chien Peter Lin <peterlin@andestech.com>
>  F:	arch/Config.in.nds32
>  F:	board/andes
>  F:	configs/andes_ae350_45_defconfig
> -F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
>  
>  N:	Olaf Rempel <razzor@kopf-tisch.de>
>  F:	package/ctorrent/
> diff --git a/support/config-fragments/autobuild/andes-nds32.config b/support/config-fragments/autobuild/andes-nds32.config
> deleted file mode 100644
> index 541677e002..0000000000
> --- a/support/config-fragments/autobuild/andes-nds32.config
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -BR2_nds32=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index f5e9bd8cf9..0b19051543 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -22,7 +22,6 @@ support/config-fragments/autobuild/br-arm-full-static.config,x86_64
>  support/config-fragments/autobuild/sourcery-arm.config,x86
>  
>  # Toolchains used by test-pkg only when the '-a' option is passed:
> -support/config-fragments/autobuild/andes-nds32.config,x86
>  support/config-fragments/autobuild/arm-aarch64.config,x86_64
>  support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
>  support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 2177e6a678..cc6464aeaf 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -23,9 +23,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
>  # ARC
>  source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
>  
> -# Andes
> -source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in"
> -
>  # ARM (use ARM toolchain by default)
>  source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
>  source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
> @@ -130,9 +127,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
>  # ARC
>  source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
>  
> -# Andes
> -source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options"
> -
>  # ARM
>  source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
>  source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> deleted file mode 100644
> index ecd50cc805..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
> -	bool "Andes nds32"
> -	depends on BR2_nds32
> -	depends on !BR2_STATIC_LIBS
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_TOOLCHAIN_HAS_SSP
> -	help
> -	  nds32 toolchain for the nds32 architecture. It uses GCC
> -	  8.2.1, GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates
> -	  code that runs on ae300 platform
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
> deleted file mode 100644
> index 7d11ae2098..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -if BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
> -
> -config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> -	default "nds32le-linux"
> -
> -config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> -	default "toolchain-external-andes-nds32"
> -
> -endif
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
> deleted file mode 100644
> index 4314bb1f55..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# From https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
> -sha256 6050601df85ad93a4c211c1d57ed3773edb62aa505f7e07d7d555652e83af2cc  nds32le-linux-glibc-v3-upstream.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
> deleted file mode 100644
> index fa29490b4f..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -################################################################################
> -#
> -# toolchain-external-andes-nds32
> -#
> -################################################################################
> -
> -TOOLCHAIN_EXTERNAL_ANDES_NDS32_SITE = https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521
> -TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE = nds32le-linux-glibc-v3-upstream.tar.gz
> -
> -$(eval $(toolchain-external-package))
> -- 
> 2.35.3
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
