Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942C0CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B30B607B5;
	Mon,  8 Sep 2025 14:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwBzGkyoeXMn; Mon,  8 Sep 2025 14:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF796069F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF796069F;
	Mon,  8 Sep 2025 14:18:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50A8D186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8926A40216
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUcAsIRXcrnA for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78BC54021C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BC54021C
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76037818B3; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 11:54:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b987677e145fdb212debf708f40faaa18c4f29c
X-Git-Newrev: fdc002ee38e58ef4abfbd1615217a5977f9a0077
X-Patchwork-Hint: ignore
Message-Id: <20250908141625.76037818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imxrt1050-evk: Check hashes,
 use bootlin toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdc002ee38e58ef4abfbd1615217a5977f9a0077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y in the
defconfig, bumps kernel to 6.12.43, and adds custom hash files.
The exception entry in .checkpackageignore is also removed.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Peter: correct linux-headers.patch symlink]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                               | 1 -
 .../imxrt1050evk/patches/linux-headers/linuux-headers.hash        | 1 +
 board/freescale/imxrt1050evk/patches/linux/linux.hash             | 2 ++
 board/freescale/imxrt1050evk/patches/uboot/uboot.hash             | 2 ++
 configs/imxrt1050-evk_defconfig                                   | 8 ++++++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ca7fec588a..4cf1c9f449 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -156,7 +156,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
-configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imxrt1050evk/patches/linux-headers/linuux-headers.hash b/board/freescale/imxrt1050evk/patches/linux-headers/linuux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/linux-headers/linuux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..216d9b9d39
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index fce2b831f3..0574eae981 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -1,12 +1,16 @@
 BR2_arm=y
 BR2_cortex_m7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imxrt1050evk/patches"
 BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
