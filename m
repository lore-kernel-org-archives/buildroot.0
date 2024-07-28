Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D4FC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 17:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E82B8116E;
	Sun, 28 Jul 2024 17:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vshml_1z7lfV; Sun, 28 Jul 2024 17:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C5D81174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C5D81174;
	Sun, 28 Jul 2024 17:37:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D67DF1BF5A8
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 17:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4B2660611
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 17:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EK5Q2cnLGBh8 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 17:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C20B605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C20B605CA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C20B605CA
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 17:37:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA988B0053D;
 Sun, 28 Jul 2024 19:37:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 19:37:20 +0200
Message-ID: <20240728173720.495604-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722188258;
 bh=qtGhjjXT61pM+9j2G6dShmW9iO/bEYrExB7MJ21gspM=;
 h=From:To:Cc:Subject:Date:From;
 b=ax18T5Iky3WfRSim7yBQXmQ/TnYWe7tS5S03ckqFFn5x2jb1G3Y/BRAftwbc4KAmc
 e7yLVo/TarQg8Tr3SimqmMUb7cYAPyW6upuDmnU3ZFQluBH9BkfO9ThHvzA6xOziVH
 7ZXzpVHOnaDYXZVCs5gPcnr5TF3Zbbn3cjy4PsVtbUj8m+NlcMnW9a9NNuND3k8gGm
 LnEiGaSELdHBQRl7KKf0Tfso3fu5XOoSpWe+av9CvvrqrYBhtAZ+dBJoB8kkeM156V
 3iLlmrz2tIq9rD7rIk+KNdHned9yUa1ZVv1HagKXOifkgEIy2gsEsHdFHCyYLnRIpq
 NbLZJ7yIycNAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ax18T5Ik
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx7dsabresd: bump BSP
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

This commit bumps U-Boot and Linux kernel to the NXP BSP
lf-6.6.23-2.0.0 versions.

While bumping those BSP components, this commit also adds the custom
hashes by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in this
defconfig. A _PATCH_DIR is added for that purpose and hash files are
added in it. The ".checkpackageignore" entry for this defconfig is
also removed.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
this freescale_imx7dsabresd_defconfig is failing to build the Kernel
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_340' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping components which includes the
needed gcc-13 fixes.

The Kernel DTS name is also updated by adding the new "nxp/imx/"
prefix, to follow the upstream reorganization in [1], first included
in v6.5.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7423016459

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/freescale/imx7dsdb/patches/linux/linux.hash  |  2 ++
 board/freescale/imx7dsdb/patches/uboot/uboot.hash  |  2 ++
 configs/freescale_imx7dsabresd_defconfig           | 14 +++++++++-----
 5 files changed, 14 insertions(+), 6 deletions(-)
 create mode 120000 board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx7dsdb/patches/linux/linux.hash
 create mode 100644 board/freescale/imx7dsdb/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 0f054c9a30..537684ac5c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -159,7 +159,6 @@ configs/freescale_imx6qsabreauto_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6qsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6sxsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx7dsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash b/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx7dsdb/patches/linux/linux.hash b/board/freescale/imx7dsdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx7dsdb/patches/uboot/uboot.hash b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index d337865831..f00144239e 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -2,8 +2,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx7dsdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -11,10 +15,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -25,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
