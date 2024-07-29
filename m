Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AF8C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9968A60885;
	Mon, 29 Jul 2024 17:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXHa2nHRz9qp; Mon, 29 Jul 2024 17:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB236086B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB236086B;
	Mon, 29 Jul 2024 17:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E81EC1BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13C080EBC
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5VzQ5l4GEpj for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15CEB80E3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CEB80E3B
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 071A982894; Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 19:53:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 549e4d8d9ed4f9dbca92cb85cc7fa414a9582915
X-Git-Newrev: 5960f45cbc2d0b5a476b36588d1de62af9111011
X-Patchwork-Hint: ignore
Message-Id: <20240729175348.071A982894@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Redpine RS9116 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=5960f45cbc2d0b5a476b36588d1de62af9111011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This firmware is required for the rsi9116 wifi and bluetooth module
which is driven by the rsi_91x kernel driver.

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 265b72e562..651ca45087 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -506,6 +506,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	help
 	  Firmware files for WLAN and Bluetooth modules rs9113
 
+config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9116
+	bool "Redpine rs9116"
+	help
+	  Firmware files for WLAN and Bluetooth modules rs9116
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 75f721d147..e40eab8dc8 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -854,6 +854,14 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9116),y)
+LINUX_FIRMWARE_FILES += \
+	rsi/rs9116_wlan.rps \
+	rsi/rs9116_wlan_bt_classic.rps
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
 LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
