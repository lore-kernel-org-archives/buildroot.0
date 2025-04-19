Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA03C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8DD60F23;
	Mon, 19 May 2025 10:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9kGPg8ECQQU; Mon, 19 May 2025 10:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD43270748
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD43270748;
	Mon, 19 May 2025 10:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DBAD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C43EA41E59
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Md7CG4DM0epZ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054A341201
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054A341201
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 036A684BBD; Mon, 19 May 2025 10:39:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:25:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6fd3e498af1bf837f3318eb0d47f27ac6901e7dc
X-Git-Newrev: cb6729d21410278a70d8064326ab706bef4c2b95
X-Patchwork-Hint: ignore
Message-Id: <20250519103953.036A684BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/stm32f429_disco_xip:
 bump Linux to 6.1.133
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb6729d21410278a70d8064326ab706bef4c2b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch bumps the Linux kernel to version 6.1.133. The size of xipImage
has increased by only 22 bytes (1671804 bytes compared to 1671782 in
version 6.1.126).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 9330b9749e..7855de012d 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c91920b34aec412fa6deb6ae3f22ffb41879bf07115a5e224edf4f2778be1790  linux-6.1.126.tar.xz
+sha256  97b59faf3f1925f296442a73a64439a447366f1d434be579803877097c5abe70  linux-6.1.133.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 7ba5d4ee3f..69266f567e 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.126"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.133"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
