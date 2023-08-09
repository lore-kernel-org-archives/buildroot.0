Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1805BC001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8634021E;
	Wed,  9 Aug 2023 17:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8634021E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTJZNCs1Za-4; Wed,  9 Aug 2023 17:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0E1401FB;
	Wed,  9 Aug 2023 17:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0E1401FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291331BF2FD
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 006FC401FB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 006FC401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_o67byfr8py for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:57:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 345BB401F4
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 345BB401F4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CCBC240007;
 Wed,  9 Aug 2023 17:57:46 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:57:45 +0200
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Message-ID: <20230809195745.5d51785c@windsurf>
In-Reply-To: <CA+fTLhg9R0KwFb-EZKEYy2U_WgdRzBZyJ6QrmCUv4dCB_kfo8A@mail.gmail.com>
References: <CA+fTLhg9R0KwFb-EZKEYy2U_WgdRzBZyJ6QrmCUv4dCB_kfo8A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691603866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/RzpxEBi0gGtfYu3+7ZdsdrIvd/H0x0CESuGFA5Xw8=;
 b=mpkV1y5AsQybJA/JaMiG54Xa1g5FrFtshI7588taEzgTAmsopGrK93LK1ice+U8SFRt4Bj
 JPJZTTRdYENMc2TQSikU/AnHzju//Gwx0h4b0Wvo+L4zI7PdRxUcojO/sXKyNdZZBvV1G/
 etbIJK7cV8/LzyOAXd6Jsyqu3NyFraYbb5Z5pjVpomYwWqw3wIjQWhLoHWTnr04BIdPQ3P
 VKFFLHvxQu6rBW24ZQHjfR6eoHM/r7I9fG5ThX3xbYisZCVM5bLjKLGyanmnmR9dm0Gogf
 tecXUNf7F5CW5s6oEB31tCP3Isy5CMZeruZmBVUC8RgjNieIeLhjPtIuLYJhbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mpkV1y5A
Subject: Re: [Buildroot] [PATCH 1/1] configs/mangopi_mq_d1s: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Indrek,

On Wed, 9 Aug 2023 20:32:15 +0300
Indrek Kruusa <indrek.kruusa@gmail.com> wrote:

> This patch adds the support for the MangoPi MQ D1s board.
> Allwinner D1/D1s SOC and this particular board is partially supported by
> mainline linux kernel so the current configuration runs on mainline 6.4.x
> series. Improved support (PWM,SPI,CAN,audio) is coming in the near future.
> The provided kernel configuration in linux.fragment ensures that the compiled
> kernel is suitable for the board with 64MB RAM (integrated into the CPU).
> The configuration is using an u-boot version provided by Samuel Holland.
> 
> Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I know you will resend, but a few comments anyway.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0f6cb75e0e..83a539b46f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1334,6 +1334,10 @@ F: package/keepalived/
>  N: Ilya Averyanov <averyanovin@gmail.com>
>  F: package/exempi/
> 
> +N: Indrek Kruusa <indrek.kruusa@gmail.com>
> +F: configs/mangopi_mq_d1s_defconfig
> +F: board/mangopi-mq-d1s

We normally try to have board/<vendor>/<board>/

Also, a final slash when the entry matches a directory.



> +
>  N: Ismael Luceno <ismael@iodev.co.uk>
>  F: package/axel/
>  F: package/mawk/
> diff --git a/board/mangopi-mq-d1s/genimage.cfg
> b/board/mangopi-mq-d1s/genimage.cfg
> new file mode 100644
> index 0000000000..3acf78a3ab
> --- /dev/null
> +++ b/board/mangopi-mq-d1s/genimage.cfg
> @@ -0,0 +1,20 @@
> +# Minimal SD card image for the MangoPi MQ F133 D1s
> +# https://mangopi.org/mangopi_mq
> +
> +image sdcard.img {
> + hdimage {
> + }
> +
> + partition u-boot {
> + in-partition-table = false
> + image = "u-boot-sunxi-with-spl.bin"
> + offset = 8K
> + }
> +
> + partition rootfs {
> + partition-type = 0x83
> + image = "rootfs.ext4"
> + bootable = "true"
> + offset = 1M
> + }
> +}

Please match the indentation with other genimage.cfg files (maybe the
indentation got eaten up by your e-mail client).

