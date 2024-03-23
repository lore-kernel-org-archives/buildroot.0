Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D7C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B52E606EB;
	Sat, 23 Mar 2024 20:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPq4F3FXzhCi; Sat, 23 Mar 2024 20:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509FE60751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509FE60751;
	Sat, 23 Mar 2024 20:29:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44D961BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E965606DB
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4C4iWUJxQCz for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68461606EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68461606EB
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F11B83961; Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:22:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eaf90622947758719762463214f729462771075
X-Git-Newrev: 012b6cc874e944fb098136c697fc0f71bcc264ef
X-Patchwork-Hint: ignore
Message-Id: <20240323202919.4F11B83961@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone_defconfig: bump Linux
 to 6.1.80-ti-r34 and U-Boot to 2024.01
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=012b6cc874e944fb098136c697fc0f71bcc264ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested on beaglebone black.

[1] https://github.com/beagleboard/linux/releases/tag/6.1.80-ti-r34

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 configs/beaglebone_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e2d67019b1..064f283489 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.80-ti-r34)/linux-6.1.80-ti-r34.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
