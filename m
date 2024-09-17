Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DB2C35FF3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 08:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A49FC40236;
	Tue, 17 Sep 2024 08:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yoN3ma_kAJAm; Tue, 17 Sep 2024 08:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F75D403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F75D403A2;
	Tue, 17 Sep 2024 08:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14A9C1BF276
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1077840236
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fps9272L7Lua for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 08:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE22340231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE22340231
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE22340231
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 08:25:44 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 373F735374DB; Tue, 17 Sep 2024 10:25:42 +0200 (CEST)
Date: Tue, 17 Sep 2024 10:25:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zuk9BvNm4xiiXz21@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726561542; bh=7IOhweOHz6klhqsOX5EQgSYlxon+m4luAG/uvveL6gQ=;
 h=Date:From:To:Subject:From;
 b=BFCk8a8ngiCouVNQvk0mS/fnVoDUuigyXabQYJs7wxY4QsMu8DzNeDKLB1TFgLCA5
 xQvmFVTXy6c1dWbObofJKMtBA2nCY2ScYnBgDrpopJSpItlzp0Fl7uVj8RGdUmAPeD
 orTzhswtMqbRXwmughIfaCU7b+EERTbaLABM9ttaePpKuHtS59gBbNgJ8zD8f1CVfz
 HITcfNWI0tLtKp3aB9vtT367VUozU9oytbmCtI3PEs7iO6cNx3og+0EKJa9gduGSVj
 Dp/OeGX+H+PYsCVa7o0VCQfGhEvUWZkITwpgOoBkkjS5j5E8jK0LJWvRWnuxMjdPc/
 bSA7fstyO6ueQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=BFCk8a8n
Subject: [Buildroot] [PATCH v2 2/3] configs/qemu_nios2_10m50: delete config
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
no longer test it when updating Qemu zo 9.1.0.
Furthermore it seems that NIOS2 architecture will be soon
deprecated in the toolchain support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - no changes
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
