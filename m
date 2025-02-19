Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AC785E5C;
	Fri, 28 Feb 2025 17:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AY7synA9br4w; Fri, 28 Feb 2025 17:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB9785E72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB9785E72;
	Fri, 28 Feb 2025 17:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1480A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F238B46A5D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmfCqgdiRvIy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C19F46E3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C19F46E3A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55C7480807; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 22:12:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd41cccc7a9d912289315e28ca85ade8179f2c1f
X-Git-Newrev: 386cd2ebafd3de3d29c50f3d9526a69f1ad7993a
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.55C7480807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/arm_foundationv8: bump
 to Linux 6.12 and model 11.27
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
Content-Type: multipart/mixed; boundary="===============9018488087505903703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9018488087505903703==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=386cd2ebafd3de3d29c50f3d9526a69f1ad7993a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump Linux kernel to v6.12.15, update the hash file and add the
  dependency on host-python3.
- Bump the FVP in the readme to version 11.27 build 19.

While at it:
- Rework the readme a bit with explicit build instructions, add a link
  to the model binaries running on AArch64 host and update the model
  command line to specify Arm v8.0 (as we are building for Cortex-A53).
- Turn on hashes verification and update .checkpackageignore
  accordingly.
- Add myself as co-developer for this defconfig.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
[Julien: remove "Locally calculated" in linux.hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                              |  1 -
 DEVELOPERS                                       |  2 ++
 board/arm/foundation-v8/patches/linux/linux.hash |  4 ++--
 board/arm/foundation-v8/readme.txt               | 26 ++++++++++++++++++++----
 configs/arm_foundationv8_defconfig               |  6 ++++--
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d54bd353b2..b10f69ec36 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -105,7 +105,6 @@ configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
-configs/arm_foundationv8_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 6827866db1..73d4281d12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3332,7 +3332,9 @@ F:	configs/qemu_arm_ebbr_defconfig
 F:	package/edk2-non-osi/
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
+F:	board/arm/foundation-v8/
 F:	board/bananapi/bananapi-m2-zero/
+F:	configs/arm_foundationv8_defconfig
 F:	configs/bananapi_m2_zero_defconfig
 F:	configs/uevm5432_defconfig
 F:	package/i7z/
diff --git a/board/arm/foundation-v8/patches/linux/linux.hash b/board/arm/foundation-v8/patches/linux/linux.hash
index 559b53be2d..47cbb0181a 100644
--- a/board/arm/foundation-v8/patches/linux/linux.hash
+++ b/board/arm/foundation-v8/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  b0bb92d982f88380e5b2059349c3a862e0afa712e0646eb0e082b9c2c5cb5176  linux-6.8.10.tar.xz
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5ff5bd84ea0e22c53437302db5d394d0a92d8b8b1a88ce20d1098298e9f7630a  linux-6.12.15.tar.xz
diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 701cf3ceb0..c640491215 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -1,16 +1,34 @@
+Introduction
+============
+
 This is the support for the ARM Foundation v8 machine emulated by the
 ARM software simulator of the AArch64 architecture.
 
-First, one has to download the AArch64 software simulator from:
+Building
+========
+
+  $ make arm_foundationv8_defconfig
+  $ make
+
+Generated files under output/images:
+
+* linux-system.axf: An image comprising the boot-wrapper-aarch64 minimal
+                    firmware and bootloader, a Devicetree and the Linux kernel.
+* rootfs.ext2:      The OS root filesystem.
+
+Running on the simulator
+========================
 
-  https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/Foundation_Platform_11.25_15_Linux64.tgz
+Download the AArch64 software simulator from one of the following sources,
+corresponding to your host computer:
 
-Then, use the arm_foundationv8_defconfig configuration to build your
-Buildroot system.
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.27/Foundation_Platform_11.27_19_Linux64.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.27/Foundation_Platform_11.27_19_Linux64_armv8l.tgz
 
 Finally, boot your system with:
 
  ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-9.3/Foundation_Platform \
+    --arm-v8.0 \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
     --network=nat \
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index d4e7ca0dd4..93613f5a34 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,14 +1,16 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/arm/foundation-v8/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8-gicv3-psci"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set

--===============9018488087505903703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9018488087505903703==--
