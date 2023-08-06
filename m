Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E7C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5EF34011A;
	Sun,  6 Aug 2023 15:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5EF34011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGdMAW8b1kXp; Sun,  6 Aug 2023 15:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4CD4054E;
	Sun,  6 Aug 2023 15:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4CD4054E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5C91BF5DA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83605809EF
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83605809EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEOLjPy8YVhM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:40:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5787815CA
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5787815CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A376F84529; Sun,  6 Aug 2023 15:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 17:39:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8aa64eecb0da4dfee7da41a66589d7b46c6730e5
X-Git-Newrev: 78039eb59acfb2c3051ca81e7e161d9e281d3983
X-Patchwork-Hint: ignore
Message-Id: <20230806154027.A376F84529@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/zynqmp: bump to
 xilinx-v2023.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78039eb59acfb2c3051ca81e7e161d9e281d3983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps the zynqmp defconfigs to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8 (including mainline buildroot patches)
- PMUFW xilinx_v2023.1
- Updated pm_cfg_obj.c from Vitis v2023.1
- Removed kria u-boot patch which is included with xilinx-v2023.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 board/zynqmp/kria/kv260/pm_cfg_obj.c               | 69 ++--------------------
 .../v1-0001-makefile-add-multi_dtb_fit-dep.patch   | 32 ----------
 ...ild-add-support-for-new-binutils-versions.patch |  2 +-
 .../0002-build-tools-avoid-unnecessary-link.patch  |  1 +
 board/zynqmp/zcu102/pm_cfg_obj.c                   | 51 ++--------------
 board/zynqmp/zcu106/pm_cfg_obj.c                   | 51 ++--------------
 configs/zynqmp_kria_kv260_defconfig                | 15 ++---
 configs/zynqmp_zcu102_defconfig                    | 13 ++--
 configs/zynqmp_zcu106_defconfig                    | 13 ++--
 10 files changed, 39 insertions(+), 209 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1d96ae5ca0..d7fab118a9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -101,7 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
-board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
diff --git a/board/zynqmp/kria/kv260/pm_cfg_obj.c b/board/zynqmp/kria/kv260/pm_cfg_obj.c
index 019df6e237..fc6c4024c6 100644
--- a/board/zynqmp/kria/kv260/pm_cfg_obj.c
+++ b/board/zynqmp/kria/kv260/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	34,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -151,54 +150,22 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SATA,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_UART_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_UART_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SPI_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_I2C_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +182,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,14 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_CAN_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_EXTERN,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -259,22 +214,10 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCIE,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_VCU,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_PL,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -545,8 +488,6 @@ __root const u32 XPm_ConfigObject[] =
 	/**********************************************************************/
 	/* GPO SECTION */
 	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
-	PM_CONFIG_GPO1_BIT_2_MASK |
-	PM_CONFIG_GPO1_MIO_PIN_34_MAP |
 	PM_CONFIG_GPO1_MIO_PIN_35_MAP |
 	0,					/* State of GPO pins */
 };
diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
deleted file mode 100644
index ddc04cacac..0000000000
--- a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8b181bf582c17cf709a62cf499f9709c94f49d33 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 21 Dec 2022 07:51:42 +0000
-Subject: [PATCH v1 1/1] makefile: add multi_dtb_fit dep
-
-With certain gcc compilers, the u-boot.itb is built immediately after dtb
-generation.  If CONFIG_MULTI_DTB_FIT is used, it is possible that the
-fit-dtb.blob is not finished in time.
-
-This patch adds a necessary dependency to guarantee that the fit-dtb.blob
-is built before attempting to build the u-boot.itb.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index b96e2ffa15..682a5d94fd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1425,6 +1425,7 @@ MKIMAGEFLAGS_u-boot.itb += -B 0x8
- ifdef U_BOOT_ITS
- u-boot.itb: u-boot-nodtb.bin \
- 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
-+		$(if $(CONFIG_MULTI_DTB_FIT),$(FINAL_DTB_CONTAINER)) \
- 		$(U_BOOT_ITS) FORCE
- 	$(call if_changed,mkfitimage)
- 	$(BOARD_SIZE_CHECK)
--- 
-2.17.1
-
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
index 695cc80b94..8ad996914b 120000
--- a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -1 +1 @@
-../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
+../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
new file mode 120000
index 0000000000..fecdee5449
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
diff --git a/board/zynqmp/zcu102/pm_cfg_obj.c b/board/zynqmp/zcu102/pm_cfg_obj.c
index 68557c4cb4..04bfb16e35 100644
--- a/board/zynqmp/zcu102/pm_cfg_obj.c
+++ b/board/zynqmp/zcu102/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	38,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -155,18 +154,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -179,14 +166,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_SPI_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -195,10 +174,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,10 +198,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_CAN_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -263,18 +230,10 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_VCU,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_PL,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
diff --git a/board/zynqmp/zcu106/pm_cfg_obj.c b/board/zynqmp/zcu106/pm_cfg_obj.c
index 6d15d510e9..54a1afa902 100644
--- a/board/zynqmp/zcu106/pm_cfg_obj.c
+++ b/board/zynqmp/zcu106/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	38,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -155,18 +154,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -179,14 +166,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_SPI_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -195,10 +174,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,10 +198,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_CAN_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -259,14 +226,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCIE,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 8ceaa6983d..78b62a9ff8 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,27 +15,28 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/kv260/kv260_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kv260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/zynqmp/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index f4789b9d88..18230cf89b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,21 +15,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 516f1143ce..21f41a2d8f 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,21 +15,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu106-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
