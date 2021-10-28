Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8B1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66BA61056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66BA61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71EB540101;
	Thu, 28 Oct 2021 21:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQn8eJo1sfRo; Thu, 28 Oct 2021 21:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3050E40486;
	Thu, 28 Oct 2021 21:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40D901BF317
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB1B403D7
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_ABv7xx3sHA for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 21:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 996D2403BD
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635456211;
 bh=F74h/8zJcRPaB0l7ToRk/dufTVmwaK6BrmIKjaCh1+Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AXw7i1fAeYuvSI8eJ9WnPIuywtn6VMjsTl3yz/PfNAtRWFDKs+GIkyHhSejzylaWW
 vaCqdZtYAt3wNonQFv1bKWeJw+VEdjkFWAERC4EwrboAPqCuSR2CJafUN8KrW3l+Lf
 k24cJSD0kf3AVtsfoA/zYR9GmtkkB14pnzcwfOI0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.38]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1mXRRa3vou-008vfd; Thu, 28
 Oct 2021 23:23:31 +0200
Date: Thu, 28 Oct 2021 23:23:29 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Julien Grossholtz <julien.grossholtz@openest.io>
Message-ID: <20211028232329.2580363a@gmx.net>
In-Reply-To: <20211028062617.2772874-2-julien.grossholtz@openest.io>
References: <20211028062617.2772874-1-julien.grossholtz@openest.io>
 <20211028062617.2772874-2-julien.grossholtz@openest.io>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:69qMFaXmZIVeN1EB5k7pMSCNbq0V3Voe6Fwxi3HMd64qJB3mxN9
 DPea7XKUiII9VbpD5DRvKmEyKRPN5V9vaRIY5Z8g2mg08gqR/t2BVQ03xTGj1aLlyWjRAYg
 Tcx7atyZ8ZUnu7U/AsDl4M0rglRKRkb1ImB1IYrN3PTyNZelTVWY9cxQdSjY6jLMrAgiwa0
 4M6tsYxFhJLi0Suf4YeYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sNk/6FmKWaM=:LayO5k8PPcY8UgC4QPUpKz
 d1L+e331FB8Hvhx3Bcy881R5+RBd2F4bwCpZLDD1E6XRdIOHRVpmKJd83Yb1GwEtPYripg0VU
 kBLCEg7mDxdPMANxu7nUXVGYxtsRfPHljWkTI2dkL11YTg/QdTZvTrU98hIJQyFUMAmPjLvxG
 epN8sTQBw6n6Vyq9mVjOcnBx2SIl/qqiFIPoU79Z/djtVYWFnAVMJN/0JZcSW4j9dOhDfGRgS
 K/msZBwAMpgCqSu3hwqTk3AYfVL7v2RGFK5FC9n7CBQkBNT5tZlmVFPS+CWxe/B87LCcIh/es
 pqcoOpo3MAzck6xBLCNj3kJZW3RjqQfUR8pU8CNXntdTBpMwWib6SO7EwOHqeqPTZ5sUoS8X7
 Paug0wDg2Y/bltzMMu1IDYBEa17Y96vhjPKgZWAV5v71Q1zn/W+Rii0NLxwLXTokPHNx9YxTa
 ak6dmbBhP1iuwsIeHPtmNzhlADb0F+q8SQhWxJAockEi7GeoX60CdGCg271WJpXbS7wexJbe+
 4wd1IvjK9osF6wMDNgBRcZ9WJGxRPuCqpFNZq5Q5QIbfW6kn7pAKjUe7WUU0FzNHFyLOG8S+W
 JC8OOr/etqSWrSTqbw8n10yoTHEfwdxntN0pBhQrrblcVsJDHfNzjdLSAfUP7TYWFB2Efxt5Q
 SWfnw2cO24kQfGx5QWNpRuQSb6VZWaGPxlMFRTTcDzLm9gpPI0caJI+BNKRzOsl+Ma81+Pjoc
 bb7N4V2oUQpSOdczoGFcSQkOJJT35P1nuO2uo/vr10UHE5h7AxBWPWgXVjVXt/wTuAx2+UiAy
 MCJ5kXU/vQ+y4pzaWw8IobmD4m3iNkU91823tsd6F84XOwGFqzZfSsTy6yd4Nrc2FUqiC5XZA
 9Cpdb/iUtBdNmcsbabFIg0+u7xeeO8csF8w6HKWNbMPFXluuNjylDH4dx8DOmi8pm3Tt5IfcG
 U2BFTxueXFP90J9nXjHOxDEOvZYz0oQU9J0s1iUll1YHqKG9DuiAOl9QqICj4NMM4beshKax2
 afg1wz61Edv8B0CeqzpD6kNNntjpStoUO3jNmkoFOYHMCb8uYJRlPsv0fqQ0F84WRDnH2E86p
 prA1MMEOeq+Hc4=
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: add Raspberry Pi
 Zero 2 W
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

thanks for (the fast) contribution of the new rpi variant, comments below...

