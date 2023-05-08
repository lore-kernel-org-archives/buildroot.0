Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEEC7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B960A408B3;
	Mon,  8 May 2023 20:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B960A408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mB5Dvvc5pvaN; Mon,  8 May 2023 20:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7374087A;
	Mon,  8 May 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7374087A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11FE1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 843B4845A0
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 843B4845A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnETKMrgSXRk for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:13:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1927F8459E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1927F8459E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:13:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4C7E0200390;
 Mon,  8 May 2023 22:13:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:13:20 +0200
Date: Mon, 8 May 2023 22:13:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230508201320.GN252090@scaer>
References: <20230428224051.259264-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428224051.259264-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683576803;
 bh=l1Sb8B24MYJS8YmBsqhTkVe5XJzF+PBDFVy/hIDJNjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POS08J3UIlx6XwMrSfJOzxVOU3b1d0+HEvno4f7Y6crzbX2XniHAodTJ9WV95iVou
 Vn7rbImvcdv24KrYM47dZM3F5kCFDNP14T9qKP40T0ipe0VrSy6wQlEM0260BGiTan
 pwl9wkcUfgDo/9RSj1Yd8OH5/msZc3lZ67Lb+Hdz+XC4LgEvGxiIcaOgqbANo8rxgd
 BO6goWC/E8SrsFjIdCjN7F+YW71Jq/pMpEDoNg+i+o2pb/e8Dq+2z0mx1FDL7l731M
 07QPJAgb0l4eJAUrmiV5B1J+aZdDnrRyUWN3ibbumHh8k1TBjxWmin8YR2NjW88UO0
 +cDUzb/TaXdlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=POS08J3U
Subject: Re: [Buildroot] [PATCH v4] configs/qemu: update defconfigs to Linux
 6.1.26
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, Sebastian, All,

