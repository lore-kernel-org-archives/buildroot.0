Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615C9C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1982841F5B;
	Tue,  6 Feb 2024 14:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1982841F5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw7kvS7tQUOh; Tue,  6 Feb 2024 14:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A721C41F28;
	Tue,  6 Feb 2024 14:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A721C41F28
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C53121BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C5FB404D8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C5FB404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCSNK3jfyo_V for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:18:56 +0000 (UTC)
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DC94401F1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC94401F1
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XMHjrJ8jnoTDCXMHjrzbwB; Tue, 06 Feb 2024 15:18:52 +0100
Message-ID: <f82835e0-2fbb-4247-a9f9-bae3c7ea2168@benettiengineering.com>
Date: Tue, 6 Feb 2024 15:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <20240206080603.28916-1-hanyuan-z@qq.com>
 <tencent_3D7A01628C29BF242C6737C7FF6F4A3A3809@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_3D7A01628C29BF242C6737C7FF6F4A3A3809@qq.com>
X-CMAE-Envelope: MS4xfLkeHc6yTK5NSdTc9xrt8p92rCkqytsSGjAKH11q1ATYUPbQNciCyODfPlMhIAKD7ktSQho99T3RA2jPdf491ZCXE98q7eT6Wpo9LjRgs8E+VgV3d5fI
 dAHvKQUW2KpeFBDea1uIwLUOUN+XTBLuEGQMWkXyZv2cjQYjX/DUQ5smz6jW9bWhHU36zdU8K5sHmmYrEA9dWtMpBKjlfXpiKDzhBrvC19MhwuxLhGMAxvpw
 Fg3xAz7mj10UQlizCoEkiYFpgc8a4a0qrG6fUgtgcx5hCp7H6nP4Y12htmS/j1XXzmb+WstqTZZgSd4FDLPY1BhoOS0pXsE/TAf0CYzLXCDe8f2lXH/o3ZOo
 OhMqsEwd
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707229132; bh=BJOjkGW5uWMN2qjuIvD8VSSSH1MN08vOUCVKhxTzioM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TH2kNAqmKv3x4wFcqwtE0YIVQ5D6Ummzj3alNqtoYB6t+AVE3h3vZGp/BjgOu3vJJ
 dm0YtXzHG4yqyK84TQr/AV3Fku4jbM/rra8Bs0NGb7bFa7knQX02TSMlY1T89CUsuY
 1q9YhD4utZ2l/lIctSoQfqfyE7vCX/l6gnDTSZdzHBfg43VQD1gMpLByMMmEBL5MCh
 ji0zc4kQmOXr4BLJVpqLCfmOaKY2tqCRPsLr0AAgOC+YVcHyQHkctXj57PjDbR+Py7
 c45vUn3A/ZnhsKHRFh0ElD7w3TctBPwe+0pbT6QYMg0OqVnGqGNqmUL+dqadGxFIFz
 Yv7T1bwwdQp/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TH2kNAqm
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/milkv_duo: new defconfig
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
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Hanyuan,

On 06/02/24 09:06, Hanyuan Zhao wrote:
> Milk-V Duo is an ultra-compact embedded RISC-V development platform based on the CV1800B chip.
> It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
> for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.
> 
> https://milkv.io/duo
> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> ---

Here you definetely need to add that this patch depends on this
patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=393667
to work-around a gcc bug on htop package.

After the 3 dashes above you should add changes between patch versions like:
V1->V2:
* changed this
* changed that

V2->V3:
* change thee

etc..

and I usually close with other 3 dashes
---