> diff --git a/board/mangopi-mq-d1s/linux.fragment
> b/board/mangopi-mq-d1s/linux.fragment
> new file mode 100644
> index 0000000000..20a24f841d
> --- /dev/null
> +++ b/board/mangopi-mq-d1s/linux.fragment
> @@ -0,0 +1,70 @@
> +# CONFIG_SOC_MICROCHIP_POLARFIRE is not set
> +# CONFIG_ARCH_RENESAS is not set
> +# CONFIG_SOC_SIFIVE is not set
> +# CONFIG_SOC_STARFIVE is not set
> +# CONFIG_SOC_VIRT is not set
> +# CONFIG_ERRATA_SIFIVE is not set
> +CONFIG_BROKEN_ON_SMP=y
> +# CONFIG_SMP is not set
> +CONFIG_NONPORTABLE=y
> +CONFIG_HZ_250=y
> +CONFIG_RISCV_SBI_CPUIDLE=y
> +# CONFIG_EFI is not set
> +# CONFIG_CPU_FREQ is not set
> +# CONFIG_KPROBES is not set
> +# CONFIG_SWAP is not set
> +# CONFIG_ZSWAP is not set
> +# CONFIG_VIRTUALIZATION is not set
> +# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
> +CONFIG_SYSVIPC_COMPAT=y
> +CONFIG_POSIX_MQUEUE is not set
> +CONFIG_PREEMPT_BUILD=y
> +CONFIG_PREEMPT=y
> +CONFIG_PREEMPTION=y
> +CONFIG_NEED_PER_CPU_KM=y
> +# CONFIG_CGROUP_HUGETLB is not set
> +# CONFIG_CGROUP_PERF is not set
> +# CONFIG_CHECKPOINT_RESTORE is not set
> +# CONFIG_BLK_DEV_INITRD is not set
> +# CONFIG_PROFILING is not set
> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +# CONFIG_IOSCHED_BFQ is not set
> +CONFIG_COMPAT=y
> +# CONFIG_STACKPROTECTOR is not set
> +CONFIG_FLATMEM_MANUAL=y
> +# CONFIG_SPARSEMEM_MANUAL is not set
> +CONFIG_FLATMEM=y
> +CONFIG_SUN50I_DE2_BUS=y
> +CONFIG_SUNXI_RSB=y
> +CONFIG_GPIO_GENERIC_PLATFORM=y
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LEGACY_TIOCSTI is not set
> +# CONFIG_SERIAL_8250_PCI is not set
> +# CONFIG_SERIAL_SIFIVE is not set
> +# CONFIG_SPI_SIFIVE is not set
> +# CONFIG_GPIO_SIFIVE is not set
> +# CONFIG_VHOST_MENU is not set
> +# CONFIG_GOLDFISH is not set
> +# CONFIG_NET_9P is not set
> +# CONFIG_BLK_DEV_NVME is not set
> +# CONFIG_BLK_DEBUG_FS is not set
> +# CONFIG_SCSI is not set
> +# CONFIG_ATA is not set
> +# CONFIG_DRM_RADEON is not set
> +# CONFIG_DRM_NOUVEAU is not set
> +# CONFIG_RAID6_PQ_BENCHMARK is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_LIBNVDIMM is not set
> +# CONFIG_DAX is not set
> +# CONFIG_ETHERNET is not set
> +# CONFIG_PHYLIB is not set
> +# CONFIG_USB_NET_DRIVERS is not set
> +# CONFIG_WLAN is not set
> +# CONFIG_SPI is not set
> +# CONFIG_NFS_SWAP is not set
> +CONFIG_PINCTRL_SUNXI=y
> +CONFIG_PINCTRL_SUN20I_D1=y
> +# CONFIG_VIRTIO_BLK is not set
> +# CONFIG_MD is not set
> +# CONFIG_VIRTIO_MENU is not set

Not sure if a fragment or a defconfig is better here. If the fragment
is in the end disabling almost all what's in the default defconfig,
perhaps provide your own defconfig instead?


> diff --git a/board/mangopi-mq-d1s/uboot_board_defconfig
> b/board/mangopi-mq-d1s/uboot_board_defconfig
> new file mode 100644
> index 0000000000..0a3d8ded01
> --- /dev/null
> +++ b/board/mangopi-mq-d1s/uboot_board_defconfig

uboot.config or u-boot.config for the file name.

> diff --git a/configs/mangopi_mq_d1s_defconfig b/configs/mangopi_mq_d1s_defconfig
> new file mode 100644
> index 0000000000..0d2a3c40dd
> --- /dev/null
> +++ b/configs/mangopi_mq_d1s_defconfig
> @@ -0,0 +1,47 @@
> +BR2_riscv=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_ROOTFS_OVERLAY="board/mangopi-mq-d1s/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi-mq-d1s/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.8"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/mangopi-mq-d1s/linux.fragment"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1s-mangopi-mq"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_RTL8189FS=y
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
> +BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y

I was initially not sure about enabling wpa-supplicant, but it's true
that if the platform only has WiFi connectivity (no Ethernet) it
probably makes sense to have it enabled by default.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
> +BR2_TARGET_OPENSBI_LATEST_VERSION=y
> +# BR2_TARGET_OPENSBI_CUSTOM_VERSION is not set
> +BR2_TARGET_OPENSBI_VERSION="1.3"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> github,smaeul,u-boot,for-conor)/uboot-for-conor.tar.gz"

This point to a branch, which can move over time. Can you change that
to point to a tag or a commit hash?

The rest looks good really, so not much to fix.

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
