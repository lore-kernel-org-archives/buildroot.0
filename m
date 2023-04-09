Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B530C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3675D60B29;
	Sun,  9 Apr 2023 14:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3675D60B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pl2MFstME6Wb; Sun,  9 Apr 2023 14:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223D260BBB;
	Sun,  9 Apr 2023 14:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223D260BBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B68E61C2E2E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 907A2401D2
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 907A2401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isHm2YuizKfx for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:21:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7310D4015E
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7310D4015E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F6DA83B58; Sun,  9 Apr 2023 14:21:21 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 16:19:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e9d807a4730f5efe8cfe5e97a7e39cc7ee5f21b
X-Git-Newrev: 2df4bf8373fb826a49cce1bb9194459529f9f886
X-Patchwork-Hint: ignore
Message-Id: <20230409142121.5F6DA83B58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn_bsh_smm_s2_defconfig: bump
 U-Boot version to 2023.04
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2df4bf8373fb826a49cce1bb9194459529f9f886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to version 2023.04 and remove the patch that has already
been upstreamed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...figs-Remove-rootwait-1-to-all-the-affecte.patch | 160 ---------------------
 configs/imx8mn_bsh_smm_s2_defconfig                |   3 +-
 2 files changed, 1 insertion(+), 162 deletions(-)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
deleted file mode 100644
index 59db559b93..0000000000
--- a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 3878b941c6bde84e29b2725e4261d85bea828752 Mon Sep 17 00:00:00 2001
-From: Michael Trimarchi <michael@amarulasolutions.com>
-Date: Sun, 22 May 2022 15:22:08 +0200
-Subject: [PATCH] include/configs: Remove rootwait=1 to all the affected boards
-
-rootwait=1 is not a valid kernel boot parameters. According
-to the documenation is only rootwait
-
-rootwait	[KNL]	Wait (indefinitely) for root device to show up.
-			Useful for devices that are detected asynchronously
-			(e.g. USB and MMC devices).
-
-Fix:
-Unknown kernel command line parameters "rootwait=1", will be passed to user space.
-
-Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
-Reviewed-by: Heiko Schocher <hs@denx.de>
-Link: https://patchwork.ozlabs.org/project/uboot/patch/20220520110013.32811-1-michael@amarulasolutions.com/
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- include/configs/am335x_evm.h           | 2 +-
- include/configs/am43xx_evm.h           | 2 +-
- include/configs/baltos.h               | 2 +-
- include/configs/chiliboard.h           | 2 +-
- include/configs/etamin.h               | 2 +-
- include/configs/imx8mn_bsh_smm_s2.h    | 2 +-
- include/configs/siemens-am33x-common.h | 4 ++--
- include/configs/ti_armv7_keystone2.h   | 2 +-
- include/environment/ti/nand.h          | 2 +-
- 9 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index fd5b209a52db..f301a6dc835b 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -34,7 +34,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/am43xx_evm.h b/include/configs/am43xx_evm.h
-index 5057441f7506..1f5c3cd04e88 100644
---- a/include/configs/am43xx_evm.h
-+++ b/include/configs/am43xx_evm.h
-@@ -166,7 +166,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,4096\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/baltos.h b/include/configs/baltos.h
-index b881d8c03fd7..7b43741fde7c 100644
---- a/include/configs/baltos.h
-+++ b/include/configs/baltos.h
-@@ -37,7 +37,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=5\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"setenv loadaddr 0x84000000; " \
-diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
-index 82acda595f09..8bad0f9ac4b6 100644
---- a/include/configs/chiliboard.h
-+++ b/include/configs/chiliboard.h
-@@ -20,7 +20,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdt_addr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/etamin.h b/include/configs/etamin.h
-index 9cf93924df93..1c0a86d1ed10 100644
---- a/include/configs/etamin.h
-+++ b/include/configs/etamin.h
-@@ -113,7 +113,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"rootfs_name=rootfs\0" \
- 	"kernel_name=uImage\0"\
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_args=run bootargs_defaults;" \
- 		"mtdparts default;" \
- 		"setenv ${partitionset_active} true;" \
-diff --git a/include/configs/imx8mn_bsh_smm_s2.h b/include/configs/imx8mn_bsh_smm_s2.h
-index d09c2ab01610..0dc514f00684 100644
---- a/include/configs/imx8mn_bsh_smm_s2.h
-+++ b/include/configs/imx8mn_bsh_smm_s2.h
-@@ -22,7 +22,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:root rw ubi.mtd=nandrootfs\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdt_addr_r} nanddtb; " \
-diff --git a/include/configs/siemens-am33x-common.h b/include/configs/siemens-am33x-common.h
-index 08c4d52d658f..9f1a6cd51b40 100644
---- a/include/configs/siemens-am33x-common.h
-+++ b/include/configs/siemens-am33x-common.h
-@@ -237,7 +237,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"nand_active_ubi_vol_A=rootfs_a\0" \
- 	"nand_active_ubi_vol_B=rootfs_b\0" \
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_src_addr=0x280000\0" \
- 	"nand_src_addr_A=0x280000\0" \
- 	"nand_src_addr_B=0x780000\0" \
-@@ -314,7 +314,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"rootfs_name=rootfs\0" \
- 	"kernel_name=uImage\0"\
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_args=run bootargs_defaults;" \
- 		"mtdparts default;" \
- 		"setenv ${partitionset_active} true;" \
-diff --git a/include/configs/ti_armv7_keystone2.h b/include/configs/ti_armv7_keystone2.h
-index 57f013cbf846..133daecf7164 100644
---- a/include/configs/ti_armv7_keystone2.h
-+++ b/include/configs/ti_armv7_keystone2.h
-@@ -180,7 +180,7 @@
- 		"sf write ${loadaddr} 0 ${filesize}\0"		\
- 	"burn_uboot_nand=nand erase 0 0x100000; "			\
- 		"nand write ${loadaddr} 0 ${filesize}\0"		\
--	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait=1 "	\
-+	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait "	\
- 		KERNEL_MTD_PARTS					\
- 	"args_net=setenv bootargs ${bootargs} rootfstype=nfs "		\
- 		"root=/dev/nfs rw nfsroot=${serverip}:${nfs_root},"	\
-diff --git a/include/environment/ti/nand.h b/include/environment/ti/nand.h
-index 11dcefcc41ca..7d00afa2b10f 100644
---- a/include/environment/ti/nand.h
-+++ b/include/environment/ti/nand.h
-@@ -14,7 +14,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
--- 
-2.32.0
-
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 9b8ac8bfe2..8b2b74395e 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-BR2_GLOBAL_PATCH_DIR="board/bsh/imx8mn-bsh-smm-s2/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
@@ -28,7 +27,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