>   board/milkv/duo/genimage.cfg                 | 25 ++++++++
>   board/milkv/duo/post-image.sh                | 47 +++++++++++++++
>   board/milkv/duo/readme.txt                   | 54 +++++++++++++++++
>   configs/milkv_duo_musl_riscv64_defconfig     | 63 ++++++++++++++++++++
>   configs/milkv_duo_musl_riscv64_ion_defconfig | 63 ++++++++++++++++++++
>   5 files changed, 252 insertions(+)
>   create mode 100644 board/milkv/duo/genimage.cfg
>   create mode 100755 board/milkv/duo/post-image.sh
>   create mode 100644 board/milkv/duo/readme.txt
>   create mode 100644 configs/milkv_duo_musl_riscv64_defconfig
>   create mode 100644 configs/milkv_duo_musl_riscv64_ion_defconfig
> 
> diff --git a/board/milkv/duo/genimage.cfg b/board/milkv/duo/genimage.cfg
> new file mode 100644
> index 0000000000..1fd74f845a
> --- /dev/null
> +++ b/board/milkv/duo/genimage.cfg
> @@ -0,0 +1,25 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"fip.bin",
> +			"boot.sd",
> +		}
> +	}
> +	size = 8M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}
> diff --git a/board/milkv/duo/post-image.sh b/board/milkv/duo/post-image.sh
> new file mode 100755
> index 0000000000..c58233003e
> --- /dev/null
> +++ b/board/milkv/duo/post-image.sh
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +
> +###########################################################
> +# File: post-image.sh
> +# Author: GP Orcullo <kinsamanka@gmail.com>
> +#         Hanyuan Zhao <zhaohy22@mails.tsinghua.edu.cn>
> +# Description: this sh will make the fip.bin and boot.sd,
> +#              then pack everything to an image file.
> +###########################################################
> +
> +FIPTOOL_OPTS="genfip ${BINARIES_DIR}/fip.bin \
> +	--MONITOR_RUNADDR=0x80000000 \
> +	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
> +	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
> +	--NAND_INFO=00000000 \
> +	--BL2=${BINARIES_DIR}/bl2.bin \
> +	--BLCP_IMG_RUNADDR=0x05200200 \
> +	--BLCP_PARAM_LOADADDR=0 \
> +	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
> +	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
> +	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin"
> +
> +if [ -f ${BINARIES_DIR}/cvirtos.bin ]; then
> +	FIPTOOL_OPTS="${FIPTOOL_OPTS} \
> +		--BLCP=${BINARIES_DIR}/empty.bin \
> +		--BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \
> +		--BLCP_2ND_RUNADDR=0x83f40000"
> +	echo "[Duo Post-Image fiptool.py] Integrating FreeRTOS"
> +fi
> +
> +${BINARIES_DIR}/fiptool.py ${FIPTOOL_OPTS}\

missing space before trailing '\', but maybe a Maintainer can apply
while fixing this,

