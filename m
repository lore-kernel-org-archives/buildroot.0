Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265AAC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0CCF6FB1E;
	Fri, 28 Feb 2025 17:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7LdvDw709xF; Fri, 28 Feb 2025 17:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004B170840
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004B170840;
	Fri, 28 Feb 2025 17:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D23F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA6A424ED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8INHpvwPE97M for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1538B42E5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1538B42E5A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11CEE82581; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 20:30:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12ec5d5059ea107a960b9e20dd11b9f7affd1070
X-Git-Newrev: 44075c19555df409ea7c2859729abb02d341df29
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.11CEE82581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu: update
 defconfigs to Linux 6.12.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=44075c19555df409ea7c2859729abb02d341df29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update all qemu defconfigs to the latest Kernel LTS version.

Runtime tested locally (on a build server).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/patches/linux/linux.hash       | 2 +-
 configs/qemu_aarch64_ebbr_defconfig       | 4 ++--
 configs/qemu_aarch64_sbsa_defconfig       | 4 ++--
 configs/qemu_aarch64_virt_defconfig       | 4 ++--
 configs/qemu_arm_ebbr_defconfig           | 4 ++--
 configs/qemu_arm_versatile_defconfig      | 4 ++--
 configs/qemu_arm_vexpress_defconfig       | 4 ++--
 configs/qemu_arm_vexpress_tz_defconfig    | 4 ++--
 configs/qemu_m68k_mcf5208_defconfig       | 4 ++--
 configs/qemu_m68k_q800_defconfig          | 4 ++--
 configs/qemu_microblazebe_mmu_defconfig   | 4 ++--
 configs/qemu_microblazeel_mmu_defconfig   | 4 ++--
 configs/qemu_mips32r2_malta_defconfig     | 4 ++--
 configs/qemu_mips32r2el_malta_defconfig   | 4 ++--
 configs/qemu_mips32r6_malta_defconfig     | 4 ++--
 configs/qemu_mips32r6el_malta_defconfig   | 4 ++--
 configs/qemu_mips64_malta_defconfig       | 4 ++--
 configs/qemu_mips64el_malta_defconfig     | 4 ++--
 configs/qemu_mips64r6_malta_defconfig     | 4 ++--
 configs/qemu_mips64r6el_malta_defconfig   | 4 ++--
 configs/qemu_or1k_defconfig               | 4 ++--
 configs/qemu_ppc64_e5500_defconfig        | 4 ++--
 configs/qemu_ppc64_pseries_defconfig      | 4 ++--
 configs/qemu_ppc64le_powernv8_defconfig   | 4 ++--
 configs/qemu_ppc64le_pseries_defconfig    | 4 ++--
 configs/qemu_ppc_bamboo_defconfig         | 4 ++--
 configs/qemu_ppc_e500mc_defconfig         | 4 ++--
 configs/qemu_ppc_g3beige_defconfig        | 4 ++--
 configs/qemu_ppc_mac99_defconfig          | 4 ++--
 configs/qemu_ppc_mpc8544ds_defconfig      | 4 ++--
 configs/qemu_riscv32_nommu_virt_defconfig | 4 ++--
 configs/qemu_riscv32_virt_defconfig       | 4 ++--
 configs/qemu_riscv64_nommu_virt_defconfig | 4 ++--
 configs/qemu_riscv64_virt_defconfig       | 4 ++--
 configs/qemu_riscv64_virt_efi_defconfig   | 4 ++--
 configs/qemu_s390x_defconfig              | 4 ++--
 configs/qemu_sh4_r2d_defconfig            | 4 ++--
 configs/qemu_sh4eb_r2d_defconfig          | 4 ++--
 configs/qemu_sparc64_sun4u_defconfig      | 4 ++--
 configs/qemu_sparc_ss10_defconfig         | 4 ++--
 configs/qemu_x86_64_defconfig             | 4 ++--
 configs/qemu_x86_defconfig                | 4 ++--
 configs/qemu_xtensa_lx60_defconfig        | 4 ++--
 configs/qemu_xtensa_lx60_nommu_defconfig  | 4 ++--
 44 files changed, 87 insertions(+), 87 deletions(-)

