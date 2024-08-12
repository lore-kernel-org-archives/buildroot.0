Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BB2C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 05:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CA260773;
	Mon, 12 Aug 2024 05:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KM_PEcxCKSR5; Mon, 12 Aug 2024 05:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03CF8605DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CF8605DC;
	Mon, 12 Aug 2024 05:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2EE31BF2B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D4D78110D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh9594yoZfiY for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 05:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FDA7810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FDA7810EA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FDA7810EA
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 05:28:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 168C035211D4; Mon, 12 Aug 2024 07:28:19 +0200 (CEST)
Date: Mon, 12 Aug 2024 07:28:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zrmdc57gS6XDpKzt@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723440500; bh=j1swFlvZqJW9KIUBfMpmGWiKKugDNQ+9tvXzGVhDRvw=;
 h=Date:From:To:Subject:From;
 b=LioEOaAsL90UzVkOe7kWp+28qkj8usEELFY0yNPf4cvuDFe9uRcjxq3HMBJkav51z
 H6V38mxQQqi8kjcus97TtRMznWSimuigs0sEqAxrgMTdGhNVDg25ZuT/Go1lJ8pVaF
 WREYO0Nxwa0HsIFKkN4euTKP5r4dXfcL6YNwppHpN/b2U5njQ2v2srFIF/GbBXuhlU
 yTCFSKgFsZSqFu/vOG006DwLUEvcqUI/QkE7DlMzLjnaOPiPml6zUX+oEDso6zGMnM
 eoTjD9Qfqr4Kl5HzQI9knbvLArOb/LznwPAlT2lP1shj3EgGTZhaxjXtvO50yjcOy2
 k5UWY4O3M69xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=LioEOaAs
Subject: [Buildroot] [PATCH v2] configs/solidrun_clearfog: update U-Boot and
 Linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on Solidrun Clearfog.

Signed-off-by: Wademar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - update .checkignorepatch requested by Baruch Siach
---
 .checkpackageignore                                    |  1 -
 board/solidrun/clearfog/genimage.cfg                   |  2 +-
 .../clearfog/patches/linux-headers/linux-headers.hash  |  2 ++
 board/solidrun/clearfog/patches/linux/linux.hash       |  2 ++
 board/solidrun/clearfog/patches/uboot/uboot.hash       |  2 ++
 configs/solidrun_clearfog_defconfig                    | 10 +++++++---
 6 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/clearfog/patches/linux/linux.hash
 create mode 100644 board/solidrun/clearfog/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fe4a16eb8..a44817578d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -255,7 +255,6 @@ configs/snps_archs38_axs103_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_haps_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_hsdk_defconfig lib_defconfig.ForceCheckHash
 configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
-configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
index 8963619cc5..35aab62a8c 100644
--- a/board/solidrun/clearfog/genimage.cfg
+++ b/board/solidrun/clearfog/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard.img {
 
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot-spl.kwb"
+		image = "u-boot-with-spl.kwb"
 		offset = 512
 	}
 
diff --git a/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/solidrun/clearfog/patches/linux/linux.hash b/board/solidrun/clearfog/patches/linux/linux.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/solidrun/clearfog/patches/uboot/uboot.hash b/board/solidrun/clearfog/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/solidrun/clearfog/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 7f633d30d5..56d5c1d354 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -5,6 +5,10 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
 
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/solidrun/clearfog/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
@@ -16,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,10 +37,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.kwb"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
