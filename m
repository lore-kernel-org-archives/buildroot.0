Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037DC44506
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF2C76075A;
	Mon, 13 Jul 2026 09:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAKw_zwcwmKx; Mon, 13 Jul 2026 09:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2E4606F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783935258;
	bh=poNWfr8DHyfCNklha46RFzVpNyJ4kMke0oteFUC0l/Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gTq3iYyszywTd7j4zB69iwHIh/SWXbwnH5ytjMylo80VFIFmtrY7Uhn40XVgPvBOp
	 CeOC+4Y/DgMpYq0t8ZHVpc+c4p2d+Ls5HHT/pxLSAJwEGEQAFVY2M7PAAyrVjU6AlR
	 OS+0RCIG46eu3K+bWGIw5RXbh/mX5+qkLTqD07jatE6zgAZF4mdudEVqsfZ43Ij9vW
	 R65fZXav/wup9q1yBcGmCXi2bc++g+1S+otXzxGHGxdzwK7OPX+jVtqTz8haQ/9Unf
	 WMthaDqVnBeRoIaETfjm+UvM4mKpGHleXv1Ewr5FAVaLk102A2K8TKOa5TIvUzOq3d
	 KWiGy0L+AvC5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF2E4606F1;
	Mon, 13 Jul 2026 09:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB75A2EE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F04408AB
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuH7CKw1ll9M for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 09:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7720C408A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7720C408A8
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4316D887B3; Mon, 13 Jul 2026 09:33:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 11:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb594e029f6e7ff394ca3ea5d8e5ae86d1449e9e
X-Git-Newrev: 66469c73ed74ec433a88d678c2115a10a816691c
X-Patchwork-Hint: ignore
Message-Id: <20260713093342.4316D887B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/cubieboard{1,
 2}: bump Linux to 7.1.3 and U-Boot to 2026.07
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66469c73ed74ec433a88d678c2115a10a816691c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 4 ++--
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 board/cubietech/cubieboard2/patches/linux/linux.hash | 4 ++--
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 configs/cubieboard2_defconfig                        | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index aac576b5f9..cd7c9607f2 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index b6a925ea4e..ff6e4ed2e2 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index aac576b5f9..cd7c9607f2 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index b6a925ea4e..ff6e4ed2e2 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 47d882c04f..217303dc47 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.1.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 0de3edb93e..a0d6d968c4 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.1.3"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
