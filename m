Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E89FA3754
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CC940865;
	Fri,  2 Jan 2026 17:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-MYGS-cWPAZ; Fri,  2 Jan 2026 17:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112A0404C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373594;
	bh=BPr/E+7Ft3uojyNN47VU+FwdMY9zXTypK0LJS8fDbfU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P0djFMSxxZaShK8zowB7OTtooWBjtfGwfr6Ja/U3zawKC2VVFOLN61cczmiTOJTYU
	 YrGMRremmyCB6iTCx55NmzYoib318wGYgBJmFvIxDpGQkOpSiVA8N9qVA3UhCPq7S5
	 4cqbaNZEZyeuoudJT/sjr2whAru4VkAy+QSwBPYT1z7LlRosfLWq5c760zR/QMdJVg
	 UFaoU7yf4yN+UTR5tu91aGhFRDVF9YuHatGChmWFLR6GMjyraCYGfc23uRTZRCdhzL
	 MLBxPPPYTv/nmKcPpFFjW3JqbGwBRryvEkZmqIUQeDwIE1PaT1CqXK8IcyJKWey7jj
	 LWWi5TL5YVJng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112A0404C3;
	Fri,  2 Jan 2026 17:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDF87440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4CCF60A7F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hd9_OTGFGHHW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD66607DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFD66607DA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8B2187FBD; Fri,  2 Jan 2026 17:06:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:06:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf383d3e13e7963eca8e1c3aefe2512e9b5ef81c
X-Git-Newrev: f0c865ee1e8b8a5a79dd1be86bfc5a8859b943ee
X-Patchwork-Hint: ignore
Message-Id: <20260102170630.D8B2187FBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: bump Linux
 and U-Boot, add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0c865ee1e8b8a5a79dd1be86bfc5a8859b943ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following Microchip's Linux 2025.07 release, update the assets to the
latest versions, this includes a Linux version bump and addditional
U-Boot drivers and functionality. Update the Linux headers to support
the updated v6.12 kernel. Update the corresponding package hashes.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index 416a8b1550..d0e2d5693c 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
+sha256  7789cc2844cb9633aa8c146e194c9ad3482bf06ace707d66d0ca6039ed16833d  linux-linux4microchip+fpga-2025.07.tar.gz
diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index 2628d4b4fd..0adbe15710 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
+sha256  8dab9abc2861d95e609cd62a44b4687d03dc13eae6487fd1ae1ded6398ddb0cd  uboot-linux4microchip+fpga-2025.07.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 4337ac34b4..4d465016c7 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,13 +1,13 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/microchip/mpfs_icicle/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.07)/linux-linux4microchip+fpga-2025.07.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.07)/uboot-linux4microchip+fpga-2025.07.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
