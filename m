Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7E4C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AEEA408C1;
	Sat, 13 Jul 2024 14:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beoxcYTQ38bv; Sat, 13 Jul 2024 14:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 741EA40974
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 741EA40974;
	Sat, 13 Jul 2024 14:53:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBCAE1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA04160759
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6NBguXogC4T for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D0F606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1D0F606A7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DA478650C; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:52:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50a0634c47a5d4c007ec0b6a5c1e9caa0a06c436
X-Git-Newrev: 0b4f7735c53dfdc9adacae9ea3583608a861a373
X-Patchwork-Hint: ignore
Message-Id: <20240713145315.9DA478650C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone{_qt5}_defconfig: move
 board files to board/beagleboard/beaglebone
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b4f7735c53dfdc9adacae9ea3583608a861a373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beaglebone board files from beagleboard.org project should be
moved to board/beagleboard directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                            |  4 ++--
 DEVELOPERS                                                     |  2 +-
 board/{ => beagleboard}/beaglebone/extlinux.conf               |  0
 board/{ => beagleboard}/beaglebone/genimage.cfg                |  0
 board/{ => beagleboard}/beaglebone/linux-sgx.fragment          |  0
 .../beaglebone/patches/linux-headers/linux-headers.hash        |  0
 .../linux/0001-keep-jtag-clock-alive-for-debugger.patch        |  0
 ...-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch |  0
 ...3-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch |  0
 .../linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch    |  0
 board/{ => beagleboard}/beaglebone/patches/linux/linux.hash    |  0
 board/{ => beagleboard}/beaglebone/patches/uboot/uboot.hash    |  0
 board/{ => beagleboard}/beaglebone/post-build.sh               |  0
 board/{ => beagleboard}/beaglebone/readme.txt                  |  0
 .../beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json       |  0
 board/{ => beagleboard}/beaglebone/uEnv.txt                    |  0
 configs/beaglebone_defconfig                                   |  4 ++--
 configs/beaglebone_qt5_defconfig                               | 10 +++++-----
 18 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b29f290dd8..b49d8d92b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,8 +8,8 @@ board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
 board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
-board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
-board/beaglebone/post-build.sh Shellcheck
+board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
+board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/beaglev/post-build.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 4f60a6b239..8e2650daf4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2030,7 +2030,7 @@ F:	package/mongrel2/
 
 N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
-F:	board/beaglebone/
+F:	board/beagleboard/beaglebone/
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
diff --git a/board/beaglebone/extlinux.conf b/board/beagleboard/beaglebone/extlinux.conf
similarity index 100%
rename from board/beaglebone/extlinux.conf
rename to board/beagleboard/beaglebone/extlinux.conf
diff --git a/board/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
similarity index 100%
rename from board/beaglebone/genimage.cfg
rename to board/beagleboard/beaglebone/genimage.cfg
diff --git a/board/beaglebone/linux-sgx.fragment b/board/beagleboard/beaglebone/linux-sgx.fragment
similarity index 100%
rename from board/beaglebone/linux-sgx.fragment
rename to board/beagleboard/beaglebone/linux-sgx.fragment
diff --git a/board/beaglebone/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beaglebone/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
diff --git a/board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
rename to board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
diff --git a/board/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch b/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
rename to board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
diff --git a/board/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch b/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
rename to board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
diff --git a/board/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
similarity index 100%
rename from board/beaglebone/patches/linux/linux.hash
rename to board/beagleboard/beaglebone/patches/linux/linux.hash
diff --git a/board/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
similarity index 100%
rename from board/beaglebone/patches/uboot/uboot.hash
rename to board/beagleboard/beaglebone/patches/uboot/uboot.hash
diff --git a/board/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
similarity index 100%
rename from board/beaglebone/post-build.sh
rename to board/beagleboard/beaglebone/post-build.sh
diff --git a/board/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
similarity index 100%
rename from board/beaglebone/readme.txt
rename to board/beagleboard/beaglebone/readme.txt
diff --git a/board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json b/board/beagleboard/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
similarity index 100%
rename from board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
rename to board/beagleboard/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
diff --git a/board/beaglebone/uEnv.txt b/board/beagleboard/beaglebone/uEnv.txt
similarity index 100%
rename from board/beaglebone/uEnv.txt
rename to board/beagleboard/beaglebone/uEnv.txt
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 064f283489..b1a0c7cda4 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,9 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Image
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index ae46fff228..e09a88e21b 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,20 +1,20 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_OVERLAY="board/beaglebone/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/beagleboard/beaglebone/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.94-ti-r72)/linux-4.19.94-ti-r72.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
