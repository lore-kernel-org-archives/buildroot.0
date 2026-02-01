Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ABE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB6E081364;
	Sun,  1 Feb 2026 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZHw6DoqskAp; Sun,  1 Feb 2026 21:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2649F81376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769980513;
	bh=J6cK5KK8wt9kMiOrP5GWuRtILW4CRMX7YDxKKrQPh4M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nTCX7mULOeee5NbYp65NzNfTaFInk9gEDV3cFZRZOqsrrRtCihO+emggSEL/s/WmH
	 GLfCjG8LhkWLgiWoA6nzQY1p85cGIey4djZS9EfU9f8uBY69FAdehcHsjxZvi0YbSB
	 F+gh3ndjdBP7NX4OoR2fNpKSWtz6XNchKcrW0MoZ3xteEuDz4jFfAK4LkAo+agjY+M
	 /+rTh6SeJzdhEYsuuFO7pNbLO74cHQajtzgMBvsnwRIBLIXMzhJGmVJgo+jXiGwLca
	 q3nd4Sy8Oqj3p+QfNDuzTp4HO4RMHvrLEnU2pdWeJIemC6vWqOFyU3dOtKgD0rZ40L
	 aLGpHc94XaFAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2649F81376;
	Sun,  1 Feb 2026 21:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80AE323E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E42281376
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In-4iTRYNMYE for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10FC81364
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B10FC81364
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98A1A7FB4E; Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 22:14:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d0c5a86041a5a727aea07191ae4dcef3213c594
X-Git-Newrev: 44cbf0fc9daf8307e11dbd1d2370e2e603cf05af
X-Patchwork-Hint: ignore
Message-Id: <20260201211511.98A1A7FB4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock4se: bump Linux to 6.18.8 and
 U-Boot to 2026.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=44cbf0fc9daf8307e11dbd1d2370e2e603cf05af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.

Tested on Radxa ROCK 4SE.

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/radxa/rock4se/patches/linux/linux.hash | 2 +-
 board/radxa/rock4se/patches/uboot/uboot.hash | 2 +-
 configs/rock4se_defconfig                    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
index 8ad0e7d8c0..f83883b936 100644
--- a/board/radxa/rock4se/patches/linux/linux.hash
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
index 80ea21b7cb..b6a925ea4e 100644
--- a/board/radxa/rock4se/patches/uboot/uboot.hash
+++ b/board/radxa/rock4se/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index 29437b9be3..c4e13f6a39 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
