Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7C4CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB56142280;
	Tue,  9 Jun 2026 13:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OZhw0-IJeAW; Tue,  9 Jun 2026 13:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFCD0420A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010374;
	bh=+Znjtx32O6Oupa8YPAk9L24yEac1TRdUkv6Q/dlBMms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QRcwd2BBGzdebE8LkmtHb4uFqJO0b0fW791RGOs8QWcLFHvJHE5JlORzxrOjYts5C
	 tj0khKSOdcTOGBXOCPs86ft4QjZuWtJwTHIpCc4ZTI6FORQigOfmDJHbSjdd4XAdWQ
	 49KttZmYQv+3hkgaU45S/ghxQ+vPL+im6Wr63a+UiPzZ2ZzXyzcI1nCHvH+LrVhAxi
	 Qff9YIjbDLtCQ6n1dC8sCzZGc3CTtO5k9Wt6gBak8fhmrxdUGSJ+AJt4K7nGKVBEMw
	 0rhGVQpY5bEXnd8vHnWz5W2Dgp2aS2rVUF4/tqO54xauyyOHP/0myPk1fXGbKztKdM
	 ihYOCvA0ZpkQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCD0420A2;
	Tue,  9 Jun 2026 13:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA34196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5363F426E7
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WuzXlE3nwg0 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E77426DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7E77426DF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F37787E75; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 00:01:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6be20a5df1b8208b8d156fee292954d4738a4b3e
X-Git-Newrev: 573ca408f766f5c98aaf684cb34145ddf96e8711
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.1F37787E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add WiFi and BT
 firmware for MT7920
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============0547681972282976582=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0547681972282976582==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/573ca408f766f5c98aaf684cb34145ddf96e8711
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add firmware for the MediaTek MT7920 chip, which is handled by the
mt7921e driver. WiFi support was added in Linux 6.10 [1] and Bluetooth
support in Linux 6.9 [2]. The firmware files were added in [3] (WiFi)
and [4] (BT), included in linux-firmware since version 20241017.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4a40fcbfe3ab4846670b59b81c914ed7e7dac2b3
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=1cb63d80fff6c4f501469e28a0eb6379639e0711
[3] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3ce84a8dbf4a418cc982503596e481a1be84eab1
[4] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=7f9c1f1b1c0edd237c2d0b72fbc15e74be624b77

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1f787bde4e..7533b3d899 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -94,6 +94,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
 	help
 	  Firmware files for MediaTek MT7650 bluetooth support
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920_BT
+	bool "MediaTek MT7920"
+	help
+	  Firmware files for MediaTek MT7920 bluetooth support
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921_BT
 	bool "MediaTek MT7921"
 	help
@@ -481,6 +486,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7916
 	help
 	  MediaTek MT7916
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920
+	bool "MediaTek MT7920"
+	help
+	  MediaTek MT7920
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921
 	bool "MediaTek MT7921"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1e30e2992c..3761c5c09b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -407,6 +407,19 @@ LINUX_FIRMWARE_FILES += mediatek/mt7916_eeprom.bin \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# MT7920
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920),y)
+LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin \
+	mediatek/WIFI_RAM_CODE_MT7961_1a.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# Mediatek MT7920 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920_BT),y)
+LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # MT7921
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921),y)
 LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin \

--===============0547681972282976582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0547681972282976582==--
