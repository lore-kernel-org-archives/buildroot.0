Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1A3C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 18:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336C360730;
	Sun, 14 Jul 2024 18:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rW9xXe5FP2R; Sun, 14 Jul 2024 18:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 593F460732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 593F460732;
	Sun, 14 Jul 2024 18:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCEF1BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59C6C8111A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 18:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSHxgv2P0qKf for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 18:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF3D81116
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AF3D81116
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 18:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66CAA86935; Sun, 14 Jul 2024 18:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 20:00:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99e536d9c7382f5a3ff9d7533d62615d7b6efeef
X-Git-Newrev: 0e1b6ab700f575226c2290c6a41db333e0b03a60
X-Patchwork-Hint: ignore
Message-Id: <20240714180143.66CAA86935@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_lite: bump kernel and
 u-boot versions
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e1b6ab700f575226c2290c6a41db333e0b03a60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to 6.6 and U-Boot to 2024.01.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
[Romain:
      - enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and add hashes files
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                            |  1 -
 .../orangepi-lite/patches/linux-headers/linux-headers.hash     |  1 +
 board/orangepi/orangepi-lite/patches/linux/linux.hash          |  2 ++
 board/orangepi/orangepi-lite/patches/uboot/uboot.hash          |  2 ++
 configs/orangepi_lite_defconfig                                | 10 ++++++----
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 42b22d4aed..8ed68f580f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -233,7 +233,6 @@ configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_lite_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-lite/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-lite/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-lite/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-lite/patches/linux/linux.hash b/board/orangepi/orangepi-lite/patches/linux/linux.hash
new file mode 100644
index 0000000000..e8609babc9
--- /dev/null
+++ b/board/orangepi/orangepi-lite/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b21d5795a3bead4f112916423222faa8a0f519e4201df343e3eb88dc9e4aaa30  linux-6.6.16.tar.xz
diff --git a/board/orangepi/orangepi-lite/patches/uboot/uboot.hash b/board/orangepi/orangepi-lite/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/orangepi/orangepi-lite/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index eff5af938b..4298019837 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-lite/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
@@ -9,11 +11,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.16"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-lite"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-lite"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RTL8189FS=y
@@ -26,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
