Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EDAC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5FD43727;
	Wed, 10 Jan 2024 22:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D5FD43727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef9Aa0YqkQOf; Wed, 10 Jan 2024 22:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E5943715;
	Wed, 10 Jan 2024 22:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E5943715
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D238E1BF966
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A99A540143
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99A540143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jyzK07Fvl1E for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:04:01 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 877BE4046B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877BE4046B
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5bso42406255e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704924239; x=1705529039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/AdqQv0Nv8dr4SX+6FTw39i/8t+hSAjMYaifza7wQ4=;
 b=jGEOKeQg6tHerXPtnEEa9O8MNarM33fi55rrYRsypZB69hBjyN7QXZ4/V+JpLkdhSu
 KQN0Auz/4Fsc4qsJNREXEBRNKh2bH7t7f7CsisY5sK5rwyhqiIwTSFJG1aI9hXAO8/Xh
 8PpjawuO1qs2yTbD1WXvK/Dwd/jLllQ/Ex4IOF+GuYJDyI/79/khYZ3c9SbB0p9PzFDk
 lecs89Vx7Ot5/JvKrkAuB2mD/zc2Y/aw1KczjmjOS2dPKjinJ52wbH6+LiJbm2zsmDib
 3gXZw4SKk+U7ihMeu3Z0/KRn+lHRjgXriGnS+bXUtNQrTOmAoeC6QAInt4BboEgcx+ac
 Ebgg==
X-Gm-Message-State: AOJu0YyknhZqgb6OcULUK4qe18fdFUDKcGknbo+3iANKStC1wBQXf4eg
 CQw8Shoepx0G7/MZTHs1+t/lVZTv+Lg=
X-Google-Smtp-Source: AGHT+IGaGTkvWCksK47xpfP17FcI0hEvzlQZiQ904TRu0neDbB0DtM5HIhsJzFj22YZdhGLmYbzS7g==
X-Received: by 2002:a05:600c:420a:b0:40d:85d4:4bf8 with SMTP id
 x10-20020a05600c420a00b0040d85d44bf8mr48380wmh.54.1704924238724; 
 Wed, 10 Jan 2024 14:03:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc2b2000000b0040d5c58c41dsm3409164wmk.24.2024.01.10.14.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 14:03:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:03:53 +0100
Message-ID: <20240110220353.1270674-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704924239; x=1705529039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p/AdqQv0Nv8dr4SX+6FTw39i/8t+hSAjMYaifza7wQ4=;
 b=BU3V4g30VYj9QlGke0hu5G2PIgBKP5e8HKIYJw4X+g84er23iZFqBARNL7vfrjX7K/
 BU1+zHPwOv9hYbgPllqP2t9+UULnTF2Gsey9szu9iB1Ihte1bZM7IvE9B8RIsHvBcCuF
 8F32VFTMkJPCSqthUpqRifyXTvMX5pCla295XAwtcdlrfaY1qxGPKGisqZbJn3G53+hw
 NsT4Pvtg814FRGVd4X3ZI1qvemPNgPai9zbvmjFDQppWiG6w0FW00EkHsPMeAi0b6kB4
 7q+TMcMHJ103F5xl+/pYCnl+m+go3XSs3mb4We0uIJFvrZhrJtonAEAD6OwYA2FxxbAM
 E+KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BU3V4g30
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: bump to version 2.2.6
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/miniupnp/miniupnp/blob/miniupnpc_2_2_6/miniupnpc/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libminiupnpc/libminiupnpc.hash | 2 +-
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index db6b01f0c9..21dac02dd3 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38acd5f4602f7cf8bcdc1ec30b2d58db2e9912e5d9f5350dd99b06bfdffb517c  miniupnpc-2.2.5.tar.gz
+sha256  37fcd91953508c3e62d6964bb8ffbc5d47f3e13481fa54e6214fcc68704c66f1  miniupnpc-2.2.6.tar.gz
 sha256  e143c6e207d0bb874c4be76b57689ffa408063a37a735c6dcec3dc600cb522c5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 59b593cb36..dddbe6f81b 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.5
+LIBMINIUPNPC_VERSION = 2.2.6
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
