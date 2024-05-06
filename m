Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34C2C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C6AD822BE;
	Mon,  6 May 2024 20:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdJnwRTGdc_j; Mon,  6 May 2024 20:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7FB82305
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7FB82305;
	Mon,  6 May 2024 20:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A61F1BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F0C41481
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhQd0fC5i4AA for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D18C414A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D18C414A0
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29802868B6; Mon,  6 May 2024 20:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7efd75867cd84926b7aa6524e0a41c50c32b20e1
X-Git-Newrev: 1f5fd13567a6ecfbb91f832ce2e20d50337dcd86
X-Patchwork-Hint: ignore
Message-Id: <20240506200644.29802868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62x_sk_defconfig: bump kernel
 to v6.8.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f5fd13567a6ecfbb91f832ce2e20d50337dcd86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest kernel to pull in the latest bug fixes and features
for TI's SoCs and reference boards

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index cedae67f33..2e9aad399e 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
+sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 51e8793a66..36052dba40 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
