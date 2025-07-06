Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5788EC83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB4360A82;
	Sun,  6 Jul 2025 14:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNoKNm1pRkBe; Sun,  6 Jul 2025 14:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A4D606D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A4D606D7;
	Sun,  6 Jul 2025 14:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 206EA12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D234640662
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvzxILSzsyN8 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 230964089F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 230964089F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CEF280DCC; Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 16:41:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bab8ed7b0b454488456436291453751d65a35fbe
X-Git-Newrev: b2e42b0d506e6973fdec350372f2a3f94ccdc26f
X-Patchwork-Hint: ignore
Message-Id: <20250706144233.1CEF280DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20250627
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2e42b0d506e6973fdec350372f2a3f94ccdc26f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Also, some licenses were extracted from WHENCE to separate files in
upstream commit [1]. This commit adds those new files for firmwares
supported in Buildroot.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=cb826c70e9128e6a4069ea84680a379ebe960262

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/linux-firmware/linux-firmware.hash |  7 +++++--
 package/linux-firmware/linux-firmware.mk   | 11 ++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 07f3d7b31a..c9c673f7e2 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e  linux-firmware-20250509.tar.xz
+sha256  edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89  linux-firmware-20250627.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -10,6 +10,8 @@ sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENC
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
 sha256  631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91  ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
 sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENCE.bnx2
+sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
@@ -30,6 +32,7 @@ sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENC
 sha256  8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508  LICENCE.ralink_a_mediatek_company_firmware
 sha256  a61351665b4f264f6c631364f85b907d8f8f41f8b369533ef4021765f9f3b62e  LICENCE.rtlwifi_firmware.txt
 sha256  190fdf103278cd69f489dc0d1d4da81d9a36af8b5baea336567fcb1df51a1973  LICENCE.ti-connectivity
+sha256  a255d4a90c457bbc840a839d009fe57765ed85223965a2e4e5ecb83b348e5ec8  LICENCE.tigon
 sha256  8ea9f4aee5f53ad877041ff089e8c95d34d615ce19a3111e5e1ea70d990ed7ff  LICENCE.xc4000
 sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENCE.xc5000
 sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENCE.xc5000c
@@ -41,7 +44,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  476379d7f25204d2a5987ecd614fd0fadaa9d64775c926f067461fdfdff9b0c9  WHENCE
+sha256  8f2a8ecb3358644cac3c1f37db3c61a92521bcaf4457ac726c597b3b81796aa4  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 07d7fe4ea1..38212e12ac 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20250509
+LINUX_FIRMWARE_VERSION = 20250627
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -631,20 +631,17 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
-# No license file; the license is in the file WHENCE
-# which is installed unconditionally
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.tigon
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2),y)
 LINUX_FIRMWARE_FILES += bnx2/*
-# No license file; the license is in the file WHENCE
-# which is installed unconditionally
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.bnx2
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
-# No license file; the license is in the file WHENCE
-# which is installed unconditionally
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.bnx2x
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
