Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B01C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E22400F5;
	Sun, 13 Feb 2022 15:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93EvnS6p-Mrr; Sun, 13 Feb 2022 15:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3F74011D;
	Sun, 13 Feb 2022 15:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8FF1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C87B60A83
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNfTor0g69Mv for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 451FF60591
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:22:00 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z13so5321857edc.12
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3jHH5owiYvCA8AoVGp7umBsPDKkSdOBne3Tf7uwiSKc=;
 b=hJbbdsSc7NRHvZvmr/pXobvNpyFdkT6Z8jajwt/MYDU5SJm/n/jC+aY/fCWH4bllSb
 Wqfuz+4vLa7IA97EzDdXuwqQyUAF7dHQlWDBZnRO0IKCjXZqwIuHzrEHSfXjBa2/eRB2
 CcLoX0qOSfzaoLfqWkZw3F3HcH0qYXiT56mH7y86SzYDITvC0+goFL3D2sVs65Xqwq8W
 dj5LJy/xZKmnuz/f3elLl6F+pw50EPbASCe+XCLPwmtgEfZfwtTxC1qounppubadNpAk
 0I38+OdOaO/O10cBNnlCcdFYDeNoinfhbiJA/ki049Nk12rrYcvvd/LKYm9fEP/vOSZs
 3K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3jHH5owiYvCA8AoVGp7umBsPDKkSdOBne3Tf7uwiSKc=;
 b=eA5D909jk/6Wvj1I+MuLW/X9MuqbkfyRYi2c1FypufJhJi/iCWeyMuOmKSCRkkKf5h
 viEYe9+odXRE2EmspYtS70Ptspncu10vin2/uqMxjjebMK7wOY3i+J07NoxGMWgeaUZP
 9OM2eBmt1ab26bSvKwmecrqhKXQhCE8uodyapTx63PkZWFQzhHgvhmRoBY3BO1vn06CB
 NOM7mx9CU6LQ6BYIzLQSWogJeYZRWKK1zOmNOS9OThF3wkncJMvT6H0Op/DroJGEubSY
 675h9ysPpHGIefuMuwFZ3BDwcR5B1p5GNn5WgfVPTj2hwypBLw3MCuLCoK62BG+du8Q1
 80Og==
X-Gm-Message-State: AOAM532yuE3XkxzdtsSXWC3d2E4a68hDOmHuS8no560CZUYylmWlDgso
 KwpnaK28GXA1/QgsI9tCkV2uH8tiIL6nMA==
X-Google-Smtp-Source: ABdhPJxMIQUPFN68F0cNt/2EMPDRImBpq0Hzu6OImJjGibBzTrHi1tQdspxNcRTGZR+zoW5ArRY8uw==
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr4104725edb.418.1644765718366; 
 Sun, 13 Feb 2022 07:21:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id eo7sm11052288edb.97.2022.02.13.07.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:21:57 -0800 (PST)
Message-ID: <d4c345ac-a9ff-6cfb-5818-fe26e82a293e@mind.be>
Date: Sun, 13 Feb 2022 16:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: David HENG <david.heng@smile.fr>, buildroot@buildroot.org
References: <20220203155951.1277343-1-david.heng@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220203155951.1277343-1-david.heng@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] configs/qemu_*: bump kernel version to
 5.15.18
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



