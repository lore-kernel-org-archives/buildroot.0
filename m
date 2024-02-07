Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E09FC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AC180C29;
	Wed,  7 Feb 2024 11:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TxpwsPgx0RW; Wed,  7 Feb 2024 11:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F64A80C1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F64A80C1D;
	Wed,  7 Feb 2024 11:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7431BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A52C80C1D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXp-X9WCIzt9 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F15780B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F15780B6F
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F15780B6F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:41:03 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XgIWrnGnLWf5XXgIWrkUaU; Wed, 07 Feb 2024 12:41:01 +0100
Message-ID: <9957d4b8-944a-4314-a8f4-471446deda52@benettiengineering.com>
Date: Wed, 7 Feb 2024 12:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <20240207074950.2049-1-hanyuan-z@qq.com>
 <tencent_7C8E1E802D63F62F30CBE54D84FFAB120907@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_7C8E1E802D63F62F30CBE54D84FFAB120907@qq.com>
X-CMAE-Envelope: MS4xfC3yxsFdfyfYFAABj6JA4wZSkFVvO09mkkqUxs2sABplb5M7gasXWKfZSHEVlyxOI0ZToEDipsm8aeJ8VQGRWYTfMgoimsWWB3CFLNa2oz47zK46WycZ
 ZXweddV/M9P6x4oKrzdrCwWb7aH1u+hIiB8Ug6x+bJ+HnU4NHCbFwKcHctXYe1vD5ogK+ByTSHelfPIuPQZJNu9XKK/Bs18vb47aK7tEX9Y+3LL0BtXLKM4I
 ghgtixUHntb3pRO/GGC1nMV19Sm3jAdXHEIvMpuURPbaYjJxEoI5+mfm2tr30dPVl+adHjlNz233VAeSAEKdHeOrP6LsDIPpyJ7v5Ma7bk6ZB/R0xIsonSbt
 dROQTlIP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707306061; bh=rvD3Fni6o8tnAIMvISD/TnEbu38GoYMokOW9yYkWQOQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XkMl/5kgz9K/1lSy29sSnpFRYP5ZOQhbjlNDYr6qo+aUx3HnzNYSI1Sb8d1hIIaYv
 EIms/MmIAlz2mlaYAU5J0EL1SNOihVfO+UnIcGdbeUuoVqDp2KInAbpAOB31jXYfdU
 lxctt+rYFFw3dQ9C2ZoYEaP2p6HP3VQ8jFeu8fW+QTiIqGK2efdiJZt5HSHNQziRaR
 6J53B+N5//MfMH1hHb2P2co92IBcLwW18T/zHbhYK4p4nTVEZtlW+j7eYvsy0yCKrc
 fH9XEjaBI+mJgsk/DP6J3sVJhcQBoNjiyOnnoRBxnsspLX+Fkc+THFb6b76ZxxO948
 0YP2mJLfzJtig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XkMl/5kg
Subject: Re: [Buildroot] [PATCH v4 3/3] configs/milkv_duo: new defconfig
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

On 07/02/24 08:49, Hanyuan Zhao wrote:
> Milk-V Duo is an ultra-compact embedded RISC-V development platform based on the CV1800B chip.
> It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
> for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.
> 
> https://milkv.io/duo
> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Build Tested only both defconfigs]
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> ---
> This patch depends on:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=393667
> to work-around a gcc bug on htop package.
> ---
> Changes v3 -> v4:
>    - Lint the code
>    - Add more comments about gcc ICE in defconfig
>    - Remove unnecessary comments
> 
> Changes v2 -> v3:
>    - Remove BR2_TOOLCHAIN_BUILDROOT_CXX in defconfig
>    - Refactor post-image.sh
>    - Provide more info about ION and camera memory use
> 
> Changes v1 -> v2:
>    - Refactor defconfig
>    - Set the boot partition size to 8M
>    - Refactor the image generating logic
> ---
>   board/milkv/duo/genimage.cfg                 | 25 ++++++++
>   board/milkv/duo/post-image.sh                | 47 ++++++++++++++
>   board/milkv/duo/readme.txt                   | 46 ++++++++++++++
>   configs/milkv_duo_musl_riscv64_defconfig     | 67 ++++++++++++++++++++
>   configs/milkv_duo_musl_riscv64_ion_defconfig | 67 ++++++++++++++++++++
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
> index 0000000000..3856d977df
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
> +${BINARIES_DIR}/fiptool.py ${FIPTOOL_OPTS} \
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
> +fi
> diff --git a/board/milkv/duo/readme.txt b/board/milkv/duo/readme.txt
> new file mode 100644
> index 0000000000..bb05050245
> --- /dev/null
> +++ b/board/milkv/duo/readme.txt
> @@ -0,0 +1,46 @@
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
> index 0000000000..0773924072
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_defconfig
> @@ -0,0 +1,67 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_riscv_g=y
> +BR2_RISCV_ISA_RVC=y
> +
> +# Linux headers same as kernel 5.10 series
> +BR2_KERNEL_HEADERS_5_10=y
> +
> +# Since gcc 13 and later versions with the t-head's optimizations
> +# below are currently not well compatible with glibc, which will
> +# throw gcc ICE (Internal Compiler Error) when the buildroot is
> +# compiling the glibc, so we choose musl used by the official sdk
> +# until this ICE gets fixed.
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
> index 0000000000..18458726d9
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_ion_defconfig
> @@ -0,0 +1,67 @@
> +# Architecture
> +BR2_riscv=y
> +BR2_riscv_g=y
> +BR2_RISCV_ISA_RVC=y
> +
> +# Linux headers same as kernel 5.10 series
> +BR2_KERNEL_HEADERS_5_10=y
> +
> +# Since gcc 13 and later versions with the t-head's optimizations
> +# below are currently not well compatible with glibc, which will
> +# throw gcc ICE (Internal Compiler Error) when the buildroot is
> +# compiling the glibc, so we choose musl used by the official sdk
> +# until this ICE gets fixed.
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

Everything looks good to me now, so let's wait for some Maintainer to
take care of this patch along with the others in the patchset.

Best regards!
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
