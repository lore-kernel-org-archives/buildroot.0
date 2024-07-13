Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5E8C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9616079D;
	Sat, 13 Jul 2024 15:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eb6OER-LiFc; Sat, 13 Jul 2024 15:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8BF607D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F8BF607D6;
	Sat, 13 Jul 2024 15:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 958AF1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8303060769
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siv3dzQkhM2s for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A169C60643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A169C60643
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D3AD8658D; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:57:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc4e4a93db658a561a93c72239aa63b61e6048c2
X-Git-Newrev: a7f75d2b8f856401b50fa35617dda22b728725ee
X-Patchwork-Hint: ignore
Message-Id: <20240713155752.8D3AD8658D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump to version
 20240709
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7f75d2b8f856401b50fa35617dda22b728725ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update requires:

- Changing the path to the Amlogic Bluetooth, as reported by Yang Li
  <yang.li@amlogic.com>

- Updating the hash of LICENCE.ti-connectivity due to the following
  change:

  -Copyright (c) 2016 Texas Instruments Incorporated
  +Copyright (c) 2016-2024 Texas Instruments Incorporated

- Updating the hash of LICENSE.amdgpu due to the following change:

  -Copyright (C) 2023  Advanced Micro Devices, Inc. All rights reserved.
  +Copyright (C) 2024  Advanced Micro Devices, Inc. All rights reserved.

- Updating the hash of the WHENCE file, due to firmware additions and
  firmware changes, but no changes to the redistribution/licensing
  conditions

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 8 ++++----
 package/linux-firmware/linux-firmware.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c1d168100d..73df66e650 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,9 +1,9 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b7f231228439c4302be2dfb5014dad18f4a77d663a11667c08c7b8aea7580d99  linux-firmware-20240410.tar.xz
+sha256  719662d2e8644c097f9a0bfb6e4c97280f8b2943e7bd9b47f77cf039412f5b14  linux-firmware-20240709.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
-sha256  33c0ba2ed43918f2602cfb7274757ff62a6c743082aeeec78ad636ff74200faf  LICENSE.amdgpu
+sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
@@ -28,7 +28,7 @@ sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENC
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
 sha256  8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508  LICENCE.ralink_a_mediatek_company_firmware
 sha256  a61351665b4f264f6c631364f85b907d8f8f41f8b369533ef4021765f9f3b62e  LICENCE.rtlwifi_firmware.txt
-sha256  106bef96470001e877fcf7ba0337fa6766a317650eb47fcaeb743eeebd62c4ff  LICENCE.ti-connectivity
+sha256  190fdf103278cd69f489dc0d1d4da81d9a36af8b5baea336567fcb1df51a1973  LICENCE.ti-connectivity
 sha256  8ea9f4aee5f53ad877041ff089e8c95d34d615ce19a3111e5e1ea70d990ed7ff  LICENCE.xc4000
 sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENCE.xc5000
 sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENCE.xc5000c
@@ -40,6 +40,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  77a4c5cacd61e58b47af61a6bf636f7fc37b626647a2a406210ac61d0ddd9aef  WHENCE
+sha256  416a9ad4b5232b6fbfc47cfadc14e338eb0c4351a59e6ee862c0f336f55c403e  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d6b0157ed3..75f721d147 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20240410
+LINUX_FIRMWARE_VERSION = 20240709
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -53,7 +53,7 @@ endif
 
 # Amlogic SoC Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
-LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
+LINUX_FIRMWARE_FILES += amlogic/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
