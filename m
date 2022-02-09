Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2DAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F46B82FF9;
	Wed,  9 Feb 2022 19:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RU7-Jf-I_NB; Wed,  9 Feb 2022 19:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5528182FBE;
	Wed,  9 Feb 2022 19:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5FA1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5F782FBE
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YcALFKk3XlY for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:38:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69AA682F84
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:38:09 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Hsn0nQrubks1JHsn1nIUQc; Wed, 09 Feb 2022 20:38:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644435487; bh=QUqLjkcCq6+wTPFON+yfZfvsp94r7nnfUA+4Fm8l1oE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=X6MXQOhL58upwt3Zo/c7mXUTilXd4lAdwaXFzQ9SbHlaahvkS2Fbte+6AbAkufh9N
 TeJ07jSkd5rX5LihAwUQ8Nz5BaiQuoQ13TyWLZmb48gu4DMDY7YwehQAC3LEDqtzdT
 zbFLpp9nKOqgVTItkLdT9S0TWymcwJYlwaTCri17Il76gLyQ3TjwDJLRyWRn2UoIIt
 BUF16IEG/lmMrhPg5mtqCh9y7liA+qR2LVlpxYyBAS7lEWNA2NGw+i5TqCnVxqs6sX
 r4d/unkO1uUPjMwmt36roVrHBUMUq7cC5tSoozR5JZwaHBQpC1UKX11r6q56VvInpM
 XUJjAqMtZtpSA==
Message-ID: <6de61d14-67ba-2c21-ad51-b23690420009@benettiengineering.com>
Date: Wed, 9 Feb 2022 20:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220209180306.2629180-1-neal.frager@xilinx.com>
 <20220209180306.2629180-2-neal.frager@xilinx.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220209180306.2629180-2-neal.frager@xilinx.com>
X-CMAE-Envelope: MS4wfFC78XI/raywMZJ5X9hoK8PkjpjZ9gnBssSu+Wo8YSJKDBxjlyUh2gL6kk2vbGoOi3bVmNlHdUGlqJ3XnBLdXVr2jA/SkF0Nr16cL7ApZ5OWXmY3eJce
 VStj3M9lTx5wqE1w0BkSDhUMo4P/SPVwdmkEnz1K+jC8vMRM0vmSmE+gcu19wviWbdb26uUrI2mmam4zZRqeQKtSu+zOFdYpDyIE9DG7/n4puAc7+wFqkoC7
 uCGMM5IY/TBpVVx3776Ja8HRU+t8mkadmdKT+oYallDVBGTreDr1IazG+AzKCYP1KNlHtWcWgTyAvUJN2DTKkQ==
Subject: Re: [Buildroot] [PATCH v3 2/2] add configs/zynqmp_zcu102_defconfig
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
Cc: luca@lucaceresoli.net, michal.simek@xilinx.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 09/02/22 19:03, Neal Frager wrote:
> This patch:
> - adds support for Xilinx ZCU102 evaluation board
> - ZCU102 features can be found here:
> - https://www.xilinx.com/products/boards-and-kits/zcu102.html

^^^ please remove the dash

> 
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

Here like on previous patch add:
---
V1->V2:
*
etc.

> ---
>   board/zynqmp/readme.txt         | 23 +++++++++++++------
>   configs/zynqmp_zcu102_defconfig | 39 +++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+), 7 deletions(-)
>   create mode 100644 configs/zynqmp_zcu102_defconfig
> 
> diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
> index da37f4ccc9..0dc1793e03 100644
> --- a/board/zynqmp/readme.txt
> +++ b/board/zynqmp/readme.txt
> @@ -1,10 +1,19 @@
> -********************************
> -Xilinx ZCU106 board - ZynqMP SoC
> -********************************
> +******************************************
> +Xilinx ZCU102 / ZCU106 boards - ZynqMP SoC
> +******************************************
> +
> +This document describes the Buildroot support for the ZCU102 and ZCU106
> +boards by Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP).
> +It has been tested with the ZCU102 and ZCU106 production boards.
> +
> +Evaluation board features can be found here with the links below.
> +
> +ZCU102:
> +https://www.xilinx.com/products/boards-and-kits/zcu102.html
> +
> +ZCU106:
> +https://www.xilinx.com/products/boards-and-kits/zcu106.html
>   
> -This document describes the Buildroot support for the ZCU106 board by
> -Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). It has been
> -tested with the EK-U1-ZCU106-ES2 pre-production board.
>   
>   How to build it
>   ===============
> @@ -32,7 +41,7 @@ After building, you should get a tree like this:
>       +-- rootfs.ext4 -> rootfs.ext2
>       +-- sdcard.img
>       +-- system.dtb -> zynqmp-zcu106-revA.dtb
> -    +-- u-boot.bin
> +    +-- u-boot.itb
>       `-- zynqmp-zcu106-revA.dtb
>   
>   How to write the SD card
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> new file mode 100644
> index 0000000000..acffda64bf
> --- /dev/null
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -0,0 +1,39 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> +BR2_TARGET_UBOOT_ZYNQMP=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/pm_cfg_obj.c"
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Please send a V4 with the few requested changes and add in commit log 
like this:
```
Signed-off-by: Neal Frager <neal.frager@xilinx.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: only build tested]
```

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
