Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC3AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DEB61165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4DEB61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92AB160B06;
	Wed, 13 Oct 2021 20:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VIgRhrPWDCb; Wed, 13 Oct 2021 20:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C79160D76;
	Wed, 13 Oct 2021 20:01:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10B221BF9C2
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6110D4052F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-wz9TzJKV7A for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3174D40219
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C84695BC6; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 219822da9034a0e280f55447b6e297e9a9acf3db
X-Git-Newrev: 66235c5da48e6dafaac42e454c9df700bb0eed90
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.5C84695BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nitrogen*: update kernel to
 5.10.x_2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=66235c5da48e6dafaac42e454c9df700bb0eed90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also bump linux headers version to 5.10.
Based on NXP 5.10.35-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/nitrogen6sx_defconfig | 8 ++++----
 configs/nitrogen6x_defconfig  | 8 ++++----
 configs/nitrogen7_defconfig   | 8 ++++----
 configs/nitrogen8m_defconfig  | 8 ++++----
 configs/nitrogen8mm_defconfig | 8 ++++----
 configs/nitrogen8mn_defconfig | 8 ++++----
 configs/nitrogen8mp_defconfig | 8 ++++----
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 73dfe2caff..317bf192af 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 8e4b268356..b3d97c52e9 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 8b152d931b..7656fe20d9 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 438a0bc29e..9e0e0983ee 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 567636ee4c..db5ccef156 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 71fb0e7914..95a2a45780 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 14bd26724d..53933b6b8d 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.4.x_2.3.0
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
+# Latest revision  of branch boundary-imx_5.10.x_2.0.0
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
