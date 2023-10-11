Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5E4CDB467
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 17:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD607817ED;
	Wed, 11 Oct 2023 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD607817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRHSNk0FPmJ2; Wed, 11 Oct 2023 17:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A729819F3;
	Wed, 11 Oct 2023 17:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A729819F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62B481BF420
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4778961241
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4778961241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwMvK4f2QVLe for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 17:00:55 +0000 (UTC)
Received: from linux1801mail.webawere.nl (linux1801mail.webawere.nl
 [185.158.164.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD08B60B2C
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 17:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD08B60B2C
Received: from [185.47.134.76] (helo=bram-MS-7D25.bybram.com)
 by linux1801.webawere.nl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1-7-g79877b70e)
 (envelope-from <dev@bybram.com>) id 1qqc14-003HAD-1n;
 Wed, 11 Oct 2023 18:24:58 +0200
From: Bram Oosterhuis <dev@bybram.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 18:24:29 +0200
Message-Id: <20231011162430.3484150-1-dev@bybram.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LRCvWO2paAv45tMm9DP1Wz/Cihl7U7LltrH8BA3FgoI=; b=H
 vNW76o9hVvUMV2MmPaoAn5ITzymFUVPGyjfxYZtaF2RjehOyVb5XyJT6PFwmEqg5YyPfl5o3hPT8j
 JPIOaGCEpR3XLb7dBGdQOsTNhkj+oPymeMXa0vHVhzE3RjqYgDGXbGxuICuecG4g8yeI7bywORatd
 BT8K06ktPMgxYudXqPm1Yw0Gy8w4CWOrmBep0X6vCEWfihE0wF+ia4tTu4TnrYVWw2DYKv0PTmPp8
 8zeygVcWdpjn/DC8apXKBlIzVKSxHiUT/R5x7PveVxzCA/lpMej6UUm8yI4a/sFWpJAWJBt5EMBN0
 0vbE/L+fML7LY25uRDh4DB1Yg6O87jEvQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bybram.com header.i=@bybram.com
 header.a=rsa-sha256 header.s=x header.b=HvNW76o9
Subject: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version to
 6.1.55
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
Cc: Bram Oosterhuis <dev@bybram.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux 6.1 has been marked LTS for a long time now. Time to bump
Linux for RaspberryPi's to the latest 6.1.55-v7. Since April 2022
the RaspberryPi defconfigs have compressed kernel module enabled
by default. (see [1] and [2]).

To load compressed kernel modules kmod and xz packages are needed
because busybox doesn't support it.

[1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
[2] https://github.com/raspberrypi/linux/issues/4966

Signed-off-by: Bram Oosterhuis <dev@bybram.com>
---
 configs/raspberrypi0_defconfig        | 13 ++++++++++---
 configs/raspberrypi0w_defconfig       | 13 ++++++++++---
 configs/raspberrypi2_defconfig        | 13 ++++++++++---
 configs/raspberrypi3_64_defconfig     | 13 ++++++++++---
 configs/raspberrypi3_defconfig        | 13 ++++++++++---
 configs/raspberrypi3_qt5we_defconfig  | 13 ++++++++++---
 configs/raspberrypi4_64_defconfig     | 13 ++++++++++---
 configs/raspberrypi4_defconfig        | 13 ++++++++++---
 configs/raspberrypi_defconfig         | 13 ++++++++++---
 configs/raspberrypicm4io_64_defconfig | 13 ++++++++++---
 configs/raspberrypicm4io_defconfig    | 13 ++++++++++---
 configs/raspberrypizero2w_defconfig   | 13 ++++++++++---
 12 files changed, 120 insertions(+), 36 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 4506e94bce..4b4c3ff696 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
@@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 7a35794c2d..aace7cf70a 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
@@ -32,3 +32,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 9b484c5588..d679510f66 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
@@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 4d838ae0e8..5577442872 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
@@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 0a59ab42a9..b6db81f027 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
@@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 40d0c0f888..3767b7d4bc 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
@@ -51,3 +51,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 5942f7c4e1..55d6f3a7fa 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
@@ -36,3 +36,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 4e5580c140..54176fde19 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
@@ -36,3 +36,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index cca53f9b37..064037dfb0 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -4,14 +4,14 @@ BR2_ARM_EABIHF=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
@@ -38,3 +38,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 29cb0472d7..23114da28a 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
@@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 017aecc0dd..c50704a227 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
@@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 2ea503ca24..8f9d598cbf 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6.1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4ce3961c5794c1937d3bb4716eb355bc9e12c445)/linux-4ce3961c5794c1937d3bb4716eb355bc9e12c445.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
@@ -34,3 +34,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+BR2_PACKAGE_KMOD_TOOLS
+BR2_PACKAGE_XZ
+BR2_PACKAGE_KMOD
+BR2_PACKAGE_HOST_KMOD_XZ
\ No newline at end of file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
