Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46887C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F256066F;
	Mon, 29 Jul 2024 18:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqT49n40ZN4E; Mon, 29 Jul 2024 18:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070406086B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070406086B;
	Mon, 29 Jul 2024 18:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878B41BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80038810A2
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xn6Fk2atEJYK for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C877810A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C877810A0
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:12:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C31B83233; Mon, 29 Jul 2024 18:12:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 20:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 009d31b438b2c402fa959a9041f5cc9b050a1f8f
X-Git-Newrev: cefa611c8fcedf9b35d3a8161d5bcef775d46c32
X-Patchwork-Hint: ignore
Message-Id: <20240729181226.2C31B83233@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx6{dl, q,
 sx}*: bump BSP components to lf-6.6.23-2.0.0
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
Content-Type: multipart/mixed; boundary="===============4488317809422939329=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4488317809422939329==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cefa611c8fcedf9b35d3a8161d5bcef775d46c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: configs/freescale_imx6{dl,q,sx}* corresponds to the five:
freescale_imx6dlsabreauto_defconfig
freescale_imx6dlsabresd_defconfig
freescale_imx6qsabreauto_defconfig
freescale_imx6qsabresd_defconfig
freescale_imx6sxsabresd_defconfig

Those i.MX6 Sabre defconfigs have a lot in common. This is why they are
all updated at once in this single commit.

This commit bumps U-Boot and Linux kernel to the NXP BSP
lf-6.6.23-2.0.0 versions. The imx6sabre uboot patch is also rebased on
the new version, and the "Upstream:" tag is added to flag this patch
as Buildroot-specific. The ".checkpackageignore" entry for this patch
is also removed.

While bumping those BSP components, this commit also adds the custom
hashes by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in those
defconfigs. Hash files are added in the _PATCH_DIR. The
".checkpackageignore" entries for those defconfigs are also removed.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
those freescale_imx6{dl,q,sx}* are failing to build the Kernel
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_340' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping components which includes the
needed gcc-13 fixes.

The Kernel DTS names are also updated by adding the new "nxp/imx/"
prefix, to follow the upstream reorganization in [1], first included
in v6.5.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089449
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089451
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089452
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089455
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089456

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                         |  6 ------
 .../imx6sabre/patches/linux-headers/linux-headers.hash      |  1 +
 board/freescale/imx6sabre/patches/linux/linux.hash          |  2 ++
 ...6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch | 13 ++++++++-----
 board/freescale/imx6sabre/patches/uboot/uboot.hash          |  2 ++
 configs/freescale_imx6dlsabreauto_defconfig                 | 11 ++++++-----
 configs/freescale_imx6dlsabresd_defconfig                   | 11 ++++++-----
 configs/freescale_imx6qsabreauto_defconfig                  | 11 ++++++-----
 configs/freescale_imx6qsabresd_defconfig                    | 11 ++++++-----
 configs/freescale_imx6sxsabresd_defconfig                   | 11 ++++++-----
 10 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0f054c9a30..8e2a4c0324 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -30,7 +30,6 @@ board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upst
 board/cubietech/cubieboard2/post-image.sh Shellcheck
 board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
 board/freescale/common/mxs/post-image.sh Shellcheck
-board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch lib_patch.Upstream
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
 board/hardkernel/odroidc2/post-image.sh Shellcheck
 board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
@@ -153,11 +152,6 @@ configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6dlsabreauto_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6dlsabresd_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6qsabreauto_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6qsabresd_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6sxsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx7dsabresd_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6sabre/patches/linux-headers/linux-headers.hash b/board/freescale/imx6sabre/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx6sabre/patches/linux/linux.hash b/board/freescale/imx6sabre/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
index a9f88c2645..cbcb7c73fb 100644
--- a/board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ b/board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -1,4 +1,4 @@
-From e9a88fddc149fc52cdc5a8997f9fd3a29416c643 Mon Sep 17 00:00:00 2001
+From 221b57404b29190e0b37f03b81dd3ee6a0fc9ce0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
 Date: Tue, 12 Aug 2014 10:17:31 +0200
 Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
@@ -15,17 +15,20 @@ buildroot system entirely through USB.
 
 Signed-off-by: Vincent Stehlé <vincent.stehle@freescale.com>
 Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
+[Julien: rebased patch on lf-6.6.23-2.0.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: Not applicable, Buildroot specific.
 ---
  include/configs/imx_env.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/configs/imx_env.h b/include/configs/imx_env.h
-index c03748d93f..aa1a8bf488 100644
+index 1b34478fc3f..9106d59ff9f 100644
 --- a/include/configs/imx_env.h
 +++ b/include/configs/imx_env.h
-@@ -29,7 +29,7 @@
+@@ -54,7 +54,7 @@
  
- #define CONFIG_MFG_ENV_SETTINGS_DEFAULT \
+ #define CFG_MFG_ENV_SETTINGS_DEFAULT \
  	"mfgtool_args=setenv bootargs console=${console},${baudrate} " \
 -		"rdinit=/linuxrc " \
 +		"rdinit=/init " \
@@ -33,5 +36,5 @@ index c03748d93f..aa1a8bf488 100644
  		"\0" \
  	"kboot="MFG_BOOT_CMD"\0"\
 -- 
-2.26.2
+2.45.2
 
diff --git a/board/freescale/imx6sabre/patches/uboot/uboot.hash b/board/freescale/imx6sabre/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 4081fa74a2..9354d2ecec 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -7,9 +7,10 @@ BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -17,10 +18,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-sabreauto"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -38,5 +39,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 976c180d6c..a06b49d74d 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -7,9 +7,10 @@ BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,10 +18,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-sabresd"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -37,5 +38,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 72696ab1ad..bc9a64a735 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -7,9 +7,10 @@ BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -17,10 +18,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabreauto"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -38,5 +39,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index dddfaf5228..a9f45ad4be 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -7,9 +7,10 @@ BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,10 +18,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -38,5 +39,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 0c585c97f0..a88ac68da1 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -7,9 +7,10 @@ BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,10 +18,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
@@ -36,6 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y

--===============4488317809422939329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4488317809422939329==--
