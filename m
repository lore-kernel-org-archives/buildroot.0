Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E45C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D98416AD;
	Thu, 10 Mar 2022 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZPPbKELM_mM; Thu, 10 Mar 2022 20:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E8141601;
	Thu, 10 Mar 2022 20:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7631BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FB940192
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oISVbFDmjPRf for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:43:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 487D140154
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:43:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c20so8500428edr.8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Hcg1y5jy0InWqDfpZoasFx91wcAR1yb9m/mIcTfJKTY=;
 b=EELkuvks4U981nJrgkhOHVpH5TFi+vR51YtF4Exx89vL/5z5+LL+RFCx/r2d2WSz4T
 PExwfQFyF8Enkl1iALHopD6syGt23vEkdLmBy8R1mB7N+hLtnj2QlSCoxIgEQyifIn72
 WFFHRYBDaZpr9TQPkcZXv3UN3/SABN/ETUgraBZh7ukmw1ro8ahpbGWsQIPx/BHRkJBz
 QyOwUwQH/IdjHVLlNweUxXI3Vdt7UqEN4FVTP8crfWuLnqI2J6twIWcXdTLBTSTwTDxf
 3s7rmJEjVLxRQN8iCdipbl5v45uIcI5BwNrLfJYRIqjyW5C2FramQO4GjzD5o2EENH1Z
 hBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hcg1y5jy0InWqDfpZoasFx91wcAR1yb9m/mIcTfJKTY=;
 b=uxNz8hLPOH2Vb4rUxrwRBwW99MKAfDdgoApoACDM6MkIXGctR3Q3kkcK5CivSgplvY
 vKOFQU0pgq1NyWXJAG2lKANZFQJybIoFm44STTIkQsUYrIXilMpcWbJ2SBnULtKTSYi2
 XoKyLUWedzG/J01AUBxq2KF6O8rutc6MjtQNsusnLFJu6LnQmKrQHu3VeY4D1aQdzh+a
 ELj2CRRTMdi3k1fqXyo2HGfA5IysNU858iMhKaLMaW6D+VxF5TwEeX4gZC3B/ZfP55ou
 Q2IWBBPbqo/zri+xvPEMOLL8J6z3EAdk/sAqQKeGped84lXlcPsaBcaUjtOguWFLSWcP
 5OxQ==
X-Gm-Message-State: AOAM531HFxSiDVmuAcafXNbHS3LybgwX4p759IbFob3C79wzanEHdvyQ
 L5jHQr7df65ztufO4HuAhyTFTxn0RbhqdQ==
X-Google-Smtp-Source: ABdhPJxXJIY2dbZ7GJfZVs8fia5EloR1c0n9QoG53nTD+8iHY74grRU6BIWVuD14tWTuS+kDDFq6wQ==
X-Received: by 2002:aa7:c64d:0:b0:415:eb27:4 with SMTP id
 z13-20020aa7c64d000000b00415eb270004mr6184699edr.365.1646945009306; 
 Thu, 10 Mar 2022 12:43:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709062a5300b006c75a94c587sm2216762eje.65.2022.03.10.12.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:43:28 -0800 (PST)
Message-ID: <90f76172-fd06-bd9f-f88c-dff188ef4a7d@mind.be>
Date: Thu, 10 Mar 2022 21:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220218035141.6914-1-kuzminov.sergey81@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218035141.6914-1-kuzminov.sergey81@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] configs/orangepi_pc_defconfig: switch to
 extlinux
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 04:51, Sergey Kuzminov wrote:
> Changes:
> * Switch to common orangepi scenario for multiple boards (board/orangepi/common) to create an SD image.
> * Exclude FAT partition, it is no longer needed for U-Boot.
> * Switch SD image from MBR to GPT for partition-uuid to work.
> * Switch to extlinux, this is convenient for debugging.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> * improved commit log
> ---
>   board/orangepi/orangepi-pc/boot.cmd     |  8 ------
>   board/orangepi/orangepi-pc/genimage.cfg | 37 -------------------------
>   configs/orangepi_pc_defconfig           |  9 ++----
>   3 files changed, 3 insertions(+), 51 deletions(-)
>   delete mode 100644 board/orangepi/orangepi-pc/boot.cmd
>   delete mode 100644 board/orangepi/orangepi-pc/genimage.cfg
> 
> diff --git a/board/orangepi/orangepi-pc/boot.cmd b/board/orangepi/orangepi-pc/boot.cmd
> deleted file mode 100644
> index 9da625c803..0000000000
> --- a/board/orangepi/orangepi-pc/boot.cmd
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -setenv fdt_high ffffffff
> -
> -setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> -
> -fatload mmc 0 $kernel_addr_r zImage
> -fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
> -
> -bootz $kernel_addr_r - $fdt_addr_r
> diff --git a/board/orangepi/orangepi-pc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
> deleted file mode 100644
> index 14e326cc56..0000000000
> --- a/board/orangepi/orangepi-pc/genimage.cfg
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -# Minimal SD card image for the OrangePi PC
> -#
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-h3-orangepi-pc.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
> -	size = 10M
> -}
> -
> -image sdcard.img {
> -	hdimage {
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot-sunxi-with-spl.bin"
> -		offset = 8K
> -		size = 1016K # 1MB - 8KB
> -	}
> -
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
> -	partition rootfs {
> -		partition-type = 0x83
> -		image = "rootfs.ext4"
> -		size = 512M
> -	}
> -}
> diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
> index 44ea9b95c4..fd0f64e0e6 100644
> --- a/configs/orangepi_pc_defconfig
> +++ b/configs/orangepi_pc_defconfig
> @@ -5,8 +5,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
>   BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
> @@ -14,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> @@ -27,9 +29,4 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
