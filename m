Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D64CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258E160ADD;
	Sun, 24 Sep 2023 12:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258E160ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0sfhXg5uARW; Sun, 24 Sep 2023 12:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7330060A9B;
	Sun, 24 Sep 2023 12:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7330060A9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFB51BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05DBA81447
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05DBA81447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4h2wJo4dhd7F for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:20:18 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF77D81440
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF77D81440
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32320381a07so578063f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695558015; x=1696162815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YyqYTuApTq+7Mkn2OMRtJukrg7K4pFhdWXBbhg4GgQY=;
 b=tMHxONCwhSfU2ZnHHCRyXmor4MUHvqQiGoLPQ55zv34o/UZn8dwhrhArYk48tY5U2G
 DKBEjlXkhCfrWklXGykjZCLLqtenF5CESQVSKP57VJtETYgErdBXHCS8g/3u9BPzztLP
 mrW8gwrcS1Wd541yswSTp7Ry1YVACLNGT/Y+bd/aBmiMXdsnfI3mI7Fn11rT+/xNL7gJ
 s4YkRtNYDMNvBqjQhrCGx4G23bUsyWZMCoRZ3NwvI8rN1xVbUiPLK4BVc9BIS+b/Y8X5
 HWkyRRT8oSxkxrftKpshQJP/KzGDU8ANOxGbpiFtp2iCWmiUwnppP/Y9gJCdCG6szLLk
 u+Eg==
X-Gm-Message-State: AOJu0YyZsNF07mfZhwmSlUzwM2DHTtIXGvMOsewhzFfSmmBZhXD1AQDX
 dRawoi15PfqqInR2zd43uwAts0OqBZU=
X-Google-Smtp-Source: AGHT+IFHSXy6TdEcdJk4NrkZ+xMviciZ3LlUE8h3TnsSe2bUqpqeORVdItvk3/L8V9KvU5nLErweFQ==
X-Received: by 2002:a5d:4903:0:b0:322:5251:d798 with SMTP id
 x3-20020a5d4903000000b003225251d798mr3612576wrq.70.1695558015098; 
 Sun, 24 Sep 2023 05:20:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfeac5000000b0031984b370f2sm9174053wrn.47.2023.09.24.05.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:20:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:20:12 +0200
Message-Id: <20230924122012.136060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695558015; x=1696162815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YyqYTuApTq+7Mkn2OMRtJukrg7K4pFhdWXBbhg4GgQY=;
 b=UcEjjnQJmvGmPAvHMc40des/c1JkW8tjFodDp8HKedkYYxyQBtyZCzKWceYQ1987sZ
 tZUpYQkKf/Eb+dbCIO5I8sWhnRyUZ1JibrRGaS3K30RoZInP0HrHsiahXj4dUWySOuSO
 rKD5iDKu/BDTdKdzPyCoaBumBKxGOQIgUIKIZxBWS25vIXoy0lOX5UiAxY/yr1Lpw3YP
 MAIYHBhvePxXADy5tXpufxTtDfuZ7/ezdxrQLL9KzQffk/Gsr1ckCYBRbjja81rvvJJu
 yMOphePa+bKIca7TvuAW5+D/KYpHpT7/lF3cBnBDLXits2sY7kuJt2QGvKRP1qN4DP6n
 FUxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UcEjjnQJ
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 2.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4326822e41..e0face9ddb 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a  pcsc-lite-1.9.9.tar.bz2
+sha256  d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356  pcsc-lite-2.0.0.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 0b92380ccb..2b2114835e 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.9
+PCSC_LITE_VERSION = 2.0.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
