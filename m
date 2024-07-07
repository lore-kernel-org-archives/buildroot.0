Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B970C3DA44
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 21:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A60F403A7;
	Sun,  7 Jul 2024 21:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjsGC5v2onYr; Sun,  7 Jul 2024 21:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5FD404EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5FD404EB;
	Sun,  7 Jul 2024 21:12:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 314841BF3EA
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A406606A5
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eLCRzasuC-I for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 21:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04AA460665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AA460665
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04AA460665
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 21:12:43 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-37636c38d6aso14961095ab.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 14:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720386762; x=1720991562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXYOP0vZCUof4ThWilAyFdiauGFKJrg35fJYk2YRxwA=;
 b=eGUHZ57YQYrOLwM+IrYfd6cB+jQ+uwcRIgL3s0DHN8XlC3X38v9HBgzXpsLp6JYSab
 S+Dlh/yqyATX/ywm6y8WMEiDG1QxKcC4+vdntw9nk8qImSd805pH9XWNpIG39f0RNNHR
 AcJ8L9ey9IW7bYxiH/cHaOncAQWuaYmZOWziYfW7qzHok8MRu/tOkNvqILf28oyRpPGN
 LEju/nC9UAcyaRr5EYCyQ/9rvVM3RmdBpmdwejVUFyzZ0T7jKI/5LVGUHUPjVnL0bZSw
 A6JvZEliDIDbLmFj7GKOTUW1X5PHgukFhiV7NeKzCKW6dGtm0qtGLhekxwRT54OuUv6t
 OmHg==
X-Gm-Message-State: AOJu0YyYkVbbM6Ej8LOmx/x9VDaSY4OCVxFg/p0eMcXNCA1grMoioJnb
 JvmkRSsxhDT7o7PXTKMLBccYP5/SoePRRss9mLsb5+xctjmVJsdC7VchZbbk
X-Google-Smtp-Source: AGHT+IHh5lcjsXp1nkve6RNNWEc6mdsNeNBH2Nk4dqRSfnmr8+sbEeSidx4MO2a/t3/QuqkMNOAPEA==
X-Received: by 2002:a05:6e02:184d:b0:375:a7ee:dff9 with SMTP id
 e9e14a558f8ab-383990c94b8mr155100165ab.17.1720386762477; 
 Sun, 07 Jul 2024 14:12:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-385c716b052sm12589755ab.22.2024.07.07.14.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 14:12:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 15:12:40 -0600
Message-Id: <20240707211240.2280126-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720386762; x=1720991562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kXYOP0vZCUof4ThWilAyFdiauGFKJrg35fJYk2YRxwA=;
 b=M47tZ5s2heFEJsUPAiQ2IBWTRqBASEen0A49XHvvCYxsQgSPFqk/gFdQmy5QqOSxtX
 5UJ12fKOdKYQsCEAuNQI7WQUU0HWsG+sNe2aMdD71j67r+irMA34EsCJZvEnw5EsG4Kf
 lPkR8Ip81xafK10V4iyCNiRoPXVzMSAZ4pgAdBowBFE7qjQmLwBlHv85DQuUEdufz595
 Fl83rsiyh/x1BBTRyJN9g2WgOsfqIFA4sAaxmzeYqrlC2DC2y2/9sgPU4VHmXdUTxXS6
 25UZm6NDB0SY+kpy9uj7wdTbsAtF3C4nuHW2xb/PQhRFvfKoELVlNDYRMX3xT14WlpLp
 tdpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M47tZ5s2
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.32.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index c4aeabb25d..2764a0f2d2 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  941e175c276cd7d39d098092c56679a4  requests-2.31.0.tar.gz
-sha256  942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1  requests-2.31.0.tar.gz
+md5  fa3ee5ac3f1b3f4368bd74ab530d3f0f  requests-2.32.3.tar.gz
+sha256  55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760  requests-2.32.3.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 2c74db3711..fc8f51fd1f 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.31.0
+PYTHON_REQUESTS_VERSION = 2.32.3
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
