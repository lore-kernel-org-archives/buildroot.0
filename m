Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC39C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B7140C0E;
	Sun, 20 Jul 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rONiSg5UtyAp; Sun, 20 Jul 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE84D40BDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE84D40BDB;
	Sun, 20 Jul 2025 16:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E431F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55F940BAA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 543oanSleriB for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 16:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B74840B6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B74840B6C
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05D01868A8; Sun, 20 Jul 2025 16:31:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 17:40:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ccd9300cdca0358cd7b10c3f87a3cbac1b328d6
X-Git-Newrev: 91b9d8c32b3c5793b795558d6890a168819df3e3
X-Patchwork-Hint: ignore
Message-Id: <20250720163109.05D01868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.39 and U-Boot to 2025.07
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91b9d8c32b3c5793b795558d6890a168819df3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 6.12.39 and U-Boot to
version 2025.07. The patches applied to U-Boot by Buildroot have been
removed, as they are included in version 2025.07.

The patch has been tested on both boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../imx8mn-bsh-smm-s2/patches/linux/linux.hash     |   2 +-
 ...0001-arm-imx-imx8m-soc-fix-the-macro-name.patch |  45 ------
 ...imx-imx8m-soc-replace-ifdef-by-IS_ENABLED.patch | 178 ---------------------
 ...Kconfig-support-U-Boot-load-from-raw-NAND.patch |  49 ------
 ...mx-spl_imx_romapi-support-raw-NAND-sector.patch |  42 -----
 ...x8mn_bsh_smm_s2-load-U-Boot-from-raw-NAND.patch |  32 ----
 .../imx8mn-bsh-smm-s2/patches/uboot/uboot.hash     |   2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                |   4 +-
 configs/imx8mn_bsh_smm_s2_pro_defconfig            |   4 +-
 9 files changed, 6 insertions(+), 352 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index 0add29fcf0..839b62862a 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d8d95404f8deeb7ff6992c0df855025062e9e8182bca6daa27ef2e9275d27749  linux-6.12.23.tar.xz
