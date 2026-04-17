Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A7CF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FE4460E87;
	Fri, 17 Apr 2026 15:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbFIz06j5XWN; Fri, 17 Apr 2026 15:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E044D60E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439393;
	bh=alti70shAXhec7CpWPzJzmdqHfN7c/kwBjNhye5/McI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jWJBGpNqJsYg+nxInZG7PICbpqG3t+aWBUxNTNM8+4ByQfM1ItIKYGTHnHGK2CJnM
	 46FoeS5288/fFVe1qo/k0OCoNk6IlRCsbIsRK1enCMPLiMcCxnO/DKtaWnXdprMuer
	 DPg5bP8A+/3UCIilVWN0daKHfI0csOXw6Y9+rKMQI0hH3sFPyNIF7YfFrtB+B2wrOj
	 jV5zRLqqQz/DCJUALC2whIjfhw3xlcUcamDh1OV6csJmRCot7qCISAEMfKEbg1CHPK
	 LkCiNd3/B28YRPcaETarTLAdVsrji/R6+kQrw+3Okm3dSw4gsd80jmHHTHLjB3rHUm
	 7tACrkOM1T+Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E044D60E8B;
	Fri, 17 Apr 2026 15:23:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF7B3259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0271240DEB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQble01rie3e for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4996340DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4996340DF4
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD5681DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d7da44f6da765263051e69c4b3924d2da43e7442
X-Git-Newrev: fc52ce0ef6160382dfcfd3d018b89a88d40a731f
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.EDD5681DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] configs/nitrogen*: switch
 to bootlin toolchain
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc52ce0ef6160382dfcfd3d018b89a88d40a731f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

As recommended by Julien[1].

[1] https://lists.buildroot.org/pipermail/buildroot/2026-April/800059.html

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8c655ac80ce3beca4669436a3a23dab83cd14865)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 configs/nitrogen6sx_defconfig | 4 +++-
 configs/nitrogen6x_defconfig  | 4 +++-
 configs/nitrogen7_defconfig   | 4 +++-
 configs/nitrogen8m_defconfig  | 4 +++-
 configs/nitrogen8mm_defconfig | 4 +++-
 configs/nitrogen8mn_defconfig | 4 +++-
 configs/nitrogen8mp_defconfig | 4 +++-
 7 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 03103567e9..1c68810aa9 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -3,7 +3,9 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 4d5408a474..50f769ac23 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -3,7 +3,9 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 65aff36860..7e5f8dd4f6 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 9a90cdae54..48ecf4b201 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index db4af070a8..b984acd604 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index dc54d24008..4c63fdf9d3 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 72884d97fd..b6c1264e77 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
