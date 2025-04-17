Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEACC369CB
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 20:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8902B411D1;
	Thu, 17 Apr 2025 20:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwFRTaDaULdX; Thu, 17 Apr 2025 20:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAA540870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAA540870;
	Thu, 17 Apr 2025 20:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 356A422E
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A6D0607E8
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKeiw0Z_inKu for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 20:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C07B606F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C07B606F1
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:51:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16EFD85B50; Thu, 17 Apr 2025 20:51:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 22:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f85aea1b96ff865ad2981566cfa64f5140f30753
X-Git-Newrev: 794cdd0ad383cab59b55b700ecddb95c5b84b422
X-Patchwork-Hint: ignore
Message-Id: <20250417205110.16EFD85B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.1.134 and U-Boot to 2025.04
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=794cdd0ad383cab59b55b700ecddb95c5b84b422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 6.1.134 and U-Boot to
version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 6d69eabbd6..e300dfeb82 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
+sha256  60c70cdd70ddee384c004242e67844e3dd1fe28f75b26b3586859fff0a07bd23  linux-6.1.134.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 904fa56c02..80ea21b7cb 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index f12dc8383d..2169ab4465 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.120"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.134"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
