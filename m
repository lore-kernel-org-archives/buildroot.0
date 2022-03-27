Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A1FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C701C81CAF;
	Sun, 27 Mar 2022 15:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueW5L8Tu8iS5; Sun, 27 Mar 2022 15:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E255F81B7B;
	Sun, 27 Mar 2022 15:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4B4C1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3F8C81B7B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GKIRyI6wjLo for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:07:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BF9481AAD
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 15:07:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b19so16886626wrh.11
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+LnTGmzW/urqyJkD0JaMocfKNXbjzB3JQKScW59NKM=;
 b=LF3ou9EeStmier/K/DlunhQz3lAv+jv5QCtSjaGgt8eSpz/Mru5cdDvvk9t8K9DJMb
 2SFTL2LPI0VFr3enMkRsHC9nS4RKjJxg7H+t/YKU8b7yotXwMcqCcSy74Crh+gA6s7/J
 IMndL+b853MAGWOXLnTKPSic3i5cxjfB2NI+uQkyT/qclQtQ3tGzH3TeWuxRaXmuLrFq
 vz88/kMyhQ8oyN2L4eUUBKpm45iSceQmvSYiNncE3B5HfztMI0lhRvA7VJ2B+sjss3O/
 qPppXZDrwR+3QxyBR+/JmhI10+Xz05KvwOtQ0El4zAY/kcDbongYSzoPMqb1iqBro/an
 6LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+LnTGmzW/urqyJkD0JaMocfKNXbjzB3JQKScW59NKM=;
 b=O/iuzVQ/VmBFeqtyyUVftMvlAH7ofE0vhQmL3FKWFrd4ss3Q0ETNE/9LxROsOTkt12
 WnpPLhKOB+2ADNCCemB5PIkBH26sMRWeOgigkjfwhdmkch2T5v8Jl7radYI43V2sGCX4
 WP2BFBuT/0SJ8QGaCfnWHPMxcT7ZjqxXON6mIII9HV7T/jrqG9xTKDZxPXG54iZ6weSw
 Pc3/Y9L/8TPXmAJ0neAuQNrSE/+i0C/Btd7exSXd7p3djneHoIxGXMHtBfBQ56z3FktS
 +j80GXz1IOVajkBLnq+AZd94KaYjhc6OmBdSZFxhwf5/yTxN7384dHzKNHBi+m9mTrO4
 EoXQ==
X-Gm-Message-State: AOAM531rqe9kvioQFusU5CZE8QTCmyk4sa/nU549/aJOLrED1FpT3Zwl
 bFpMEXPdeOtxhc3YsBeK3U64z7JCgpI=
X-Google-Smtp-Source: ABdhPJxDK6jG0aD+zg0L4mqtD/4UB+CJiDH0kCJzi4FiwUPfqXmCEq5t7ZUfM8o7Skru1A/aO5XCnA==
X-Received: by 2002:adf:e346:0:b0:205:97d0:50db with SMTP id
 n6-20020adfe346000000b0020597d050dbmr15759226wrj.257.1648393674118; 
 Sun, 27 Mar 2022 08:07:54 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b00205c0cb33e0sm993323wrw.35.2022.03.27.08.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 08:07:53 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Mar 2022 16:20:23 +0200
Message-Id: <20220327142023.1477251-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-basexx: bump to version 0.4.1
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
 package/lua-basexx/lua-basexx.hash | 4 ++--
 package/lua-basexx/lua-basexx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
index aee636c32..447ec60ba 100644
--- a/package/lua-basexx/lua-basexx.hash
+++ b/package/lua-basexx/lua-basexx.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
-sha256 a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.0/LICENSE
+sha256  3f6a7134a518676d73a9ba80437487de9a7d482e54859a96c0c5d8b381b0a8c6  basexx-0.4.1-1.src.rock
+sha256  a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.1/LICENSE
diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
index 5aa5ecf21..22b5a3771 100644
--- a/package/lua-basexx/lua-basexx.mk
+++ b/package/lua-basexx/lua-basexx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_BASEXX_VERSION = 0.4.0-1
+LUA_BASEXX_VERSION = 0.4.1-1
 LUA_BASEXX_NAME_UPSTREAM = basexx
 LUA_BASEXX_LICENSE = MIT
 LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
