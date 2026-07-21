Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E63BC4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED09608EB;
	Tue, 21 Jul 2026 20:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19SDC0HQbb1j; Tue, 21 Jul 2026 20:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A37608CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666371;
	bh=YgILgy4J4Ov1mAas8WV4ZbV+2ypNCAQ6GnfP+wPb7JA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aQf4VbpdTioICIXu4DZ/nbWG2yfQlfONlSDzYir24sgJrrydIawbsITbpmPeaY2hV
	 SQ4/4dBJHvpGgs9M49/tpiVotrlSZ5Sf7KjxkzivtUyeYlCPaRyLmKrTvxrwq9rNfE
	 JpCEMcdShdRaVsQBmYn/uxwJRYtGx3zTZVviTiyjsjcnJaLbX5FKwUI196Y88meUyo
	 jhikACDrxzMb9bvI74bHd9KAQXxQ85XYVlfcz8g6EarYHexPcerkKSRaeHVFDvG3tK
	 e5FsZRKf3IgmpALOoRHr3Sh3BqBjVBlgEtqlu3SNeZOK2KeGXtf3Oc1Nry4tgtdzMW
	 N6R1WcRNvYsqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A37608CD;
	Tue, 21 Jul 2026 20:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA039E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54A6B40349
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sR33h4rqDDTG for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D7D40369
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D7D40369
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B5F8907E; Tue, 21 Jul 2026 20:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a33d2553c9412e378a7a60e21cb892494c10abb
X-Git-Newrev: 0c30a2c7a72742350de60f728cecb5119e834a1a
X-Patchwork-Hint: ignore
Message-Id: <20260721203844.21B5F8907E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.211
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c30a2c7a72742350de60f728cecb5119e834a1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 5.15.211 and, for the SD
configuration, also updates U-Boot to version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f469_disco_sd_defconfig                              | 4 ++--
 configs/stm32f469_disco_xip_defconfig                             | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 7929b2b9e3..b4a6bbd3f7 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 36322a6a90..ff6e4ed2e2 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c0dacd5b0c..c9c385e071 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e642d8d489..1d113da08c 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -9,7 +9,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
