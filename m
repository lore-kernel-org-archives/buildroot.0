Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53B7C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C60B60BDE;
	Sun, 14 Jan 2024 08:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C60B60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYOAAJ31eRD8; Sun, 14 Jan 2024 08:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E0160C0A;
	Sun, 14 Jan 2024 08:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E0160C0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85CEA1BF578
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439E983578
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439E983578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGG-mql4YKvP for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6029683542
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6029683542
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B6E3860F8; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 09:16:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3865d88423c18f28f74efd9878a386db9491246f
X-Git-Newrev: ff8186657cdb0b4d4fd8c8b7cee45fa14fa4490c
X-Patchwork-Hint: ignore
Message-Id: <20240114084701.4B6E3860F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add rtw89 firmware
 files
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
Content-Type: multipart/mixed; boundary="===============4369037697882617121=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4369037697882617121==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ff8186657cdb0b4d4fd8c8b7cee45fa14fa4490c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add files for rtw89 driver and extend help text for rtw88 option a bit.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 8 +++++++-
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5befe50122..1221a80984 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -422,7 +422,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88
 	bool "Realtek rtw88"
 	help
 	  Firmware images supported by Realtek's wireless
-	  driver rtw88.
+	  driver rtw88 (802.11n/ac chipsets).
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW89
+	bool "Realtek rtw89"
+	help
+	  Firmware images supported by Realtek's wireless
+	  driver rtw89 (802.11ax chipsets).
 
 config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	bool "Redpine rs9113"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 96905dd909..d061c9f402 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -171,6 +171,13 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# rtw89
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW89),y)
+LINUX_FIRMWARE_FILES += \
+	rtw89/rtw*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 # ar3011
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3011),y)
 LINUX_FIRMWARE_FILES += ath3k-1.fw

--===============4369037697882617121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4369037697882617121==--
