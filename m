Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A276BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 22:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4163760A92;
	Wed,  2 Feb 2022 22:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVJOgHIaxXKw; Wed,  2 Feb 2022 22:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3789B60AEB;
	Wed,  2 Feb 2022 22:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B74C61BF5DE
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3497402D8
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6hN1gnDRMGy for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 22:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE19402B8
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 22:28:45 +0000 (UTC)
Received: from [77.244.183.192] (port=65038 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nFO7H-0001Nw-8c; Wed, 02 Feb 2022 23:28:43 +0100
Message-ID: <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
Date: Wed, 2 Feb 2022 23:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220202165555.3497977-1-nealf@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220202165555.3497977-1-nealf@xilinx.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Cc: Neal Frager <nealf@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

thank you for your effort and for sending a patch in the format that is
the most convenient for other people to review your code.

Your work seems generally in a good shape. I have several remarks, see
below, but nothing really problematic.

On 02/02/22 17:55, Neal Frager wrote:
> Signed-off-by: Neal Frager <nealf@xilinx.com>

Maybe you can add more details before the Signed-off-by line, suah as
"Also add a defconfig for ZCU102", "remove U-Boot and ATF patches not
upstream"...

First issue: this defconfig does not build on my PC:

$ git clean -xdf && make zynqmp_zcu106_defconfig && verynice make
package/pkg-generic.mk:266: *** BR2_GLOBAL_PATCH_DIR contains
nonexistent directory board/zynqmp/patches/.  Stop.
$

As you removed all patches (which is sooo gooood!) you now have to
remove the BR2_GLOBAL_PATCH_DIR.

> ---
>  board/zynqmp/genimage.cfg                     |   1 +
>  ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 -------
>  ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------
>  ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------
>  ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 -------
>  ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
>  configs/zynqmp_zcu102_defconfig               |  35 ++++
>  configs/zynqmp_zcu106_defconfig               |  15 +-
>  8 files changed, 44 insertions(+), 484 deletions(-)
>  delete mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
>  delete mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
>  delete mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
>  delete mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
>  delete mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>  create mode 100644 configs/zynqmp_zcu102_defconfig
> 
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
> index ed202f4550..557364e124 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -3,6 +3,7 @@ image boot.vfat {
>  		files = {
>  			"boot.bin",
>  			"u-boot.bin",
> +			"u-boot.itb",

Is u-boot.bin still needed, when we have the .itb?

> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index bee7c1daf7..3a6947e1e8 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -1,11 +1,11 @@
>  BR2_aarch64=y
>  BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> @@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"

As far as I remember (but I ask the core developers to confirm or deny),
from the Buildroot perspective upstream versions are generally preferred
even when they lack some non-fundamental features (e.g.: some drivers
are missing) that are in vendor forks.

Is there a reason for switching ATF to the Xilinx fork? In this case
explain it in the commit message, otherwise stay on the upstream repo,
upgrading to the latest [working] release.

A similar question applies to kernel and U-Boot: is it possible to
switch to upstream releases?

>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"

The "_virt" suffix looks strange to the uninitiated. IIRC it is the
main, unified defconfig for all Xilinx kernels. Please add a line in the
commit message so it is clear for everybody's benefit.

>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2021.2.bin"

Please point to a tag, not a branch, or the file could be modified in
the future, resulting in a non-reproducible build. Use:
https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin

Ouch, now the build I had started ended with a new error:

>>> arm-trusted-firmware xlnx_rebase_v2.4_2021.2 Building
...
  AR      .../build/zynqmp/release/lib/libc.a
  LD      .../build/zynqmp/release/bl31/bl31.elf
.../aarch64-buildroot-linux-uclibc-ld:
.../build/zynqmp/release/bl31/bl31.elf section `coherent_ram' will not
fit in region `RAM'
.../aarch64-buildroot-linux-uclibc-ld: BL31 image has exceeded its limit.
.../aarch64-buildroot-linux-uclibc-ld: region `RAM' overflowed by 1 byte

I have run my build on Ubuntu 18.04 with your patch applied on current
master.

I assume you have built and run it successfully. Any idea on why it
fails on a different host?

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