> +> ${BINARIES_DIR}/fip.log 2>&1
> +if [ -f ${BINARIES_DIR}/fip.bin ]; then
> +	echo "[Duo Post-Image fiptool.py] > fip.bin generated!"
> +fi
> +
> +cp ${BINARIES_DIR}/u-boot.dtb ${BINARIES_DIR}/cv1800b_milkv_duo_sd.dtb
> +lzma -fk ${BINARIES_DIR}/Image
> +mkimage -f ${BINARIES_DIR}/multi.its ${BINARIES_DIR}/boot.sd
> +if [ -f ${BINARIES_DIR}/boot.sd ]; then
> +	echo "[Duo Post-Image] > boot.sd generated!"
> +fi
> +support/scripts/genimage.sh -c $(pwd)/board/milkv/duo/genimage.cfg
> +gzip -fk ${BINARIES_DIR}/sdcard.img
> +if [ -f ${BINARIES_DIR}/sdcard.img ]; then
> +	echo "[Duo Post-Image] > sdcard.img generated!"
> +fi > diff --git a/board/milkv/duo/readme.txt b/board/milkv/duo/readme.txt
> new file mode 100644
> index 0000000000..1623fa97c5
> --- /dev/null
> +++ b/board/milkv/duo/readme.txt
> @@ -0,0 +1,54 @@
> +Milk-V Duo (https://milkv.io/docs/duo/overview)
> +
> +Intro
> +=====
> +
> +Milk-V Duo is an ultra-compact embedded development platform
> +based on the rv64 CV1800B chip. It can run Linux and RTOS,
> +providing a reliable, cost-effective, and high-performance
> +platform for professionals, industrial ODMs, AIoT enthusiasts,
> +DIY enthusiasts, and creators.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make milkv_duo_musl_riscv64_defconfig
> +
> +The milkv_duo_musl_riscv64_defconfig will by default provide
> +the full 64MiB free RAM. If you want to build with memory
> +reserved for ION (generalized memory manager in linux, i.e.
> +some memory will be reserved for the camera algorithms), please try:
> +
> +    $ make milkv_duo_musl_riscv64_ion_defconfig
> +
> +For more information about the ION, please refer to
> +
> +https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/README.md?plain=1#L436
> +
> +Modify configuration if needed, e.g. add more packages to target:
> +
> +    $ make menuconfig
> +
> +Compile everything and build the SD card image:
> +
> +    $ make
> +

please drop from here...

> +To configure the linux kernel or u-boot:
> +
> +    $ make linux-menuconfig
> +
> +To rebuild something (e.g. linux):
> +
> +    $ make linux-rebuild
> +

...to here, since it's part of Buildroot manual and also
you should point "linux-menuconfig and uboot-menuconfig",
but it doesn't make sense to me, so yes please drop it,

> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image
> +called "sdcard.img" in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> diff --git a/configs/milkv_duo_musl_riscv64_defconfig b/configs/milkv_duo_musl_riscv64_defconfig
> new file mode 100644
> index 0000000000..4155ad1f57
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_defconfig
> @@ -0,0 +1,63 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_riscv_g=y
> +BR2_RISCV_ISA_RVC=y
> +
> +# Linux headers same as kernel 5.10 series
> +BR2_KERNEL_HEADERS_5_10=y
> +
> +# Using gcc13 and musl to have t-head's optimization and features

Here I would expand comment by pointing that glibc is not suitable and
why. It should be a gcc ICE, so maybe someone can fix or work it around
later with this indication.

> +BR2_GCC_VERSION_13_X=y
> +BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> +BR2_TARGET_OPTIMIZATION="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
> +
> +# opensbi
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-opensbi.git"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="ee78f99daf8ac5956c6bf95458983ead52142548"
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
> +BR2_TARGET_OPENSBI_FW_FDT_PATH=y
> +
> +# u-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_64mb"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_LINUX_KERNEL_LZMA=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# SD card image generating script
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
> +
> +# rootfs
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Packages for the sdcard image generating
> +BR2_PACKAGE_MILKV_DUO_LIBRARIES=y
> +BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
> +BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB=y
> +BR2_PACKAGE_MILKV_DUO_PINMUX=y
> +BR2_PACKAGE_MILKV_DUO_FEATURES=y
> +BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
> +
> +# Host packages for the sdcard image generating
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_LZMA_ALONE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> diff --git a/configs/milkv_duo_musl_riscv64_ion_defconfig b/configs/milkv_duo_musl_riscv64_ion_defconfig
> new file mode 100644
> index 0000000000..7af0d9a44d
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_ion_defconfig
> @@ -0,0 +1,63 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_riscv_g=y
> +BR2_RISCV_ISA_RVC=y
> +
> +# Linux headers same as kernel 5.10 series
> +BR2_KERNEL_HEADERS_5_10=y
> +
> +# Using gcc13 and musl to have t-head's optimization and features

Ditto,

> +BR2_GCC_VERSION_13_X=y
> +BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> +BR2_TARGET_OPTIMIZATION="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
> +
> +# opensbi
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-opensbi.git"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="ee78f99daf8ac5956c6bf95458983ead52142548"
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
> +BR2_TARGET_OPENSBI_FW_FDT_PATH=y
> +
> +# u-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_ion"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_LINUX_KERNEL_LZMA=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# SD card image generating script
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
> +
> +# rootfs
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Packages for the sdcard image generating
> +BR2_PACKAGE_MILKV_DUO_LIBRARIES=y
> +BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
> +BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
> +BR2_PACKAGE_MILKV_DUO_PINMUX=y
> +BR2_PACKAGE_MILKV_DUO_FEATURES=y
> +BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
> +
> +# Host packages for the sdcard image generating
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_LZMA_ALONE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

Except that it looks good to me so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested only both defconfigs]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Please keep my 2 tags above while send V4, thanks.
Also please wait for me or someone else to review the other patch of the
series before respinning.

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
