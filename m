Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E74CCD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 322DF6083F;
	Tue,  3 Sep 2024 19:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZzcfgj-thZM; Tue,  3 Sep 2024 19:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A0E6084B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A0E6084B;
	Tue,  3 Sep 2024 19:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83BC11BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71464607CF
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLlY0Cr8F656 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95B1360683
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B1360683
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FC5986BE0; Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:51:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7c2aa477fe9b70bfa9ddcd52c0d27a96b7fdec6
X-Git-Newrev: 5e94707ca925accebdd1a7fc8fb4b023e2e8edec
X-Patchwork-Hint: ignore
Message-Id: <20240903195155.8FC5986BE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/pine64: bump Linux to
 version 6.6.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e94707ca925accebdd1a7fc8fb4b023e2e8edec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump Linux to the latest LTS version 6.6.48 and increase rootfs size to
fit kernel modules.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pine64_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index fb3a468f2d..1a3d1ab6fe 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -31,7 +31,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
@@ -41,6 +41,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
