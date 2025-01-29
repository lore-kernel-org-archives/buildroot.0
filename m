Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CFBC0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 16:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C9A61073;
	Wed, 29 Jan 2025 16:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4vEMN-98_fb; Wed, 29 Jan 2025 16:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DD561002
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DD561002;
	Wed, 29 Jan 2025 16:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 310DE20
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 16:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E82B405F0
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 16:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oasvFMDzoLlg for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 16:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CA7B40590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA7B40590
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CA7B40590
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 16:51:09 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3b95:eac2:3cf9:9a25] (unknown
 [IPv6:2a01:e0a:12:eba0:3b95:eac2:3cf9:9a25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id CD79AC0247;
 Wed, 29 Jan 2025 17:51:07 +0100 (CET)
Message-ID: <e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr>
Date: Wed, 29 Jan 2025 17:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20250129095716.2511434-1-romain.naour@smile.fr>
 <20250129095716.2511434-2-romain.naour@smile.fr>
Content-Language: en-US, fr
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20250129095716.2511434-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1738169467;
 bh=zWxuuxLUiwAt3X+LSJA9mEaYfxy7QQpj+7+zg2RI+2I=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fQl87wQrUDF3BLIEglmw+lfY41gAtOEhpqrEylfhRkgCqEvY2X8OXmHXVUWbP+W6k
 RAs7gUNrkvctG9q2zPcqPbdmY5qcY/Tj2qe3uZLphY6sKY+x/6c/f7dbWasE6ZTxhF
 FXyYxqs0HvV9aejPh7lD4Gh/f3TktSR3fUtXblrYM04UDLfTCwi0xrcEWB7aYoVnQh
 XxF7MscsscyghKuapaZSThX3/pSUG8LHyoOhPolIopwjiO01h2CBsOJ/Oh3FG9y4JS
 ql7mKYaC9T/S/PjVfr1MiS/Mvl3kULsPuLpgjpRZtDPaBwuAE8/8Srj+QSetktqKIw
 sd0B5ok6SA5uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=fQl87wQr
Subject: Re: [Buildroot] [PATCHv4 2/2] configs/acmesystems_acqua_a5_*: bump
 to Linux 6.12.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

On 2025-01-29, 10:57, Romain Naour wrote:
> Use the newly introduced BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY
> option to provide the Out-of-tree Device Tree Source file with
> its vendor subdirectory that is needed since kernel 6.12 [1].
> 
> Revert the sama5d31.dtsi include path update added by the previous
> kernel version bump 6.6.12 [2].
> 
> As noticed by Michael Walle, newer OOT device trees should use the
> same #include directives as the in-tree device trees to ease
> sharing the files between u-boot, linux and OOT external trees [3].
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> [2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
> [3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/
> 
> Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

After build-testing the previous patch in the series, I added this one
on top and build-tested again:

    # Test the regular, no-OVERRIDE_SRCDIR case.
    make linux-dirclean
    git am 0002-configs-acmesystems_acqua_a5_-bump-to-Linux-6.12.9.patch
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

    # Test the OVERRIDE_SRCDIR case.
    make linux-dirclean
    git -C $HOME/src/linux checkout v6.12.9
    echo "LINUX_OVERRIDE_SRCDIR = $HOME/src/linux" > local.mk
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

I then built a complete system, and run-tested it on an actual Acqua
board. I also tested with the latest point release (6.12.11).

Best regards,

Edgar Bonet.

> ---
>  .../acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts     | 2 +-
>  board/acmesystems/acqua-a5/patches/linux/linux.hash         | 2 +-
>  configs/acmesystems_acqua_a5_256mb_defconfig                | 6 +++---
>  configs/acmesystems_acqua_a5_512mb_defconfig                | 6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)
>  rename board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts (99%)
> 
> diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> similarity index 99%
> rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
> rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> index 411d1942f5..60be8a67cd 100644
> --- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
> +++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> @@ -9,7 +9,7 @@
>   * Licensed under GPLv2 or later.
>   */
>  /dts-v1/;
> -#include "microchip/sama5d31.dtsi"
> +#include "sama5d31.dtsi"
>  
>  / {
>  	model = "Acme Systems Acqua SOM";
> diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> index 4b20a009a7..7a4c4e57c9 100644
> --- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
> +++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
> +sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index b102dde0ba..8a1f6328a0 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -2,7 +2,7 @@ BR2_arm=y
>  BR2_cortex_a5=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> @@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY="board/acmesystems/acqua-a5/dts"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index da54eaf620..b47daa15f9 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -2,7 +2,7 @@ BR2_arm=y
>  BR2_cortex_a5=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> @@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY="board/acmesystems/acqua-a5/dts"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
