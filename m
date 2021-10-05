Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6440360F23
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6440360F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D67E400EE;
	Tue,  5 Oct 2021 15:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qr0ryjqqcuG; Tue,  5 Oct 2021 15:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5948400FE;
	Tue,  5 Oct 2021 15:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 016191BF385
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E523B607A1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB1BL30Awa0F for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 15:42:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48934600CD
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 15:42:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7244E20009;
 Tue,  5 Oct 2021 15:42:24 +0000 (UTC)
Date: Tue, 5 Oct 2021 17:42:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211005174223.6efc9aa0@windsurf>
In-Reply-To: <20211005145205.27617-1-kory.maincent@bootlin.com>
References: <20211005145205.27617-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/octavo_osd32mp1_brk_defconfig:
 Add support for octavo brk board
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

Hello,

Thanks for this work. First (minor) comment, the commit title should be:

configs/<blabla without _defconfig prefix>: new defconfig

On Tue,  5 Oct 2021 16:52:04 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> Very similar to the other stm32mp157-based boards. We use the TF-A, U-boot
> and Linux version from ST used by the Octavo constructor.

And here you add a sentence with the name of the board.

> 
> Reference:
>     https://octavosystems.com/octavo_products/osd32mp1-brk/
> 
> The device tree blobs come from Octavo System:
>     https://github.com/octavosystems/OSD32MP1-BRK-device-tree.git
> 
> The uboot patches come from Octavo System:
>     https://github.com/octavosystems/BRK_Developer_Package_patches/tree/master/u-boot-v2020.01-stm32mp
> 
> It is licensed under BSD 2-Clause.

What do you refer to "It" here ?


> +N:	Kory Maincent <kory.maincent@bootlin.com

Typo.

> +F:	board/octavo/brk/
> +F:	configs/octavo_osd32mp1_brk_defconfig

Should it be "octavosystems" instead of "octavo" ? This is a question,
I agree "octavo" is shorter.

