Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA29C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35A9341123;
	Thu, 11 Jul 2024 19:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgeYKrpiwqIV; Thu, 11 Jul 2024 19:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 540B54111E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 540B54111E;
	Thu, 11 Jul 2024 19:02:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67E1D1BF42E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62A7A60895
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCcnm4kogctN for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9723260761
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9723260761
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DC185080; Thu, 11 Jul 2024 19:02:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:01:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 460f716c446799d6de64568db514d759c73e3bb3
X-Git-Newrev: 0a0e48cd59570c67dfa270ece6e839403ce2b808
X-Patchwork-Hint: ignore
Message-Id: <20240711190230.82DC185080@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.162
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a0e48cd59570c67dfa270ece6e839403ce2b808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 5.15.162 for both
configurations and U-Boot to version 2024.04 for the SD one. Using the
same kernel will subsequently allow adding the hash files in a single
location.

Furthermore, now even the xip configuration uses the same headers as
the used Linux kernel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/stm32f469_disco_sd_defconfig  | 7 ++++---
 configs/stm32f469_disco_xip_defconfig | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 66840a7742..689a129416 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,12 +1,13 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -21,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 6e6ead0fde..000265d831 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,12 +1,13 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_KERNEL_HEADERS_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.162"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
