Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 15:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFBE541A19;
	Sun, 29 May 2022 15:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdxMKkHotfJh; Sun, 29 May 2022 15:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC90641A0F;
	Sun, 29 May 2022 15:10:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A02D1BF29A
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 15:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509FE84681
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 15:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arJ_8ebg0CV6 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 15:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA6784665
 for <buildroot@buildroot.org>; Sun, 29 May 2022 15:10:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3185B78035B;
 Sun, 29 May 2022 17:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653837053;
 bh=D//UBR9Nqvxkn4R7ycns4Lyi6BG/SljtLxoeCtdeMb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TBrxTRjsbo0W+fzff8HoqgrJZR1ki1Rizo9ld23qsFO5hPWyTz4kbepW+QTzfNtfu
 3X7QfObzRvbKb9TzpCoHyNF5NAnFR16PTGJ5izHq5aUsITDEW0XDsx/+TJ8cNZ7eCH
 OzuV7c5uwNQ5F8es3E5STduNgZXM6l68K64mQjeefThGK3VyqwmmTOxwlnJPH80zE+
 bBCdK39dkxDghOY38G07UE4Jc5qR6ASk4XqU/rJBbYFxLpZdoLAyumoywBOzU2EXT7
 oKHiPRIjj/0++a6tQO3e0SCPQ+Ejd8a/Yeqt3DsuZ8DwWmy/vxba+PRKWnj36Uvle/
 0M311iQyFV0fA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 17:10:49 +0200
Date: Sun, 29 May 2022 17:10:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220529151049.GA993669@scaer>
References: <20220521141939.267991-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220521141939.267991-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs: remove
 qemu_arm_versatile_nommu_defconfig
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

Romain, All,

