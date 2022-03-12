Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE99C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC164410BA;
	Sat, 12 Mar 2022 20:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGckEmSJCfEJ; Sat, 12 Mar 2022 20:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A27B410D3;
	Sat, 12 Mar 2022 20:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9F81BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9877681429
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ans-pdWCow6T for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:49:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DAD81426
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:49:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8D48583C81; Sat, 12 Mar 2022 20:41:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 21:49:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b9246703dbb92e1e556ff343746959fa04ca17e
X-Git-Newrev: aee590b3bc953b538b87b2a97ea3d5cde6b6d90f
X-Patchwork-Hint: ignore
Message-Id: <20220312204122.8D48583C81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add Intel WiFi
 22000 series
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee590b3bc953b538b87b2a97ea3d5cde6b6d90f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Intel WiFi 22000 series firmware. This firmware supports WiFi 6
models like AX200/AX201/AX210.

Signed-off-by: Stefan Agner <stefan@agner.ch>
[yann.morin.1998@free.fr: fix prompt for consistency with other iwlwifi]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index c94ffe24de..4a44d4a2b6 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -175,6 +175,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX
 	help
 	  Firmware files for the Cypress cyw54xxx FullMAC.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
+	bool "Intel iwlwifi 22000"
+	help
+	  Firmware files for the Intel Wifi 22000 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
 	bool "Intel iwlwifi 22260"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5ccb7f10dd..2eec8a291a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -437,6 +437,11 @@ LINUX_FIRMWARE_FILES += wil6210.*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
+LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
 LINUX_FIRMWARE_FILES += iwlwifi-cc-a0-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
