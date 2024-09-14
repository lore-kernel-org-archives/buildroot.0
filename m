Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FE4C021A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B152F81F10;
	Sat, 14 Sep 2024 16:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Skw0XdWPDEIS; Sat, 14 Sep 2024 16:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF0D0840F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0D0840F3;
	Sat, 14 Sep 2024 16:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36CAE1BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A451B412B8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvO3iKSzMo48 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C344408DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C344408DD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:28:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3539F83538; Sat, 14 Sep 2024 16:28:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 18:27:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cac7bc3c98c5008b646d2f33b386a45c0271a34
X-Git-Newrev: 66f85504ce42b4a08cffd45f72c611c6fc0560c4
X-Patchwork-Hint: ignore
Message-Id: <20240914162848.3539F83538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add WLAN and BLE
 chip TI cc33xx firmware option
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

commit: https://git.buildroot.net/buildroot/commit/?id=66f85504ce42b4a08cffd45f72c611c6fc0560c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install the cc33xx firmware files.
The TI cc33xx family of devices support WiFi 6 and BLE 5.4.

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index abec943c36..4630252c5e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -527,6 +527,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
 	help
 	  Firmware files for WLAN and Bluetooth modules wl18xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX
+	bool "TI cc33xx"
+	help
+	  Firmware files for cc33xx WLAN and BLE family of chips
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210
 	bool "Qualcomm Atheros wil6210"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ae10e160b9..80a6f38a85 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -486,6 +486,15 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+# cc33xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX),y)
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/cc33xx_2nd_loader.bin \
+	ti-connectivity/cc33xx_fw.bin \
+	ti-connectivity/cc33xx-conf.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
 LINUX_FIRMWARE_FILES += wil6210.*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