On Thu, 28 Oct 2021 08:26:17 +0200, Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> The Raspberry-Pi Zero 2 W is an affordable single board computer. It is
> a more powerful drop-in replacement for the Raspberry Pi Zero W.
>
> The board incorporates an Raspberry-Pi RP3A0 system-in-package (SiP) with
> a Broadcom BCM2710A1 and 512MB LPDDR2 SDRAM. The CPU is a quad-core 1Ghz
> 64-bit Arm Cortex-A53. As for other Raspberry-Pis it also provides
> 2.4GHz 802.11 b/g/n Wifi, Bluetooth 4.2 and BLE.
>
> The BCM2710 cpu is similar to the Raspberry-Pi 3 and the form factor is
> the same as the previous Zero W. Therefore, this board support uses the
> Pi 3's Linux configuration and the original Zero W device-tree.
>
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  board/raspberrypi/config_zero2.txt            | 29 ++++++++++++++
>  .../raspberrypi/genimage-raspberrypizero2.cfg | 31 +++++++++++++++
>  board/raspberrypi/readme.txt                  |  5 +++
>  board/raspberrypizero2                        |  1 +
>  configs/raspberrypizero2_defconfig            | 38 +++++++++++++++++++
>  5 files changed, 104 insertions(+)
>  create mode 100644 board/raspberrypi/config_zero2.txt
>  create mode 100644 board/raspberrypi/genimage-raspberrypizero2.cfg
>  create mode 120000 board/raspberrypizero2
>  create mode 100644 configs/raspberrypizero2_defconfig
>
> diff --git a/board/raspberrypi/config_zero2.txt b/board/raspberrypi/config_zero2.txt
> new file mode 100644
> index 0000000000..9e6b7f5ccf
> --- /dev/null
> +++ b/board/raspberrypi/config_zero2.txt
> @@ -0,0 +1,29 @@
> +# Please note that this is only a sample, we recommend you to change it to fit
> +# your needs.
> +# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
> +# See http://buildroot.org/manual.html#rootfs-custom
> +# and http://elinux.org/RPiconfig for a description of config.txt syntax
> +
> +start_file=start.elf
> +fixup_file=fixup.dat
> +
> +kernel=zImage
> +
> +# To use an external initramfs file
> +#initramfs rootfs.cpio.gz
> +
> +# Disable overscan assuming the display supports displaying the full resolution
> +# If the text shown on the screen disappears off the edge, comment this out
> +disable_overscan=1
> +
> +# How much memory in MB to assign to the GPU on Pi models having
> +# 256, 512 or 1024 MB total memory
> +gpu_mem_256=100
> +gpu_mem_512=100
> +gpu_mem_1024=100
> +
> +# fixes rpi (3B, 3B+, 3A+, 4B ,zero W and zero 2) ttyAMA0 serial console
> +dtoverlay=miniuart-bt
> +
> +# enable autoprobing of Bluetooth driver without need of hciattach/btattach
> +dtoverlay=krnbt=on
> diff --git a/board/raspberrypi/genimage-raspberrypizero2.cfg b/board/raspberrypi/genimage-raspberrypizero2.cfg
> new file mode 100644
> index 0000000000..f76256ef8a
> --- /dev/null
> +++ b/board/raspberrypi/genimage-raspberrypizero2.cfg
> @@ -0,0 +1,31 @@
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      "bcm2708-rpi-zero-w.dtb",
> +      "rpi-firmware/bootcode.bin",
> +      "rpi-firmware/cmdline.txt",
> +      "rpi-firmware/config.txt",
> +      "rpi-firmware/fixup.dat",
> +      "rpi-firmware/start.elf",
> +      "rpi-firmware/overlays",
> +      "zImage"
> +    }
> +  }
> +  size = 32M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext4"
> +  }
> +}
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 98c44d80a1..7d134d17fb 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -28,6 +28,10 @@ For model Zero (model A+ in smaller form factor):
>
>    $ make raspberrypi0_defconfig
>
> +For model Zero 2 (model B3 in smaller form factor):
> +
> +  $ make raspberrypizero2_defconfig
> +
>  For model 2 B:
>
>    $ make raspberrypi2_defconfig
> @@ -76,6 +80,7 @@ After building, you should obtain this tree:
>      output/images/
>      +-- bcm2708-rpi-b.dtb           [1]
>      +-- bcm2708-rpi-b-plus.dtb      [1]
> +    +-- bcm2708-rpi-zero-w.dtb      [1]
>      +-- bcm2709-rpi-2-b.dtb         [1]
>      +-- bcm2710-rpi-3-b.dtb         [1]
>      +-- bcm2710-rpi-3-b-plus.dtb    [1]
> diff --git a/board/raspberrypizero2 b/board/raspberrypizero2
> new file mode 120000
> index 0000000000..fcdafc81ed
> --- /dev/null
> +++ b/board/raspberrypizero2
> @@ -0,0 +1 @@
> +raspberrypi
> \ No newline at end of file
> diff --git a/configs/raspberrypizero2_defconfig b/configs/raspberrypizero2_defconfig
> new file mode 100644
> index 0000000000..81d92ee6b7
> --- /dev/null
> +++ b/configs/raspberrypizero2_defconfig
> @@ -0,0 +1,38 @@
> +BR2_arm=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> +
> +# The zero2 uses the same processor as the Raspberry Pi 3 with the same
> +# form-factor as the zero-w

For the dts not the form-factor but the board layout/components
are important...

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"

With commit [1] a new bcm2710-rpi-zero-2.dtb is available...

Seems time for an rpi linux-kernel/rpi-firmware update to support
the new hardware...

Otherwise the patch looks good...

Sorry no rpi-zero-2-w hardware for testing ;-)

Regards,
Peter

[1] https://github.com/raspberrypi/linux/commit/84dc624be6ae704fdb3c413b7d86315cf49fbb0b

> +
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
> +BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2/config_zero2.txt"
> +
> +# MicroSD images generation tools
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2/post-image.sh"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
