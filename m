Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E78C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C9C84689;
	Sat, 21 May 2022 14:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lDqweEHmkwX; Sat, 21 May 2022 14:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ADBC8464D;
	Sat, 21 May 2022 14:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED0F21BF475
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 14:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D952F40B14
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 14:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytQIYh3eaECF for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 14:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71B08400AB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 14:19:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso3947277wmn.4
 for <buildroot@buildroot.org>; Sat, 21 May 2022 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPYOlCr6lg6n7zLCgZQI4b/Qpz9xDvJW8ZDdmh701DU=;
 b=gDTH5JQXVXqx3tt7svkJV5R/4yDJ1FGDQWOhZgcffyw92sWeqLbYdqnXMEvgZnZ9Zd
 o+k8rQt41NbxyN8g12eUkjYBCAzhNs0AXytmPZJ94GYrZ6ZuwYyTd+NURyFN6+pMJPyj
 BqdKa7Ht6q2fMj3Dj+loSXauypghH+b+hf9o0bx37kQxGiGcFIteMSpxnHCMLSbQTxuw
 2Hd77caXgKwPFf2UROgkMC8wjFIQ5q43i8uzNZQ5E5goaqJPxm3w02jYMFfKdLtPzvj7
 04AVYySd23M9vQI/6HSa0iUmKbiw5EG+N+KQRojdvtxHAS+nJTXRm2/GTkfw6BZsu+fT
 IE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPYOlCr6lg6n7zLCgZQI4b/Qpz9xDvJW8ZDdmh701DU=;
 b=c2O2P2sxZHriJQJdA4XMQHu5FE0MuOVAWxeuXnJ9Agw5q0FXUrk9p3tO3Omzj5pOOj
 YFwqg9uxpi4sIfIrc1C37ll/a85jVYFZNxEJcf9a9sqSrN5jhUT1r1eU4AHz+1S5n1rB
 ILgdwN2bfFY4CDywXF7is5xSDs3GYEAuSxpqAJVDxV4YX9hATdIos1gB/m4jalFHIt2o
 0dtKWrvdvb8rcV0W5D1+xe2XWSSjCx1O6G4Wo0Jxek4I1HQJUVgXEvFcQlecjdkdEEjX
 SKkwDVYdMvA6mBSHUCsKPmrdlhcl+XMeu0C9ZVH124g/Tw0cvGCsyxBPFKXpdyxhb97M
 AIMA==
X-Gm-Message-State: AOAM530r382w2CX2H4E98/QFItSnmwWerSW56p7jTIi8mV49KGztpXkQ
 9h8If81OPum8iyl8BfW5Y0bKNJr4u+Y=
X-Google-Smtp-Source: ABdhPJyUHdDGwM+THN/pkWHIx3q4dlRPACHWMDFrfnjyHmMtRKmW6KFRS/REQQrTjFBH4zyRJWmUDQ==
X-Received: by 2002:a1c:acc6:0:b0:38e:b184:7721 with SMTP id
 v189-20020a1cacc6000000b0038eb1847721mr12451600wme.94.1653142784501; 
 Sat, 21 May 2022 07:19:44 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d21-20020adf9b95000000b0020d06e7c16fsm5110462wrc.84.2022.05.21.07.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 07:19:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 16:19:39 +0200
Message-Id: <20220521141939.267991-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs: remove
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1], the MMU support is mandatory for MMU-capable ARM
cores. This includes the arm926t ARM core used the
qemu_arm_versatile_nommu configuration.

From [2]
"I don't think supporting ARMv5 noMMU makes much sense, as
explained in the commit log. Supporting ARMv7-M definitely makes
sense, but not ARMv5 noMMU."

Remove this defconfig.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067386

[1] 8c925613dc1d3af6031c9a39bb51b418cfe2b9d8
[2] http://lists.busybox.net/pipermail/buildroot/2022-May/643064.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/arm-versatile/linux-nommu.fragment |  59 ---------
 .../patches/linux/versatile-nommu.patch       | 122 ------------------
 board/qemu/arm-versatile/readme.txt           |   4 -
 configs/qemu_arm_versatile_nommu_defconfig    |  42 ------
 4 files changed, 227 deletions(-)
 delete mode 100644 board/qemu/arm-versatile/linux-nommu.fragment
 delete mode 100644 board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
 delete mode 100644 configs/qemu_arm_versatile_nommu_defconfig

