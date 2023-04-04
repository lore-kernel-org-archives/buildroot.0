Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8334BC6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 14:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8E23400EA;
	Tue,  4 Apr 2023 14:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E23400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DotPByzeHqaR; Tue,  4 Apr 2023 14:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFDD540483;
	Tue,  4 Apr 2023 14:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFDD540483
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 171541C289D
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 14:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45CB40483
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 14:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45CB40483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YMRMz-HpiI8 for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 14:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F0B7400EA
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0B7400EA
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 14:40:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E401D75;
 Tue,  4 Apr 2023 07:40:57 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.125.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38EF63F73F;
 Tue,  4 Apr 2023 07:40:11 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:40:08 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <ZCw2yOGVaMQ3sE8N@debian>
Mail-Followup-To: Sebastian Weyer <sebastian.weyer@smile.fr>,
 buildroot@buildroot.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Egorenkov <egorenar@linux.ibm.com>,
 Mark Corbin <mark@dibsco.co.uk>, Dick Olsson <hi@senzilla.io>,
 Thomas Huth <huth@tuxfamily.org>,
 Romain Naour <romain.naour@gmail.com>,
 Niklas Cassel <niklas.cassel@wdc.com>
References: <20230403114947.1823718-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403114947.1823718-1-sebastian.weyer@smile.fr>
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/qemu: update defconfigs to
 Linux 6.2.9
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Thomas Huth <huth@tuxfamily.org>,
 buildroot@buildroot.org, Mark Corbin <mark@dibsco.co.uk>,
 Alexander Egorenkov <egorenar@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Romain Naour <romain.naour@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 03, 2023 at 01:49:46PM +0200, Sebastian Weyer wrote:
> Just updating all qemu defconfigs to the latest Kernel version:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.2.y&id=e128ce12e29c5a6d9a88c7b8a1c8e07402c38fed
> 
> Tested using external toolchains:
> https://gitlab.com/DocSepp/buildroot/-/pipelines/826008372
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v2:
>     - remove Kernel header version from comment in
>       qemu_riscv64_nommu_virt_defconfig
>     - use kernel version 6.2.9 instead of 6.1.11
> 
> The pipeline used here yielded the same results as Romain's for the
> previous version of the patch:
> https://gitlab.com/kubu93/buildroot/-/pipelines/776319124
> With the exception that the defconfigs he removed aren't removed for the
> new pipeline
> ---
>  configs/qemu_aarch64_ebbr_defconfig       | 4 ++--
>  configs/qemu_aarch64_sbsa_defconfig       | 4 ++--
>  configs/qemu_aarch64_virt_defconfig       | 4 ++--
>  configs/qemu_arm_ebbr_defconfig           | 4 ++--
>  configs/qemu_arm_versatile_defconfig      | 4 ++--
>  configs/qemu_arm_vexpress_defconfig       | 4 ++--
>  configs/qemu_arm_vexpress_tz_defconfig    | 4 ++--

Hi Sebastian,

Thanks for this patch.

I have quickly tested all the aarch64 and arm defconfigs. They all work on my
side except the qemu_aarch64_virt_defconfig, which has a typo (see below). It
does work fine with the typo fixed.

Best regards,
Vincent.

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
>  configs/qemu_s390x_defconfig              | 4 ++--
>  configs/qemu_sh4_r2d_defconfig            | 4 ++--
>  configs/qemu_sh4eb_r2d_defconfig          | 4 ++--
>  configs/qemu_sparc64_sun4u_defconfig      | 4 ++--
>  configs/qemu_sparc_ss10_defconfig         | 4 ++--
>  configs/qemu_x86_64_defconfig             | 4 ++--
>  configs/qemu_x86_defconfig                | 4 ++--
>  configs/qemu_xtensa_lx60_defconfig        | 4 ++--
>  configs/qemu_xtensa_lx60_nommu_defconfig  | 4 ++--
>  42 files changed, 85 insertions(+), 85 deletions(-)
> 
> diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
> index e3157089a9..e5714c1ed5 100644
> --- a/configs/qemu_aarch64_ebbr_defconfig
> +++ b/configs/qemu_aarch64_ebbr_defconfig
> @@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
>  
>  # Linux headers
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index 609444e787..e368721252 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 03df0ad9e2..9115569ab9 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> + BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
   ^
A spurious space slipped in, which breaks the build.

>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
> index 8fbb3069bc..c530dd502c 100644
> --- a/configs/qemu_arm_ebbr_defconfig
> +++ b/configs/qemu_arm_ebbr_defconfig
> @@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
>  
>  # Linux headers
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
>  
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 4f43273a82..50f0f62e39 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index 2c813456f4..997e11be10 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 576c441154..1ea602de0e 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>  
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index 0490b9e29e..7e3acaf41a 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index 30d8982db3..00b08f9753 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 7bd2ae53b8..6701d9077d 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index cd8c5a3cb2..674e88911e 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index 49d84c308b..f24422102e 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 5363018c47..26356dde3d 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index f77feb9b6d..82c37317a7 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index 575034441a..9f6a3f3a44 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index e9438fda1e..60eb2ecdc3 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index 4b1c8e22af..96b92dc264 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 87ef7902af..42676eae80 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index 5774207f65..4ec537a0e9 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
> index 4b9c53e8de..8a6059b738 100644
> --- a/configs/qemu_nios2_10m50_defconfig
> +++ b/configs/qemu_nios2_10m50_defconfig
> @@ -1,7 +1,7 @@
>  BR2_nios2=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="10m50"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel needs mkimage
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index b3d9d79156..9cd6bf7372 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>  
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 6ad03c4c87..bb5a5268a4 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -12,12 +12,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 50844dc93b..5cddbd8242 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
> index f6a5c3d409..edb4fe2832 100644
> --- a/configs/qemu_ppc64le_powernv8_defconfig
> +++ b/configs/qemu_ppc64le_powernv8_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="powernv"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index 7ce5a9d310..418e632331 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  
> diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
> index f4cc5589e7..75266dc24b 100644
> --- a/configs/qemu_ppc_bamboo_defconfig
> +++ b/configs/qemu_ppc_bamboo_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
> index 0a1877c44b..c110627611 100644
> --- a/configs/qemu_ppc_e500mc_defconfig
> +++ b/configs/qemu_ppc_e500mc_defconfig
> @@ -11,12 +11,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index 1c11bcf77d..a14a641b23 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index 2331041c2a..ec11cf8946 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -6,12 +6,12 @@ BR2_powerpc_7400=y
>  BR2_SYSTEM_DHCP="eth0"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index b9a0812d52..ebb09a4efa 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index f354e303e5..b38c97652f 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index ee70beb208..c9b7200883 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -3,8 +3,8 @@ BR2_riscv=y
>  BR2_RISCV_64=y
>  # BR2_RISCV_USE_MMU is not set
>  
> -# Linux headers same as kernel, a 5.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Busybox with hush
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> @@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index b3174a152c..fd0ff16791 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index 6bbcca0896..78184eca1f 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.4"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index 0f12b7dfe9..9267270ccd 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index d5ee371e79..e4d48e1f90 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 485b497e71..c064a7b939 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>  
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index 2ba04c0864..af26a2fb55 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
>  
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index cc505a8540..6562bc1f52 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index 34b7e2d292..7886cb4ccf 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>  
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index cb78106091..ade45fa180 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index 4be1b66edc..c6ba892486 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.2.9"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -- 
> 2.25.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