diff --git a/board/qemu/patches/linux/linux.hash b/board/qemu/patches/linux/linux.hash
index deb1ad0ce5..464f5e4cd3 100644
--- a/board/qemu/patches/linux/linux.hash
+++ b/board/qemu/patches/linux/linux.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
+sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
 
 # sha256 locally computed
 sha256  a76052c0c71d4025b117dcfc18ca7e189ac495a7645fa98c1bdaddca15cce815  xtensa_dc233c.tar.gz
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index cb6a06653c..d807f220bc 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_OPTEE_CLIENT=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 04bb2832d3..802f8c3d56 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_neoverse_n1=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 6c206cea93..fb9db3f0fc 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index 2cc222e2a4..587690a5d3 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index e22ef33c06..febce57f92 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -1,5 +1,5 @@
 BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="versatile"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 84be67045f..b65d893967 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 1c2da47282..8ad9fbd220 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_ARM_FPU_VFPV3D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
 BR2_PACKAGE_OPENSSL=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index feb96bb533..be2eec0935 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -1,6 +1,6 @@
 BR2_m68k=y
 BR2_m68k_cf5208=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 689da54892..a440b0f071 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -1,5 +1,5 @@
 BR2_m68k=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 572f7c125f..6a218ef40f 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,5 +1,5 @@
 BR2_microblazebe=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 03c80919dc..bc8e40eaf0 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,5 +1,5 @@
 BR2_microblazeel=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index ceb5f91b20..1a3c1bbc3e 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mips=y
 BR2_mips_32r2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index e5ce0c660b..127006ec73 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mipsel=y
 BR2_mips_32r2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index d8f3455b27..7cb1d83b7d 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mips=y
 BR2_mips_32r6=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 89231a2c4f..80c3e33269 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mipsel=y
 BR2_mips_32r6=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index de0ba6d959..2341d2790f 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mips64=y
 BR2_MIPS_NABI64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index e8d4b4093d..983ac8b8d3 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -1,6 +1,6 @@
 BR2_mips64el=y
 BR2_MIPS_NABI64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 06530044e1..f3015c9102 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -1,7 +1,7 @@
 BR2_mips64=y
 BR2_mips_64r6=y
 BR2_MIPS_NABI64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index d2e0bb7157..3ad6f3652f 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -1,7 +1,7 @@
 BR2_mips64el=y
 BR2_mips_64r6=y
 BR2_MIPS_NABI64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 02c3882ed6..2ea8bfa190 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -1,5 +1,5 @@
 BR2_or1k=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index dd778e7868..e3fb1490e1 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc64=y
 BR2_powerpc_e5500=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index d006bee7a4..d3f8f57232 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc64=y
 BR2_powerpc_power7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index d20a21618a..e1a9cfe661 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -1,5 +1,5 @@
 BR2_powerpc64le=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 5cbacd3f17..86952b3461 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -1,5 +1,5 @@
 BR2_powerpc64le=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
index bb7dca6930..7d2c61aa79 100644
--- a/configs/qemu_ppc_bamboo_defconfig
+++ b/configs/qemu_ppc_bamboo_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc=y
 BR2_powerpc_440fp=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
index eccf86f6a3..590a049239 100644
--- a/configs/qemu_ppc_e500mc_defconfig
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc=y
 BR2_powerpc_e500mc=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index f35c8557b1..9df8b8bc86 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc=y
 BR2_powerpc_750=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 13d9aba0b0..85c63aefa3 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc=y
 BR2_powerpc_7400=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 8da2a0472c..11808718e7 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -1,6 +1,6 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
index 49580716bb..3115f20066 100644
--- a/configs/qemu_riscv32_nommu_virt_defconfig
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -1,7 +1,7 @@
 BR2_riscv=y
 BR2_RISCV_32=y
 # BR2_RISCV_USE_MMU is not set
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 83ea0e91d9..a171ef4525 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_RISCV_32=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index bb3fb2c5cb..169eead244 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 # BR2_RISCV_USE_MMU is not set
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index d9f715198a..82c289e1af 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
index 66a05d59e5..d7fdc861c6 100644
--- a/configs/qemu_riscv64_virt_efi_defconfig
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-e
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 975633e3ab..a86df53aae 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -1,5 +1,5 @@
 BR2_s390x=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 4b06017aec..8762cc2ea9 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -1,5 +1,5 @@
 BR2_sh=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 9a80bb1065..01302a2e98 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -1,6 +1,6 @@
 BR2_sh=y
 BR2_sh4eb=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index d409a9ff47..bea866eea9 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -1,5 +1,5 @@
 BR2_sparc64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 63ca7330b9..90d98ce6fa 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -1,5 +1,5 @@
 BR2_sparc=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 8022e43a20..7c7fc374d9 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index e4ff52a3d5..0a31327e88 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_pentiumpro=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index dca2e600d5..4a3e530aea 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,7 +1,7 @@
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 52e28cb9c5..363ab27513 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -2,7 +2,7 @@ BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 # BR2_XTENSA_USE_MMU is not set
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
