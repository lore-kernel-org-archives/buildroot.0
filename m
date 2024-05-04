Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B20C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1C5415A2;
	Sat,  4 May 2024 21:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYNED9lmi99k; Sat,  4 May 2024 21:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89804155E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89804155E;
	Sat,  4 May 2024 21:40:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 370CA1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D4434085D
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUeglCLfbfH2 for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 002AD404DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002AD404DC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 002AD404DC
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so5124455e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858825; x=1715463625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0EzGZbuBJ9SgOMY7/nSEL6YQyaHEcQWTWPUlafSgyzQ=;
 b=kMhXpLEKNcST3gnE1fwgRULuHOvoRj4h5EHGJAMwQHSjsHIJCd9wHVbcZ27or696Oz
 Z4EBEfNKpYO0OzV7izBvBr86p20wodD5Ja73zVJvQqHb9+1WuTDGPEPerOSAen+9jNoY
 P8tHbDH+e5H/MAiSquTP6avj2EwtMuP9y1d6vfzwvDtd2zac+d8JHSCPnkfC3kkWRm1L
 C+GMYtFLvGSG7Hm3fgQSc5YrCUSliC49bz7tKkL4ZMX+IXbHJDMvAWs1IImV2Yu52gCb
 c3hcAK309o+1g9rIL3HRUrT6axRhWHvlJ/1MdI8dsxE5qTR7RRGYZcFBXnKHGPRrPBme
 R/6A==
X-Gm-Message-State: AOJu0YwwLQz7+mrBm7tmvDxYr5e7MaCOSVWL7stpWdwCQmY15v+GJD7H
 asqDRUzOo+tzFvlEEw0xY13EuGBhxDsGisv58Q4/ZvrUEexvoHf0IAoDDg==
X-Google-Smtp-Source: AGHT+IHHvcUrZa7nUyxhiGylpzJa4h+IakFS3JoHVxhetjgVTkL0z57Jf0rIXOidVlTDLJMGJ/BjRg==
X-Received: by 2002:a05:600c:1e8e:b0:419:a1b:d11f with SMTP id
 be14-20020a05600c1e8e00b004190a1bd11fmr5014446wmb.17.1714858824630; 
 Sat, 04 May 2024 14:40:24 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:02 +0200
Message-ID: <3d37c41bb206f6fb6458e73cc73d27e41053d118.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858825; x=1715463625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EzGZbuBJ9SgOMY7/nSEL6YQyaHEcQWTWPUlafSgyzQ=;
 b=VEHMnvHR5EtwGp7g2cNfqpxBx1P8jXzBdM+tmP/JN1WlZS5DiUa/wfFgiIOS+8IScH
 NBfKEnGUw+tNipKijJAirFaKe2PJqxxqb34PrOLwJxJVF9hmLdqRxvtqSenSfy7wpAWR
 UGOFNQHftNEgdeIMv0+oLQZfPvXeHnUBXiaEt59YrbEkUnnOQBaSuMi2ActIZAkuVfV0
 A+yxG9Aj5nVPHbu+gjh/8liRAQnEsohqat0GwyV3xuFdhRFt0ib5+1DC6eCvrwvFb7C/
 a3Qule+lPszdO2+skqWbj1IuUxaRaAcIpgk3OrX/BKQk825xiRBTXNUYzLSm0LlrFNnf
 7BMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VEHMnvHR
Subject: [Buildroot] [PATCH 01/22 v3] package/docker-compose: bump version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current version of docker-compose is un-vendorable, because the
dependencies it referenmces (directly or indirectly) are not available:

go: github.com/docker/compose/v2/cmd/compose imports
        github.com/moby/buildkit/util/progress/progressui:
        github.com/crazy-max/buildkit@v0.7.1-0.20240130133234-d9aa289bd124:
        invalid version: unknown revision d9aa289bd124

And indeed, that commit does not exist in that repository. The v0.7.1
tag does exist, but there is not commit that matches the short hash
d9aa289bd124, or even the whole version string. Sigh...

There is no way anyone can vendor the version we currently package, and
all they and us can hope for is that we never lose s.b.o ever.

Bump the version. That one can be vendored. Well, at least it can
_still_ be vendored _now_...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index ca3d08cf63..d55e35eb16 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  931bfcc34eb43106be07787372bb853d4cd82830a5785f3049c5192ab0e4ac35  docker-compose-2.24.7.tar.gz
+sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 5417ba2d4f..66a88ac7e7 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.24.7
+DOCKER_COMPOSE_VERSION = 2.26.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