+sha256  6e562502a8fd11639f558e43b74f0df0d85fa85e60f5332acb275a75a35f5345  linux-6.12.39.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0001-arm-imx-imx8m-soc-fix-the-macro-name.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0001-arm-imx-imx8m-soc-fix-the-macro-name.patch
deleted file mode 100644
index 6d53dddfb8..0000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0001-arm-imx-imx8m-soc-fix-the-macro-name.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f7cddc4c6f4e4da57c6500cd0d88ea06e937b239 Mon Sep 17 00:00:00 2001
-From: Michael Trimarchi <michael@amarulasolutions.com>
-Date: Thu, 15 May 2025 17:09:51 +0200
-Subject: [PATCH] arm: imx: imx8m: soc: fix the macro name
-
-The function arch_spl_mmc_get_uboot_raw_sector() was never compiled,
-even when the option CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION was
-enabled. So rename the macro SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION to
-CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION.
-
-Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
-Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
-Reviewed-by: Peng Fan <peng.fan@nxp.com>
-Upstream: https://source.denx.de/u-boot/u-boot/-/commit/f7cddc4c6f4e4da57c6500cd0d88ea06e937b239
----
- arch/arm/mach-imx/imx8m/soc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/mach-imx/imx8m/soc.c b/arch/arm/mach-imx/imx8m/soc.c
-index 567e8e9e81a0..806adcf145fa 100644
---- a/arch/arm/mach-imx/imx8m/soc.c
-+++ b/arch/arm/mach-imx/imx8m/soc.c
-@@ -791,7 +791,7 @@ int boot_mode_getprisec(void)
- #endif
- 
- #if defined(CONFIG_IMX8MN) || defined(CONFIG_IMX8MP)
--#ifdef SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
-+#ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
- #define IMG_CNTN_SET1_OFFSET	GENMASK(22, 19)
- unsigned long arch_spl_mmc_get_uboot_raw_sector(struct mmc *mmc,
- 						unsigned long raw_sect)
-@@ -826,7 +826,7 @@ unsigned long arch_spl_mmc_get_uboot_raw_sector(struct mmc *mmc,
- 
- 	return raw_sect;
- }
--#endif /* SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION */
-+#endif /* CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION */
- #endif
- 
- bool is_usb_boot(void)
--- 
-2.43.0
-
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0002-arm-imx-imx8m-soc-replace-ifdef-by-IS_ENABLED.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0002-arm-imx-imx8m-soc-replace-ifdef-by-IS_ENABLED.patch
deleted file mode 100644
index 5f57c69481..0000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0002-arm-imx-imx8m-soc-replace-ifdef-by-IS_ENABLED.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 4c82eeab9840983693791117aa75f7bd7fbc805b Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Thu, 15 May 2025 17:09:52 +0200
-Subject: [PATCH] arm: imx: imx8m: soc: replace ifdef by IS_ENABLED()
-
-Standardize on using the IS_ENABLED macro.
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Reviewed-by: Peng Fan <peng.fan@nxp.com>
-Upstream: https://source.denx.de/u-boot/u-boot/-/commit/4c82eeab9840983693791117aa75f7bd7fbc805b
----
- arch/arm/mach-imx/imx8m/soc.c | 40 +++++++++++++++++------------------
- 1 file changed, 20 insertions(+), 20 deletions(-)
-
-diff --git a/arch/arm/mach-imx/imx8m/soc.c b/arch/arm/mach-imx/imx8m/soc.c
-index 806adcf145fa..3cdb71a25284 100644
---- a/arch/arm/mach-imx/imx8m/soc.c
-+++ b/arch/arm/mach-imx/imx8m/soc.c
-@@ -38,7 +38,7 @@
- 
- DECLARE_GLOBAL_DATA_PTR;
- 
--#if defined(CONFIG_IMX_HAB)
-+#if IS_ENABLED(CONFIG_IMX_HAB)
- struct imx_fuse const imx_sec_config_fuse = {
- 	.bank = 1,
- 	.word = 3,
-@@ -52,7 +52,7 @@ struct imx_fuse const imx_field_return_fuse = {
- 
- int timer_init(void)
- {
--#ifdef CONFIG_XPL_BUILD
-+#if IS_ENABLED(CONFIG_XPL_BUILD)
- 	struct sctr_regs *sctr = (struct sctr_regs *)SYSCNT_CTRL_BASE_ADDR;
- 	unsigned long freq = readl(&sctr->cntfid0);
- 
-@@ -110,7 +110,7 @@ void set_wdog_reset(struct wdog_regs *wdog)
- 	setbits_le16(&wdog->wcr, WDOG_WDT_MASK | WDOG_WDZST_MASK);
- }
- 
--#ifdef CONFIG_ARMV8_PSCI
-+#if IS_ENABLED(CONFIG_ARMV8_PSCI)
- #define PTE_MAP_NS	PTE_BLOCK_NS
- #else
- #define PTE_MAP_NS	0
-@@ -700,11 +700,11 @@ int arch_cpu_init(void)
- 	return 0;
- }
- 
--#if defined(CONFIG_IMX8MN) || defined(CONFIG_IMX8MP)
-+#if IS_ENABLED(CONFIG_IMX8MN) || IS_ENABLED(CONFIG_IMX8MP)
- struct rom_api *g_rom_api = (struct rom_api *)0x980;
- #endif
- 
--#if defined(CONFIG_IMX8M)
-+#if IS_ENABLED(CONFIG_IMX8M)
- #include <spl.h>
- int imx8m_detect_secondary_image_boot(void)
- {
-@@ -790,8 +790,8 @@ int boot_mode_getprisec(void)
- }
- #endif
- 
--#if defined(CONFIG_IMX8MN) || defined(CONFIG_IMX8MP)
--#ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
-+#if IS_ENABLED(CONFIG_IMX8MN) || IS_ENABLED(CONFIG_IMX8MP)
-+#if IS_ENABLED(CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION)
- #define IMG_CNTN_SET1_OFFSET	GENMASK(22, 19)
- unsigned long arch_spl_mmc_get_uboot_raw_sector(struct mmc *mmc,
- 						unsigned long raw_sect)
-@@ -834,7 +834,7 @@ bool is_usb_boot(void)
- 	return get_boot_device() == USB_BOOT;
- }
- 
--#ifdef CONFIG_OF_SYSTEM_SETUP
-+#if IS_ENABLED(CONFIG_OF_SYSTEM_SETUP)
- bool check_fdt_new_path(void *blob)
- {
- 	const char *soc_path = "/soc@0";
-@@ -880,7 +880,7 @@ add_status:
- 	return 0;
- }
- 
--#ifdef CONFIG_IMX8MQ
-+#if IS_ENABLED(CONFIG_IMX8MQ)
- bool check_dcss_fused(void)
- {
- 	struct ocotp_regs *ocotp = (struct ocotp_regs *)OCOTP_BASE_ADDR;
-@@ -1026,7 +1026,7 @@ int disable_vpu_nodes(void *blob)
- 		return -EPERM;
- }
- 
--#ifdef CONFIG_IMX8MN_LOW_DRIVE_MODE
-+#if IS_ENABLED(CONFIG_IMX8MN_LOW_DRIVE_MODE)
- static int low_drive_gpu_freq(void *blob)
- {
- 	static const char *nodes_path_8mn[] = {
-@@ -1311,7 +1311,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
- 		"/cpus/cpu@3",
- 	};
- 
--#ifdef CONFIG_IMX8MQ
-+#if IS_ENABLED(CONFIG_IMX8MQ)
- 	int i = 0;
- 	int rc;
- 	int nodeoff;
-@@ -1387,7 +1387,7 @@ usb_modify_speed:
- 	if (is_imx8md())
- 		disable_cpu_nodes(blob, nodes_path, 2, 4);
- 
--#elif defined(CONFIG_IMX8MM)
-+#elif IS_ENABLED(CONFIG_IMX8MM)
- 	if (is_imx8mml() || is_imx8mmdl() ||  is_imx8mmsl())
- 		disable_vpu_nodes(blob);
- 
-@@ -1396,10 +1396,10 @@ usb_modify_speed:
- 	else if (is_imx8mms() || is_imx8mmsl())
- 		disable_cpu_nodes(blob, nodes_path, 3, 4);
- 
--#elif defined(CONFIG_IMX8MN)
-+#elif IS_ENABLED(CONFIG_IMX8MN)
- 	if (is_imx8mnl() || is_imx8mndl() ||  is_imx8mnsl())
- 		disable_gpu_nodes(blob);
--#ifdef CONFIG_IMX8MN_LOW_DRIVE_MODE
-+#if IS_ENABLED(CONFIG_IMX8MN_LOW_DRIVE_MODE)
- 	else {
- 		int ldm_gpu = low_drive_gpu_freq(blob);
- 
-@@ -1415,7 +1415,7 @@ usb_modify_speed:
- 	else if (is_imx8mns() || is_imx8mnsl() || is_imx8mnus())
- 		disable_cpu_nodes(blob, nodes_path, 3, 4);
- 
--#elif defined(CONFIG_IMX8MP)
-+#elif IS_ENABLED(CONFIG_IMX8MP)
- 	if (is_imx8mpul()) {
- 		/* Disable GPU */
- 		disable_gpu_nodes(blob);
-@@ -1471,7 +1471,7 @@ void reset_cpu(void)
- }
- #endif
- 
--#if defined(CONFIG_ARCH_MISC_INIT)
-+#if IS_ENABLED(CONFIG_ARCH_MISC_INIT)
- int arch_misc_init(void)
- {
- 	if (IS_ENABLED(CONFIG_FSL_CAAM)) {
-@@ -1487,8 +1487,8 @@ int arch_misc_init(void)
- }
- #endif
- 
--#if defined(CONFIG_XPL_BUILD)
--#if defined(CONFIG_IMX8MQ) || defined(CONFIG_IMX8MM) || defined(CONFIG_IMX8MN)
-+#if IS_ENABLED(CONFIG_XPL_BUILD)
-+#if IS_ENABLED(CONFIG_IMX8MQ) || IS_ENABLED(CONFIG_IMX8MM) || IS_ENABLED(CONFIG_IMX8MN)
- bool serror_need_skip = true;
- 
- void do_error(struct pt_regs *pt_regs)
-@@ -1523,7 +1523,7 @@ void do_error(struct pt_regs *pt_regs)
- #endif
- #endif
- 
--#if defined(CONFIG_IMX8MN) || defined(CONFIG_IMX8MP)
-+#if IS_ENABLED(CONFIG_IMX8MN) || IS_ENABLED(CONFIG_IMX8MP)
- enum env_location arch_env_get_location(enum env_operation op, int prio)
- {
- 	enum boot_device dev = get_boot_device();
-@@ -1571,7 +1571,7 @@ enum env_location arch_env_get_location(enum env_operation op, int prio)
- 
- #endif
- 
--#ifdef CONFIG_IMX_BOOTAUX
-+#if IS_ENABLED(CONFIG_IMX_BOOTAUX)
- const struct rproc_att hostmap[] = {
- 	/* aux core , host core,  size */
- 	{ 0x00000000, 0x007e0000, 0x00020000 },
--- 
-2.43.0
-
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0003-spl-Kconfig-support-U-Boot-load-from-raw-NAND.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0003-spl-Kconfig-support-U-Boot-load-from-raw-NAND.patch
deleted file mode 100644
index 4e8ade441a..0000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0003-spl-Kconfig-support-U-Boot-load-from-raw-NAND.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8acea298bb82c38b20855cd46a46b9e418dc1fb0 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Tue, 20 May 2025 10:54:16 +0200
-Subject: [PATCH] spl: Kconfig: support U-Boot load from raw NAND
-
-Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options") breaks
-the boot of the BSH SMM S2 board. As stated in the commit itself, "Some
-boards use this value even though MMC is not enabled in SPL, for example
-imx8mn_bsh_smm_s2".
-
-Support load of the U-Boot image from raw NAND sector. This is equivalent
-to load from MMC raw sector.
-
-Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://source.denx.de/u-boot/u-boot/-/commit/8acea298bb82c38b20855cd46a46b9e418dc1fb0
----
- common/spl/Kconfig | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/common/spl/Kconfig b/common/spl/Kconfig
-index aa3a85eea54d..77cf04d38ed0 100644
---- a/common/spl/Kconfig
-+++ b/common/spl/Kconfig
-@@ -974,6 +974,21 @@ config SPL_NAND_SUPPORT
- 	  This enables the drivers in drivers/mtd/nand/raw as part of an SPL
- 	  build.
- 
-+config SPL_NAND_RAW_U_BOOT_USE_SECTOR
-+	bool "NAND raw mode: by sector"
-+	depends on SPL_NAND_SUPPORT
-+	select SPL_LOAD_BLOCK
-+	help
-+	  Use sector number for specifying U-Boot location on NAND in
-+	  raw mode.
-+
-+config SPL_NAND_RAW_U_BOOT_SECTOR
-+	hex "Address on the NAND to load U-Boot from"
-+	depends on SPL_NAND_RAW_U_BOOT_USE_SECTOR
-+	help
-+	  Address on the NAND to load U-Boot from, when the NAND is being used
-+	  in raw mode. Units: NAND disk sectors (1 sector = 512 bytes).
-+
- config SPL_NAND_RAW_ONLY
- 	bool "Support to boot only raw u-boot.bin images"
- 	depends on SPL_NAND_SUPPORT
--- 
-2.43.0
-
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0004-imx-spl_imx_romapi-support-raw-NAND-sector.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0004-imx-spl_imx_romapi-support-raw-NAND-sector.patch
deleted file mode 100644
index cc35a76f88..0000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0004-imx-spl_imx_romapi-support-raw-NAND-sector.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 24d98fa63bbcb21988e4e822f11686319502fb1f Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Tue, 20 May 2025 10:54:17 +0200
-Subject: [PATCH] imx: spl_imx_romapi: support raw NAND sector
-
-Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options") breaks
-the boot of the BSH SMM S2 board. As stated in the dropped comment, "Some
-boards use this value even though MMC is not enabled in SPL, for example
-imx8mn_bsh_smm_s2".
-
-Support load of the U-Boot image from raw NAND sector.
-
-Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://source.denx.de/u-boot/u-boot/-/commit/24d98fa63bbcb21988e4e822f11686319502fb1f
----
- arch/arm/mach-imx/spl_imx_romapi.c | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/arch/arm/mach-imx/spl_imx_romapi.c b/arch/arm/mach-imx/spl_imx_romapi.c
-index 3982f4cca184..b7008df8e35a 100644
---- a/arch/arm/mach-imx/spl_imx_romapi.c
-+++ b/arch/arm/mach-imx/spl_imx_romapi.c
-@@ -35,12 +35,10 @@ ulong __weak spl_romapi_get_uboot_base(u32 image_offset, u32 rom_bt_dev)
- {
- 	u32 sector = 0;
- 
--	/*
--	 * Some boards use this value even though MMC is not enabled in SPL, for
--	 * example imx8mn_bsh_smm_s2
--	 */
--#ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR
-+#if IS_ENABLED(CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR)
- 	sector = CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR;
-+#elif IS_ENABLED(CONFIG_SPL_NAND_RAW_U_BOOT_USE_SECTOR)
-+	sector = CONFIG_SPL_NAND_RAW_U_BOOT_SECTOR;
- #endif
- 
- 	return image_offset + sector * 512 - 0x8000;
--- 
-2.43.0
-
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0005-configs-imx8mn_bsh_smm_s2-load-U-Boot-from-raw-NAND.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0005-configs-imx8mn_bsh_smm_s2-load-U-Boot-from-raw-NAND.patch
deleted file mode 100644
index 61eccd51ff..0000000000
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/0005-configs-imx8mn_bsh_smm_s2-load-U-Boot-from-raw-NAND.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From dce71922df352b0eb1b6cc3d40c374ad80a7d6c5 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Tue, 20 May 2025 10:54:18 +0200
-Subject: [PATCH] configs: imx8mn_bsh_smm_s2: load U-Boot from raw NAND
-
-Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options") breaks
-the boot of the BSH SMM S2 board. Add options to load U-Boot from raw NAND
-sector.
-
-Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://source.denx.de/u-boot/u-boot/-/commit/dce71922df352b0eb1b6cc3d40c374ad80a7d6c5
----
- configs/imx8mn_bsh_smm_s2_defconfig | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
-index 9ffcd3b221c3..1c11d4705419 100644
---- a/configs/imx8mn_bsh_smm_s2_defconfig
-+++ b/configs/imx8mn_bsh_smm_s2_defconfig
-@@ -47,6 +47,8 @@ CONFIG_SPL_DMA=y
- CONFIG_SPL_I2C=y
- CONFIG_SPL_MTD=y
- CONFIG_SPL_NAND_SUPPORT=y
-+CONFIG_SPL_NAND_RAW_U_BOOT_USE_SECTOR=y
-+CONFIG_SPL_NAND_RAW_U_BOOT_SECTOR=0x300
- CONFIG_SPL_NAND_BASE=y
- CONFIG_SPL_NAND_IDENT=y
- CONFIG_SPL_POWER=y
--- 
-2.43.0
-
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 80ea21b7cb..440526977b 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 0b1334fc90..662aea69de 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.23"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index b00dd03b69..f1e9d0c0a1 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.23"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.39"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