On 2022-05-21 16:19 +0200, Romain Naour spake thusly:
> Since commit [1], the MMU support is mandatory for MMU-capable ARM
> cores. This includes the arm926t ARM core used the
> qemu_arm_versatile_nommu configuration.
> 
> From [2]
> "I don't think supporting ARMv5 noMMU makes much sense, as
> explained in the commit log. Supporting ARMv7-M definitely makes
> sense, but not ARMv5 noMMU."
> 
> Remove this defconfig.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067386
> 
> [1] 8c925613dc1d3af6031c9a39bb51b418cfe2b9d8
> [2] http://lists.busybox.net/pipermail/buildroot/2022-May/643064.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/qemu/arm-versatile/linux-nommu.fragment |  59 ---------
>  .../patches/linux/versatile-nommu.patch       | 122 ------------------
>  board/qemu/arm-versatile/readme.txt           |   4 -
>  configs/qemu_arm_versatile_nommu_defconfig    |  42 ------
>  4 files changed, 227 deletions(-)
>  delete mode 100644 board/qemu/arm-versatile/linux-nommu.fragment
>  delete mode 100644 board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
>  delete mode 100644 configs/qemu_arm_versatile_nommu_defconfig
> 
> diff --git a/board/qemu/arm-versatile/linux-nommu.fragment b/board/qemu/arm-versatile/linux-nommu.fragment
> deleted file mode 100644
> index 6f1cc3f26d..0000000000
> --- a/board/qemu/arm-versatile/linux-nommu.fragment
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -# CONFIG_ARM_SINGLE_ARMV7M is not set
> -CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
> -CONFIG_BINFMT_ELF_FDPIC=y
> -CONFIG_BINFMT_FLAT=y
> -# CONFIG_BLK_DEV_RAM is not set
> -# CONFIG_CRAMFS is not set
> -CONFIG_CMDLINE=""
> -# CONFIG_DEBUG_FS is not set
> -# CONFIG_DEBUG_KERNEL is not set
> -# CONFIG_DEBUG_USER is not set
> -# CONFIG_DRM is not set
> -# CONFIG_EEPROM_LEGACY is not set
> -# CONFIG_EXT2_FS is not set
> -CONFIG_EXT4_FS=y
> -CONFIG_FB_ARMCLCD=y
> -# CONFIG_FONTS is not set
> -CONFIG_FONT_8x16=y
> -CONFIG_FONT_8x8=y
> -# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> -# CONFIG_FTRACE is not set
> -# CONFIG_GPIO_PL061 is not set
> -# CONFIG_HIGH_RES_TIMERS is not set
> -CONFIG_HWMON=y
> -# CONFIG_I2C_VERSATILE is not set
> -CONFIG_INET_DIAG=y
> -CONFIG_INPUT_EVDEV=y
> -CONFIG_IPV6=y
> -# CONFIG_IP_MULTICAST is not set
> -# CONFIG_IP_PNP is not set
> -# CONFIG_MMU is not set
> -CONFIG_LOCALVERSION_AUTO=y
> -# CONFIG_LOGO is not set
> -CONFIG_LOG_BUF_SHIFT=17
> -CONFIG_MDIO_DEVICE=y
> -# CONFIG_MINIX_FS is not set
> -# CONFIG_MMC is not set
> -# CONFIG_MTD is not set
> -# CONFIG_NEW_LEDS is not set
> -# CONFIG_NFSD is not set
> -# CONFIG_NFS_FS is not set
> -# CONFIG_NLS_CODEPAGE_850 is not set
> -# CONFIG_NLS_ISO8859_1 is not set
> -# CONFIG_NO_HZ_IDLE is not set
> -# CONFIG_NVMEM is not set
> -CONFIG_DRAM_BASE=0x00000000
> -CONFIG_DRAM_SIZE=0x08000000
> -CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
> -# CONFIG_PARTITION_ADVANCED is not set
> -# CONFIG_OABI_COMPAT is not set
> -CONFIG_PHYLIB=y
> -# CONFIG_ROMFS_FS is not set
> -# CONFIG_RTC_CLASS is not set
> -CONFIG_SERIAL_CORE=y
> -CONFIG_SERIO_SERPORT=y
> -CONFIG_SET_MEM_PARAM=y
> -CONFIG_SLUB=y
> -# CONFIG_SPI is not set
> -# CONFIG_SYNC_FILE is not set
> -# CONFIG_VFP is not set
> diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> deleted file mode 100644
> index 1a5130deb4..0000000000
> --- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -From 7c245ffc17a9ab6215830d4ecd8b2f9beddb487c Mon Sep 17 00:00:00 2001
> -From: Waldemar Brodkorb <wbx@openadk.org>
> -Date: Fri, 1 Feb 2019 11:36:20 +0100
> -Subject: [PATCH] arm-versatile-nommu: Linux patch
> -
> -Originally made by Waldemar Brodkorb <wbx@openadk.org> from LKML.
> -
> -Rename CLKSRC_OF to TIMER_OF (kernel >= 4.13)
> -https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bb0eb050a577a866cb47c2dc37596f1207f4c2d9
> -
> -Remove GENERIC_CLOCKEVENTS since its enabled by default (kernel >= 5.11)
> -https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0774a6ed294b963dc76df2d8342ab86d030759ec
> -
> -Select CONFIG_GENERIC_IRQ_MULTI_HANDLER since irqchip doesn't select it anymore (kernel >= 5.12)
> -https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a79f7051cccb6f3bcd3d2a0a058c7d5c79bb0371
> -
> -Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
> -[Gerome: reformated as a Git patch]
> -Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
> -[Romain: fix Waldemar's authorship in Git patch]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - arch/arm/Kconfig                       | 11 +++++++++++
> - arch/arm/Kconfig.debug                 |  3 ++-
> - arch/arm/include/asm/mach/map.h        |  1 +
> - arch/arm/mach-versatile/Kconfig        |  5 +++--
> - arch/arm/mach-versatile/Makefile.boot  |  3 +++
> - arch/arm/mach-versatile/versatile_dt.c |  4 ++++
> - 6 files changed, 24 insertions(+), 3 deletions(-)
> - create mode 100644 arch/arm/mach-versatile/Makefile.boot
> -
> -diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index dcf2df6da98f..c2155c1a2eba 100644
> ---- a/arch/arm/Kconfig
> -+++ b/arch/arm/Kconfig
> -@@ -337,6 +337,17 @@ config ARM_SINGLE_ARMV7M
> - 	select SPARSE_IRQ
> - 	select USE_OF
> - 
> -+config ARM_SINGLE_ARCH_VERSATILE
> -+	bool "ARM Ltd. Versatile family"
> -+	depends on !MMU
> -+	select AUTO_ZRELADDR
> -+	select TIMER_OF
> -+	select COMMON_CLK
> -+	select GENERIC_IRQ_MULTI_HANDLER
> -+	select GPIOLIB
> -+	select SPARSE_IRQ
> -+	select USE_OF
> -+
> - config ARCH_EP93XX
> - 	bool "EP93xx-based"
> - 	select ARCH_SPARSEMEM_ENABLE
> -diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> -index 98436702e0c7..7e63299ceb40 100644
> ---- a/arch/arm/Kconfig.debug
> -+++ b/arch/arm/Kconfig.debug
> -@@ -1891,7 +1891,8 @@ config DEBUG_UNCOMPRESS
> - config UNCOMPRESS_INCLUDE
> - 	string
> - 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
> --					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
> -+					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
> -+					ARM_SINGLE_ARCH_VERSATILE
> - 	default "mach/uncompress.h"
> - 
> - config EARLY_PRINTK
> -diff --git a/arch/arm/include/asm/mach/map.h b/arch/arm/include/asm/mach/map.h
> -index 92282558caf7..90bd9c069ffc 100644
> ---- a/arch/arm/include/asm/mach/map.h
> -+++ b/arch/arm/include/asm/mach/map.h
> -@@ -59,6 +59,7 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
> - #else
> - #define iotable_init(map,num)	do { } while (0)
> - #define vm_reserve_area_early(a,s,c)	do { } while (0)
> -+#define debug_ll_io_init()	do { } while (0)
> - #endif
> - 
> - #endif
> -diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> -index d88e7725bf99..d38b90157f13 100644
> ---- a/arch/arm/mach-versatile/Kconfig
> -+++ b/arch/arm/mach-versatile/Kconfig
> -@@ -1,7 +1,8 @@
> - # SPDX-License-Identifier: GPL-2.0
> - config ARCH_VERSATILE
> --	bool "ARM Ltd. Versatile family"
> --	depends on ARCH_MULTI_V5
> -+	bool "ARM Ltd. Versatile family" if ARCH_MULTI_V5
> -+	depends on ARCH_MULTI_V5 || ARM_SINGLE_ARCH_VERSATILE
> -+	default y if ARM_SINGLE_ARCH_VERSATILE
> - 	select ARM_AMBA
> - 	select ARM_TIMER_SP804
> - 	select ARM_VIC
> -diff --git a/arch/arm/mach-versatile/Makefile.boot b/arch/arm/mach-versatile/Makefile.boot
> -new file mode 100644
> -index 000000000000..eacfc3f5c33e
> ---- /dev/null
> -+++ b/arch/arm/mach-versatile/Makefile.boot
> -@@ -0,0 +1,3 @@
> -+# Empty file waiting for deletion once Makefile.boot isn't needed any more.
> -+# Patch waits for application at
> -+# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
> -diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
> -index 02ba68abe533..835b51bc597b 100644
> ---- a/arch/arm/mach-versatile/versatile_dt.c
> -+++ b/arch/arm/mach-versatile/versatile_dt.c
> -@@ -22,7 +22,11 @@
> - #include <asm/mach/map.h>
> - 
> - /* macro to get at MMIO space when running virtually */
> -+#ifdef CONFIG_MMU
> - #define IO_ADDRESS(x)		(((x) & 0x0fffffff) + (((x) >> 4) & 0x0f000000) + 0xf0000000)
> -+#else
> -+#define IO_ADDRESS(x)		(x)
> -+#endif
> - #define __io_address(n)		((void __iomem __force *)IO_ADDRESS(n))
> - 
> - /*
> --- 
> -2.31.1
> -
> diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
> index 223bd55c01..757ef378e9 100644
> --- a/board/qemu/arm-versatile/readme.txt
> +++ b/board/qemu/arm-versatile/readme.txt
> @@ -2,9 +2,5 @@ Run the emulation with:
>  
>    qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user # qemu_arm_versatile_defconfig
>  
> -Or for the noMMU emulation:
> -
> -  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111 # qemu_arm_versatile_nommu_defconfig
> -
>  The login prompt will appear in the terminal that started Qemu. The
>  graphical window is the framebuffer.
> diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
> deleted file mode 100644
> index 0c49d1b67d..0000000000
> --- a/configs/qemu_arm_versatile_nommu_defconfig
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# Architecture
> -BR2_arm=y
> -BR2_arm926t=y
> -
> -# Toolchain
> -BR2_PACKAGE_HOST_ELF2FLT=y
> -# BR2_USE_MMU is not set
> -
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/qemu/arm-versatile/patches"
> -
> -# Busybox with hush
> -BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> -
> -# System
> -BR2_SYSTEM_DHCP="eth0"
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -
> -# Filesystem
> -# BR2_TARGET_ROOTFS_EXT2 is not set
> -# BR2_TARGET_ROOTFS_TAR is not set
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> -
> -# Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> -BR2_LINUX_KERNEL_DEFCONFIG="versatile"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux-nommu.fragment"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
> -
> -# host-qemu for gitlab testing
> -BR2_PACKAGE_HOST_QEMU=y
> -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.35.3
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
