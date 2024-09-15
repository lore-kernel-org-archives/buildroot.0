Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41351C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09DB540012;
	Sun, 15 Sep 2024 14:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 370GIN_SxHeQ; Sun, 15 Sep 2024 14:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAACA402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAACA402BC;
	Sun, 15 Sep 2024 14:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18F911BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0723F40450
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3OP3978qBpQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7362B4043D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7362B4043D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7362B4043D
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:23:55 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0FD6635282AA; Sun, 15 Sep 2024 16:23:53 +0200 (CEST)
Date: Sun, 15 Sep 2024 16:23:52 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zubt+Ff8z3g0XZIO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726410233; bh=POs8hZUwFA9k2uqpihAWodg3FTHC1/opHKb/m+yLXHA=;
 h=Date:From:To:Subject:From;
 b=ObGT44hMPpNrYFmeT/B4/OjuIjbEmsMqldTz08beSyEYFru8smSmY/sPwZPge/3fo
 MzKfGRAXMxo1610wyuBgvd6Vhb8XjI/ZudsQTV/RjpFfTKoE4/0uYG1oKj1ZdENpUj
 9OpqOSOr+uL848ix1w8EcVyUGlOr1z849RKn1jo6HDcu4pMp/kS04cshPmLHt/ym9a
 6X0zX1coGotZt2Gqzo1BSBX6ADvyjefH7sv70xLuOZ0om5oP+36YyI44Ux264erf4T
 0qx2pNfu7XHmeXy6wNRt2CuVXxcHjRbSU7coO2uSpuPVVDBP2Vp5ENdVpVDqt7uR9R
 ZTDMXq6FILKcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ObGT44hM
Subject: [Buildroot] [PATCH 1/2] configs/qemu_nios2_10m50: delete config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qemu 9.1.0 removed support for NIOS2 emulation, so we can't
no longer test it when updating Qemu to 9.1.0.
Furthermore it seems that NIOS2 architecture will be soon
deprecated in the toolchain support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/nios2-10m50/linux.fragment |  3 ---
 board/qemu/nios2-10m50/readme.txt     |  5 -----
 configs/qemu_nios2_10m50_defconfig    | 26 --------------------------
 3 files changed, 34 deletions(-)
 delete mode 100644 board/qemu/nios2-10m50/linux.fragment
 delete mode 100644 board/qemu/nios2-10m50/readme.txt
 delete mode 100644 configs/qemu_nios2_10m50_defconfig

diff --git a/board/qemu/nios2-10m50/linux.fragment b/board/qemu/nios2-10m50/linux.fragment
deleted file mode 100644
index c7647cee8a..0000000000
--- a/board/qemu/nios2-10m50/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-# Embed the DTB in the kernel image
-CONFIG_NIOS2_DTB_SOURCE_BOOL=y
-CONFIG_NIOS2_DTB_SOURCE="10m50_devboard.dts"
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
deleted file mode 100644
index f8f8f3b3a5..0000000000
--- a/board/qemu/nios2-10m50/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run the emulation with:
-
-  qemu-system-nios2 -kernel output/images/vmlinux -nographic # qemu_nios2_10m50_defconfig
-
-The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
deleted file mode 100644
index 67419827dd..0000000000
--- a/configs/qemu_nios2_10m50_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_nios2=y
-
-# Hashes
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
-BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# Linux headers same as kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-
-# Kernel needs mkimage
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-
-# host-qemu for gitlab testing
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
