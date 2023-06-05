Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B8C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 06:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CFE41867;
	Mon,  5 Jun 2023 06:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CFE41867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gbhpbmsl3E0P; Mon,  5 Jun 2023 06:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B588341809;
	Mon,  5 Jun 2023 06:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B588341809
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5391BF59C
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 06:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533BD60E2D
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 06:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 533BD60E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xc6XFCStCeF2 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 06:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFEE260784
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFEE260784
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 06:25:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f61d79b0f2so1760497e87.3
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 23:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685946323; x=1688538323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7HREmHhz/Wie4QKCryPz6jcJ5YK8MLuZ0SXiWW/Glk=;
 b=Q6YBgcffDXaZTNdctrWYc7r2+8P0aijuRyLbpR3fOkkTXzLCjMiJIHNZzizSOLFlzL
 lDcOe/ZhjJLRo58vzWC5qLcttqNI2lx0hfXIlK0NoWbr7oq9naoetCWD3SOgLayXk5oK
 XrefRW3Y6qgMwrJuNux84dHmtYtVIJpamqd7eY8gWfLONyN7vASBZJ77TzpqWgo5Vf1b
 yYhBOv9gHiJh8sr2Tn68u8ONXGIvncCHTgiyxFSPsOr4HM31zrgVjpyi37Y7zxN9Cd7m
 FA6qUXqb1eOucR+tizqPVTAmkpbv6LUJzxQZHEaF5pFfVaKhB1MErN5s4Wl1z+P2We5l
 uzAw==
X-Gm-Message-State: AC+VfDxpik+JUWMrkkFJ6wQdHxvTHIcR1VrFn1OscjeNm5ZG7zaB01sK
 FjTcE9QEMQ/uLskZ6gZeNEiVju7ei+Y=
X-Google-Smtp-Source: ACHHUZ7oguDAJ3nbOjvlxu7W3t0cXADDLmQqyL0SJZnpDMXBj4rfHC44AzVYLgHRiHSKWyjU2HKb9w==
X-Received: by 2002:ac2:43b0:0:b0:4f4:c973:c97f with SMTP id
 t16-20020ac243b0000000b004f4c973c97fmr4958460lfl.49.1685946322498; 
 Sun, 04 Jun 2023 23:25:22 -0700 (PDT)
Received: from localhost.localdomain (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 k7-20020ac24567000000b004e887fd71acsm996841lfm.236.2023.06.04.23.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 23:25:21 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 08:24:51 +0200
Message-Id: <20230605062451.405573-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685946323; x=1688538323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o7HREmHhz/Wie4QKCryPz6jcJ5YK8MLuZ0SXiWW/Glk=;
 b=rJHdpohoU5TtHSrQQWAo5lFywmklqSoKCl92yCX7LaGC5aVtj1644GI0NJGhXVepyb
 WPmhxiOSON6c8UuEgcwVzPTtHlNL65l4kX8IuLWDEocdMdbfS1gTstEuMzw4J+YZ6D5l
 bdyLPbLLMoaiYOTEtvpMPV+KfaCefVkulpvTw+eDTSJVRvjiIrf/+1UxtfAG4ydJQjYm
 sZ95y0soWoP4GYv7Z7vdmPKBuk8LJxureRSRqdL5pMFuzWPRjQ8KTaTKxBZyB+ImzBFv
 iCpNDpNruwQ+W+8a5EI7jegS4esOTfi6vOXoL+v7FQ/LHW/ZVVD51f6hhKxKV9hl9sR4
 bT+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rJHdpoho
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.11
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

From the release notes
(see https://github.com/redis/redis/blob/7.0/00-RELEASENOTES):

================================================================================
Redis 7.0.11 Released Mon Apr 17 16:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-28856) Authenticated users can use the HINCRBYFLOAT command to create
  an invalid hash field that will crash Redis on access

...

================================================================================
Redis 7.0.10 Released Mon Mar 20 16:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service

...

================================================================================
Redis 7.0.9 Released Tue Feb 28 12:00:00 IST 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2023-25155) Specially crafted SRANDMEMBER, ZRANDMEMBER, and HRANDFIELD
  commands can trigger an integer overflow, resulting in a runtime assertion
  and termination of the Redis server process.
* (CVE-2022-36021) String matching commands (like SCAN or KEYS) with a specially
  crafted pattern to trigger a denial-of-service attack on Redis, causing it to
  hang and consume 100% CPU time.

...

================================================================================
Redis 7.0.8 Released Mon Jan 16 12:00:00 IDT 2023
================================================================================

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
* (CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
  commands can drive Redis to OOM panic
* (CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and ZRANDMEMBER
  commands can lead to denial-of-service

...

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index eb8c21be98..69bfc1475f 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586  redis-7.0.7.tar.gz
+sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b08be11538..e5d3de8eb9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.7
+REDIS_VERSION = 7.0.11
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