> +
>  N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
>  F:	package/bcusdk/
>  F:	package/libpthsem/
> diff --git a/board/octavo/brk/genimage.cfg b/board/octavo/brk/genimage.cfg
> new file mode 100644
> index 0000000000..03fba8daf0
> --- /dev/null
> +++ b/board/octavo/brk/genimage.cfg
> @@ -0,0 +1,23 @@
> +image sdcard.img {
> +	hdimage {
> +		gpt = "true"
> +	}
> +
> +	partition fsbl1 {
> +		image = "%ATFBIN%"
> +	}
> +
> +	partition fsbl2 {
> +		image = "%ATFBIN%"
> +	}

Do you need this custom genimage.cfg file? If so, why isn't %ATFBIN%
hardcoded? Either you have a board-specific genimage.cfg that has all
values hardcoded, or you share the genimage.cfg file with other boards,
and it gets "tweaked" by the post-image script. But mixing both is odd.

> diff --git a/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts b/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
> new file mode 100644
> index 0000000000..d763b48945
> --- /dev/null
> +++ b/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts

That's a lot of Device Tree stuff. Since they have it in a Git
repository, I was wondering if we couldn't do something better. But we
don't really have a good mechanism today to download Device Tree files
from a Git repo, and feed them into the TF-A/U-Boot/Linux build.

What do others think about this?

> diff --git a/board/octavo/brk/linux.config b/board/octavo/brk/linux.config
> new file mode 100644
> index 0000000000..1a5a088de0

Where does this file comes from? It seems to have a lot of "useless"
things enabled.


> +CONFIG_NFC=m
> +CONFIG_NFC_DIGITAL=m
> +CONFIG_NFC_NCI=m
> +CONFIG_NFC_NCI_SPI=m
> +CONFIG_NFC_NCI_UART=m
> +CONFIG_NFC_HCI=m
> +CONFIG_NFC_SHDLC=y
> +CONFIG_NFC_S3FWRN5_I2C=m

Like meh, all these NFC stuff ?


> +CONFIG_AD525X_DPOT=y
> +CONFIG_AD525X_DPOT_I2C=y
> +CONFIG_ICS932S401=y
> +CONFIG_APDS9802ALS=y
> +CONFIG_ISL29003=y

These drivers are all used ?

> +CONFIG_EEPROM_AT24=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_CHR_DEV_SG=y
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_NETDEVICES=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_B53_SPI_DRIVER=m
> +CONFIG_B53_MDIO_DRIVER=m
> +CONFIG_B53_MMAP_DRIVER=m
> +CONFIG_B53_SRAB_DRIVER=m
> +CONFIG_B53_SERDES=m
> +CONFIG_NET_DSA_BCM_SF2=m
> +CONFIG_BCMGENET=m
> +CONFIG_SYSTEMPORT=m
> +CONFIG_MACB=y
> +CONFIG_FTGMAC100=m
> +CONFIG_HIX5HD2_GMAC=y
> +CONFIG_MVMDIO=y
> +CONFIG_KS8851=y
> +CONFIG_SMSC911X=y

Why all these networking options? Like MVMDIO, which is for Marvell
platforms ?

Please review this Linux kernel configuration file.

> diff --git a/board/octavo/brk/overlay/boot/extlinux/extlinux.conf b/board/octavo/brk/overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..025eff9354
> --- /dev/null
> +++ b/board/octavo/brk/overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label stm32mp157c-dk2-buildroot

Copy/paste issue here.

> +  kernel /boot/zImage
> +  devicetree /boot/stm32mp157c-osd32mp1-brk.dtb
> +  append root=/dev/mmcblk0p4 rootwait
> diff --git a/board/octavo/brk/post-image.sh b/board/octavo/brk/post-image.sh
> new file mode 100755
> index 0000000000..fc2fbd1134
> --- /dev/null
> +++ b/board/octavo/brk/post-image.sh

Do we need this script at all ?


> diff --git a/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch b/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch
> new file mode 100644
> index 0000000000..4ddfc5b982
> --- /dev/null
> +++ b/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch

0006 ? Why does it start at 0006 ?

Also, please use BR2_GLOBAL_PATCH_DIR, so put these patches in
board/octavo/brk/patches/uboot/.

> @@ -0,0 +1,1989 @@
> +From 2efe6be348489dbdc856947eda6e5187494aefc8 Mon Sep 17 00:00:00 2001
> +From: Martin Lesniak <martin.lesniak@st.com>
> +Date: Thu, 27 Aug 2020 14:44:46 -0500
> +Subject: [PATCH 1/4] osd32mpp1 BRK board added

Generate the patches with "git format-patch -N", because the 1/4 here
doesn't make any sense.

> +
> +New board definition for Octavo's OSD32MP1-BRK
> +
> +Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>

We need your Signed-off-by added on the patches.


> diff --git a/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch b/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch
> new file mode 100644
> index 0000000000..ffa9505dad
> --- /dev/null
> +++ b/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch

0007, why ?

> @@ -0,0 +1,976 @@
> +From a473ef7f04c60d7a4a878a50890730cb0e788b40 Mon Sep 17 00:00:00 2001
> +From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
> +Date: Tue, 22 Sep 2020 17:30:17 -0500
> +Subject: [PATCH 2/4] Add OSD32MP1-BRK features and fix formatting

Drop 2/4.

Signed-off-by needed.

Also, indicate where the patch comes from.

> diff --git a/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch b/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch
> new file mode 100644
> index 0000000000..522a55f300
> --- /dev/null
> +++ b/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch
> @@ -0,0 +1,25 @@
> +From 7c5db44f99c2945b510160269b73d305a4db3c96 Mon Sep 17 00:00:00 2001
> +From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
> +Date: Wed, 23 Sep 2020 18:29:52 -0500
> +Subject: [PATCH 4/4] Fix Cube programmer GPIO default level
> +

Same comment as previous patches.

> diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
> new file mode 100644
> index 0000000000..3cb333441d
> --- /dev/null
> +++ b/configs/octavo_osd32mp1_brk_defconfig
> @@ -0,0 +1,39 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +BR2_ROOTFS_OVERLAY="board/octavo/brk/overlay/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/octavo/brk/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.4-stm32mp-r1.1"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/octavo/brk/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-osd32mp1-brk"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/brk/linux-dts/*"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2-stm32mp-r2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/octavo/brk/tfa-dts/*"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-osd32mp1-brk.dtb STM32MP_USB_PROGRAMMER=1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2020.01-stm32mp-r1.1"
> +BR2_TARGET_UBOOT_PATCH="board/octavo/brk/uboot-patches/*.patch"

Use BR2_GLOBAL_PATCH_DIRECTORIES

I don't know if using the vendor provided U-Boot repository wouldn't be
better here instead of carrying those U-Boot patches forever.

Also, another thing is badly missing: a readme.txt in the board/
directory that describes how to build, flash and use this Buildroot
configuration on the board.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
