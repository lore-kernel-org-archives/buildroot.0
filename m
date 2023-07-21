Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE26FEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 03:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2386740320;
	Fri, 21 Jul 2023 03:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2386740320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itYNfz8S4B1F; Fri, 21 Jul 2023 03:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6312740201;
	Fri, 21 Jul 2023 03:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6312740201
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7E0F1BF329
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 03:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC1A60736
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 03:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC1A60736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLQvWAy47QNB for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 03:21:13 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49F7F607A4
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 03:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F7F607A4
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b8ad356fe4so10127465ad.2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689909672; x=1690514472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MmQA/4Vec8L9cAMf/BGxPLTqoCgMLUpP6bLhlPfdYy4=;
 b=RYc7WR3c0wD1oRgKtVUNQ52e5yOtulkf8lsMCVpKH4iTs0RJ3PTlY8WsN+csrG5qrD
 JUULYADam2hnsDdJzWIxa6XIQisMGpHZh/Smr7l64nAInkRkyLAm302p17zm6wlzok1g
 olQKfTTEyf3BciVqc5FkW+tQC2W2Hb49RMB/rMN+joGueRN+SBzFQQ9SGLQ3oGeAdiiK
 44tr7l+pk/9Gbi+VatHM+jdQqYLnAdDFWt7EtdsXI2O+F0OiE4WIzpoakG1n+ndR9P6G
 TkXI6Xqgz4nENvtwGNSRlH+yhjhOZxEpzG8vdXcChM4FD/FoElpq8uUCSIbykbZ4wd8J
 qF/A==
X-Gm-Message-State: ABy/qLb+mS7LOupkCpLkqzoAghznoh7XkM95pudZ6nTLHhItA1h+cV2/
 3pJ4WcAwu+PhxO4czitokdehOGkpwk8qM8jE
X-Google-Smtp-Source: APBJJlFODBEsJ6a+00o8rgTZp6lVoS/L+Dely7PgzXlCJHrmudFQsx++2t3R/B1039wUoOZ+hB2kyA==
X-Received: by 2002:a17:902:aa97:b0:1b8:6cab:db7f with SMTP id
 d23-20020a170902aa9700b001b86cabdb7fmr620191plr.53.1689909672299; 
 Thu, 20 Jul 2023 20:21:12 -0700 (PDT)
Received: from toolbox.wdc.com
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b001b9df74bac6sm2145135plg.260.2023.07.20.20.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 20:21:11 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 13:21:01 +1000
Message-Id: <20230721032102.782318-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689909672; x=1690514472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MmQA/4Vec8L9cAMf/BGxPLTqoCgMLUpP6bLhlPfdYy4=;
 b=igAzEuqxbVBeYPzgPqXzX9FpNM08Av/EbnH35rQEMYZ5rt85E8FLtuPtnRMYQl7Jo9
 /OfY3s7ks8s9MvuG9YrD50swSOgxaFAQeC5meFDo6qUYjIC16WxWlBSYyd5azEEvVZDl
 XFo8/D6rFGbTCzUBQxvPf9iq8TbLtNbpCGRbahTlSESZObKn8ibUxYFfKjVFaa1vfIQ6
 S7DIFFsiSRH1YfJNjjZNL7zg6OIB26rKkAGHUF7ST7xFtJaPm3DbQg9om4ZQKwKZMYZH
 JXTLVICKIDXO1kY/wRTaS6UgvjJdlER7Z0DcPgQ9Nd2HVjgdhZ3EMUzr/rtrZ+hS3qPL
 dung==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=igAzEuqx
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: Copy the crypto include
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 7a4e0dfca2..9d44098063 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -127,6 +127,10 @@ endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	mkdir -p $(STAGING_DIR)/usr/include/crypto
+	$(INSTALL) -m 644 $(@D)/include/crypto/* $(STAGING_DIR)/usr/include/crypto/
+	mkdir -p $(STAGING_DIR)/usr/include/internal
+	$(INSTALL) -m 644 $(@D)/include/internal/* $(STAGING_DIR)/usr/include/internal/
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
