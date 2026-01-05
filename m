Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6830FC79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2B160AB0;
	Mon,  5 Jan 2026 19:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbpc_Gx11mCW; Mon,  5 Jan 2026 19:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5C460AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642763;
	bh=LJkoe1EmkBIdioO/5yOqMCBZEG2QJJE5mDU5XlZyfUo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rxaoof/WAYaS8TFrHSp2cFprzim8VvfzWqrEiklec7kZhFlYlXmXWylKsNYUhWw9e
	 3OdfnE1psvsMPKl+i7CResLwduItr0OgK3X5vtKTOCBwvnuZQ0FTW0Uuj4R7ZoXa42
	 Bm2GeUKuS2KshX6i9J5EQi9o3ImeD2CqV/I/UD/X5zZ0dGDVBLyIc4KvEkhkkr4wy9
	 hFLS19+GULGNWOD2ghziZEXyX6Twi1cma146w0jcRZT280h7xa5LGF6KIGakyW51lX
	 F88ZuR3/KKlAtne7MargnvFoSFhYMHRHjRsm3Qo6Qrhyciiat18Dj25q7U9kR7xIH7
	 6ggXxQuHSQBCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5C460AD5;
	Mon,  5 Jan 2026 19:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6374D976
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B749F60B00
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gB2DOknZVOq for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D4260AAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05D4260AAD
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00E028827C; Mon,  5 Jan 2026 19:52:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 18:47:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bceb64326724bd1d12429374636f46f8bd12287d
X-Git-Newrev: e8a53ce52ac7b0dc5c2281f80608d6c91e1050d6
X-Patchwork-Hint: ignore
Message-Id: <20260105195237.00E028827C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: Bump to Linux mainline
 6.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8a53ce52ac7b0dc5c2281f80608d6c91e1050d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps the Linux kernel to the latest 6.18.1 mainline version.

Tested on BeagleBone Black.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 4 ++--
 configs/beaglebone_defconfig                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index e70a999129..99ac4fc57e 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  1db327d0743e97ec725fefe05065a6fb779abe3063845fc3b551a4a716247c0a  linux-6.12.34-ti-arm32-r12.tar.gz
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 8a8f618e40..38d5d3b52f 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,9 +11,9 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
