Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4DBD5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B6D360813;
	Mon, 28 Oct 2024 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHo3vSBUs0UZ; Mon, 28 Oct 2024 21:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06604607FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06604607FA;
	Mon, 28 Oct 2024 21:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59BC4AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C0D81144
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRsMV0MyO33G for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BD1E80B5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BD1E80B5C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 748A7844C9; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:33:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e47726a50a3421262b6cb472e58d987d407f3e5e
X-Git-Newrev: f96b4c176f6e9d6c4374a0d322de672bf44c35bf
X-Patchwork-Hint: ignore
Message-Id: <20241028213823.748A7844C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_nios2_10m50: delete config
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f96b4c176f6e9d6c4374a0d322de672bf44c35bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu 9.1.0 removed support for NIOS2 emulation, so we can't
no longer test it when updating Qemu zo 9.1.0.
Furthermore it seems that NIOS2 architecture will be soon
deprecated in the toolchain support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/nios2-10m50/linux.fragment |  3 ---
 board/qemu/nios2-10m50/readme.txt     |  5 -----
 configs/qemu_nios2_10m50_defconfig    | 15 ---------------
 3 files changed, 23 deletions(-)

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
index 8b8b4524bd..0000000000
--- a/configs/qemu_nios2_10m50_defconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-BR2_nios2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
-BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
-BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
