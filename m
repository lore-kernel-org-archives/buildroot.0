Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FCBC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A2660BF2;
	Sun, 14 Jan 2024 08:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A2660BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1cMGra3X_-4; Sun, 14 Jan 2024 08:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83DD360BFF;
	Sun, 14 Jan 2024 08:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DD360BFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82F871BF86D
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB9C60BDE
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB9C60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfLkRd-Y7HT2 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8276760BAB
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8276760BAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63D40860FC; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 09:42:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae794be9cd1ff762e5f89c6e9d857297ee703ff4
X-Git-Newrev: 104b0fee839d3e4885329e77d1b8d553d552fb8e
X-Patchwork-Hint: ignore
Message-Id: <20240114084701.63D40860FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add support of
 Amlogic bluetooth firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=104b0fee839d3e4885329e77d1b8d553d552fb8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support of Amlogic bluetooth firmware.

Signed-off-by: Yang Li <yang.li@amlogic.com>
[yann.morin.1998@free.fr:
  - add license file and its hash
  - move to BT submenu
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 47b765831c..0c48a03e49 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -53,6 +53,11 @@ endmenu # Video
 
 menu "Bluetooth firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC
+	bool "Amlogic SOC Bluetooth"
+	help
+	  Firmware files for Conexant Amlogic SOC bluetooth support.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 67b03dc1b4..93222c881f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -32,6 +32,7 @@ sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENC
 sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENCE.xc5000c
 sha256  a064cbf83e10d72579d236a1e36032681adb8e442943ff75b57020a82992a5ed  LICENSE.QualcommAtheros_ar3k
 sha256  337a55102138d7baa143ee4a4c6c91693e0113fece35d380b2a12109e8c23b3f  LICENSE.QualcommAtheros_ath10k
+sha256  8c4f2bd742da678336ca582ac46ee203d75d77ce928797caed032ee0e3a2c7dd  LICENSE.amlogic
 sha256  630fd46c95d3ac6544590c2265ba7348fbc930fb386261a1c04dcd9f403645b8  LICENSE.dib0700
 sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENSE.i915
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b9a6154331..91cd1b4661 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,6 +53,12 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+# Amlogic SoC Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
+LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
