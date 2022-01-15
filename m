Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E228C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8895B4056C;
	Sat, 15 Jan 2022 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLgbRMzw5aNb; Sat, 15 Jan 2022 09:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925664010E;
	Sat, 15 Jan 2022 09:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 056D11BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E39B382B1E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqA-mgCmiGDc for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:14:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BAE882A87
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 09:14:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so10119371wme.4
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 01:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U527L32qNZI11xGFzFcrJ2QokiRIN1WrnBCmGiGHUNA=;
 b=V5yBQZDKDfvJfh17Di6HGusJtTsUQNFL9zrReXx+oamcJYRpyLsRhajv17IHdi5oBq
 YVxvpPaP1zCAasxV+JfzKM3eFvQBGxB/1kKZZ56+GwUazxGlzfoSaC+mE1oyNQfdd6Do
 O118JevZOFsjar6ysgwXEJSJcpiDlqBCYKSB/ssgKAuHfkh95g5D+SlR6ELgZN8zHpbg
 dMFZtZyV6p/Dnrdkt8nJvClkeTMAJcX8CQ4OlmsaM/NdTImGXrMLvDR0JrOCIOsikYwK
 dBYFnlOHmNtXRJLGr04MUs9leVWOAK+a4fhJcGkAWbU8tBsNyn7nYJ4UeEX+WkuEXCVl
 JTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U527L32qNZI11xGFzFcrJ2QokiRIN1WrnBCmGiGHUNA=;
 b=RMyYRUnBtOXxrsUGZjF6UV3xv93njbsJIIUmYksIWKWc9vfPHY3l0y2vJRSTAWFvSZ
 peLQUaWZxlKYTZNJV/ww7ALhWpbD6ZtrhhPy/3MNO/ZmXTrZ1oStp/4SZ/ogpLNPG8xL
 4+CbUUvLvmRj4aTpkq/r9m9MPaUlDqDVkptiQD81FzLse/a+9a4ZwNrWUXZQjwhK9QqI
 wwVZb/YOO9OFVMnmfbSz4IllxJaRA+Yz6+q5U1xi/X2YCSOqzGCRuwepksFtX/UmnBBT
 Z3Sj3QV7rBiBXB3weretg3yfh/wmFoYw4//RxEDK9rVGXccOyRo0msmHKBTlc4H3gltq
 pHyw==
X-Gm-Message-State: AOAM530+RResd9xmd3iBmPCNRo8JfMBWD3CLks0Gug67qdO59Vqvx7iw
 ILJ9N/JS2PSJhSvU4j+k8+Brd39vsuk=
X-Google-Smtp-Source: ABdhPJz0/3mWbR8KcT2DgBzJCpSG0NwcjgXmRn0OcE+sBVBMDGkj6CUV4xcA4sRa9MM5Q9p541bFKg==
X-Received: by 2002:a7b:c199:: with SMTP id y25mr10610487wmi.83.1642238069651; 
 Sat, 15 Jan 2022 01:14:29 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t6sm4877841wmq.16.2022.01.15.01.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 01:14:29 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 15 Jan 2022 10:14:18 +0100
Message-Id: <20220115091418.60621-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 1497ee9df..d92eefb39 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b1b19f92451a661ba1167ee0b259299616cb3a1cdaf5ab05d7ccffaffeb4a0fb  luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a.tar.gz
+sha256  7ea92e2414b6405c7fb3974ab092707c400a5496e8d4936174b5bd3aa6e94477  luajit-a91d0d9d3bba1a936669cfac3244509a0f2ac0e3.tar.gz
 
 # Locally calculated
 sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d2af69d1e..7c1b556ff 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
+LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
