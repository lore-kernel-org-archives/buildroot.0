Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF16C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7AA260FFA;
	Tue,  4 Feb 2025 13:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6OVKN7KFwmr; Tue,  4 Feb 2025 13:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645F560FDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645F560FDF;
	Tue,  4 Feb 2025 13:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C7E12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16A3C4116A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCLLrCA_fHBg for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC57B41183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC57B41183
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:30:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C84D486C94; Tue,  4 Feb 2025 13:30:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 14:24:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 031e02f1d80ed8381c5a2fe36c5c513bf3f7ea2c
X-Git-Newrev: 3b4038e3d70375cd4b16d790fb90508b4f902f99
X-Patchwork-Hint: ignore
Message-Id: <20250204133059.C84D486C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp: add new qspi.bin binary to
 images
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b4038e3d70375cd4b16d790fb90508b4f902f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the new qspi.bin file to the zynqmp sdcard.img.

For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
For QSPI booting, only the qspi.bin file needs to be written to the flash.

This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
as either "ImageA" or "ImageB".

Kria BIRT (Boot Image Recovery Tool):
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/genimage.cfg           | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 7 files changed, 7 insertions(+)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 20d8352c08..0a6aea7a29 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -3,6 +3,7 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.itb",
+			"qspi.bin",
 			"system.dtb",
 			"Image"
 		}
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 139ad7157e..85ef7d5aa2 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 700b378bd2..c5cfe2fe86 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 4dd0226c33..288606fc02 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 2a316958f2..1e453adeb0 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 4574898d72..13ee5ff5dc 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index d6e2617552..2669afe1f6 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
