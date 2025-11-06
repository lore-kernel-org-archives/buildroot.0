Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBFBCCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824A3841F8;
	Thu,  6 Nov 2025 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyF1tYtluNUp; Thu,  6 Nov 2025 19:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6710A84220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6710A84220;
	Thu,  6 Nov 2025 19:32:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7129A93E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591E0607EC
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_ucIuCmOsOa for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53557607F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53557607F0
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4434E83EE6; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 19:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3e2b2f53f1b46a4f71b7886d0a9f5e7d9ff7625
X-Git-Newrev: a29196c96843a9c64963db12cf14f20b3885e70f
X-Patchwork-Hint: ignore
Message-Id: <20251106193217.4434E83EE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: bump to
 uboot v2025.07
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

commit: https://git.buildroot.net/buildroot/commit/?id=a29196c96843a9c64963db12cf14f20b3885e70f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps uboot to v2025.07, removes unnecessary patches,
and add proper hash file.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
[Julien:
 - remove .checkpackageignore entries to fix check-package errors
 - add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y in defconfig
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 --
 ...0_mci-Support-DTS-of-ftsdc010-driver-for-.patch | 38 --------------------
 ...evice-tree-blob-address-at-8-byte-boundar.patch | 42 ----------------------
 board/andes/ae350/patches/uboot/uboot.hash         |  2 ++
 configs/andes_ae350_45_defconfig                   |  5 +--
 5 files changed, 5 insertions(+), 84 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6fbc66b15d..ad0937eefb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,6 +1,4 @@
 board/amarula/vyasa/post-build.sh Shellcheck
-board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
-board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream
 board/arcturus/aarch64-ucls1012a/post-build.sh Shellcheck
 board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
diff --git a/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch b/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
deleted file mode 100644
index be89a1563f..0000000000
--- a/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 16aad5594e08550295ea3c12c1c9ed6f64774748 Mon Sep 17 00:00:00 2001
-From: Rick Chen <rick@andestech.com>
-Date: Tue, 29 Mar 2022 13:41:10 +0800
-Subject: [PATCH] mmc: ftsdc010_mci: Support DTS of ftsdc010 driver for
- generic dma
-
-The ftsdc010 driver has been implemented for generic dma in Linux
-kernel. And its compatible is andestech,atfsdc010g to distinguish
-the legacy andestech,atfsdc010 which is not for generic dma.
-
-Althought the ftsdc010_mci driver in U-Boot does not use dma, but
-it still can work well with the mmc node for generic dma. So add
-the compatible string to support it.
-
-Signed-off-by: Rick Chen <rick@andestech.com>
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- drivers/mmc/ftsdc010_mci.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/mmc/ftsdc010_mci.c b/drivers/mmc/ftsdc010_mci.c
-index 570d54cf9d..65b1d447a8 100644
---- a/drivers/mmc/ftsdc010_mci.c
-+++ b/drivers/mmc/ftsdc010_mci.c
-@@ -460,6 +460,7 @@ int ftsdc010_mmc_bind(struct udevice *dev)
- 
- static const struct udevice_id ftsdc010_mmc_ids[] = {
- 	{ .compatible = "andestech,atfsdc010" },
-+	{ .compatible = "andestech,atfsdc010g" },
- 	{ }
- };
- 
--- 
-2.34.1
-
diff --git a/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch b/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
deleted file mode 100644
index 5080554ca1..0000000000
--- a/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 933ad8a59f7fd9b2088badc3e97167d750a40b5a Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Mon, 12 Jul 2021 11:52:31 +0800
-Subject: [PATCH] spl: Align device tree blob address at 8-byte boundary
-
-Since libfdt v1.6.1, a new requirement on the device tree address via:
-
-  commit 5e735860c478 ("libfdt: Check for 8-byte address alignment in fdt_ro_probe_()")
-
-must be met that the device tree must be loaded in to memory at an
-8-byte aligned address.
-
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-
-This patch was imported from U-boot patchwork:
-https://patchwork.ozlabs.org/project/uboot/patch/20210712035231.26475-1-bmeng.cn@gmail.com/
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- common/spl/spl_fit.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/common/spl/spl_fit.c b/common/spl/spl_fit.c
-index a35be529..a76ad14a 100644
---- a/common/spl/spl_fit.c
-+++ b/common/spl/spl_fit.c
-@@ -382,6 +382,12 @@ static int spl_fit_append_fdt(struct spl_image_info *spl_image,
- 	 */
- 	image_info.load_addr = spl_image->load_addr + spl_image->size;
- 
-+	/*
-+	 * Since libfdt v1.6.1, the device tree must be loaded in to memory
-+	 * at an 8-byte aligned address.
-+	 */
-+	image_info.load_addr = roundup(image_info.load_addr, 8);
-+
- 	/* Figure out which device tree the board wants to use */
- 	node = spl_fit_get_image_node(ctx, FIT_FDT_PROP, index++);
- 	if (node < 0) {
--- 
-2.34.1
-
diff --git a/board/andes/ae350/patches/uboot/uboot.hash b/board/andes/ae350/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index aafa447379..5e8ea5468d 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -23,12 +23,13 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,u-boot,u-boot,a5dfa3b8a0f7ad555495bad1386613d2de4ba619)/u-boot-a5dfa3b8a0f7ad555495bad1386613d2de4ba619.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
