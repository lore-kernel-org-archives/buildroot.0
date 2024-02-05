Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E9AC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D231040468;
	Mon,  5 Feb 2024 17:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D231040468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJb3-SzVX9uf; Mon,  5 Feb 2024 17:25:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3237A40AB8;
	Mon,  5 Feb 2024 17:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3237A40AB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C12811BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97D3040AB8
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97D3040AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07bQxV6No5jf for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:25:49 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E2640468
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E2640468
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X2j4r2P0Zl81fX2j4rWHX9; Mon, 05 Feb 2024 18:25:46 +0100
Message-ID: <d2a79053-ad5c-4596-9e03-8abc1811eacb@benettiengineering.com>
Date: Mon, 5 Feb 2024 18:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <tencent_267933F59FABC482631A00CC38E64BD83205@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_267933F59FABC482631A00CC38E64BD83205@qq.com>
X-CMAE-Envelope: MS4xfLHbVK0imdjZ6rekhJK0u4I2/5MlecFdX1Me6ZPpNii+MfdmH5e0QGvTx89AAnO/KHKv7Xy5CVMcv5u0sIW/LwWZTCbQ5zQaW/ygMxzZgDWHixb38tw5
 +er3vUzeFOKMEgQLjV4XKYhsdVq+lDrVRRyt03+ccgRuXgs+vmkMivB2ReW6/+XXrtPVD4QugWXifbzdcsXNYPVofiZIT7w59fCb4mKfb7KYsfS+xgnHJyS4
 QN0QTJ/k3IKveyUNqqdvt8UqB8WuHsKZ79lnfW2a8gbsSw/kSjKnxLiBtW7kI6HcSCM+ZQj0j8j00P+WZi0W2xcdf1MpNMLL04tCpe/T0H/L02zoU8ocdCK5
 kBKmCdQ8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707153946; bh=5veiX1GcFKwIlrBb0wFtGcE3nxTL5iWTi62EUoSbaKA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=S77g6sPlAp09WRffW049gyudcOjTdyCMkQUaT7iWrlJSJ/UFfJ8IFFhJIWkBpcgJK
 +jckakvUKS5ouLHYYmUX9+HWDEc56Kux7n7bKKPYw91+M2raKPZGL2kegkWx4ekCSA
 u+GiPItPBYNYqVGzoisGTY9CjnPr+fHdDocO7QJ3ptSt0dRFxyFWpZtBL/EP16GrVW
 c2v27sK2JdiXEskz9+eiy5jSnO3S5YGOr4Fh0XCm+WNkhm0J7eRzhtcGNHVUruXnGj
 oRIyiPPF7bRHrcEc8oLOuaR1Yj/ot4Zt5AYlwfUuv66zgyS3pRJ2ru9pCmM2UuflV2
 xPEOH81lPC37w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S77g6sPl
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/milkv_duo: new defconfig
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

thank for contributing,
one important note is to swap Patch 1/2 and 2/2. This is because they
are bisectable this way since on Patch 1/2 you enable packages appearing
in Patch 2/2, also,

On 02/12/23 03:57, hanyuan wrote:
> Milk-V Duo is an ultra-compact embedded development platform based on the CV1800B chip.
> It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
> for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.

can you please provide the board product webpage URL here?
And also some ION indications too?

> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> ---
>   board/milkv/duo/genimage.cfg                 | 25 ++++++++
>   board/milkv/duo/post-image.sh                | 58 ++++++++++++++++++
>   board/milkv/duo/readme.txt                   | 49 +++++++++++++++
>   configs/milkv_duo_musl_riscv64_defconfig     | 63 ++++++++++++++++++++
>   configs/milkv_duo_musl_riscv64_ion_defconfig | 63 ++++++++++++++++++++
>   5 files changed, 258 insertions(+)
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
> index 0000000000..6dc6d7853b
> --- /dev/null
> +++ b/board/milkv/duo/post-image.sh
> @@ -0,0 +1,58 @@
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
> +if [ -f ${BINARIES_DIR}/cvirtos.bin ]; then
> +	${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
> +	--MONITOR_RUNADDR=0x80000000 \
> +	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
> +	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
> +	--NAND_INFO=00000000 \
> +	--BL2=${BINARIES_DIR}/bl2.bin \
> +	--BLCP_IMG_RUNADDR=0x05200200 \
> +	--BLCP_PARAM_LOADADDR=0 \
> +	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
> +	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
> +	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin \

All this if statement is redundant with the else part.
Can you add a variable like:
FIPTOOL_ARGUMENTS = genfip ${BINARIES_DIR}/fip.bin \
	--MONITOR_RUNADDR=0x80000000 \
	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF 
\
	--NAND_INFO=00000000 \
	--BL2=${BINARIES_DIR}/bl2.bin \
	--BLCP_IMG_RUNADDR=0x05200200 \
	--BLCP_PARAM_LOADADDR=0 \
	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin \

and then you add or not the remaining BLCP* variables below and execute
${BINARIES_DIR}/fiptool.py ${FIPTOOL_ARGUMENTS}

> +	--BLCP=${BINARIES_DIR}/empty.bin \
> +	--BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \
> +	--BLCP_2ND_RUNADDR=0x83f40000 \
> +	> ${BINARIES_DIR}/fip.log 2>&1
> +	if [ -f ${BINARIES_DIR}/fip.bin ]; then
> +		echo "[Duo Post-Image fiptool.py] FreeRTOS integrated"
> +	fi

Then this nested if statement and..

> +else
> +	${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
> +	--MONITOR_RUNADDR=0x80000000 \
> +	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
> +	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
> +	--NAND_INFO=00000000 \
> +	--BL2=${BINARIES_DIR}/bl2.bin \
> +	--BLCP_IMG_RUNADDR=0x05200200 \
> +	--BLCP_PARAM_LOADADDR=0 \
> +	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
> +	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
> +	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
> +	> ${BINARIES_DIR}/fip.log 2>&1
> +	if [ -f ${BINARIES_DIR}/fip.bin ]; then
> +		echo "[Duo Post-Image fiptool.py] No FreeRTOS integrated"
> +	fi

..this are redundant too. Can you provide a single if-else-fi statement
outside the main if statement...

> +fi

... here?

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
> +fi
> diff --git a/board/milkv/duo/readme.txt b/board/milkv/duo/readme.txt
> new file mode 100644
> index 0000000000..a483a73a19
> --- /dev/null
> +++ b/board/milkv/duo/readme.txt
> @@ -0,0 +1,49 @@
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
> +reserved for ION, please try:
> +
> +    $ make milkv_duo_musl_riscv64_ion_defconfig

Can you please provide more informations about ION here? Or a link to
it?

> +
> +Modify configuration if needed, e.g. add more packages to target:
> +
> +    $ make menuconfig
> +
> +Compile everything and build the SD card image:
> +
> +    $ make
> +
> +To configure the linux kernel or u-boot:
> +
> +    $ make linux-menuconfig
> +
> +To rebuild something (e.g. linux):
> +
> +    $ make linux-rebuild
> +
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
> index 0000000000..4f5180891f
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
> +BR2_GCC_VERSION_13_X=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Is CXX needed by any package selected here?

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

here you need:
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

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
> index 0000000000..7875853711
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
> +BR2_GCC_VERSION_13_X=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
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

here you need:
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

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

For the rest the patch looks good and builds fine using utils/docker-run 
except package htop that fails to build due to gcc ICE 109809 for which
I've sent a patch:
https://patchwork.ozlabs.org/project/buildroot/list/?series=393667

So this patchset depends on patchset above for htop gcc ICE.

Anyway a V2 must be sent with BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y fix.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
