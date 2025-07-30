Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E266C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9714740364;
	Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNhdiG_nLIpD; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A734240365
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A734240365;
	Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 122D4767
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0090A40027
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiTvrlgjWf8i for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F8140012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F8140012
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37658430F; Thu,  7 Aug 2025 17:00:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 11:04:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 67f3da3864b142cfc9c5ae80a4c18a8624768eab
X-Git-Newrev: 4ffe0852720084dec246c5871d5822e0082ce67b
X-Patchwork-Hint: ignore
Message-Id: <20250807170019.D37658430F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert
 "configs/raspberrypi5: install Raspberry Pi 500 device-tree blob"
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ffe0852720084dec246c5871d5822e0082ce67b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In Buildroot 2025.02, the vendor specific kernel version used for the
rapsberrypi5 does not yet include any dts named bcm2712-rpi-500.dts, which
results in a build error.

This reverts commit fa0ee12fcc20a63fb3f8ee2f462d14a41ccab086, which was
mistakenly cherry picked regardless of the needed vendor kernel version bump.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 board/raspberrypi/readme.txt   | 4 +---
 configs/raspberrypi5_defconfig | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 47814736bd..a110934ec1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -19,7 +19,6 @@ These instructions apply to all models of the Raspberry Pi:
   - the model CM4 (aka Raspberry Pi Compute Module 4 and IO Board).
   - the model CM4s (aka Raspberry Pi Compute Module 4s).
   - the model B5 (aka Raspberry Pi 5).
-  - the model 500 (aka Raspberry Pi 500).
 
 How to build it
 ===============
@@ -78,7 +77,7 @@ or for CM4 (on IO Board - 64 bit):
 
   $ make raspberrypicm4io_64_defconfig
 
-For model 5 B and 500:
+For model 5 B:
 
   $ make raspberrypi5_defconfig
 
@@ -118,7 +117,6 @@ After building, you should obtain this tree:
     +-- bcm2711-rpi-cm4s.dtb        [1]
     +-- bcm2712-rpi-5-b.dtb         [1]
     +-- bcm2712d0-rpi-5-b.dtb       [1]
-    +-- bcm2712-rpi-500.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 25c574d0df..8cbd533eee 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc1
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b broadcom/bcm2712-rpi-500"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
