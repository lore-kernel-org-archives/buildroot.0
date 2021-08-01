Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEA6C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:03:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137E061050
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 137E061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D296A400BF;
	Sun,  1 Aug 2021 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lToUE4jtZ05A; Sun,  1 Aug 2021 20:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB31400DF;
	Sun,  1 Aug 2021 20:02:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1062A1BF424
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB8340471
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqSoaUas1A1A for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C306D4046E
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:02:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9523A5FF3F;
 Sun,  1 Aug 2021 22:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627848171;
 bh=d6YhnMUYsCBiBM+zAhVc6g3dkhh9Qb1v+9N3iXNW4yM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMeLoqtwsZdjchDEKxHTg36AWeHTtn4N4cOFvF/Mkc9029VwIDxarCHFZbMhxe767
 QmRU6Z6dIsRJWN2kYzpzgDlSqBVOHbvaHfiWEy2GN90pqWc4mixLWOAJBWxAFMcwYY
 Qknnf6Xqfcf0R7WRsNzmNUmfcU1NwhiNq0SoHdVuZRzo6cTQPqMsgck6tloAG1mLW/
 rbLFUzE8rxYYwlWkaewL7Ga07YmB9hw67pVrJ5paw+1XloC3bGF6+SFq503CnUcviJ
 FYzHj3St+hTA4SrsjTqMibkKCKAthLVceZyGjzKi+DPTQNanGIAL5vSUlH7u3JhrjX
 f+TszRzfvGEAg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 22:02:45 +0200
Date: Sun, 1 Aug 2021 22:02:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: dopsi@dopsi.ch
Message-ID: <20210801200245.GK3189549@scaer>
References: <20210730075536.825224-1-dopsi@dopsi.ch>
 <20210730075536.825224-2-dopsi@dopsi.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730075536.825224-2-dopsi@dopsi.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32mp157c_odyssey: new
 defconfig
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Simon, All,

On 2021-07-30 07:56 +0000, dopsi@dopsi.ch spake thusly:
> From: Simon Doppler <dopsi@dopsi.ch>
> 
> STM32MP157C-Odyssey reference:
> https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
> 
> Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
> ---
[--SNIP--]
> diff --git a/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..b5795415eb
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label stm32mp157c-odyssey-buildroot
> +  kernel /boot/zImage
> +  devicetree /boot/stm32mp157c-odyssey.dtb
> +  append root=/dev/mmcblk0p4 rootwait

What is this extlinux.conf file for? As far as I can see, this defconfig
does not use syslinux, which is anyway only available on x86 and x86_64.

> diff --git a/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
> new file mode 100644
> index 0000000000..6f266706a4
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
> @@ -0,0 +1,15 @@
> +linux: stm32mp157c-odyssey.dts: remove the SDMMC1 CD as per schematic
> +
> +Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
> +
> +--- linux-5.10.1.orig/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> ++++ linux-5.10.1/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> +@@ -64,7 +64,7 @@
> + 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> + 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> + 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +-	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> ++	broken-cd;

Would it not be better to backport upstream commit 0171b07373cc (ARM:
dts: stm32: fix stm32mp157c-odyssey card detect pin):

    -       cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
    +       cd-gpios = <&gpioi 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

Except for those two minor nits, this v2 looks OK.

Regards,
Yann E. MORIN.

> + 	disable-wp;
> + 	st,neg-edge;
> + 	bus-width = <4>;
> diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
> new file mode 100644
> index 0000000000..078ff74923
> --- /dev/null
> +++ b/configs/stm32mp157c_odyssey_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_GLOBAL_PATCH_DIR="board/seeed/stm32mp157c-odyssey/patches"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/seeed/stm32mp157c-odyssey/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-odyssey"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-odyssey.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.30.2
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
