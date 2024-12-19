Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70494E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEDE408B7;
	Thu, 19 Dec 2024 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2F3rbIht0dp; Thu, 19 Dec 2024 20:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CC8408BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5CC8408BA;
	Thu, 19 Dec 2024 20:39:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC868920
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D10B8148D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 20:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFm0dcLC5qSV for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 20:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1289D8134A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1289D8134A
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1289D8134A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 20:39:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (11)
Received: from zm.. (pub-25.182.29.194.multiplay.pl [194.29.182.25])
 by server220076.nazwa.pl (Postfix) with ESMTP id CFE7A1BDF94;
 Thu, 19 Dec 2024 21:27:05 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 19 Dec 2024 21:26:43 +0100
Message-ID: <20241219202645.3260381-2-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219202645.3260381-1-m.niestroj@grinn-global.com>
References: <20241219202645.3260381-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 2/2] configs/grinn_liteboard: update BSP versions
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

Switch to:
 * Linux LTS 6.12.6
 * U-Boot 2024.10

Provide hashes for all above components and enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 .checkpackageignore                                   |  1 -
 .../patches/linux-headers/linux-headers.hash          |  1 +
 board/grinn/liteboard/patches/linux/linux.hash        |  2 ++
 board/grinn/liteboard/patches/uboot/uboot.hash        |  2 ++
 configs/grinn_liteboard_defconfig                     | 11 +++++++----
 5 files changed, 12 insertions(+), 5 deletions(-)
 create mode 120000 board/grinn/liteboard/patches/linux-headers/linux-headers.hash
 create mode 100644 board/grinn/liteboard/patches/linux/linux.hash
 create mode 100644 board/grinn/liteboard/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 1a573a53ef..53bab435d7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -148,7 +148,6 @@ configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
 configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
 configs/galileo_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
-configs/grinn_liteboard_defconfig lib_defconfig.ForceCheckHash
 configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/grinn/liteboard/patches/linux-headers/linux-headers.hash b/board/grinn/liteboard/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/grinn/liteboard/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/grinn/liteboard/patches/linux/linux.hash b/board/grinn/liteboard/patches/linux/linux.hash
new file mode 100644
index 0000000000..80e573540f
--- /dev/null
+++ b/board/grinn/liteboard/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d450ab215de4e1f8bb85e0f4216760fa33fd024b4526b144f4ce0d9012b29c9e  linux-6.12.6.tar.xz
diff --git a/board/grinn/liteboard/patches/uboot/uboot.hash b/board/grinn/liteboard/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/grinn/liteboard/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 3ae4a2a0b5..480a5a8c23 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,23 +1,26 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/grinn/liteboard/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/liteboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-liteboard"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="liteboard"
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
