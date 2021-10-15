Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B527C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:17:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E76660F39
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E76660F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402E540847;
	Fri, 15 Oct 2021 21:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMPDkEgHSSBw; Fri, 15 Oct 2021 21:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F874086A;
	Fri, 15 Oct 2021 21:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 222281BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E35B40107
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K15TZKdUGxRd for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:16:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E6D440142
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A2A395C35; Fri, 15 Oct 2021 21:13:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 23:07:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc767ade062c4d0e28a2327c68c4e29471f9bf01
X-Git-Newrev: 20243e6691fa3975dbec8ddd21dc26a39623fc87
X-Patchwork-Hint: ignore
Message-Id: <20211015211349.9A2A395C35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armbian-firmware: bump to commit
 a1df8ab2ffbac51a8260905dd841bf825cf1bc53
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

commit: https://git.buildroot.net/buildroot/commit/?id=20243e6691fa3975dbec8ddd21dc26a39623fc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update package/armbian-firmware to latest commit.
Add config options for AP6255 and Realtek 8822CS WiFi/BT combo chips.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/armbian-firmware/Config.in             | 10 ++++++++++
 package/armbian-firmware/armbian-firmware.hash |  2 +-
 package/armbian-firmware/armbian-firmware.mk   | 23 ++++++++++++++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index 7c5f6ba193..7fb654b6d5 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256
 	help
 	  Firmware files for AP6256 WiFi/BT combo chip.
 
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255
+	bool "AP6255 WiFi/BT"
+	help
+	  Firmware files for AP6255 WiFi/BT combo chip.
+
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS
+	bool "Realtek 8822CS SDIO WiFi/BT"
+	help
+	  Firmware files for Realtek 8822CS SDIO combo chip.
+
 config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
 	bool "XR819 WiFi"
 	help
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index ceefafd97c..16bc1a2978 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a370a6aeb30f12a17f8d47c81a4d81aa822b9408589305a4d6a67d544280520d  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e-br1.tar.gz
+sha256  2e61dc5e43f6011868417504f6633e6de6c220ee48fba3b58823e4ce33a6b933  armbian-firmware-a1df8ab2ffbac51a8260905dd841bf825cf1bc53-br1.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 0ed069025d..68adab4714 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
+ARMBIAN_FIRMWARE_VERSION = a1df8ab2ffbac51a8260905dd841bf825cf1bc53
 ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
 ARMBIAN_FIRMWARE_SITE_METHOD = git
 
@@ -21,6 +21,27 @@ ARMBIAN_FIRMWARE_FILES += \
 	brcm/brcmfmac43456-sdio.txt
 endif
 
+# AP6255 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255),y)
+ARMBIAN_FIRMWARE_FILES += \
+	BCM4345C0.hcd \
+	fw_bcm43455c0_ag.bin \
+	fw_bcm43455c0_ag_apsta.bin \
+	fw_bcm43455c0_ag_p2p.bin \
+	nvram_ap6255.txt \
+	brcm/brcmfmac43455-sdio.bin \
+	brcm/brcmfmac43455-sdio.clm_blob \
+	brcm/brcmfmac43455-sdio.txt \
+	brcm/config.txt
+endif
+
+# Realtek 8822CS SDIO WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS),y)
+ARMBIAN_FIRMWARE_FILES += \
+	rtlbt/rtl8822cs_config \
+	rtlbt/rtl8822cs_fw
+endif
+
 # XR819 WiFi firmware
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
 ARMBIAN_FIRMWARE_FILES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
