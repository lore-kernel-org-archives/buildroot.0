Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B92EC87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16C366100B;
	Sun,  3 Aug 2025 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPcT-Owwb5Jy; Sun,  3 Aug 2025 14:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A76B61001
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A76B61001;
	Sun,  3 Aug 2025 14:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65AD1118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4747E41039
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DqYK7lDnK_L for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3946C40EF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3946C40EF6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3946C40EF6
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1v2q3e1iFC-00JlV5; Sun, 03
 Aug 2025 16:42:12 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:42:07 +0200
Message-ID: <20250803144208.195144-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803144208.195144-1-ps.report@gmx.net>
References: <20250803144208.195144-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/OVnme+SeoAPrtttLgVMW7clUHsbKd1UZP3LvO4V/2NHK4OgWjm
 05Z+ny/dfm+nJO+Yt4221Op0uwkt5Pto4+pmyX2UNgDLUdPk6R80XcYNgMag7emCYahqmUM
 O+v4z88YGiFLEJZXmt7WhhCfOTL1m9qTupBeXyMk4aGSGGd7FmuP79nbwZkE9qxEyrlwMbH
 oqnGz0YSw/xA/06OGEJmA==
UI-OutboundReport: notjunk:1;M01:P0:QFxZKgY2G8Q=;FoPU3qh2l4WMEB+tscx53Z4Ou6w
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754232132; x=1754836932; i=ps.report@gmx.net;
 bh=rTfVoDobjFAWxCEh05KRQppUFL3pku+1ORJGXBgc//o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h281w03AT+mSKda9wY8MU0hUeAdtyf0YLofqcEBFTyrbBQk79elaPszekXj1E1iH
 uGShXRXOgbNW7u9+LJkLrMMhiulR7Ne1i0+ehDJena2YDWVhx611y+76H9XPUm/RX
 s5gFSxpNXYozroXyhsIEWghzfQxz534gAFbxFkJVVZV+sDCxV1n9OK7g8Wavxed92
 LdGNwKoo4/IG5YJGIh6ZJsVdfjJRJtfLi+4VmIPzRSmOaVCfo6J0Y8dY2U+D7hqpq
 uVlZ7DvxSjOzp4IC/UMcSeARaYN4NhoMs/KY+UQlvbB3HL/GIruakxn8KDGmY6dk3
 qYRkzqFAyC4DcTr7rA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=h281w03A
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version to
 95be71b
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 95be71b matches with kernel 6.12.41.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index c2ca9343f1..0645d6ad77 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b120625c1e0d2dec819638a6fda97c74d1c86e184c6a4263cdf04faa2d5bbe2e  rpi-firmware-1.20250326.tar.gz
+sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2577d16a01..d0b6abcc6f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Please keep in sync with configs/raspberrypi*_deconfig
-RPI_FIRMWARE_VERSION = 1.20250326
+RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
