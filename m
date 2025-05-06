Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7305FC3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 17:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1911440919;
	Tue,  6 May 2025 17:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-aT-lQoGEh5; Tue,  6 May 2025 17:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3373740913
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3373740913;
	Tue,  6 May 2025 17:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C8912E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA92C60C0A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0vc25GkXUWQ for <buildroot@buildroot.org>;
 Tue,  6 May 2025 17:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ABA860BDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ABA860BDC
 for <buildroot@buildroot.org>; Tue,  6 May 2025 17:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 152FF862FA; Tue,  6 May 2025 17:35:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 18:07:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d3c4130d799f1523d071df624124120b58016cd
X-Git-Newrev: b769d4dbb88a878a1ab5a261a9618c404c6a7e29
X-Patchwork-Hint: ignore
Message-Id: <20250506173556.152FF862FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-rkbin: bump to latest git
 commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=b769d4dbb88a878a1ab5a261a9618c404c6a7e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version incorporates stability fixes and support for newer chip
generations.

The license hash change is only cosmetic, see the corresponding
commit[1] in the upstream repo.

Fix up defconfigs as needed since older TPL blob versions have gotten
removed.

[1] https://github.com/rockchip-linux/rkbin/commit/385bf9f1700cc4b7ab8af1ec96da02f4837c525a

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/friendlyarm_nanopi_r3s_defconfig   | 2 +-
 configs/orangepi_5_plus_defconfig          | 2 +-
 configs/rock5b_defconfig                   | 2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash | 4 ++--
 package/rockchip-rkbin/rockchip-rkbin.mk   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index d0a2478637..39e21c74fd 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3566_ddr_1056MHz_v1.18.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3566_ddr_1056MHz_v1.23.bin"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
diff --git a/configs/orangepi_5_plus_defconfig b/configs/orangepi_5_plus_defconfig
index f283cbff7e..53a633f639 100644
--- a/configs/orangepi_5_plus_defconfig
+++ b/configs/orangepi_5_plus_defconfig
@@ -26,7 +26,7 @@ BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 7d718df15d..bef12adaa4 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -27,7 +27,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index 3e25ffac0a..83aa37b714 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb548b8c4dcd0f7d6b75c13e20d48eaac77f6218ad74e8a34c7f2097e793205  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git4.tar.gz
-sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
+sha256  4a70cdc877600b75c0a885a8ebe1aa68f0800a0010aa580c105cbd9386140fa7  rockchip-rkbin-f43a462e7a1429a9d407ae52b4745033034a6cf9-git4.tar.gz
+sha256  d2765124a2c24d71aba3cbc6cdd6975a5a297821264eb6c26378a4c16cd16e92  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
index 49271084eb..7d1459128e 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.mk
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
+ROCKCHIP_RKBIN_VERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
 ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
 ROCKCHIP_RKBIN_SITE_METHOD = git
 ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
