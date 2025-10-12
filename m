Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98991CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 592BA60F05;
	Sun, 12 Oct 2025 10:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCMjc9hdBjSD; Sun, 12 Oct 2025 10:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A9E60F10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A9E60F10;
	Sun, 12 Oct 2025 10:35:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A00D6BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B1CF80BD7
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3h9_3nrhoeCn for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D26B80BD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D26B80BD0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 781D387085; Sun, 12 Oct 2025 10:35:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 12:28:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409ec3dc497c69e67b9bdc4c2073c7fdfa79c6ac
X-Git-Newrev: 415afde1922256532f5a2046d522483b8c3aedbf
X-Patchwork-Hint: ignore
Message-Id: <20251012103505.781D387085@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20251011
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=415afde1922256532f5a2046d522483b8c3aedbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Updated paths for iwlwifi files due to upstream commits:
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/078946281c84e8477222e51f29416439a037d83d
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/06205c0eb81a78fef9eae2cb5b1789d99a78ac25

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash |  4 +--
 package/linux-firmware/linux-firmware.mk   | 58 +++++++++++++++---------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 3824467072..f1fdca52a9 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89  linux-firmware-20250627.tar.xz
+sha256  b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3  linux-firmware-20251011.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -49,7 +49,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  8f2a8ecb3358644cac3c1f37db3c61a92521bcaf4457ac726c597b3b81796aa4  WHENCE
+sha256  fc3825c3807cf5028aa9c60a4f5936a8265e3e00fcbc85b5c016bdfc136e045f  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 287f896c87..6e58814279 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20250627
+LINUX_FIRMWARE_VERSION = 20251011
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -551,62 +551,62 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_100),y)
-LINUX_FIRMWARE_FILES += iwlwifi-100-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-100-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_105),y)
-LINUX_FIRMWARE_FILES += iwlwifi-105-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-105-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_135),y)
-LINUX_FIRMWARE_FILES += iwlwifi-135-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-135-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_1000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-1000-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-1000-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-2000-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2000-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2030),y)
-LINUX_FIRMWARE_FILES += iwlwifi-2030-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2030-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode intel/iwlwifi/iwlwifi-Qu-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-cc-a0-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-cc-a0-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3168-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3945-2.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3945-2.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
-LINUX_FIRMWARE_FILES += iwlwifi-4965-2.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-4965-2.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -615,63 +615,63 @@ endif
 # different versions of the firmware API. For now, we only install the
 # most recent one.
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
-LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2a-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B),y)
-LINUX_FIRMWARE_FILES += iwlwifi-6000g2b-6.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2b-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7260-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265D-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265D-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C),y)
-LINUX_FIRMWARE_FILES += iwlwifi-8000C-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8000C-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-8265-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
-LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
-LINUX_FIRMWARE_FILES += iwlwifi-so-a0-jf-b0*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-9???-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-so-a0-jf-b0*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
-LINUX_FIRMWARE_FILES += iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7),y)
-LINUX_FIRMWARE_FILES += iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
-LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -930,17 +930,17 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
-LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_895xcc.bin intel/qat/qat_895xcc_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C3XXX),y)
-LINUX_FIRMWARE_FILES += qat_c3xxx.bin qat_c3xxx_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_c3xxx.bin intel/qat/qat_c3xxx_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X),y)
-LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_c62x.bin intel/qat/qat_c62x_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
