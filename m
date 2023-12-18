Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4B0C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4542A41B3C;
	Mon, 18 Dec 2023 19:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4542A41B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4R7Ao0f8CW6; Mon, 18 Dec 2023 19:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4DD41B4B;
	Mon, 18 Dec 2023 19:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4DD41B4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94E0D1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E2DF4189A
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2DF4189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OF5Se3UsdqRI for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:21 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8CB3408FB
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8CB3408FB
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d32c5ce32eso32829535ad.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928420; x=1703533220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md/XImKnWo4fPrxg3FBDyKINQvX8/CZshmqAEQToGvw=;
 b=bOnivHyO6WBygQvGLado7sMBPpzeyiQR7kHJvfHxx/+hfXejLoIo8QytrIr3l5kd4W
 1/BVd6czDJPeW+rypgCweOSRqW3IdXU3JVY5hogwwXFYwzbuaB12t4Feez4dl5WSXNP+
 zEL1QW46+wWNfBuC6t841fEY1oR5Mh5AJ+/SxFSVMnWiGRigabn3Q/Xu5nEe+UYcSvo5
 JcvJ6qHvkl7H7a9dPkPXeNyIDeMmENrx/hOipPkgV1+UTWJwNsdNu8sCbRXiuQWz+OWn
 UYNyqw93mwCLPzDJ4X5CRyCg/sreC+oxifdOsjM2BhTaRCaegu5H4SwUvZlDmSYro8U0
 vpBQ==
X-Gm-Message-State: AOJu0Yxrk4Qf11sqpOgkkVIMyuqKmDLfvRPNBKihJf1XWABhkgYDHE4j
 Bom53+a+Tee/dBzeRvDxRUT2HjLnpzhKpJmnI5w=
X-Google-Smtp-Source: AGHT+IGIQVo78sYc1mVSK/CJsDSlkptFmis2bdxhW9qJ42zrovhkttzBaD7BwPrwVxJz8S+IvjDrMA==
X-Received: by 2002:a17:902:d48d:b0:1d3:d1ee:9bd8 with SMTP id
 c13-20020a170902d48d00b001d3d1ee9bd8mr793056plg.20.1702928420647; 
 Mon, 18 Dec 2023 11:40:20 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:58 -0700
Message-ID: <20231218194001.544887-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928420; x=1703533220;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=md/XImKnWo4fPrxg3FBDyKINQvX8/CZshmqAEQToGvw=;
 b=TRYwekWtgvWYG2MavPl4vYntEznHiZF/1RsoIDxXauzXTgxBuzQkmp6d8nt35CWglv
 bR0OE6ctyRF4idwRBUzBXXQ0lMf7WiBPN2UmsRRjbMlU6kvHAIRbVXwXLcQI7Oiqi6Fc
 i4W+eIis06Dpa6djZl3Eb+Fz41coWrFPcAiAI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TRYwekWt
Subject: [Buildroot] [PATCH v2 13/14] package/sway: enable swaynag support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a config option to build sway with swaynag support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 5 +++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 49fca8dba0..5481c2c4e1 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -47,6 +47,11 @@ config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
+config BR2_PACKAGE_SWAY_SWAYNAG
+	bool "swaynag"
+	help
+	  Enable support for swaynag
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 39098797eb..7e1bd61a40 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaynag=false \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -48,6 +47,12 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYNAG),y)
+SWAY_CONF_OPTS += -Dswaynag=true
+else
+SWAY_CONF_OPTS += -Dswaynag=false
+endif
+
 ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
 SWAY_CONF_OPTS += -Dtray=enabled
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
