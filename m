Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93328C001DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE4E4050C;
	Thu, 13 Jul 2023 21:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE4E4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9Xaw3hpWan0; Thu, 13 Jul 2023 21:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AA0F405AA;
	Thu, 13 Jul 2023 21:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA0F405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E856A1BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB0B42166
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB0B42166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVozumHmTaPv for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B063C42144
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B063C42144
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DE7887001; Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 320cba89512b36b26c7e9447e0f726cc9add8fb3
X-Git-Newrev: 83f11700fe7743aee243ced057873e105889b36a
X-Patchwork-Hint: ignore
Message-Id: <20230713211113.9DE7887001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add QCA9377 BT
 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=83f11700fe7743aee243ced057873e105889b36a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Deploy firmware files as well.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 72a5bcddcd..3ae72564cc 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -69,6 +69,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_9377_BT
+	bool "Qualcomm Atheros QCA9377 Bluetooth"
+	help
+	  Firmware files for QCA9377 bluetooth support.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_AR3011
 	bool "Qualcomm Atheros 3011"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1819ae71f0..9383b20c15 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -65,6 +65,12 @@ LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
 endif
 
+# Qualcomm Atheros QCA9377 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_9377_BT),y)
+LINUX_FIRMWARE_FILES += qca/rampatch_00230302.bin qca/nvm_00230302.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+endif
+
 # Realtek 87xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT),y)
 LINUX_FIRMWARE_FILES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
