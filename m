Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399EAC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4621F4F69C;
	Fri, 28 Feb 2025 16:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZY2ZuUGnTh7K; Fri, 28 Feb 2025 16:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B22A24F690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B22A24F690;
	Fri, 28 Feb 2025 16:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4731DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7040F424C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwpUWSjmDq_V for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B002424B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B002424B5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87CA2820F8; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 22:44:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ef5975b795271a723b694160c8d50c62d518e8e
X-Git-Newrev: 6ee9c706179076ec1d7772debb6390631da184ce
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.87CA2820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_one: bump BSP
 versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ee9c706179076ec1d7772debb6390631da184ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to the new Linux LTS release 6.12.3 and to the latest U-Boot
2024.10. Add hashes for Linux kernel/headers and U-Boot. Finally,
add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Julien:
  - add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
  - remove .checkpackageignore entry
  - change linux.hash comment to use upstream hashes
  - add missing BR2_GLOBAL_PATCH_DIR
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                              | 1 -
 .../orangepi-one/patches/linux-headers/linux-headers.hash        | 1 +
 board/orangepi/orangepi-one/patches/linux/linux.hash             | 2 ++
 board/orangepi/orangepi-one/patches/uboot/uboot.hash             | 2 ++
 configs/orangepi_one_defconfig                                   | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f8997bac55..e886d631a6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -201,7 +201,6 @@ configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_one_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-one/patches/linux/linux.hash b/board/orangepi/orangepi-one/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-one/patches/uboot/uboot.hash b/board/orangepi/orangepi-one/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 167527235e..aef7eb6c77 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-one/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-one"
@@ -22,11 +24,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
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