diff --git a/board/qemu/arm-versatile/linux-nommu.fragment b/board/qemu/arm-versatile/linux-nommu.fragment
deleted file mode 100644
index 6f1cc3f26d..0000000000
--- a/board/qemu/arm-versatile/linux-nommu.fragment
+++ /dev/null
@@ -1,59 +0,0 @@
-# CONFIG_ARM_SINGLE_ARMV7M is not set
-CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
-CONFIG_BINFMT_ELF_FDPIC=y
-CONFIG_BINFMT_FLAT=y
-# CONFIG_BLK_DEV_RAM is not set
-# CONFIG_CRAMFS is not set
-CONFIG_CMDLINE=""
-# CONFIG_DEBUG_FS is not set
-# CONFIG_DEBUG_KERNEL is not set
-# CONFIG_DEBUG_USER is not set
-# CONFIG_DRM is not set
-# CONFIG_EEPROM_LEGACY is not set
-# CONFIG_EXT2_FS is not set
-CONFIG_EXT4_FS=y
-CONFIG_FB_ARMCLCD=y
-# CONFIG_FONTS is not set
-CONFIG_FONT_8x16=y
-CONFIG_FONT_8x8=y
-# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
-# CONFIG_FTRACE is not set
-# CONFIG_GPIO_PL061 is not set
-# CONFIG_HIGH_RES_TIMERS is not set
-CONFIG_HWMON=y
-# CONFIG_I2C_VERSATILE is not set
-CONFIG_INET_DIAG=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_IPV6=y
-# CONFIG_IP_MULTICAST is not set
-# CONFIG_IP_PNP is not set
-# CONFIG_MMU is not set
-CONFIG_LOCALVERSION_AUTO=y
-# CONFIG_LOGO is not set
-CONFIG_LOG_BUF_SHIFT=17
-CONFIG_MDIO_DEVICE=y
-# CONFIG_MINIX_FS is not set
-# CONFIG_MMC is not set
-# CONFIG_MTD is not set
-# CONFIG_NEW_LEDS is not set
-# CONFIG_NFSD is not set
-# CONFIG_NFS_FS is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_ISO8859_1 is not set
-# CONFIG_NO_HZ_IDLE is not set
-# CONFIG_NVMEM is not set
-CONFIG_DRAM_BASE=0x00000000
-CONFIG_DRAM_SIZE=0x08000000
-CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
-# CONFIG_PARTITION_ADVANCED is not set
-# CONFIG_OABI_COMPAT is not set
-CONFIG_PHYLIB=y
-# CONFIG_ROMFS_FS is not set
-# CONFIG_RTC_CLASS is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIO_SERPORT=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_SLUB=y
-# CONFIG_SPI is not set
-# CONFIG_SYNC_FILE is not set
-# CONFIG_VFP is not set
diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
deleted file mode 100644
index 1a5130deb4..0000000000
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 7c245ffc17a9ab6215830d4ecd8b2f9beddb487c Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 1 Feb 2019 11:36:20 +0100
-Subject: [PATCH] arm-versatile-nommu: Linux patch
-
-Originally made by Waldemar Brodkorb <wbx@openadk.org> from LKML.
-
-Rename CLKSRC_OF to TIMER_OF (kernel >= 4.13)
-https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bb0eb050a577a866cb47c2dc37596f1207f4c2d9
-
-Remove GENERIC_CLOCKEVENTS since its enabled by default (kernel >= 5.11)
-https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0774a6ed294b963dc76df2d8342ab86d030759ec
-
-Select CONFIG_GENERIC_IRQ_MULTI_HANDLER since irqchip doesn't select it anymore (kernel >= 5.12)
-https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a79f7051cccb6f3bcd3d2a0a058c7d5c79bb0371
-
-Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Gerome: reformated as a Git patch]
-Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
-[Romain: fix Waldemar's authorship in Git patch]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- arch/arm/Kconfig                       | 11 +++++++++++
- arch/arm/Kconfig.debug                 |  3 ++-
- arch/arm/include/asm/mach/map.h        |  1 +
- arch/arm/mach-versatile/Kconfig        |  5 +++--
- arch/arm/mach-versatile/Makefile.boot  |  3 +++
- arch/arm/mach-versatile/versatile_dt.c |  4 ++++
- 6 files changed, 24 insertions(+), 3 deletions(-)
- create mode 100644 arch/arm/mach-versatile/Makefile.boot
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index dcf2df6da98f..c2155c1a2eba 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -337,6 +337,17 @@ config ARM_SINGLE_ARMV7M
- 	select SPARSE_IRQ
- 	select USE_OF
- 
-+config ARM_SINGLE_ARCH_VERSATILE
-+	bool "ARM Ltd. Versatile family"
-+	depends on !MMU
-+	select AUTO_ZRELADDR
-+	select TIMER_OF
-+	select COMMON_CLK
-+	select GENERIC_IRQ_MULTI_HANDLER
-+	select GPIOLIB
-+	select SPARSE_IRQ
-+	select USE_OF
-+
- config ARCH_EP93XX
- 	bool "EP93xx-based"
- 	select ARCH_SPARSEMEM_ENABLE
-diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
-index 98436702e0c7..7e63299ceb40 100644
---- a/arch/arm/Kconfig.debug
-+++ b/arch/arm/Kconfig.debug
-@@ -1891,7 +1891,8 @@ config DEBUG_UNCOMPRESS
- config UNCOMPRESS_INCLUDE
- 	string
- 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
--					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
-+					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
-+					ARM_SINGLE_ARCH_VERSATILE
- 	default "mach/uncompress.h"
- 
- config EARLY_PRINTK
-diff --git a/arch/arm/include/asm/mach/map.h b/arch/arm/include/asm/mach/map.h
-index 92282558caf7..90bd9c069ffc 100644
---- a/arch/arm/include/asm/mach/map.h
-+++ b/arch/arm/include/asm/mach/map.h
-@@ -59,6 +59,7 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
- #else
- #define iotable_init(map,num)	do { } while (0)
- #define vm_reserve_area_early(a,s,c)	do { } while (0)
-+#define debug_ll_io_init()	do { } while (0)
- #endif
- 
- #endif
-diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
-index d88e7725bf99..d38b90157f13 100644
---- a/arch/arm/mach-versatile/Kconfig
-+++ b/arch/arm/mach-versatile/Kconfig
-@@ -1,7 +1,8 @@
- # SPDX-License-Identifier: GPL-2.0
- config ARCH_VERSATILE
--	bool "ARM Ltd. Versatile family"
--	depends on ARCH_MULTI_V5
-+	bool "ARM Ltd. Versatile family" if ARCH_MULTI_V5
-+	depends on ARCH_MULTI_V5 || ARM_SINGLE_ARCH_VERSATILE
-+	default y if ARM_SINGLE_ARCH_VERSATILE
- 	select ARM_AMBA
- 	select ARM_TIMER_SP804
- 	select ARM_VIC
-diff --git a/arch/arm/mach-versatile/Makefile.boot b/arch/arm/mach-versatile/Makefile.boot
-new file mode 100644
-index 000000000000..eacfc3f5c33e
---- /dev/null
-+++ b/arch/arm/mach-versatile/Makefile.boot
-@@ -0,0 +1,3 @@
-+# Empty file waiting for deletion once Makefile.boot isn't needed any more.
-+# Patch waits for application at
-+# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
-diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
-index 02ba68abe533..835b51bc597b 100644
---- a/arch/arm/mach-versatile/versatile_dt.c
-+++ b/arch/arm/mach-versatile/versatile_dt.c
-@@ -22,7 +22,11 @@
- #include <asm/mach/map.h>
- 
- /* macro to get at MMIO space when running virtually */
-+#ifdef CONFIG_MMU
- #define IO_ADDRESS(x)		(((x) & 0x0fffffff) + (((x) >> 4) & 0x0f000000) + 0xf0000000)
-+#else
-+#define IO_ADDRESS(x)		(x)
-+#endif
- #define __io_address(n)		((void __iomem __force *)IO_ADDRESS(n))
- 
- /*
--- 
-2.31.1
-
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 223bd55c01..757ef378e9 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -2,9 +2,5 @@ Run the emulation with:
 
   qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user # qemu_arm_versatile_defconfig
 
-Or for the noMMU emulation:
-
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111 # qemu_arm_versatile_nommu_defconfig
-
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
deleted file mode 100644
index 0c49d1b67d..0000000000
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ /dev/null
@@ -1,42 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
-# BR2_USE_MMU is not set
-
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/arm-versatile/patches"
-
-# Busybox with hush
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
-# System
-BR2_SYSTEM_DHCP="eth0"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-
-# Filesystem
-# BR2_TARGET_ROOTFS_EXT2 is not set
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# Linux headers same as kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
-BR2_LINUX_KERNEL_DEFCONFIG="versatile"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux-nommu.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
-
-# host-qemu for gitlab testing
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
