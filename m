Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4506AC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 16:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47C5402F4;
	Mon,  1 Jul 2024 16:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4PFGeg2qKq2; Mon,  1 Jul 2024 16:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88512403B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88512403B6;
	Mon,  1 Jul 2024 16:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 252EC1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F1BE60A8C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqik0FQSb8oC for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 16:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26D8660A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D8660A8A
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26D8660A8A
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 16:37:30 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-36da84df7adso9174905ab.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 09:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719851849; x=1720456649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uf2CamVkYoPegpyNRWOp58REO9rqJTDvZfu1BVUAvJ4=;
 b=QL/FHlAVt6hcSiKViw9CNChbrRhuRyMK4D1s4nE0P0pYFbkFRKxLF9/ZiIPo3jKiaW
 vE1MUq2VqJ0HUGhmR1nM1+qqHyGKZkqmfoKvmhSUIRfZoxz8vicRWhTUgS8wz3AkmYqN
 1CirhgqdSmfjGIDmhqOe4ge1AyPYsiyw6cSg3fYRFJ1OnSP1IJzN5Wmo6MoDm1qDYa4M
 M+C8I2ZH3lu2fvo8qXU0RkcBP0Iz4CF/EQ0D/6c0AXkpCKs0ISaY1JWpTVdwexXO1bWE
 pS6O4uWLEuQRJTtoJNeiPcDMqZj3zWjCGhN1iHXTb4q1t3BTLIBSnBJMBDnwof6D8y8u
 W9cQ==
X-Gm-Message-State: AOJu0YzV0M6ipWXcWG14+Epx0Rx3Ea4BBswMdUsYc1nTXks+ak5npeh3
 cAcHq5cJme/QpuXJU37b8AaM0VXfN8B08rz/cqU4vvJ0A0r2qk7DPV/wSQ==
X-Google-Smtp-Source: AGHT+IEyQcQKc3/WJys82eA8ybPlQk4h9UP2uZ+Q27LsO2Apr0lajvQTRgIKCEPYLE8wJzNC+kJing==
X-Received: by 2002:a05:6e02:18c7:b0:375:eb20:d10 with SMTP id
 e9e14a558f8ab-37cbb2df1d7mr31625565ab.4.1719851848744; 
 Mon, 01 Jul 2024 09:37:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742eabf7sm2233060173.159.2024.07.01.09.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 09:37:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 10:37:26 -0600
Message-Id: <20240701163726.1626123-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719851849; x=1720456649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uf2CamVkYoPegpyNRWOp58REO9rqJTDvZfu1BVUAvJ4=;
 b=m84sumZflxi/hZMYVr40nLTJIsGzxgoOjQOunnekqyhZ3wtPQ6i7Ef42xHRyIKJmiK
 R8j6oPWlKoc66rb1KTZBnXVje+8hQSQ/SrcNzOifhx0rNLOADb7QwAcMupo0UJmUujQt
 ROrUlDAb/LUmv0TufUvDKOFp6HBu10SCVdavue0DotdyJV7s6AJbSill6rmMnaIoQd/l
 AFDI9KIa+D+qAilfHZLM5uqhlM+oyI6ii2Rj1geBeq0PqQ65yeDwhIgHV3VKFo/faAyb
 hzuI0frPnXpwiqMSfVxszEy0UFLpRppKbgCnp2BMgCw9g50siukOwA7g3BT9IL+FfZeA
 U4Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m84sumZf
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.7.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/getsentry/sentry-python/commit/f98f77f0a4078cc4f87e82d3a899b8a54d55a535

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 2534a48221..6060b6cab7 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  94ba9002bbfaf8c443c496b05bbc32eb  sentry-sdk-1.39.2.tar.gz
-sha256  24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c  sentry-sdk-1.39.2.tar.gz
+md5  98621433d1f8565f1f00576d47be30ce  sentry_sdk-2.7.1.tar.gz
+sha256  25006c7e68b75aaa5e6b9c6a420ece22e8d7daec4b7a906ffd3a8607b67c037b  sentry_sdk-2.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
+sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index f1c5648f07..50ca854330 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.39.2
-PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/66/90/9deac5c137e9f0ede908757d886af77938ef28f94b24decedbdf98f1ca4d
+PYTHON_SENTRY_SDK_VERSION = 2.7.1
+PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b8/63/310d89868a0dab17f6d7c1f35eba9c304dd06c2a17d0d26905738763b614
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
