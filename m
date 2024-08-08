Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD68BC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DEDC80E99;
	Thu,  8 Aug 2024 20:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zma5nvEFMyev; Thu,  8 Aug 2024 20:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E8A80E6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E8A80E6B;
	Thu,  8 Aug 2024 20:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80BF91BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F20E80E46
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1_R8FlXwdiV for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8785A80E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8785A80E6B
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8785A80E6B
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:35:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478KZIfT062343;
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478KZIt3003992
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 15:35:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 15:35:18 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478KZItx026285;
 Thu, 8 Aug 2024 15:35:18 -0500
Date: Thu, 8 Aug 2024 15:35:12 -0500
MIME-Version: 1.0
Message-ID: <20240808-bsp-bump-v1-1-9e1c6f3c2592@ti.com>
References: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
In-Reply-To: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5323; i=bb@ti.com;
 h=from:subject:message-id; bh=mG6N8lSdKUVfXTr5aNraKe0fAd6nK9x0ZbzUwR2iGJ4=;
 b=owNCWmg5MUFZJlNZqmdIqQAAZP///vfL3/98veP3t169P2HuL73i1Xfvv/+9/h3Lpp93+/2wA
 RmwHagaGgDIBo00AyAGg0NA0ZABoGmmgNGQNDJoABpoaNDQMjTQxNGjEHqGGjKIA0GIDRiaAAaG
 jCMmQ0ANAAAaaMCaNMJiYTBBo0GhpiAYE0AaAaaGgGSHqGajIDJoAA0DJpoDRk0NANGag0DQGhk
 00ADQ0AyNAAekyMEDCAGmRkAIIAxOcCYPuRh1YuBHQUwBNSL2ujBcOiHwAGcbYisfRnKk0IvwnS
 zSlONuzFPIQk6ehEjERTmKI8OLvPujvaVbuGslYFYSzLd2nC3kzS4IIHTPKDZwMdJjw1IRasmeS
 Oxs+a09moBfa9cusi0vlMSv44DVbleoF5wNM+BzcDUibPwo1fOl43yCB1aZMY2GqBnpn1ucZ1lC
 5iQQUPS34ckQxsqbgsPVK9s99K4Yvcq/HzmlHYwdgke8IibPhmV5AquUw8mSXtes8wQHQavGbk2
 JUoWBbVKaySAJMOnRgoy4fg6CNLRCjR5TnMwUdTuIoeyZqj6IPhS3bX99TaqwMJ94l8I2TTfTdy
 UVAFFgbNpSTDhCAiBygAnX2s1XClyLA7eYJNziy8o7HIQ68y5GrXLULAeg3XQ7EOXgGOIxHFjXE
 JH+cdtf4u5IpwoSFUzpFSA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723149318;
 bh=qGq7Ewy5vkdkTMFvZtL6TEv7jyNkgOT+yoZZBVzp97Q=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=K2z0uggJOj3X0IWLm6A7vNd9vkJKsK3Z8l7AiM6ENQQ7pC3+Bu85sr+ZDn3keIMad
 6GppscosYhoJbbFwcAROv1v5q3nblCIiYcxrY4XAoeQmNYWpNCtmHyrhLV2E8dhGwr
 pmrd7X6XWUNH8BGoB/39N1zv6ODo0iXkA+Zmm7Z0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=K2z0uggJ
Subject: [Buildroot] [PATCH 1/4] configs/beagleplay_defconfig: bump tfa,
 uboot and linux versions
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump tfa, uboot and linux to their latest versions for the beagleplay to
pull in the latest features and bug fixes for the platform

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash     |  2 +-
 board/beagleboard/beagleplay/patches/linux/linux.hash          |  2 +-
 .../beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash    |  3 +--
 board/beagleboard/beagleplay/patches/uboot/uboot.hash          |  2 +-
 configs/beagleplay_defconfig                                   | 10 +++++-----
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 6f02bfbb22efc..8b77e1f1653a4 100644
--- a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/linux/linux.hash b/board/beagleboard/beagleplay/patches/linux/linux.hash
index a53ec1f4e7f15..53eb1438945bc 100644
--- a/board/beagleboard/beagleplay/patches/linux/linux.hash
+++ b/board/beagleboard/beagleplay/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149  linux-6.9.tar.xz
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
deleted file mode 100644
index 97a2b4eaf95ba..0000000000000
--- a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 120000
index 0000000000000..b89e91d3e8819
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+../uboot/uboot.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleplay/patches/uboot/uboot.hash b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
index 97a2b4eaf95ba..fe9b4f53dc639 100644
--- a/board/beagleboard/beagleplay/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 19b12825c5cb2..42aa2fbd6ed20 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleplay/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleplay/post-build.sh"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/beagleboard/beagleplay/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-beagleplay"
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -31,13 +31,13 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_beagleplay_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_beagleplay_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
