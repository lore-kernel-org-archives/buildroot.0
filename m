Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6421E4013A;
	Sat, 15 Jan 2022 11:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjnH26mfzLhh; Sat, 15 Jan 2022 11:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73978400C8;
	Sat, 15 Jan 2022 11:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 217A91BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DBAC60A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOBrpjfINKGn for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47540607D1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:20:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54A1582A42; Sat, 15 Jan 2022 11:13:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:07:42 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0b0360c73c6cca0b5b3dbe4d07e19f998cbfd169
X-Git-Newrev: 310d3d6bef9719ee7e147e59697143e0f1c0e023
X-Patchwork-Hint: ignore
Message-Id: <20220115111347.54A1582A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] configs/beaglebone: add
 DT for the Beaglebone Black Wireless
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=310d3d6bef9719ee7e147e59697143e0f1c0e023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The Beaglebone Black Wireless needs a specific DT, which u-boot tries to
load based on the board name. Make sure we ship the DT so that we can
boot on that platform.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1984222c84f53f530dce230d14f30015d971ab3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/beaglebone/genimage.cfg    | 1 +
 configs/beaglebone_defconfig     | 2 +-
 configs/beaglebone_qt5_defconfig | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index cfc1039ec4..1c77c58f38 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -10,6 +10,7 @@ image boot.vfat {
 			"am335x-bone.dtb",
 			"am335x-boneblack.dtb",
 			"am335x-bonegreen.dtb",
+			"am335x-boneblack-wireless.dtb",
 		}
 	}
 	size = 16M
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 9a4be13ec5..5a37f42d3e 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 5f084b77df..11a91677ce 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
