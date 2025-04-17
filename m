Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE604C369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 22:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4DE40C44;
	Thu, 17 Apr 2025 22:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egGQdkkBqsCh; Thu, 17 Apr 2025 22:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958D74077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958D74077F;
	Thu, 17 Apr 2025 22:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C097D22D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54F084A26
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZL8GQLBNInfS for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 22:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97152848DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97152848DA
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5445C85A61; Thu, 17 Apr 2025 22:11:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 23:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 794cdd0ad383cab59b55b700ecddb95c5b84b422
X-Git-Newrev: ebdf7d5fe210ea71766cccaa1f3f0b110a987149
X-Patchwork-Hint: ignore
Message-Id: <20250417221108.5445C85A61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: bump Linux to
 6.12.17-ti-arm32-r9 and U-Boot to 2025.04
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebdf7d5fe210ea71766cccaa1f3f0b110a987149
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 6.12.17-ti-arm32-r9 and
U-Boot to version 2025.04.

Tested on beaglebone black.

Link: https://github.com/beagleboard/linux/releases/tag/6.12.17-ti-arm32-r9

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index b7d4412941..5f6bd2bec1 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c6ee813cc48fe7e308c149798100d621514e832da507e34d1dfd8247ef9ae39f  linux-6.6.58-ti-arm32-r10.tar.gz
+sha256  203743e32c9fba3bb9f965c1b3799977961a9d25071d6d482d96d74adfdbaadb  linux-6.12.17-ti-arm32-r9.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 50674352d7..80ea21b7cb 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index ddeb221e86..b4035215de 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.58-ti-arm32-r10)/linux-6.6.58-ti-arm32-r10.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.17-ti-arm32-r9)/linux-6.12.17-ti-arm32-r9.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
