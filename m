Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A00C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 12:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B18A404D2;
	Mon, 21 Apr 2025 12:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyiFrAmzYqL1; Mon, 21 Apr 2025 12:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 417F9404A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417F9404A8;
	Mon, 21 Apr 2025 12:02:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 270C5238
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D424680E1A
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_XclbAuLEzB for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 12:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19D780DD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19D780DD0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC0EA85EC6; Mon, 21 Apr 2025 12:02:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 14:01:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 272e56d1ce0ca31058cd43221e5456513693d197
X-Git-Newrev: 310ab7d53393288aba5c574c49a6cae1bf1e1a1d
X-Patchwork-Hint: ignore
Message-Id: <20250421120201.AC0EA85EC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi*: move to external
 Bootlin stable toochain
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
Content-Type: multipart/mixed; boundary="===============5146771837169739156=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5146771837169739156==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=310ab7d53393288aba5c574c49a6cae1bf1e1a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This moves the defconfig to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/raspberrypi0_defconfig        | 4 ++--
 configs/raspberrypi0w_defconfig       | 4 ++--
 configs/raspberrypi2_defconfig        | 5 +++--
 configs/raspberrypi3_64_defconfig     | 5 +++--
 configs/raspberrypi3_defconfig        | 5 +++--
 configs/raspberrypi3_qt5we_defconfig  | 5 +++--
 configs/raspberrypi4_64_defconfig     | 5 +++--
 configs/raspberrypi4_defconfig        | 5 +++--
 configs/raspberrypi5_defconfig        | 5 +++--
 configs/raspberrypi_defconfig         | 4 ++--
 configs/raspberrypicm4io_64_defconfig | 5 +++--
 configs/raspberrypicm4io_defconfig    | 5 +++--
 configs/raspberrypizero2w_defconfig   | 5 +++--
 13 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 22b255e9d3..ffd1ef78c1 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index dd7c2dc2a0..45dab555d3 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index eb6bfefa00..d19a64ce11 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 3b99865636..927f82a4cb 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -1,7 +1,8 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index ed59f199a6..9342bc4b6a 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 40a0fb004a..dc8160711d 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index c1c8581ed0..2e2c52e5c9 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -1,8 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 97f2f9e416..d7229b66f2 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 358f9e9506..d18f2ff480 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -1,7 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a76=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 0d325ced8f..90a5240bd8 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index e2bb5cb526..1e5915c287 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -1,8 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index c9a1cfe28d..51400f9217 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index a57c919b51..4385c7bdd6 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"

--===============5146771837169739156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5146771837169739156==--
