Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A15CC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689B94F553;
	Fri, 28 Feb 2025 16:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3wF_dEoISJu; Fri, 28 Feb 2025 16:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A8B4F543
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09A8B4F543;
	Fri, 28 Feb 2025 16:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BEF68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 278F94198B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3p0fz4Xatlp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C386A424B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C386A424B9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C081D844AB; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:43:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4b34375194297713de2fc3bf96feed4a97a111b
X-Git-Newrev: 9c016ee148fbe466634369e877e7c26e961e1aa2
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.C081D844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/linksprite_pcduino:
 bump BSP versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c016ee148fbe466634369e877e7c26e961e1aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to the new Linux LTS release 6.12.3 and to U-Boot 2024.10.
Force check of hashes for Linux kernel, headers, U-Boot. Finally,
add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                              | 1 -
 .../linksprite/pcduino/patches/linux-headers/linux-headers.hash  | 1 +
 board/linksprite/pcduino/patches/linux/linux.hash                | 2 ++
 board/linksprite/pcduino/patches/uboot/uboot.hash                | 2 ++
 configs/linksprite_pcduino_defconfig                             | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3e4704a577..7711bbb7f8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -167,7 +167,6 @@ configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash b/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/linksprite/pcduino/patches/linux/linux.hash b/board/linksprite/pcduino/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/linksprite/pcduino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/linksprite/pcduino/patches/uboot/uboot.hash b/board/linksprite/pcduino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/linksprite/pcduino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index 69663e0c3e..a9fe21991f 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/linksprite/pcduino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="pcduino"
 BR2_TARGET_GENERIC_ISSUE="pcDuino buildroot is ready"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -10,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,11 +31,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
