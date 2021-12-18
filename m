Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003ACC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E4460B33;
	Sat, 18 Dec 2021 21:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poP8ft5El0r8; Sat, 18 Dec 2021 21:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D684D60B2F;
	Sat, 18 Dec 2021 21:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384A31BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 266D384C71
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xS6dxRmGWFhj for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F00584C1D
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:13:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 43C6D5FF6C;
 Sat, 18 Dec 2021 22:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639862034;
 bh=kYxdnNiQlDe2yWrdrTZsDjp1qT4G6lv+mUPa6PyoD9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aO9aoGPoK5/wdf9H2QWlimhZKm7ZXi2sJtzCkOGHBw/73u+2wI1rKkgeXFaJaTIEB
 jjQDZguFs1AgbH5WHpscOURF78p9PISH2ciK7OCRRojhTrmRogY5/x4MYZvjH1FTpm
 GodTHX8T3T+H1OBnFMP2pz4dqIYt4gkdjsgKW7qTfnZgu4cgmiyBQaZu+14+ZCOAJK
 Ij7mBh9sAVYgttBhvhgm4oAFqr3n27cLjrTsLxVzQ0416cnBx8MRsRceTiNTAP+RW8
 a/mQCSxJc83U57xyiOXMgsTAK0wio3lKuyvLvC9XrCDYjX50p1he2h1LQa1vNttS9Y
 afWn+VKEbAAmA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:13:49 +0100
Date: Sat, 18 Dec 2021 22:13:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211218211349.GN2603@scaer>
References: <20211218163742.13297-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218163742.13297-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/roseapplypi_defconfig: bump kernel
 to 5.15.10
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

Peter, All,

On 2021-12-18 17:37 +0100, Peter Korsgaard spake thusly:
> The kernel now has support for dma, ethernet, i2c, mmc, pinctrl, regulator,
> so enable drivers for those, change to a ext4 rootfs and enable DHCP on
> eth0.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Will we at some point be able to drop our custom kernel config file, and
use an upstream defconfig instead?

Regards,
Yann E. MORIN.

> ---
>  board/roseapplepi/genimage.cfg |  6 ++++++
>  board/roseapplepi/linux.config | 25 +++++++++++++++++++++++++
>  board/roseapplepi/uEnv.txt     |  2 +-
>  configs/roseapplepi_defconfig  |  7 ++++---
>  4 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
> index f1bceb0ede..4c5a8de902 100644
> --- a/board/roseapplepi/genimage.cfg
> +++ b/board/roseapplepi/genimage.cfg
> @@ -36,4 +36,10 @@ image sdcard.img {
>  		bootable = "true"
>  		image = "boot.vfat"
>  	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 512M
> +	}
>  }
> diff --git a/board/roseapplepi/linux.config b/board/roseapplepi/linux.config
> index aea48b7730..89e7c8917f 100644
> --- a/board/roseapplepi/linux.config
> +++ b/board/roseapplepi/linux.config
> @@ -26,19 +26,44 @@ CONFIG_INET=y
>  # CONFIG_IPV6 is not set
>  # CONFIG_WIRELESS is not set
>  # CONFIG_ETHTOOL_NETLINK is not set
> +CONFIG_NETDEVICES=y
> +CONFIG_OWL_EMAC=y
> +CONFIG_REALTEK_PHY=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_ATC260X_ONKEY=y
>  # CONFIG_VT is not set
>  CONFIG_SERIAL_OWL=y
>  # CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_OWL=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_OWL=y
> +CONFIG_PINCTRL_S500=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_ATC260X=y
> +CONFIG_MFD_ATC260X_I2C=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_REGULATOR_ATC260X=y
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=y
> +CONFIG_MMC_OWL=y
> +CONFIG_DMADEVICES=y
> +CONFIG_OWL_DMA=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_EXT4_FS=y
> +CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
>  # CONFIG_MISC_FILESYSTEMS is not set
>  # CONFIG_NETWORK_FILESYSTEMS is not set
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
>  # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
>  # CONFIG_CRYPTO_HW is not set
>  # CONFIG_FTRACE is not set
> diff --git a/board/roseapplepi/uEnv.txt b/board/roseapplepi/uEnv.txt
> index 2b9de727b4..339eb8aa0a 100644
> --- a/board/roseapplepi/uEnv.txt
> +++ b/board/roseapplepi/uEnv.txt
> @@ -1,3 +1,3 @@
>  # no ramdisk
>  ramdisk_addr_r=-
> -bootargs=console=ttyOWL2,115200
> +bootargs=console=ttyOWL2,115200 root=/dev/mmcblk0p2 rootwait clk_ignore_unused
> diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
> index 2af94d010b..f4efacf80d 100644
> --- a/configs/roseapplepi_defconfig
> +++ b/configs/roseapplepi_defconfig
> @@ -3,15 +3,16 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.10"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
>  BR2_LINUX_KERNEL_UIMAGE=y
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
