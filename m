Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506BCC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 09:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C8760726;
	Thu, 15 Aug 2024 09:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2bR7UGMFzyr; Thu, 15 Aug 2024 09:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA5460A43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA5460A43;
	Thu, 15 Aug 2024 09:02:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0066C1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27C260726
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oR5Pe-kfES4 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 09:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809EB60A43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 809EB60A43
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 09:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795BD85E49; Thu, 15 Aug 2024 09:02:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 11:02:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7eabe00058013c2135a4084fd622b2e1c511ff3
X-Git-Newrev: fd88b0104fd0e0e39edf80518f3454d94f671405
X-Patchwork-Hint: ignore
Message-Id: <20240815090235.795BD85E49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: update
 custom tarballs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd88b0104fd0e0e39edf80518f3454d94f671405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux kernel and U-Boot custom tarballs were updated incorrectly
in commit 45db64545742. Update these to select specific release tags
instead of branches. Update the U-Boot and Linux hashes to match
these changes.

Fixes: 45db64545742 ("configs/microchip_mpfs_icicle: bump Linux and
U-Boot, add hashes")

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index 025d630f7d..416a8b1550 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a45642bd69b11d9312c15faac67fbd15b0ef90a6d90662d18c0760e37165c7cc  linux4microchip+fpga-2024.06.tar.gz
+sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index ddb73b9a71..2628d4b4fd 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d9bcbebe9723ab12cbf2b60277268741e84e4aadbe7ecd8c05be046f202d8a1  linux4microchip+fpga-2024.06.tar.gz
+sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 30d07550ac..4337ac34b4 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.6-mchp+fpga)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
