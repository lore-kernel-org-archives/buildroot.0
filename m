Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9802C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 17:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B4341272;
	Wed, 26 Feb 2025 17:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXm22QgD9CrX; Wed, 26 Feb 2025 17:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4617C41277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4617C41277;
	Wed, 26 Feb 2025 17:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BC8394F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7935B83323
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfQbjmSFhffo for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 17:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A294881F84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A294881F84
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:53:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E42987BD0; Wed, 26 Feb 2025 17:53:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 18:44:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 864cb7ea29a601c1628a33144dfc973473ee518b
X-Git-Newrev: 2cde9c108917a29c04a8f55a61cd8a422cf26498
X-Patchwork-Hint: ignore
Message-Id: <20250226175347.8E42987BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/octavo: Switch to Bootlin stable
 toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cde9c108917a29c04a8f55a61cd8a422cf26498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the Octavo configurations to use the Bootlin glibc stable prebuilt
external toolchain, as recommended in the Buildroot meeting report from
ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/octavo_osd32mp1_brk_defconfig | 4 +++-
 configs/octavo_osd32mp1_red_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
index 92848f62b5..e8857f3649 100644
--- a/configs/octavo_osd32mp1_brk_defconfig
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-brk/patches"
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-brk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
index 4372b4f8ae..d179e0a27e 100644
--- a/configs/octavo_osd32mp1_red_defconfig
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-red/patches"
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-red/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
