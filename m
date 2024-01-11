Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B7C47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 01:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A029F43791;
	Thu, 11 Jan 2024 01:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A029F43791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYleHr8IOQRt; Thu, 11 Jan 2024 01:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C3D2437A6;
	Thu, 11 Jan 2024 01:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3D2437A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BCB91BF38D
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 01:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF8F141DFF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 01:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF8F141DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3ytOEMmdX0R for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 01:49:44 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF97241DF7
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 01:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF97241DF7
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3606dc50447so25665985ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704937783; x=1705542583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NevF7/BCV6u6B5wmaFqCCq15K2V0CEiSOLgfSMes+Uw=;
 b=GqDEB3l/62nLA8Gri9/4dRkHMidx8VkJkjdb2S92HU+mFHGatAmqUK6d5lNllTaRVc
 y3aX9F1NWcnYGmRb93yrZM8dWNpjl4CKzJvYvI64cO0W6u+m7jbfp89so6ow9kOPWZkc
 nH2w6bvl1tLvWFoYXJfFNBweXUyuQNRnqBQuAbFBuwfjYnn4RIWX7yo2Fszn1Ol1XJ55
 DtHwJQbdLpMeJ+7dyGE5lTSnqi7yEDsY9zBhVIZNnKfL7GB4gpHDBqXupFcTRkel43KF
 QS4zqoDLwcpQon18RzSu0Hw7PcqMskKo6xbC1bkjsGsoNLtnQeoTCuJZRKEHDgUTpAKD
 uEBQ==
X-Gm-Message-State: AOJu0YzBk+MFEtHQfcXmvZyZHxjGdKFvbBgDqizg28JCWHZuh6QGXyTW
 4Qn+8xugHuP8LbMMaVWr4JqP5l1Aq5xSdA==
X-Google-Smtp-Source: AGHT+IF8xOX4aF8IefIhwhxkKkeZWl5PoIuUuWlGH43ywozycI7+iQfShwDGAfsl8sxBz/KR3nwwmg==
X-Received: by 2002:a05:6e02:1a62:b0:35f:ac40:4ec8 with SMTP id
 w2-20020a056e021a6200b0035fac404ec8mr606706ilv.13.1704937783225; 
 Wed, 10 Jan 2024 17:49:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bp15-20020a056638440f00b0046b83875cd5sm21573jab.168.2024.01.10.17.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 17:49:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:49:40 -0700
Message-Id: <20240111014940.2567842-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704937783; x=1705542583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NevF7/BCV6u6B5wmaFqCCq15K2V0CEiSOLgfSMes+Uw=;
 b=Mf5xNk8zYQBkEiz9fRr1LADSmGuyU7igy94frLjv4mnPxE7UeGmBDIPyjMiSaWV9Zw
 A4DcS0vCjA2TTF0Q/ZyDz8RFFaVU4gYbD3rwLa8EnA0hmgcX1Wl8Z3zp9W2ZTbU5Z0+W
 lVyKoBM5LN/qW0NGwd4TtyBKaqSVgKWTDGG+51gwXMcLf/ALM29cGPN7jgp0aBFgQXdN
 ID2LuMVHQHjEHm/9dY5Yqo8Yg41JqO9rq68rr5eIA2GCV48+rZgayJwNqNq9urpI6tmL
 Cv8qzQeQWK8QOY20gBI0rAZBqS7ZI5T/SFb1lNno1hIMIt4YoWqt6BOf3QXwYYxY7lub
 j3rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mf5xNk8z
Subject: [Buildroot] [PATCH 1/1] package/python-pymysql: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index dd81bdab7e..641d5dba97 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  3fe6ff2eefb58af5c54d335c6e0216de  PyMySQL-1.0.2.tar.gz
-sha256  816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36  PyMySQL-1.0.2.tar.gz
+md5  81d559c87414017075de030d8ce93257  PyMySQL-1.1.0.tar.gz
+sha256  4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96  PyMySQL-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 3703572f35..c600fe515c 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.0.2
+PYTHON_PYMYSQL_VERSION = 1.1.0
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/41/9d/ee68dee1c8821c839bb31e6e5f40e61035a5278f7c1307dde758f0c90452
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
