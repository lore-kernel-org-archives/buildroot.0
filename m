Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DB3CA0FFC
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 08:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DDC6109C;
	Sat,  2 Sep 2023 08:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DDC6109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPvVCZ3AxJ4f; Sat,  2 Sep 2023 08:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F60360E85;
	Sat,  2 Sep 2023 08:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F60360E85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8EC1BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 08:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6501983935
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 08:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6501983935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCF6lNlAPbUv for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 08:24:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B1AE8391F
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 08:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B1AE8391F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88002867EF; Sat,  2 Sep 2023 08:24:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 10:15:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 86fac42015cb10c8d2926a30882d8e3645e585c8
X-Git-Newrev: c82de32369d9c5c298058896c87b3e6fa9b465de
X-Patchwork-Hint: ignore
Message-Id: <20230902082459.88002867EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 new option for Marvell prestera firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=c82de32369d9c5c298058896c87b3e6fa9b465de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the Marvell prestera ethernet cards firmwares.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3ae72564cc..46e538776d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -489,6 +489,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE
 	  Firmware files for Intel Ethernet 800 Series Network Adapters
 	  (ice)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MARVELL_PRESTERA
+	bool "Marvell Prestera"
+	help
+	  Firmware files for Marvell Prestera ethernet cards
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY
 	bool "Microchip VSC85xx PHYs"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 7ba9537dd8..31bbfddfaa 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -17,6 +17,7 @@ sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENC
 sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
+sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
 sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a1cec90de2..f8c239d816 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -616,6 +616,12 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8411-2.fw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MARVELL_PRESTERA),y)
+LINUX_FIRMWARE_FILES += \
+	mrvl/prestera/mvsw_prestera_fw*.img
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
 LINUX_FIRMWARE_FILES += \
 	dvb-fe-xc4000-1.4.1.fw \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
