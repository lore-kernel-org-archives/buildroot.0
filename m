Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B4C25B79
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2D6834DE;
	Fri, 24 May 2024 19:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkUHSoFscSyq; Fri, 24 May 2024 19:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B7A834E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B7A834E8;
	Fri, 24 May 2024 19:02:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5D031CFCBB
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A5EA834F1
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6ilhhG32JhH for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39F13834DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F13834DE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39F13834DE
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:02:05 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E67CBB0055A;
 Fri, 24 May 2024 21:01:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 21:01:37 +0200
Message-ID: <20240524190137.10761-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716577322;
 bh=gTScm+uLscuIcdM8B+OIawe4SrVCYTJJukUnvzKsDgI=;
 h=From:To:Cc:Subject:Date:From;
 b=bsRf0qnuaTfgLAasuLryQnUHnZ5C0OAK0lleZ846V4gQ15AIUA4TLi29I+N3nS2dL
 49st4VfZVSAHloCST1e9tE6Gc4rwe2B7R0AYiwQmN5gaDF7iPAIIu9z8MvicTSIfjL
 VNy+YhT0Kyc0/GJQVOcoDwpN5+kB+ePEt+SF1MVnLrCb9RzFae09kYDrgrGq4pn32g
 i5wp0JS78Kudkq2qELfvtsaSrB0DsKXk28X6W41Mr8huVbWEIdQx41ERKF9BtY8K2B
 sEWmEQfHJ6eYXpldqR4HKa+pPH9zBbAPeowIBCZGXIxuREMV/uNVKWwWsDRtb7wmjC
 nE6CddbOCeTng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bsRf0qnu
Subject: [Buildroot] [PATCH 1/1] configs/mx51evk: bump bsp components to fix
 build
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

Since commit dc0f721 "package/gcc: switch to 13.x as default",
mx51evk_defconfig is failing to build in Kernel (see [1]),
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping the bsp components:
- u-boot to v2024.04
- kernel to v6.6.31

The Kernel DTS name is updated to reflect upstream reorganization.

The kernel commit fixing the build failure is [2], first included in
v6.2. There is many other gcc-13 fixes.

While bumping components, this commit also enables
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash files,
and removes the defconfig entry in ".checkpackageignore".

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: I did not tested the generated image on an actual board
(I don't have access to it).
---
 .checkpackageignore                                |  1 -
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/freescale/imx51evk/patches/linux/linux.hash  |  2 ++
 board/freescale/imx51evk/patches/uboot/uboot.hash  |  2 ++
 configs/mx51evk_defconfig                          | 14 +++++++++-----
 5 files changed, 14 insertions(+), 6 deletions(-)
 create mode 120000 board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx51evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx51evk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index ebf320c3c59..e2f84ce5287 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -236,7 +236,6 @@ configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
-configs/mx51evk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
 configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
 configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 00000000000..5808d92afe8
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx51evk/patches/linux/linux.hash b/board/freescale/imx51evk/patches/linux/linux.hash
new file mode 100644
index 00000000000..d7a0d04236d
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From: https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d6ecff966f8c95ec4cb3bb303904f757b7de6a6bcfef0d0771cb852158e61c20  linux-6.6.31.tar.xz
diff --git a/board/freescale/imx51evk/patches/uboot/uboot.hash b/board/freescale/imx51evk/patches/uboot/uboot.hash
new file mode 100644
index 00000000000..75de6acf93b
--- /dev/null
+++ b/board/freescale/imx51evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index a4bebdec976..474824e67fc 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,8 +2,12 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Global patches directory and hash check
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx51evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,14 +26,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx51evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.31"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx51-babbage"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
