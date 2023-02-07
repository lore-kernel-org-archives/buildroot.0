Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23438C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC9D40425;
	Tue,  7 Feb 2023 10:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC9D40425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOyCvBlYN0RR; Tue,  7 Feb 2023 10:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6BF40888;
	Tue,  7 Feb 2023 10:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6BF40888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09C851BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D76F360E66
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76F360E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vs4WoGvCjI3Y for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:42:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08B9C60B00
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B9C60B00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9CC484047; Tue,  7 Feb 2023 10:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:41:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 537daa143b237e88f2e272056bb05771db7f48d1
X-Git-Newrev: 0781f44c0a9b46d9119557708918948a769e6881
X-Patchwork-Hint: ignore
Message-Id: <20230207104220.E9CC484047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/versal-firmware: use Xilinx github
 for versal-firmware
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0781f44c0a9b46d9119557708918948a769e6881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate versal-firmware package from nealfrager github to Xilinx github.
The images are identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/versal_vck190_defconfig            | 2 +-
 package/versal-firmware/Config.in          | 2 +-
 package/versal-firmware/versal-firmware.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index fcda6eb431..2808fa522b 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="2022.2_br_1"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
index 8d13816149..b4b63282d8 100644
--- a/package/versal-firmware/Config.in
+++ b/package/versal-firmware/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_VERSAL_FIRMWARE
 
 config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
 	string "firmware version"
-	default "v2022.2"
+	default "2022.2_br_1"
 	help
 	  Release version of Versal firmware.
 
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
index 3e4b9e558d..0bc5a00bc6 100644
--- a/package/versal-firmware/versal-firmware.mk
+++ b/package/versal-firmware/versal-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,Xilinx,ubuntu-firmware,$(VERSAL_FIRMWARE_VERSION))
 VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
 VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
 VERSAL_FIRMWARE_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
