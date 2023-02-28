Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91481C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3597440300;
	Tue, 28 Feb 2023 07:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3597440300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nog1S03PPSnD; Tue, 28 Feb 2023 07:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C53B41825;
	Tue, 28 Feb 2023 07:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C53B41825
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5C41BF3DC
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7867A60BEB
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7867A60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53IsC0OV2bAo for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:44:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A973060BE1
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A973060BE1
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:44:47 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 8AD465C34DE;
 Tue, 28 Feb 2023 08:44:45 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 08:44:40 +0100
Message-Id: <1c5a072be17f6aeb1ff9f39d506141ed8024d7bf.1677570263.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677570285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=dn+UcAhdbCDpZFBACZGhBLDQeSaodu9fsbmLmF2/iz8=;
 b=K5WuIYQd7/Oo8kqC7IIgaBPQ9i1fy242oo0ReA7UXWof4+bczygczgJKkM1eBhvbpEQyjs
 RV1raa9nKgyh+EPm59DaQfGW3dBj82x8q7BkCWhw+IWskcDWBWa423NNMDh4v9P0H6vxDY
 wDcfsIBlLAKLUdrxQ5RkicV3dJ6yQUg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=K5WuIYQd
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Broadcom BNX2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         | 7 ++++++-
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4b415a7da2..72a5bcddcd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -449,8 +449,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3
 	  Firmware files for Broadcom Tigon3 ethernet cards
 	  (tigon)
 
-config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2
 	bool "Broadcom NetXtremeII"
+	help
+	  Firmware files for Broadcom NetXtreme ethernet cards (bnx2)
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+	bool "Broadcom NetXtremeII 10Gb"
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards
 	  (bnx2x)
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9d9d12bd5f..36b8fbbe91 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -527,6 +527,12 @@ LINUX_FIRMWARE_FILES += tigon/*
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2),y)
+LINUX_FIRMWARE_FILES += bnx2/*
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
