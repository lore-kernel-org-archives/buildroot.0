Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC1DC282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 23:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C5A8215D;
	Sat,  8 Mar 2025 23:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJk_Or9lHvpw; Sat,  8 Mar 2025 23:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B24A81440
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B24A81440;
	Sat,  8 Mar 2025 23:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 656241C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 23:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 386C381440
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 23:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12ELTcAyFgx0 for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 23:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 880AB8143D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880AB8143D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 880AB8143D
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 23:05:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2D9902003C1;
 Sun,  9 Mar 2025 00:05:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Mar 2025 00:05:49 +0100
MIME-Version: 1.0
Date: Sun, 09 Mar 2025 00:05:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250308061245.1774235-4-kanakshilledar@gmail.com>
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
 <20250308061245.1774235-4-kanakshilledar@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2cbc27d4a30b7289256d80f1c7cb5807@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741475152;
 bh=x74G7rgqMC8BYE3eTA40+LCjA0dQU4bjuU0tjnqfD5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L98c3y1KVCMw6G2bJHcjzuFhnuH8/FSyVxyu5jmrWOeUfjkO4w2Ovd5jJijVcdudv
 vQ9m7+T7JlvV6Hug2+7yddshUsYZ575V2wXw+3d2mhoNBLmMSuO2Pyp4p7HQxpp7Tl
 bw9KB2QJEwrRKU72R2Ll9JFjA8HUtcUlJqyBF1gfyQ1q0EN3LgewYzA8T0w3+x6RGr
 batmuYIGp0xNbaHAEgDk7QrgL68sl+mbedkeJ3sM6c0TPlt78aExaVoxlPT0YGgd+w
 EY2+AQDX5Xv2EB4iVr4ElGAnWHRJNwrZ1fSYpzjHh1jFbS/BBZszHFwAbrE6Fxk8A3
 +aVlejLzIESjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=L98c3y1K
Subject: Re: [Buildroot] [PATCH 2/2] configs/sipeed_licheepi_4a: add new
 board
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kanak,

Thanks for the patch!

I have few questions/comments, see below.

