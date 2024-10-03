Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38992CF34B0
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 16:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9DF082032;
	Thu,  3 Oct 2024 16:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg9sSBHi__jK; Thu,  3 Oct 2024 16:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E56EC82033
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56EC82033;
	Thu,  3 Oct 2024 16:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0281BF282
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F27607B6
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72sCy_UW-eU3 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 16:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2954B607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2954B607B2
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2954B607B2
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 16:59:29 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82fa0ccb0cdso48307639f.3
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 09:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727974769; x=1728579569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWNfRa69g+34qNh9hlydxUuUX244rblV48++5QerwO4=;
 b=oYG60ME+PIQCF7ND83GneOuGtYu3FSL+i8h5ghfwy43rqKj05IweFQnM2aPOO2f48w
 HdjrTzi+L7dgu75t0YVfAhti5p6Q7iPq/IAuPtgQabgYBhDrLVr8uIcDus5WhB8x3nB5
 hiYDSxdCBFasx+Yw7uU4+RS9Y9F+iuWaAEA0lHkN5SQbjV6Jm6QohTCuM3rt+3ShjxrG
 6Ym2hhLtUq3tgi+DO0LnZT7PiXMisAm9d7BQ1LVdjw/j3RGEOUSYtZydnTtxfedNmvYA
 wRc7xpNPRhqXvhP4QRgXubGjV/DBazhCtNRFsNwj6+W1Bti1XvOVNXbVGy5GYQuxvXwU
 c8Jg==
X-Gm-Message-State: AOJu0Yy90vrJMj5F+kk8uo+2/NfCgKTDYtKZdhtfF3OzhQKPN6deWS81
 4X0TJnoHNI7cJkRBMxpakYp5gqKwwAirNi5iiqcgaZB1BRdmbQEEK1zknA==
X-Google-Smtp-Source: AGHT+IFJaSL1gVZUfO5KxtiABL3laJouQQS3jsfQiLv4qVcg/CxQVroEUSlXxrUHm5xZ+HdHpzvu8Q==
X-Received: by 2002:a05:6602:158c:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-834d84fc56bmr676120139f.15.1727974768630; 
 Thu, 03 Oct 2024 09:59:28 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-834efc4ec88sm33593239f.8.2024.10.03.09.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:59:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 10:59:26 -0600
Message-Id: <20241003165926.849456-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727974769; x=1728579569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BWNfRa69g+34qNh9hlydxUuUX244rblV48++5QerwO4=;
 b=k5IMx32IMIpQ+9hyMPeQCZwHHT2TkYue2qw2rvvIjGJU7bhaOhG5pAtlZEidnTgKo1
 sFAO3GhGBEawBnRTs1GuMVGiLkCSpOs1t609TTbNjPlLMSxFwm9mZktwJyqPd8W0+SNw
 aCIkfaXYtRZumU78nt3diWANlSif61rah1n1A4oUyYrrvG/kI1JtRnG9JYY04S/Na8Bj
 5STLu1GQ6FEGcoXpMrx1llpIwbCjkhXwGw7yDT9s8ORuQUaY9w2lTEwfRTNhpinvzAYg
 PpCO7y56e9QQgYzhM3dXWiVYlne/hbCVlDxd7RETstiXYHREdGvF8PXm70f3NMX3RSr3
 nIzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k5IMx32I
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: enable asha when
 building audio plugins
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Symbols from the asha plugin are required when building a2dp
support as part of the audio plugins, so always enable asha
when audio plugins are selected.

Fixes:
 - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
 - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bluez5_utils/bluez5_utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 13a8ce2f0b..10bb067dd3 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,6 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--disable-asha \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
@@ -68,6 +67,7 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
 BLUEZ5_UTILS_CONF_OPTS += \
 	--enable-a2dp \
+	--enable-asha \
 	--enable-avrcp \
 	--enable-bap \
 	--enable-mcp \
@@ -75,6 +75,7 @@ BLUEZ5_UTILS_CONF_OPTS += \
 else
 BLUEZ5_UTILS_CONF_OPTS += \
 	--disable-a2dp \
+	--disable-asha \
 	--disable-avrcp \
 	--disable-bap \
 	--disable-mcp \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
