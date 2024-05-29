Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C84CC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD7660794;
	Wed, 29 May 2024 07:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcZufbnPFfTz; Wed, 29 May 2024 07:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 781C4607B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 781C4607B1;
	Wed, 29 May 2024 07:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252A51D3288
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110BA40024
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3T_wkBoCxds for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117DC40021
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117DC40021
 for <buildroot@buildroot.org>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E86E387738; Wed, 29 May 2024 07:19:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 08:52:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 197be7ed872a5cd472f64096f34a7bf132274351
X-Git-Newrev: 47da55f969e1f677507b61cdb543a6ea66e0f131
X-Patchwork-Hint: ignore
Message-Id: <20240529071943.E86E387738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi: add hashes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47da55f969e1f677507b61cdb543a6ea66e0f131
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                        | 12 ------------
 board/raspberrypi/patches/linux-headers/linux-headers.hash |  1 +
 board/raspberrypi/patches/linux/linux.hash                 |  2 ++
 configs/raspberrypi0_defconfig                             |  4 ++++
 configs/raspberrypi0w_defconfig                            |  4 ++++
 configs/raspberrypi2_defconfig                             |  4 ++++
 configs/raspberrypi3_64_defconfig                          |  4 ++++
 configs/raspberrypi3_defconfig                             |  4 ++++
 configs/raspberrypi3_qt5we_defconfig                       |  4 ++++
 configs/raspberrypi4_64_defconfig                          |  4 ++++
 configs/raspberrypi4_defconfig                             |  4 ++++
 configs/raspberrypi_defconfig                              |  4 ++++
 configs/raspberrypicm4io_64_defconfig                      |  4 ++++
 configs/raspberrypicm4io_defconfig                         |  4 ++++
 configs/raspberrypizero2w_defconfig                        |  4 ++++
 15 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1070281f98..f6d54361bc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -321,18 +321,6 @@ configs/qemu_x86_64_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_x86_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_xtensa_lx60_defconfig lib_defconfig.ForceCheckHash
 configs/qemu_xtensa_lx60_nommu_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi0_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi0w_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi2_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi3_qt5we_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi4_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi4_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypi_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypicm4io_64_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypicm4io_defconfig lib_defconfig.ForceCheckHash
-configs/raspberrypizero2w_defconfig lib_defconfig.ForceCheckHash
 configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/roc_pc_rk3399_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/raspberrypi/patches/linux-headers/linux-headers.hash b/board/raspberrypi/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/raspberrypi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
new file mode 100644
index 0000000000..2843b7023d
--- /dev/null
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4d3a2af178ac6ed8f35b773836c8d216493a850aeb80932b379348e2df0cf5d2  linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 6bff1ebf81..74a8477cc6 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index ac72d49f92..03f6a805e6 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index dee9a0b23f..79de3fbf3e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -3,6 +3,10 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 6871dc0fe0..5460cd8c62 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index f0e7b82191..eded94014d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 532b3ed686..72e1c349f2 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 453bbe9440..8da3ecee12 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 1ed5d34b56..2c37631396 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 01b4353b84..c911ec63e9 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.1 series
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index d53711c3a7..75077263e4 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -2,6 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 4b50dc9ef9..07adb962a4 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index e152889f2d..0b1457f407 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -2,6 +2,10 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
