Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986C9C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45C02404DD;
	Wed,  3 Jan 2024 00:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C02404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XGeHvOVX-mC; Wed,  3 Jan 2024 00:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D60540A75;
	Wed,  3 Jan 2024 00:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D60540A75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E488E1BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6A88124A
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE6A88124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iknmto0ztE72 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:09 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D25F481235
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D25F481235
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-28bc7155755so3983659a91.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240007; x=1704844807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcA6BEdD2PZBS3qHdO7qseMTqf22KTi4majfLqOsRzE=;
 b=JIWTwFuUpR70VyvWFwaJMqBv8UNWf/97kMLE0UTBB9RObuBawjTfXXfR2Ri/+GZYQq
 KrvzzY/DWrDCkSLiHBs59RV9O2//4ZgKjAhhdb0vtYeH9jAnzGZJG5lzmnwc5O6jZnTc
 bBOLJaMt/JXOOx22ld/zO3aVRtrzm4FUZPGxoicSEIWD3iJF6bzGEXJ+nRr2LTXPJh26
 czWJcF98bGDok3ViQstuQpb1vdBFhu7dVWDJPnBU6+uHvEu31BNcWlmopZEeLOqazTAt
 pq2zJZHRtWa/+vBJl6WkaSTiUZJjs91o8NcdRB0Fz7G5AiVlkpUvYGXJhizGuKYikIL6
 KUYw==
X-Gm-Message-State: AOJu0YwGWelM+V3DploF/Tb+kWWRZfBUB5ravBtCEzWsTrq3XB4P+QKu
 kmC3fdT4qs3nvpFrpls0URodyqVJSwSLsbKSa+ftF8qDLCI=
X-Google-Smtp-Source: AGHT+IHZK3ySGrG8SBE90KBkl4B+2Fm6MI27JzbnABoeXq3oO1hHiju+kuDZTQJ7dIgcJHZGjQm1GA==
X-Received: by 2002:a17:90a:c918:b0:28c:8c58:e27d with SMTP id
 v24-20020a17090ac91800b0028c8c58e27dmr4153102pjt.51.1704240007134; 
 Tue, 02 Jan 2024 16:00:07 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:25 -0700
Message-ID: <20240102235957.3072102-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240007; x=1704844807;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcA6BEdD2PZBS3qHdO7qseMTqf22KTi4majfLqOsRzE=;
 b=VPa9dCHXUuRqGa5VKcfD9SdnqqIgP5LJQHGKkoRCLd/6iuMcaSdKVCJhYTgdqS+bVc
 BFTXpcekUgsLahBg02xmTcl9u5OoZFQ6/bg4ytJ5EnChMfVn9KImOszrumHI7He/79iq
 1scvnVmhh/ivOBi+12BKZw8JwML6riC/RV96s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VPa9dCHX
Subject: [Buildroot] [PATCH v3 03/11] package/flutter-sdk-bin: bump version
 to 3.16.5
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

On line 66 of flutter_tools/lib/runner.dart, the following lines have been
replaced:

```
if (args.contains('--disable-telemetry') &&
            args.contains('--enable-telemetry'))
```

with the following:

```
if (args.contains('--disable-analytics') &&
    args.contains('--enable-analytics')) {
```

As such, the option in package/flutter-sdk-bin/flutter-sdk-bin.mk on line 27
changes from "--disable-telemetry" to "--disable-analytics."

A subsequent look at the rest of the file including the logic around the
change of the name of the above option provides no other elevant changes
that would apply to this package update.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Updted to 3.16.5

 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index a204de1807..f0a855f2c9 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
+sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..a28cf645f3 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.9
+FLUTTER_SDK_BIN_VERSION = 3.16.5
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -25,7 +25,7 @@ HOST_FLUTTER_SDK_BIN_ENV = \
 HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
 	--clear-features \
 	--no-analytics \
-	--disable-telemetry \
+	--disable-analytics \
 	--enable-custom-devices \
 	--enable-linux-desktop \
 	--no-enable-android \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
