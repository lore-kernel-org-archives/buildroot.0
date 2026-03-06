Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899DFCC056
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9697683D82;
	Fri,  6 Mar 2026 18:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkRVpUc9YBmt; Fri,  6 Mar 2026 18:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F4583D9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772820973;
	bh=91iALFlZj4Ayn4SXLc+RxG01H6/GXqKSPJGdMMaYffQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qyq0+9fzp5Uhu39C988Sk9wOoJBB0I3D2bKlhh1aPt6YR8rJkuxgoAlU/9zdcmkQT
	 pmYFhVeUbZgpZ/JFpqzaQJV42T1V/AcU0r7mOOEW7SdV7QjTB6LWU0Hajz61mYKmn1
	 dGjgWT0xTRtZGZ07Nnn0fNGEC8OP7NdoBUN4bUtuJPQT4xpEu02HaUElBEbi86JpDH
	 1NNGZkgAN6qwp3g5kXFjHCIH7uqXX5pE/rg6f0ebNz6feGj4CWP/tDbdh0wnW6UWFG
	 N3489rQtRnBn7MWUonOxdeVogrqf7Sj8djZD0jfTxDmqfFxF+RgGM1rKxNSm+xeKLl
	 gUOGBOHH5255g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F4583D9A;
	Fri,  6 Mar 2026 18:16:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC9625B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20784403E3
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLCT2LkUUYSh for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E1640147
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48E1640147
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FC61839FE; Fri,  6 Mar 2026 18:16:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:15:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f0300a8fbfae69ee8d5997b3e7b2f6c50acec49
X-Git-Newrev: 2093bfa0aa48e8803bc93634beca9e0b176fecbb
X-Patchwork-Hint: ignore
Message-Id: <20260306181610.4FC61839FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/khadas_vim3: bump linux to 6.18.15
 and u-boot to 2026.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2093bfa0aa48e8803bc93634beca9e0b176fecbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With U-Boot 2022.04 gnutls is required for building the hostool
mkeficapsule.

mkeficapsule tool is built by default if EFI_LOADER is set since u-boot
2024.10 [1].

Thus the BR2_TARGET_UBOOT_NEEDS_GNUTLS config is needed.

This commit also updates the defconfig to the new convention:
- It adds custom hashes, enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
BR2_GLOBAL_PATCH_DIR="board/khadas/vim3/patches" to store the files.

[1] https://source.denx.de/u-boot/u-boot/-/commit/b7a625b1ce49ac4e45dbacf476c31d8e312350fb

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Julien:
 - squashed linux and u-boot bumps
 - change linux.hash comment reuse hashes published upstream
 - increase BR2_TARGET_ROOTFS_EXT2_SIZE to 256M
 - remove partition size constraint in genimage.cfg
 - remove .checkpackageignore entry to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                        | 1 -
 board/khadas/vim3/genimage.cfg             | 1 -
 board/khadas/vim3/patches/linux/linux.hash | 2 ++
 board/khadas/vim3/patches/uboot/uboot.hash | 2 ++
 configs/khadas_vim3_defconfig              | 9 ++++++---
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 23d622a810..3ce5f08ba3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -106,7 +106,6 @@ configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
-configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/khadas/vim3/genimage.cfg b/board/khadas/vim3/genimage.cfg
index 79d7f9ca07..1ceb5e4e8b 100644
--- a/board/khadas/vim3/genimage.cfg
+++ b/board/khadas/vim3/genimage.cfg
@@ -27,7 +27,6 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext2"
-		size = 128M
 		offset = 0
 	}
 }
diff --git a/board/khadas/vim3/patches/linux/linux.hash b/board/khadas/vim3/patches/linux/linux.hash
new file mode 100644
index 0000000000..6ef79ed70a
--- /dev/null
+++ b/board/khadas/vim3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
diff --git a/board/khadas/vim3/patches/uboot/uboot.hash b/board/khadas/vim3/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/khadas/vim3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 89bae0f114..32e39fc64b 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -4,11 +4,13 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/khadas/vim3/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12b-a311d-khadas-vim3"
@@ -16,13 +18,14 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_DOSFSTOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="khadas-vim3"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