On 08/03/2025 07:12, Kanak Shilledar wrote:
> Add support for the LicheePi 4A with mainline component:
>  - Linux Kernel 6.12
> 
> The following components are provided by vendor:
>  - U-Boot 2020.01
>  - OpenSBI v0.9
> 
> Board homepage and more usable wiki:
>  - https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/1_intro.html
> 
> th1520-boot-firmware is selected from the package sipeed-lpi4abins.
> This is inspired from lone0's fork of buildroot for th1520.[1]
> 
> [1] https://github.com/lone0/buildroot-th1520
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
>  .../sipeed/licheepi_4a/extlinux/extlinux.conf |  4 ++
>  board/sipeed/licheepi_4a/genimage.cfg         |  9 ++++
>  board/sipeed/licheepi_4a/post-image.sh        | 25 +++++++++
>  board/sipeed/licheepi_4a/readme.txt           | 54 +++++++++++++++++++
>  configs/sipeed_licheepi_4a_defconfig          | 40 ++++++++++++++
>  5 files changed, 132 insertions(+)
>  create mode 100644 board/sipeed/licheepi_4a/extlinux/extlinux.conf
>  create mode 100644 board/sipeed/licheepi_4a/genimage.cfg
>  create mode 100755 board/sipeed/licheepi_4a/post-image.sh
>  create mode 100644 board/sipeed/licheepi_4a/readme.txt
>  create mode 100644 configs/sipeed_licheepi_4a_defconfig
> 
> diff --git a/board/sipeed/licheepi_4a/extlinux/extlinux.conf 
> b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..add3954184
> --- /dev/null
> +++ b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label linux
> +  kernel /Image
> +  devicetree /th1520-lichee-pi-4a.dtb
> +  append console=ttyS0,115200 root=/dev/mmcblk0p4 rootfstype=ext4 
> rootwait rw earlycon clk_ignore_unused init=/sbin/init
> diff --git a/board/sipeed/licheepi_4a/genimage.cfg 
> b/board/sipeed/licheepi_4a/genimage.cfg
> new file mode 100644
> index 0000000000..7eef4465db
> --- /dev/null
> +++ b/board/sipeed/licheepi_4a/genimage.cfg
> @@ -0,0 +1,9 @@
> +image boot.ext4 {
> +	ext4 {
> +		use-mke2fs = true

Why "use-mke2fs = true" is needed here? I think it is the first
configuration in Buildroot using it.

Could you add a comment why it is needed? (or it if works
with the default value, then it could be removed).

> +		label = "boot"
> +	}
> +
> +	size = 64M
> +}
> +
> diff --git a/board/sipeed/licheepi_4a/post-image.sh 
> b/board/sipeed/licheepi_4a/post-image.sh
> new file mode 100755
> index 0000000000..93a7572ee3
> --- /dev/null
> +++ b/board/sipeed/licheepi_4a/post-image.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +
> +set -e
> +
> +BOARD_DIR="$(dirname $0)"
> +BOARD_NAME="$(basename ${BOARD_DIR})"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
> +ROOTPATH_TMP="$(mktemp -d)"
> +rm -rf "${GENIMAGE_TMP}"
> +
> +cp ${BINARIES_DIR}/Image ${BINARIES_DIR}/*.dtb 
> ${BINARIES_DIR}/fw_dynamic.bin ${ROOTPATH_TMP}
> +cp -a ${BINARIES_DIR}/bootbins/* ${ROOTPATH_TMP}
> +cp -a ${BOARD_DIR}/extlinux ${ROOTPATH_TMP}
> +
> +genimage \
> +	--rootpath "${ROOTPATH_TMP}"   \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?
> diff --git a/board/sipeed/licheepi_4a/readme.txt 
> b/board/sipeed/licheepi_4a/readme.txt
> new file mode 100644
> index 0000000000..77a3a9b3bc
> --- /dev/null
> +++ b/board/sipeed/licheepi_4a/readme.txt
> @@ -0,0 +1,54 @@
> +Intro
> +=====
> +
> +This directory contains a buildroot configuration for building a
> +LicheePi 4A.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot
> +-------------------
> +
> +  $ make sipeed_licheepi_4a_defconfig
> +
> +Build the boot and rootfs
> +----------------

Could you underline the full section title here, please?

Build the boot and rootfs
-------------------------

> +
> +Note: you will need to have access to the network, since Buildroot
> +will download the packages' sources.
> +
> +You may now build your rootfs with:
> +
> +  $ make
> +
> +(This may take a while, consider getting yourself a coffee ;-) )
> +
> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- boot.ext4
> +    +-- rootfs.ext2
> +    +-- rootfs.ext4 -> rootfs.ext2
> +    +-- rootfs.tar
> +    +-- u-boot.bin
> +    +-- u-boot-with-spl.bin
> +    +-- fw_dynamic.bin
> +    `-- Image
> +
> +How to flash the board
> +========================
> +
> +Once the build process is finished you will have to flash the
> +correspoding images to the respective partitions in the eMMC.
> +LicheePi 4A uses fastboot to flash the images.
> +
> +# fastboot flash ram u-boot-with-spl.bin
> +# fastboot reboot
> +# fastboot flash uboot u-boot-with-spl.bin
> +# fastboot flash boot boot.ext4
> +# fastboot flash root rootfs.ext2

Out of curiosity, is it possible to boot the Buildroot image
from the SD card? If yes, it could be interesting to also have
the method here (and boot config switches).

> diff --git a/configs/sipeed_licheepi_4a_defconfig 
> b/configs/sipeed_licheepi_4a_defconfig
> new file mode 100644
> index 0000000000..14e6717e8c
> --- /dev/null
> +++ b/configs/sipeed_licheepi_4a_defconfig
> @@ -0,0 +1,40 @@
> +BR2_riscv=y
> +BR2_RISCV_ISA_RVC=y
> +BR2_RISCV_ISA_RVV=y

We need to pin a Kernel version (see below), so the kernel headers
needs to be set to the same version, with the config:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

Also, new defconfigs should add custom hash files for board
specific packages. So you should have configs like:

BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

This patch should also introduce the corresponding hash files.

> +BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi 4A"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
> +BR2_LINUX_KERNEL=y

The defconfig should pin a fixed Kernel version. For example:
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"

See other defconfigs in Buildroot.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

The Buildroot defconfigs should be kept minimal: only the package
needed to build, boot and provide core functionality should be kept.
I believe BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y is added here for
BR2_PACKAGE_HDPARM=y. They could be removed.

> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88=y
> +BR2_PACKAGE_HDPARM=y
> +BR2_PACKAGE_IPERF3=y

BR2_PACKAGE_HDPARM=y and BR2_PACKAGE_IPERF3=y could be removed.

> +BR2_PACKAGE_IW=y
> +BR2_PACKAGE_SIPEED_LPI4ABIN=y
> +BR2_PACKAGE_WIRELESS_REGDB=y
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="lpi4a"

Git branch names should not be used in repo version. Please change it to 
a
tag name or commit id.

> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="th1520"

Git branch names should not be used in repo version. Please change it to 
a
tag name or commit id.

> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Also, could you add yourself as the maintainer of this defconfig in the
file "DEVELOPERS"?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
