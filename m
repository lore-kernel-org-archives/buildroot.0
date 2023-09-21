Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E2E7D0A6
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F5A80ECD;
	Thu, 21 Sep 2023 19:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F5A80ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnFyK9xcGB6u; Thu, 21 Sep 2023 19:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E868481584;
	Thu, 21 Sep 2023 19:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E868481584
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B27B1BF3EE
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6510C61389
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6510C61389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UN7n6iN44cJY for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:19:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45ABE61388
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45ABE61388
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32704874E4; Thu, 21 Sep 2023 19:19:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:18:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fd23d68d53f13fe041894ac2eaf746874ce5a2c
X-Git-Newrev: 565e494f8649a4085d6733c067aaf0927fc4ed85
X-Patchwork-Hint: ignore
Message-Id: <20230921191947.32704874E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add iwlwifi quz
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=565e494f8649a4085d6733c067aaf0927fc4ed85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit integrates support for the iwlwifi QuZ firmware files
to support the wifi chipsets for the intel NUC10 type of hardware.
Thus, this change adds BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 46e538776d..5befe50122 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -279,6 +279,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
 	  Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
 	  supported by the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ
+	bool "Intel iwlwifi QuZ"
+	help
+	  Firmware files for the Intel Wifi QuZ devices (used in NUC10)
+	  supported by the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f8c239d816..0cd1f30c16 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -527,6 +527,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
+LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
 # No license file; the license is in the file WHENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
