Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CCC54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 12:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D538176A;
	Sun, 24 Mar 2024 12:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX30Azrw9cuO; Sun, 24 Mar 2024 12:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2536681DF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2536681DF7;
	Sun, 24 Mar 2024 12:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D81D1BF574
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3960381DF7
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu03cEKYNyRW for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 12:33:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D7378176A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D7378176A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D7378176A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 12:33:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34100f4f9a2so1960685f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 05:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711283586; x=1711888386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WvVhsCMT58D9K0kqAxbch4ahrVvcfazk9xgf3de+v48=;
 b=LNAu1aUC3BooZ+IQEwJ6X8HYWxW2CU5j+udG1rk9de+2WPhEG8gpzhSPUfdLY9oNmj
 uW40cR+ORSd/zJryPB9Smbeqe2huIO7OaU7foXbq+gxkuH2uk1DEsV78yC8Zr2CvJVRX
 P1aTPkm22U4bCniRprLWvr3zuSot+P+yj93Z6XkZIu0D2qbRgCcAzK4/YPlRCXIDr/3K
 iidiwP40/8heZr+6fRlPAlgV/DvSrolz0HO/2pXMqpSbJR5GsGLUnPdTYQKjn01PtqIe
 DaMKSWJtL6PyBmUmUwk+L3quwLX4GP5L4eOoh7NLVf5WTsW55jMTYvkLzdZjMjn/VvCH
 +hVg==
X-Gm-Message-State: AOJu0YxbOXkibsKF2PLOVjn393JKVQbFILDXNBC41kUASJQBEcJaVOQf
 YHmq428tLQaOwf890/qswENSfwIc151UhBncYvomPV35nDSiz1fGt6DPvLzd
X-Google-Smtp-Source: AGHT+IFbG4x0EGZVl0LFbFKc1Al0e1WQ5N834nhqPEWXtgRbezExW4puAJZ2E6X1xJTG794MErrZBw==
X-Received: by 2002:a5d:4ed0:0:b0:341:b88b:1625 with SMTP id
 s16-20020a5d4ed0000000b00341b88b1625mr3043417wrv.47.1711283585902; 
 Sun, 24 Mar 2024 05:33:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cf3-20020a5d5c83000000b00341b9e11b11sm5642408wrb.24.2024.03.24.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 05:33:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 13:33:00 +0100
Message-ID: <20240324123300.527914-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711283586; x=1711888386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WvVhsCMT58D9K0kqAxbch4ahrVvcfazk9xgf3de+v48=;
 b=Um0dMqlKeempeWeabXXLiybSt8/k4sdjzpdEEUwtZrchGVj10n+qbAZh7wOgHRLOKs
 R+nySCxydoyid9wDzXQmZXr3IhzKJ70zb4lkrFS09BQaDOCmzU0duyKzwgYAohS58r66
 N1Pj4AwzDzurOWXI9G1CzBT54s1qANJEo0emVL2xqtVjUjY3Kq53D+iEopmsRDH99cZu
 XyFaiJugFajDt8tK9grm74ZCelGQpnFzhYPy8E4SK3+xfpPen2C+O4y5SRQZGmlAV/HS
 KVGhYdOQKCDL//Jp71fyKnDeCK3qs8zXNn2k5tlt1r/SLiiToC1tZJYa6Q7WjWVWTk0C
 /vWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Um0dMqlK
Subject: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.33.0
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

Update hash of README, changes not related to license:
https://github.com/notroj/neon/commit/7d39a09945830c664205dd307723c2ff51ae13e3
https://github.com/notroj/neon/commit/9c3a4cb82db956357f120556efb7d8e706b5d46c

https://github.com/notroj/neon/blob/0.33.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/neon.hash | 4 ++--
 package/neon/neon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 9bd6195e39..d773b0f316 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508  neon-0.32.4.tar.gz
+sha256  659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8  neon-0.33.0.tar.gz
 # Hash for license files
-sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
+sha256  6c4f5d59a60a66cc970642c0f3799cf03b40a81c9dccbc4a254f20487d143f74  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 93870b9966..e7872df3c9 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.32.4
+NEON_VERSION = 0.33.0
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
