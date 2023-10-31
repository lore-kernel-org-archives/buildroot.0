Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79FDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 21:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D7B1401F0;
	Tue, 31 Oct 2023 21:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7B1401F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbbXxwwQR3Jb; Tue, 31 Oct 2023 21:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB0242F6D;
	Tue, 31 Oct 2023 21:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB0242F6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D2D1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 21:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A38EB6F7D2
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 21:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A38EB6F7D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnmTOF10gK1m for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 21:14:47 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 869736F7CC
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 21:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 869736F7CC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 81B0A19F5A7;
 Tue, 31 Oct 2023 22:14:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 22:14:42 +0100
Date: Tue, 31 Oct 2023 22:14:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20231031211442.GC2568@scaer>
References: <20231031084936.2397858-1-fancp2007@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031084936.2397858-1-fancp2007@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698786884;
 bh=KpE1CKsyFTvN24sHP4JtBiHjo+oUClFt6x9SucsWwXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GCl6oCLlN4TMUupKgwPcrycv5OHP9GGWFfsMGeyR1piGG8AJhbYXLZNFrr+Ijm1bW
 oHRfJhdxFMlPqAr+JRPg5HOx2Iv/kHJ80ii9ELpqaH/GB4Z8tvGNs84rhQ764tI4qh
 uBg5cgduhjF2e/i/b4+932bCL0lo7RnXFfQu8QZSaEOSCpPr40hc4QM9GG1BsNvfh8
 y0T3do2erc69YOg4IfUMjVlQ2wMzrwH2CE+UzsT9HMiQVXuaIII1TVGP+snSpIvZQ5
 H56+eBGVcq/dKXqk3XagsVpuAjpihUTK8EKEvnEzkYzPWYDgquX6c224EXv3eTRLYs
 2Ucq7qhsxN9+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GCl6oCLl
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_neo2_defconfig:
 new board
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

Scott, All,

On 2023-10-31 16:49 +0800, Scott Fan spake thusly:
> Add support for the FriendlyARM NanoPi NEO2 with mainline components:
>   - U-Boot 2023.10
>   - Linux 6.1.60

Funny, we removed a defconfig for that board a year ago, almost
day-for-day:
    24bb61071269  configs/friendlyarm_nanopi_neo2: remove defconfig

It's OK to re-add a new, fixed defconfig, though!

> Board's wiki page:
>   - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO2
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
[--SNIP--]
> diff --git a/board/friendlyarm/nanopi-neo2/post-build.sh b/board/friendlyarm/nanopi-neo2/post-build.sh
> new file mode 100755
> index 0000000000..0ee47013f1
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"

    $ ./utils-docker-run make check-package
    board/friendlyarm/nanopi-neo2/post-build.sh:0: run 'shellcheck' and fix the warnings

    $ ./utils/docker-run shellcheck board/friendlyarm/nanopi-neo2/post-build.sh
    In board/friendlyarm/nanopi-neo2/post-build.sh line 3:
    BOARD_DIR="$(dirname $0)"
                         ^-- SC2086: Double quote to prevent globbing and word splitting.

> diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
> new file mode 100644
> index 0000000000..50795a1cfb
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/readme.txt
> @@ -0,0 +1,34 @@
[--SNIP--]
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +  $ sudo sync

No need for sudo to run sync

[--SNIP--]
> diff --git a/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch b/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch
> new file mode 100644
> index 0000000000..b2edd9fb37
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch

    $ ./utils-docker-run make check-package
    board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch:0: use name <number>-<description>.patch (http://nightly.buildroot.org/#_providing_patches)
    board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
    board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Also, you need to provide a git-formatted patch, with a proper subject,
a proper commit log, and as reported above, your signed-off, and the
upstream status of this patch.

[--SNIP--]
> diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
> new file mode 100644
> index 0000000000..a88bf8957c
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_neo2_defconfig
> @@ -0,0 +1,48 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y

ATF is a bootloader, and as such, we want to use a pinned version, not
the latest one, so as for uboot:
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=v2.7

Care to fix all of those, and respin, please?

Regards,
Yann E. MORIN.

> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_PATCH="board/friendlyarm/nanopi-neo2/uboot/fit_spl_atf_its.patch"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo2/uboot/fit_spl.fragment"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM NanoPi NEO2"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo2/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo2/genimage.cfg"
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
