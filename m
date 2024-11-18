Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC29E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77AF607E9;
	Sun,  8 Dec 2024 13:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zk48WZNbnaoo; Sun,  8 Dec 2024 13:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E7B60801
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E7B60801;
	Sun,  8 Dec 2024 13:07:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C152979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4195560817
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4OuEkmUAs6W for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA7760729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA7760729
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F293A86B75; Sun,  8 Dec 2024 13:06:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Nov 2024 21:24:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a9e49fcb3fb288aa60fc73c8bf6c8bc190ae4ab
X-Git-Newrev: f59f69e0e01e2ece4c2e57cc0c371e017c36fe29
X-Patchwork-Hint: ignore
Message-Id: <20241208130651.F293A86B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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

commit: https://git.buildroot.net/buildroot/commit/?id=f59f69e0e01e2ece4c2e57cc0c371e017c36fe29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux to 6.6.56 (LTS).
- Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
- Bump TF-A to 2.11.
- Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
- Add relevant hashes in the patches folder for the board.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
[Julien: update .checkpackageignore]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                            |  1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../roc-rk3399-pc/patches/linux-headers/linux-headers.hash     |  1 +
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash           |  2 ++
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash           |  2 ++
 configs/roc_pc_rk3399_defconfig                                | 10 ++++++----
 6 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..959bb822d3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -220,7 +220,6 @@ configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
 configs/riotboard_defconfig lib_defconfig.ForceCheckHash
-configs/roc_pc_rk3399_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
 configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..98edd13a58
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 1323752683..145e155fac 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
@@ -8,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -21,14 +23,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
