Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363DC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BE180D97;
	Sat,  3 Aug 2024 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2V6pFSq4Sh1C; Sat,  3 Aug 2024 20:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D9280D10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D9280D10;
	Sat,  3 Aug 2024 20:30:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6C61BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDC760611
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR6ZJtdxbS_Y for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8875605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8875605EB
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D72FF83D97; Sat,  3 Aug 2024 20:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 22:30:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 358261b319e3be29e68a86358ccc7bf97fa795f2
X-Git-Newrev: 4f6e5813350bfb9c1c4ec724797d11d696a16c95
X-Patchwork-Hint: ignore
Message-Id: <20240803203046.D72FF83D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx6ullevk: bump BSP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f6e5813350bfb9c1c4ec724797d11d696a16c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0 versions.

This commit also adds the custom version package hashes. Therefore,
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
the hash files are added. The corresponding ".checkpackageignore"
entry is also removed.

The Kernel DTS name is also updated by adding the new "nxp/imx/"
prefix, to follow the upstream reorganization in [1], first included
in v6.5.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                            |  1 -
 .../imx6ullevk/patches/linux-headers/linux-headers.hash        |  1 +
 board/freescale/imx6ullevk/patches/linux/linux.hash            |  2 ++
 board/freescale/imx6ullevk/patches/uboot/uboot.hash            |  2 ++
 configs/freescale_imx6ullevk_defconfig                         | 10 ++++++----
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 10662bb11e..9335dca0e7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -151,7 +151,6 @@ configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx93evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash b/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index fd4254edbf..e29a9898fc 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,16 +1,18 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.36-2.1.0)/linux-imx-lf-6.1.36-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
@@ -20,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.36-2.1.0)/uboot-imx-lf-6.1.36-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
