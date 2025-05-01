Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42517C3ABA9
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 23:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF47B60ABC;
	Thu,  1 May 2025 23:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IrzhR7P7Q0Z; Thu,  1 May 2025 23:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BAC660C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAC660C12;
	Thu,  1 May 2025 23:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E566B22A
 for <buildroot@buildroot.org>; Thu,  1 May 2025 23:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86B940027
 for <buildroot@buildroot.org>; Thu,  1 May 2025 23:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A81IW8ROrql6 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 23:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1F54400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F54400BD
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1F54400BD
 for <buildroot@buildroot.org>; Thu,  1 May 2025 23:29:53 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 28073E003FD;
 Fri,  2 May 2025 01:29:50 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Sergey Matyukevich <geomatsi@gmail.com>, Florian Larysch <fl@n621.de>
Date: Fri,  2 May 2025 01:29:45 +0200
Message-ID: <20250501232946.25084-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1746142190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k6+jD3ah6c2hd94xjKxqgPOZoCmqcaYO1BxpBKM0lHw=;
 b=wnJlHr1xrdNx2T+2r4Jofym72M9iR/HNVYK2I0X+RZEYo3ipYgAwtBgONAqa5uIDbK1i9/
 VfvKc8aaTSTu/l8LC5MAOJBWCxFbKHhuEj8qo7Xg/8xTxpixDvFIC0Q7BeC4R0XUIPvjxg
 k1yAtbg2i4gM2luSY5IJXRD7nk15YcA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=wnJlHr1x
Subject: [Buildroot] [PATCH 1/1] package/rockchip-rkbin: bump to latest git
 commit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version incorporates stability fixes and support for newer chip
generations.

The license hash change is only cosmetic, see the corresponding
commit[1] in the upstream repo.

Fix up defconfigs as needed since older TPL blob versions have gotten
removed.

[1] https://github.com/rockchip-linux/rkbin/commit/385bf9f1700cc4b7ab8af1ec96da02f4837c525a

Signed-off-by: Florian Larysch <fl@n621.de>
---
 configs/friendlyarm_nanopi_r3s_defconfig   | 2 +-
 configs/orangepi_5_plus_defconfig          | 2 +-
 configs/rock5b_defconfig                   | 2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash | 4 ++--
 package/rockchip-rkbin/rockchip-rkbin.mk   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index d0a2478637..39e21c74fd 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3566_ddr_1056MHz_v1.18.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3566_ddr_1056MHz_v1.23.bin"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
diff --git a/configs/orangepi_5_plus_defconfig b/configs/orangepi_5_plus_defconfig
index f283cbff7e..53a633f639 100644
--- a/configs/orangepi_5_plus_defconfig
+++ b/configs/orangepi_5_plus_defconfig
@@ -26,7 +26,7 @@ BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 7d718df15d..bef12adaa4 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -27,7 +27,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index 3e25ffac0a..83aa37b714 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb548b8c4dcd0f7d6b75c13e20d48eaac77f6218ad74e8a34c7f2097e793205  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git4.tar.gz
-sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
+sha256  4a70cdc877600b75c0a885a8ebe1aa68f0800a0010aa580c105cbd9386140fa7  rockchip-rkbin-f43a462e7a1429a9d407ae52b4745033034a6cf9-git4.tar.gz
+sha256  d2765124a2c24d71aba3cbc6cdd6975a5a297821264eb6c26378a4c16cd16e92  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
index 49271084eb..7d1459128e 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.mk
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
+ROCKCHIP_RKBIN_VERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
 ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
 ROCKCHIP_RKBIN_SITE_METHOD = git
 ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
