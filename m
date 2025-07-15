Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B5C83F3B
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730C4417DA;
	Thu, 17 Jul 2025 20:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xr3wktmwlnkd; Thu, 17 Jul 2025 20:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24751417C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24751417C4;
	Thu, 17 Jul 2025 20:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05AB81A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2279460667
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sBSksmpfb0Q for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9655160869
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9655160869
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 944B48667E; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:11:52 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 6bf2b6a3840fa885a13bfa97c3c828b86ceefcc6
X-Git-Newrev: 1ec82cfaddf6aee6e3aebb5a2f4bf5ce1f8d5aec
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.944B48667E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/beaglebone: bump
 Linux to 6.12.23-ti-arm32-r11
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ec82cfaddf6aee6e3aebb5a2f4bf5ce1f8d5aec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The patch bumps the Linux kernel to version 6.12.23-ti-arm32-r11

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4c5cfe80db563fc9d380d68e2b201f8bd4a9c1e)
[Titouan: only bump Linux LTS]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 configs/beaglebone_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 5f6bd2bec1..f2c09d9872 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  203743e32c9fba3bb9f965c1b3799977961a9d25071d6d482d96d74adfdbaadb  linux-6.12.17-ti-arm32-r9.tar.gz
+sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b4035215de..42eab6cc59 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.17-ti-arm32-r9)/linux-6.12.17-ti-arm32-r9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
