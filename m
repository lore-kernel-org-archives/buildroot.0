Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37929C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24226064C;
	Sat,  3 Aug 2024 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-NoxTP-LqMW; Sat,  3 Aug 2024 13:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67C160618
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67C160618;
	Sat,  3 Aug 2024 13:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40F231BF2EB
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 13:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F16D8113A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 13:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNNFcOZgomzT for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 13:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BE4980EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE4980EC1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BE4980EC1
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 13:43:42 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D46D2B005A6;
 Sat,  3 Aug 2024 15:43:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 15:43:28 +0200
Message-ID: <20240803134328.2947645-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722692618;
 bh=T1E92dDc4Oubl2BLFjL3OevIIjAycDQ4oxp6LwL+m7c=;
 h=From:To:Cc:Subject:Date:From;
 b=mUd2hRWe5wbZVZQZhe31fmxZGUBbMahqXQsTiDLH9VLO4Bgc4AK0sQVYApBhe/pxs
 pVhS7MWy8eIHsHf/TybYR3bAg+Xllf1Lk/D4cGyRNOwYlJMGrCpL5a4khDOrHXQcbf
 xu2UThjSmFxwOuPrSdEBzWkOWuZca4vzuJVpUWEuP6bOaP/kqBb3GSvURXCS1vUvLw
 I30RqwO2rkQGMoTnDhTHM9jI4G5ulOpQVjv/tI+9RqjOoF34YeF72beJb8dne5nB9D
 1qRHNwvUUMBrIexroN9sPgWFBCjyrKVYqCpnokx4WZ5l0oYIPV+AHJWWWgVpOZsyGp
 r6E4qR7/lRtzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mUd2hRWe
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx93evk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
versions.

Also, commit c05f27c8ae "configs/freescale_imx93evk: new defconfig"
introduced the custom hash files, but did not add
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig. This commit fixes
this issue by adding this config directive. As a side note, commit
22fd54b737 "configs/freescale_imx93evk: Update to NXP lf-6.6.3-1.0.0"
updated the defconfig components version, but did not updated the
custom hash files, because they were ignored. This is why hashes were
still at version 6.1 whereas components where already at 6.6.

Since hashes were not enabled, this was not detected by
"make check-package", and the entry in ".checkpackageignore" was also
kept. This commit also removes this entry.

Finally, with the bump of BSP components, this commit updates the
custom hash files accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 board/freescale/imx93evk/patches/linux/linux.hash          | 2 +-
 board/freescale/imx93evk/patches/uboot/uboot.hash          | 2 +-
 configs/freescale_imx93evk_defconfig                       | 7 ++++---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 98f425a89e..0266b45d6a 100644
--- a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cfb927722272897f850681c78d5f129b0883a8efaba9c52d30e029086524f7ff  imx-atf-lf-6.1.55-2.2.0.tar.gz
+sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
index 715a590825..3c4223976b 100644
--- a/board/freescale/imx93evk/patches/linux/linux.hash
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  eb94414f952444289c0af8ad82afa0dc2d07e08f9000ccd2cc39f11da5b494ea  linux-imx-lf-6.1.55-2.2.0.tar.gz
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/uboot/uboot.hash b/board/freescale/imx93evk/patches/uboot/uboot.hash
index 9bc17c3f6f..4e0d729ca0 100644
--- a/board/freescale/imx93evk/patches/uboot/uboot.hash
+++ b/board/freescale/imx93evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  64441ee5bf3d5011e7853c028d06211b6f0439d21e147a8f36972c95a07ae9ac  uboot-imx-lf-6.1.55-2.2.0.tar.gz
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index f30bafd9a2..b244ba9684 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -3,11 +3,12 @@ BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.3-1.0.0)/linux-imx-lf-6.6.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
@@ -21,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.3-1.0.0)/imx-atf-lf-6.6.3-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.3-1.0.0)/uboot-imx-lf-6.6.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
