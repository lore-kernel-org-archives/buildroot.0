Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83968C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AEED7081B;
	Mon, 19 May 2025 10:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoWD0PylFS9K; Mon, 19 May 2025 10:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705AD70819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705AD70819;
	Mon, 19 May 2025 10:53:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2038BD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42B6241217
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhG1cz7OMcR0 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1698E40E26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1698E40E26
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1489F8348A; Mon, 19 May 2025 10:39:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 14:03:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 310ab7d53393288aba5c574c49a6cae1bf1e1a1d
X-Git-Newrev: 377e7f289ab5170b8b82a9329ca674d622a49cdb
X-Patchwork-Hint: ignore
Message-Id: <20250519103954.1489F8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/cubieboard1: bump
 Linux to 6.12.24 and U-Boot to 2025.04
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

commit: https://git.buildroot.net/buildroot/commit/?id=377e7f289ab5170b8b82a9329ca674d622a49cdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 2e30d90bb1..1213da86b1 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
+sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 50674352d7..80ea21b7cb 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 4a4d932f32..9f3ad65386 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
