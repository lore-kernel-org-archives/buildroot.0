Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225BAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B634641514;
	Sat, 12 Feb 2022 13:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwR2D2ZgYXqY; Sat, 12 Feb 2022 13:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC85F41507;
	Sat, 12 Feb 2022 13:46:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22A9E1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10AEA40391
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Afa-s_KHxdp3 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E039D40328
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:46:07 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jg20so3339197ejc.3
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=q6zc9jHOpo94rTJ6JihVusQbefLxFeBQ0hKZjWG2cGs=;
 b=iOyyzWKCJqeNukjNLHI1d9XrwEYyoFOr8MKGIYWQ9IHXyTHZJYWxRKODZUeJbFzSCK
 NDZ/GO19coWA4nC0y7d1NaFhbQhzTeA6mzMmgvClQHolNNyEntFTGxysnoRaYbDHZkkk
 fdwPFmvo6FYkdTy6vs7813iVZKEYqb66lje+w+5ErJ3Zx02pmT3vQedV5TfUWSsxS3eo
 +8C9+U1Yx0bx/wwsPYjVfBNL2F4z+P7Ec9JxI8LZm8ntjh+PhUjKZ1NiIXLVrleIL4T0
 8J4xkYYrN3EkqUBK75stYa6BZY9om1JHYZRHnr+hSJAWdFTXzq7FvZiJIrzlpBHDqhWr
 exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q6zc9jHOpo94rTJ6JihVusQbefLxFeBQ0hKZjWG2cGs=;
 b=ZkF1DIoNRwTEdyaBBObDGoUWrBixmc0klFZhMad5xkBMR2viUBgFk6WJKmb/5eE1aN
 Xe/JT7QrKP8P8/gKXrFAcRsUBxUT6bkY818Xij+dOedBIuHgRt8EQKOnDog/5ADbvSyy
 yim0CV2yaNhUKtRH+VQR0VzlaDShL9DnTOfHLCe2mWxSJph7WDiJvUx3g/IN9lHwL8QW
 VchYgbOFp5xXHlUeNT8zqKhwDUw5tjkdxo8Mg/xXsXBHSrdF3xlOeawfrhqGDQos/IS0
 WzdeYVIgr5cnkJj5vCkSJIpcKsZEhyifzIMonPz08C7ih4C4IFTMrY+n5YttlZbztvY5
 RkLw==
X-Gm-Message-State: AOAM5325dKkVl1y4bUN52Ixf4SidaZfHqI6nWIK4YrThskk31v043ZXJ
 PGL56FzAIXA4vQn4AaMNhU5LLg==
X-Google-Smtp-Source: ABdhPJyQKZBTpbDync7i10yxIEmC0Fx2Da32MJpLspwtwa4tn337QlPeA1kzg9HM+n12TxRzJ9YEvw==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr4976867ejc.541.1644673566101; 
 Sat, 12 Feb 2022 05:46:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p5sm7128473ejr.105.2022.02.12.05.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:46:05 -0800 (PST)
Message-ID: <6b45334f-0339-5f67-0c59-2f20b5d17b1e@mind.be>
Date: Sat, 12 Feb 2022 14:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20220130101150.20605-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220130101150.20605-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH v3] configs/friendlyarm_nanopi_r2s: new
 defconfig
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



On 30/01/2022 11:11, Gilles Talis wrote:
> The NanoPi R2S is a FriendlyElec mini-router based on:
> 
> - Rockchip RK3328 SoC
> - 1GB (or 2GB) DDR4 RAM
> - Gigabit Ethernet (WAN)
> - Gigabit Ethernet (USB3) (LAN)
> - USB 2.0 Host Port
> - MicroSD slot
> - Reset button
> - WAN - LAN - SYS LED
> 
> https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=282
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

[snip]
> diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
> new file mode 100644
> index 0000000000..6fcfcd7159
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_r2s_defconfig
> @@ -0,0 +1,41 @@
> +BR2_aarch64=y

  I've added an explicit BR2_cortex_a53=y

> +BR2_ARM_FPU_VFPV4=y
> +BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y

  python3 is not enough, it uses pylibfdt, so I added 
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y

  Since you switch to ext4-only, dosfstools and mtools are not longer needed, so 
I removed those.

> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

  I don't think this is needed either, but I wasn't 100% sure so I kept it.


  Applied to master with those changes, thanks.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