On 03/02/2022 16:59, David HENG wrote:
> See runtimes test here :
> https://gitlab.com/davidheng.pw/buildroot/-/pipelines/460019580
> 
> Signed-off-by: David HENG <david.heng@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> It seems that qemu_s390x_defconfig made a timeout on Gitlab shared-runner at the end but work after a restarting.
> https://gitlab.com/davidheng.pw/buildroot/-/jobs/2044971657
> ---
>   configs/qemu_aarch64_sbsa_defconfig        | 2 +-
>   configs/qemu_aarch64_virt_defconfig        | 2 +-
>   configs/qemu_arm_versatile_defconfig       | 2 +-
>   configs/qemu_arm_versatile_nommu_defconfig | 2 +-
>   configs/qemu_arm_vexpress_defconfig        | 2 +-
>   configs/qemu_arm_vexpress_tz_defconfig     | 2 +-
>   configs/qemu_m68k_mcf5208_defconfig        | 2 +-
>   configs/qemu_m68k_q800_defconfig           | 2 +-
>   configs/qemu_microblazebe_mmu_defconfig    | 2 +-
>   configs/qemu_microblazeel_mmu_defconfig    | 2 +-
>   configs/qemu_mips32r2_malta_defconfig      | 2 +-
>   configs/qemu_mips32r2el_malta_defconfig    | 2 +-
>   configs/qemu_mips32r6_malta_defconfig      | 2 +-
>   configs/qemu_mips32r6el_malta_defconfig    | 2 +-
>   configs/qemu_mips64_malta_defconfig        | 2 +-
>   configs/qemu_mips64el_malta_defconfig      | 2 +-
>   configs/qemu_mips64r6_malta_defconfig      | 2 +-
>   configs/qemu_mips64r6el_malta_defconfig    | 2 +-
>   configs/qemu_nios2_10m50_defconfig         | 2 +-
>   configs/qemu_or1k_defconfig                | 2 +-
>   configs/qemu_ppc64_e5500_defconfig         | 2 +-
>   configs/qemu_ppc64_pseries_defconfig       | 2 +-
>   configs/qemu_ppc64le_powernv8_defconfig    | 2 +-
>   configs/qemu_ppc64le_pseries_defconfig     | 2 +-
>   configs/qemu_ppc_bamboo_defconfig          | 2 +-
>   configs/qemu_ppc_e500mc_defconfig          | 2 +-
>   configs/qemu_ppc_g3beige_defconfig         | 2 +-
>   configs/qemu_ppc_mac99_defconfig           | 2 +-
>   configs/qemu_ppc_mpc8544ds_defconfig       | 2 +-
>   configs/qemu_riscv32_virt_defconfig        | 2 +-
>   configs/qemu_riscv64_virt_defconfig        | 2 +-
>   configs/qemu_s390x_defconfig               | 2 +-
>   configs/qemu_sh4_r2d_defconfig             | 2 +-
>   configs/qemu_sh4eb_r2d_defconfig           | 2 +-
>   configs/qemu_sparc64_sun4u_defconfig       | 2 +-
>   configs/qemu_sparc_ss10_defconfig          | 2 +-
>   configs/qemu_x86_64_defconfig              | 2 +-
>   configs/qemu_x86_defconfig                 | 2 +-
>   configs/qemu_xtensa_lx60_defconfig         | 2 +-
>   configs/qemu_xtensa_lx60_nommu_defconfig   | 2 +-
>   40 files changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index e7d3bd03ca..2d6134e78c 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -25,7 +25,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 9fbf293311..03df0ad9e2 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 5e399d17de..4f43273a82 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
> index 1357742703..0c49d1b67d 100644
> --- a/configs/qemu_arm_versatile_nommu_defconfig
> +++ b/configs/qemu_arm_versatile_nommu_defconfig
> @@ -31,7 +31,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux-nommu.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index dafcc37bc0..2c813456f4 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -25,7 +25,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 327762277b..def11721ae 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>   
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index 1dcd8272c3..0490b9e29e 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index 7bf8b4061f..30d8982db3 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 0508f92c36..7bd2ae53b8 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>   BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index 10811e284e..cd8c5a3cb2 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>   BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index c08ca862c5..49d84c308b 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 0bb16b9320..5363018c47 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index f7b218c62a..f77feb9b6d 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index d0f118ff90..575034441a 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index fe03b911c5..e9438fda1e 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index c6d428226c..4b1c8e22af 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 9cf651a4ba..87ef7902af 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index 0d02a5b4df..5774207f65 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
> index 44afb928e3..4b9c53e8de 100644
> --- a/configs/qemu_nios2_10m50_defconfig
> +++ b/configs/qemu_nios2_10m50_defconfig
> @@ -1,7 +1,7 @@
>   BR2_nios2=y
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="10m50"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
>   BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index 9d55cb3420..b3d9d79156 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>   
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 09aac50252..072240c99c 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 1a20e2ee0e..ad523ec2ef 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
> index d8ea6655fc..a784695ddf 100644
> --- a/configs/qemu_ppc64le_powernv8_defconfig
> +++ b/configs/qemu_ppc64le_powernv8_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="powernv"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index 46f62b8313..f10b0fdf40 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
> index d6abbeb452..6129c4a663 100644
> --- a/configs/qemu_ppc_bamboo_defconfig
> +++ b/configs/qemu_ppc_bamboo_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
> index 232bc1f70c..1853e538bb 100644
> --- a/configs/qemu_ppc_e500mc_defconfig
> +++ b/configs/qemu_ppc_e500mc_defconfig
> @@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index 824fe648ab..9bbebede1b 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index ddeb99465a..e9629ff233 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index 1a72d81ed5..2b51573da9 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index e2753cfcfd..dff87ef342 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>   BR2_LINUX_KERNEL_IMAGE=y
>   
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index 07f20776f0..d67d070185 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_IMAGE=y
>   
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index 86ac1fd024..346df04ada 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index c8177e6096..0f12b7dfe9 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>   BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index f334569779..d5ee371e79 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>   BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 941439d338..485b497e71 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>   
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index 62d3acb16b..2ba04c0864 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
>   
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index 1bca76df44..cc505a8540 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index 54cf8e9794..34b7e2d292 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>   
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index 1db3fd3ce4..cb78106091 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index d4c07b574c..c4473fb32a 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -25,7 +25,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
