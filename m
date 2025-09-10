Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AC3CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D23061505;
	Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xyucUgJTq2C; Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC93E615A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC93E615A2;
	Wed, 10 Sep 2025 21:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 645592BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE41843B4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLa9GE_1GkSp for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35AF58420E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35AF58420E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35AF58420E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 681044E40B80;
 Wed, 10 Sep 2025 21:33:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3DB1C606D4;
 Wed, 10 Sep 2025 21:33:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 910E3102F29F1; 
 Wed, 10 Sep 2025 23:33:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Wed, 10 Sep 2025 23:32:25 +0200
Message-ID: <20250910213241.1529448-18-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540016; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=1/+TTyc9qLqARluSNrAW/Yltw+Dkk680KTisTlKRYmU=;
 b=O1r9D5ZSxwqMdUheSfXk3C1vieIXMyMdzX2TTaAvHNXFEg/Bl7wiBDHFa6h6/uR4dvcc20
 V2N3xhjTuX45GacgasMuCaiQXm9wD8jQMLxRXsxCBCbVxXkHRs/N9d3ahpvLMjGVJCkxiv
 GuacLl8HghOEANCtcI0E7YNbLbyTLVQ/CmQVfy0b9p4ipxY4/xKAjjQZU40vRSkxQxAjf/
 ocMpHdetK1g1MauFbNRHpw2PnONa09pwGwL7iD0YZX/QBkVBf55QHLlAhf2iY6OMfCXtAz
 bnNZcjvkoNkOtSKNHYLYP0h+DNrKOBdtMkihWG6GYVWfOSuImHg9rrRQszUidQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=O1r9D5ZS
Subject: [Buildroot] [PATCH 17/23] package/opencv4: drop optional dependency
 on libgtk2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove libgtk2, we need to drop libgtk2 support
from opencv4. gtk3 support remains in place.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/Config.in  |  9 ---------
 package/opencv4/opencv4.mk | 14 ++++----------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index f71ceba2c5..a553411e1a 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -81,15 +81,6 @@ choice
 config BR2_PACKAGE_OPENCV4_GUI_NONE
 	bool "none"
 
-config BR2_PACKAGE_OPENCV4_WITH_GTK
-	bool "gtk2"
-	depends on BR2_PACKAGE_LIBGTK2
-
-comment "gtk2 support needs libgtk2"
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK2
-
 config BR2_PACKAGE_OPENCV4_WITH_GTK3
 	bool "gtk3"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 01f70dfe49..d3df1a39f7 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -211,6 +211,7 @@ OPENCV4_CONF_OPTS += \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
+	-DWITH_GTK_2_X=OFF \
 	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
@@ -316,18 +317,11 @@ else
 OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK)$(BR2_PACKAGE_OPENCV4_WITH_GTK3),)
-OPENCV4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK),y)
-OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
-OPENCV4_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK3),y)
-OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV4_CONF_OPTS += -DWITH_GTK=ON
 OPENCV4_DEPENDENCIES += libgtk3
+else
+OPENCV4_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV4_WITH_JPEG),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
