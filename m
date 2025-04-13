Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C8C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF1F40569;
	Sun, 13 Apr 2025 09:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnA-eYkOMJZG; Sun, 13 Apr 2025 09:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF13405A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF13405A5;
	Sun, 13 Apr 2025 09:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B77A108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 472E840415
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnxcLVg_fz0j for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB8C4014E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB8C4014E
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40DBB84553; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 11:31:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11b93ef2081316e37613902944b60e4c799e6314
X-Git-Newrev: 88e4af822effd3877efea7534c8941fb7b8986da
X-Patchwork-Hint: ignore
Message-Id: <20250413094217.40DBB84553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-cadence-dp-firmware: bump
 version aligned to 6.12.3-1.0.0 BSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=88e4af822effd3877efea7534c8941fb7b8986da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the qoriq-cadence-dp-firmware to the version
included in the 6.12.3-1.0.0 QorIQ BSP.

The firmware archive was refactored and its location has changed.
Those qoriq firmware files are now reused from the firmware-imx
archive, which is also included in Buildroot in the directory
"package/freescale-imx/firmware-imx". This commit keeps the Buildroot
package name qoriq-cadence-dp-firmware, first to keep compatibility
or Buildroot configs, and also because QorIQ BSP uses a different
version of the firmware-imx package, compared to the i.MX BSP (at a
same BSP version).

This commit updates the archive name, the archive version and the
download URL following the NXP Yocto BSP at [1]. More precisely,
the information was taken from the recipe at [2].

Note that regarding this qoriq-cadence-dp-firmware version:
- the QorIQ BSP version is: 6.12.3-1.0.0
- the Yocto dp-firmware-cadence package version is: 22.04
- the firmware-imx archive version is: 8.16

The important version we want to align with the rest of other QorIQ
components is indeed the BSP version "6.12.3-1.0.0".

This commit also updates license hashes. The license was updated from:
LA_OPT_NXP_Software_License v17 October 2020
to:
LA_OPT_NXP_Software_License v35 May 2022
Also, the license file EULA.txt was removed, so _LICENSE_FILES is
updated accordingly.

[1] https://github.com/nxp-qoriq/yocto-sdk
[2] https://github.com/Freescale/meta-freescale/blob/6fb8816cb32db4ba9391157036fa97914cc7d103/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[Julien:
 - reword commit log to add info on different version schemes
 - fix license hashes
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash |  7 +++----
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk   | 12 ++++++------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 6e5c761463..261401467c 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  firmware-cadence-lsdk2012.bin
-sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
-sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
-sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
+sha256  65f829a9e2597bffc58a680aaefa638122144a083633d1ae09b3aec1d9f8ab84  firmware-imx-8.16.bin
+sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  COPYING
+sha256  423c76762d50b82fedd3e15c48e436d7272a7e130f9ebb910f76489345707cf6  EULA
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 4f75287269..3f92bd24c2 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk2012
-QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
-QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = 8.16
+QORIQ_CADENCE_DP_FIRMWARE_SITE = https://www.nxp.com/lgfiles/NMG/MAD/YOCTO
+QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-imx-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
-QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
@@ -20,11 +20,11 @@ define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
