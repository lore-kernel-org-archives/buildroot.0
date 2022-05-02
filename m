Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F3CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 10:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EC8410E6;
	Mon,  2 May 2022 10:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aUq5ryK5gqL; Mon,  2 May 2022 10:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12EB410D6;
	Mon,  2 May 2022 10:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65B151BF3CB
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 10:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6281060ACC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 10:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AYTBWgqFsnZ for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 10:16:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA6360758
 for <buildroot@buildroot.org>; Mon,  2 May 2022 10:16:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso7488501wmq.0
 for <buildroot@buildroot.org>; Mon, 02 May 2022 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3RzbvoTY0RUqEEA0ivlt7aVko4VTj7wU1tvTcT5Q75c=;
 b=paMtx1v16hBX4neOdn94FCHIT+x2bFZKZnzD88Dh/7S51qou76ibJeowNQTyPz64Dz
 iibUqEizlSkwGtFZDf+KUtNYaiYWVqbcLEBI2azq5YKGs41V+zaVXQ0qjPqJrQ/1EqqM
 5Qf+cxukNkvshIMYeEbtYGgXLSr5GhSnno9TBmHM1dVAfEmk+eZ0kk8PYj/ccy1QSsPL
 RT/UElBVHKPWUxNuJmOFadiS3hP6SLzULlvGU4yS79PbJmX1HIy2v7uqIpwMESYyoSp3
 tMIEYZfK9MzyslAKEOh+fgkptverVKh8tiy6CqYe9b9sg0Z6CTtadl9EpMlH5Q4uLaqj
 K7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3RzbvoTY0RUqEEA0ivlt7aVko4VTj7wU1tvTcT5Q75c=;
 b=6eQluSraLsbRoTeFsaQP6VjxOYXl/6vXQQmLSG2dzdcem6v5E845e4qduGRDt2HPmU
 9GeQH1T7MKW4XqDuaq5FQM6r+QZmsyuPSsY+uLxPdn8Wh8jV6Cym4xEfMiB80owBb717
 dV5AdpSYQfxSoh5j/nB04uxrnuSeDYKRTAy6CglGH+PNmN401EOLb2ONpTbIgg8wf6qv
 CtRwqCq9Voa6XXsT0OaJ7okHijeS5dJk1YL6mqTGc9Vtgs5ujbESi5R2DCCKXV6Ftkrc
 3hc/RuXtFgrHhBr/WeKQ63h8IIjkS6poDfUD4stmKYi68et9171p2QOAHclrXBVpf/FE
 QxwA==
X-Gm-Message-State: AOAM533x8uYNUOCOzA+cmdsR4i+uLhlo1DqbJ+9TcqZtbl8quOth4hX2
 n0XGDDzSfQA5a26H4jau/opmbgoFY0k=
X-Google-Smtp-Source: ABdhPJyD4SQpFp7xuabD8L3AwoN2XwSaqHOAUZiM7PuscmVRTuT72VXenPAKlaaW6dcId7zs2P24ZA==
X-Received: by 2002:a05:600c:288:b0:394:31f9:68f with SMTP id
 8-20020a05600c028800b0039431f9068fmr7085971wmk.57.1651486606452; 
 Mon, 02 May 2022 03:16:46 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id
 o14-20020adfca0e000000b0020c5253d912sm6696488wrh.94.2022.05.02.03.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 03:16:46 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 12:16:44 +0200
Message-Id: <20220502101644.1595384-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2022.02.x 1/1] package/redis: security bump
 to v6.2.7
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes:
(https://github.com/redis/redis/blob/6.2.7/00-RELEASENOTES)

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-24736) An attacker attempting to load a specially crafted Lua script
  can cause NULL pointer dereference which will result with a crash of the
  redis-server process. This issue affects all versions of Redis.
  [reported by Aviv Yahav].
* (CVE-2022-24735) By exploiting weaknesses in the Lua script execution
  environment, an attacker with access to Redis can inject Lua code that will
  execute with the (potentially higher) privileges of another Redis user.
  [reported by Aviv Yahav].

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 74a9392a63..6871a59041 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
+sha256  b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319  redis-6.2.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f3c030d68c..fb7f653742 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.6
+REDIS_VERSION = 6.2.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
