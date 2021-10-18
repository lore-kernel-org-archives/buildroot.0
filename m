Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86039C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:42:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FCE60EE9
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90FCE60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D5480B7B;
	Mon, 18 Oct 2021 12:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-KpuiM4a5Zk; Mon, 18 Oct 2021 12:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B7380EED;
	Mon, 18 Oct 2021 12:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98DA51BF27C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81E8080B7B
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buWcrg8EOlTn for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:42:40 +0000 (UTC)
X-Greylist: delayed 00:09:38 by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5159D80EED
 for <buildroot@busybox.net>; Mon, 18 Oct 2021 12:42:40 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A863C4478
 for <buildroot@busybox.net>; Mon, 18 Oct 2021 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1634560381; bh=j252mTSBMoSzZsbKVN4wPl7crh7qM9gz868h1ekev9A=;
 h=From:To:Cc:Subject:Date:From;
 b=bwxzOBpyGwqg+y4rDoRUvv8nD7NMTbcW1Khg+Q4YE2YicTrYl8+iKhW6VPcRL4d/C
 +9lXix+kRQ7G7BPoGPJCWmmbmJnFM/w3jiqWRC17PNliujZBqKp67HHoU4Wbgvs1+6
 hH/rSCbhDv5hEBrs/HVCrxz7rjhTZt5WBKHdVDHLAtJ9wAEiPMkPMOVpH+qOCAejo+
 L6RFEX16mS1YnTvqD1yKxFuENG/twT9RKvYhBbWnnKXz3eGd7qSIKRV6pOX2kr52PP
 XgxsecpvrZjUw4YY5CTFhI8Ze6fL4MORCfb/KPYdgJzP8EBT7s9RjhI/9rn9/yhmNZ
 k+/NvBgff4SQA==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 7BE52A005D;
 Mon, 18 Oct 2021 12:32:58 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@busybox.net
Date: Mon, 18 Oct 2021 15:32:45 +0300
Message-Id: <20211018123245.48740-1-kremneva@synopsys.com>
X-Mailer: git-send-email 2.16.2
Subject: [Buildroot] [PATCH] configs/snps_*: Update packages versions for
 Synopsys configs
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
From: Veronika Kremneva via buildroot <buildroot@buildroot.org>
Reply-To: Veronika Kremneva <Veronika.Kremneva@synopsys.com>
Cc: Veronika Kremneva <Veronika.Kremneva@synopsys.com>,
 Alexey.Brodkin@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Bump Linux Kernel version to 5.10.69
* Bump Uboot version to 2021.04
* Specify GCC version as 11_X

Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 configs/snps_arc700_axs101_defconfig  | 9 +++++----
 configs/snps_archs38_axs103_defconfig | 8 +++++---
 configs/snps_archs38_haps_defconfig   | 7 ++++---
 configs/snps_archs38_hsdk_defconfig   | 7 ++++---
 configs/snps_archs38_vdk_defconfig    | 7 ++++---
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 080250e..5004a25 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -1,6 +1,8 @@
 # Architecture
 BR2_arcle=y
 
+BR2_GCC_VERSION_11_X=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="axs101"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
@@ -8,13 +10,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.69"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -22,6 +23,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index c584780..cb89d6e 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -2,6 +2,8 @@
 BR2_arcle=y
 BR2_archs38=y
 
+BR2_GCC_VERSION_11_X=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="axs103"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
@@ -10,12 +12,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
 # Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.69"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -23,6 +25,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index a95d760..a2a0484 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -2,17 +2,18 @@
 BR2_arcle=y
 BR2_archs38=y
 
+BR2_GCC_VERSION_11_X=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.69"
 BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 4a1ac3f..ca32564 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,8 +1,9 @@
 BR2_arcle=y
 BR2_archs38_full=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_PACKAGE_GLIBC_UTILS=y
+BR2_GCC_VERSION_11_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
@@ -12,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.69"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -21,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 8d8e9f7..c5034e1 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -2,19 +2,20 @@
 BR2_arcle=y
 BR2_archs38=y
 
+BR2_GCC_VERSION_11_X=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="archs38_vdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.69"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