On 2023-04-29 00:40 +0200, Romain Naour spake thusly:
> From: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> Just updating all qemu defconfigs to the latest Kernel LTS version
> including first gcc 13.1 fixes [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.1.26&id=a93c20f5832221c2bf5f80199c4eaebc0ba28e16
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2:
>     - remove Kernel header version from comment in
>       qemu_riscv64_nommu_virt_defconfig
>     - use kernel version 6.2.9 instead of 6.1.11
> 
> v3:
>     - fixed leading whitespace in qemu_aarch64_virt_defconfig that broke
>       the build
> 
> The pipeline used here yielded the same results as Romain's for the
> previous version of the patch:
> https://gitlab.com/kubu93/buildroot/-/pipelines/776319124
> With the exception that the defconfigs he removed aren't removed for the
> new pipeline
> 
> Tested using external toolchains:
> https://gitlab.com/DocSepp/buildroot/-/pipelines/826008372
> 
> v4: [Romain] revert to 6.1.x LTS kernel
>     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2 doesn't exist yet in Buildroot.
> ---
>  configs/qemu_aarch64_ebbr_defconfig       | 2 +-
>  configs/qemu_aarch64_sbsa_defconfig       | 4 ++--
>  configs/qemu_aarch64_virt_defconfig       | 4 ++--
>  configs/qemu_arm_ebbr_defconfig           | 2 +-
>  configs/qemu_arm_versatile_defconfig      | 4 ++--
>  configs/qemu_arm_vexpress_defconfig       | 4 ++--
>  configs/qemu_arm_vexpress_tz_defconfig    | 4 ++--
>  configs/qemu_m68k_mcf5208_defconfig       | 4 ++--
>  configs/qemu_m68k_q800_defconfig          | 4 ++--
>  configs/qemu_microblazebe_mmu_defconfig   | 4 ++--
>  configs/qemu_microblazeel_mmu_defconfig   | 4 ++--
>  configs/qemu_mips32r2_malta_defconfig     | 4 ++--
>  configs/qemu_mips32r2el_malta_defconfig   | 4 ++--
>  configs/qemu_mips32r6_malta_defconfig     | 4 ++--
>  configs/qemu_mips32r6el_malta_defconfig   | 4 ++--
>  configs/qemu_mips64_malta_defconfig       | 4 ++--
>  configs/qemu_mips64el_malta_defconfig     | 4 ++--
>  configs/qemu_mips64r6_malta_defconfig     | 4 ++--
>  configs/qemu_mips64r6el_malta_defconfig   | 4 ++--
>  configs/qemu_nios2_10m50_defconfig        | 4 ++--
>  configs/qemu_or1k_defconfig               | 4 ++--
>  configs/qemu_ppc64_e5500_defconfig        | 4 ++--
>  configs/qemu_ppc64_pseries_defconfig      | 4 ++--
>  configs/qemu_ppc64le_powernv8_defconfig   | 4 ++--
>  configs/qemu_ppc64le_pseries_defconfig    | 4 ++--
>  configs/qemu_ppc_bamboo_defconfig         | 4 ++--
>  configs/qemu_ppc_e500mc_defconfig         | 4 ++--
>  configs/qemu_ppc_g3beige_defconfig        | 4 ++--
>  configs/qemu_ppc_mac99_defconfig          | 4 ++--
>  configs/qemu_ppc_mpc8544ds_defconfig      | 4 ++--
>  configs/qemu_riscv32_virt_defconfig       | 4 ++--
>  configs/qemu_riscv64_nommu_virt_defconfig | 6 +++---
>  configs/qemu_riscv64_virt_defconfig       | 4 ++--
>  configs/qemu_s390x_defconfig              | 2 +-
>  configs/qemu_sh4_r2d_defconfig            | 4 ++--
>  configs/qemu_sh4eb_r2d_defconfig          | 4 ++--
>  configs/qemu_sparc64_sun4u_defconfig      | 4 ++--
>  configs/qemu_sparc_ss10_defconfig         | 4 ++--
>  configs/qemu_x86_64_defconfig             | 4 ++--
>  configs/qemu_x86_defconfig                | 4 ++--
>  configs/qemu_xtensa_lx60_defconfig        | 4 ++--
>  configs/qemu_xtensa_lx60_nommu_defconfig  | 4 ++--
>  42 files changed, 82 insertions(+), 82 deletions(-)
> 
> diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
> index e3157089a9..099934324c 100644
> --- a/configs/qemu_aarch64_ebbr_defconfig
> +++ b/configs/qemu_aarch64_ebbr_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index 609444e787..1eff468935 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 03df0ad9e2..74e6b8431a 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
> index 8fbb3069bc..dbdde892be 100644
> --- a/configs/qemu_arm_ebbr_defconfig
> +++ b/configs/qemu_arm_ebbr_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
>  
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 4f43273a82..1029031182 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index 2c813456f4..743dc0479a 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 576c441154..f2f585c201 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>  
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index 0490b9e29e..bf62136345 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index 30d8982db3..50b61a8007 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 7bd2ae53b8..96b9dce41c 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index cd8c5a3cb2..5c2e4ba3d4 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index 49d84c308b..bf4ce4f704 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 5363018c47..fadb94ad71 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index f77feb9b6d..e52b8a5408 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index 575034441a..f9ed35eb95 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index e9438fda1e..8616d689e6 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index 4b1c8e22af..e7d1a730df 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 87ef7902af..e9bf26c087 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index 5774207f65..28de05345b 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
> index 4b9c53e8de..a9fbf4ce15 100644
> --- a/configs/qemu_nios2_10m50_defconfig
> +++ b/configs/qemu_nios2_10m50_defconfig
> @@ -1,7 +1,7 @@
>  BR2_nios2=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="10m50"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel needs mkimage
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index b3d9d79156..166e5ea5ca 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>  
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 6ad03c4c87..0ab7e8e76f 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -12,12 +12,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 50844dc93b..92fe3a11f6 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
> index f6a5c3d409..cb086ba248 100644
> --- a/configs/qemu_ppc64le_powernv8_defconfig
> +++ b/configs/qemu_ppc64le_powernv8_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="powernv"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index 7ce5a9d310..001d614c3b 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
> index f4cc5589e7..83a657dcbd 100644
> --- a/configs/qemu_ppc_bamboo_defconfig
> +++ b/configs/qemu_ppc_bamboo_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
> index 0a1877c44b..124f6f247a 100644
> --- a/configs/qemu_ppc_e500mc_defconfig
> +++ b/configs/qemu_ppc_e500mc_defconfig
> @@ -11,12 +11,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index 1c11bcf77d..d2741d7dfb 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index 2331041c2a..eda116afd6 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -6,12 +6,12 @@ BR2_powerpc_7400=y
>  BR2_SYSTEM_DHCP="eth0"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index b9a0812d52..ca1a429167 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index f354e303e5..03c871282e 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index ee70beb208..6d84844e85 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -3,8 +3,8 @@ BR2_riscv=y
>  BR2_RISCV_64=y
>  # BR2_RISCV_USE_MMU is not set
>  
> -# Linux headers same as kernel, a 5.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Busybox with hush
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> @@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index b3174a152c..666500d889 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index 6bbcca0896..ee18bdb011 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.4"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index 0f12b7dfe9..f07e352367 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index d5ee371e79..9753ebc951 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 485b497e71..ccc6cce3c1 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>  
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index 2ba04c0864..7d1a424eef 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
>  
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index cc505a8540..0d1955291c 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index 34b7e2d292..19eb9360df 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>  
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index cb78106091..6bfda22775 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index 4be1b66edc..80d17d3e5a 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -- 
> 2.34.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

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

