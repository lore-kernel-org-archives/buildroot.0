Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B813C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D57610CD;
	Mon, 30 Jan 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D57610CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvawyK_0SOf8; Mon, 30 Jan 2023 21:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5935B61096;
	Mon, 30 Jan 2023 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5935B61096
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60CB31BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F4A61100
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F4A61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLP8ZKiTpjeg for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7224361185
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7224361185
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DCC9825B6; Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:28:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 319cc24aca38d6cb8898400694135b855731940f
X-Git-Newrev: fd1d0a9cbf6de2c30fcfcc181b466a5f2b44dc54
X-Patchwork-Hint: ignore
Message-Id: <20230130213019.5DCC9825B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: add support for
 BeagleBone Green Wireless
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd1d0a9cbf6de2c30fcfcc181b466a5f2b44dc54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for the BeagleBone Green Wireless to the
existing beaglebone_defconfig, by making sure the relevant Device Tree
is built and installed.

Signed-off-by: Ramon Crichlow <rcrichlow9000@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/genimage.cfg | 1 +
 configs/beaglebone_defconfig  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index 42ca2cf107..987d205075 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -11,6 +11,7 @@ image boot.vfat {
 			"am335x-boneblack.dtb",
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
+			"am335x-bonegreen-wireless.dtb",
 		}
 	}
 
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 06154d98b7..639b491e97 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -23,7 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
