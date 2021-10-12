Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29313C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBCE60E90
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFBCE60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A2CC4079E;
	Tue, 12 Oct 2021 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSONjyZS5jN5; Tue, 12 Oct 2021 20:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB77940794;
	Tue, 12 Oct 2021 20:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC4C1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5905C80E19
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWtLwyqhqKaK for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C9180E05
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0D75595550; Tue, 12 Oct 2021 20:52:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:40:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd057c2ef12d00af19454eca1bb7b55796b238b6
X-Git-Newrev: 36ca6e4a88a089c0fb1fa8ef0d5fc646e227cd57
X-Patchwork-Hint: ignore
Message-Id: <20211012205221.0D75595550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6cubox: bump Linux and U-Boot
 versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=36ca6e4a88a089c0fb1fa8ef0d5fc646e227cd57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch | 29 ----------------
 .../0002-mx6cuboxi-Fix-the-console-variable.patch  | 40 ----------------------
 configs/mx6cubox_defconfig                         |  5 ++-
 3 files changed, 2 insertions(+), 72 deletions(-)

diff --git a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch b/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
deleted file mode 100644
index b9755a042b..0000000000
--- a/board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 96db7c072b96f9b7a1d9a986eff20353f7459004 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Sun, 18 Jul 2021 19:08:36 -0300
-Subject: [PATCH] mx6cuboxi: Fix the mmc device for the rootfs
-
-After the comversion to DM_MMC, the rootfs is mmc 1, so
-adjust it accordingly.
-
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- include/configs/mx6cuboxi.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
-index 55717c77ab38..1a06f29b8c17 100644
---- a/include/configs/mx6cuboxi.h
-+++ b/include/configs/mx6cuboxi.h
-@@ -57,7 +57,7 @@
- 	"console=" CONSOLE_DEV ",115200\0" \
- 	"bootm_size=0x10000000\0" \
- 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
--	"finduuid=part uuid mmc 0:1 uuid\0" \
-+	"finduuid=part uuid mmc 1:1 uuid\0" \
- 	"update_sd_firmware=" \
- 		"if test ${ip_dyn} = yes; then " \
- 			"setenv get_cmd dhcp; " \
--- 
-2.25.1
-
diff --git a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch b/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
deleted file mode 100644
index c02134101f..0000000000
--- a/board/solidrun/mx6cubox/patches/uboot/0002-mx6cuboxi-Fix-the-console-variable.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ab1dd9332c379164925aee755a013dbd8839501b Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Mon, 19 Jul 2021 16:48:07 -0300
-Subject: [PATCH 2/2] mx6cuboxi: Fix the console variable
-
-Do not pass the console baudrate to the 'console' variable
-to avoid the baudrate being passed twice when using extlinux.conf:
-
-cat /proc/cmdline
-root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200
-
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- include/configs/mx6cuboxi.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
-index 1a06f29b8c17..9e5083b0d876 100644
---- a/include/configs/mx6cuboxi.h
-+++ b/include/configs/mx6cuboxi.h
-@@ -38,7 +38,6 @@
- /* Command definition */
- 
- #define CONFIG_MXC_UART_BASE	UART1_BASE
--#define CONSOLE_DEV	"ttymxc0"
- 
- #ifndef CONFIG_SPL_BUILD
- #define CONFIG_EXTRA_ENV_SETTINGS \
-@@ -54,7 +53,7 @@
- 	"ramdiskaddr=0x13000000\0" \
- 	"initrd_high=0xffffffff\0" \
- 	"ip_dyn=yes\0" \
--	"console=" CONSOLE_DEV ",115200\0" \
-+	"console=ttymxc0\0" \
- 	"bootm_size=0x10000000\0" \
- 	"mmcdev=" __stringify(CONFIG_SYS_MMC_ENV_DEV) "\0" \
- 	"finduuid=part uuid mmc 1:1 uuid\0" \
--- 
-2.25.1
-
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 60bfd17092..d0ce2f9a6d 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -13,12 +13,11 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.48"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.70"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -33,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
