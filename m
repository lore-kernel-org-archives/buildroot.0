Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0850DD149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A8360B14;
	Fri, 25 Oct 2024 17:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qARmGEXgmmc5; Fri, 25 Oct 2024 17:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1B6605E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1B6605E6;
	Fri, 25 Oct 2024 17:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFA42316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA3B80503
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhupJ5AWztIu for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A33780546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A33780546
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A33780546
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:39:45 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83ab9445254so96554939f.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729877984; x=1730482784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eVg+8wLTSj2YDb4MZb3VmXy8LTj7KhZX0awi9/5wKcE=;
 b=n32mo60AfkuBOsQkUIlE0JrMELXy8evUvLON1Lw5WorG6VVcso/D7TNAIJXyE9+cSu
 DPyWlmKrqYJshAzpil/dkTlPRWgj1xRAs/ltE39BbFIRc8+ttMAoxizrRjYD7CQFPjrX
 967bwEu2rehNx2duNxtjY/4/Hp/WTQZkv9JacBFg7aGLt0fJyOC7NuZF565vGEi9Lmq2
 w3rD58q7G1duLY9ftl+wi/woSyEnak20mDyTg2EKjGSB9mzIbDt4kdiU/VXJDUSBRIrK
 wWpxi3d2dD7I4kcVH3aPveAEZtRWNVYbharNt1T99bVWLruYcErHjNf3pkWuT/uH+TLo
 qtGg==
X-Gm-Message-State: AOJu0YxawX0FuRkeJPJT2mmiBGJiRsV2ffegm7V+xL4cQhu6LqAk5FKn
 Szrv5+exM6YOoRllCWvFCs3Vj48BO5jTUFwrrnkaMdHunMT6eU5VoccbVg==
X-Google-Smtp-Source: AGHT+IF2oIz6HdFsRGS1lpenaCqhXiGPBjWX23QjoSpbGl9ksUEDurckmvhLvaIuzdOh+dv60VQaFg==
X-Received: by 2002:a05:6602:154a:b0:83a:b33a:5e08 with SMTP id
 ca18e2360f4ac-83b1c60b7bbmr14104239f.10.1729877983932; 
 Fri, 25 Oct 2024 10:39:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f628asm32047839f.25.2024.10.25.10.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:39:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:39:40 -0600
Message-Id: <20241025173940.3583098-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729877984; x=1730482784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eVg+8wLTSj2YDb4MZb3VmXy8LTj7KhZX0awi9/5wKcE=;
 b=NamJLTvpYZsbZF3olEv0Hwh4ER9nbv2fVYDcjms0Z87bBAqs5U7CnbssD9PB296qFj
 Nm35UCfs75Nbsz3zLRQK1lj32KRSgx/J16LuFelAP9m/h8GPutOQJz8pCspKUZib7vRG
 SME+VxJBdpkxLitPP6P0kilyDcvszNxvcr+sWYG09h1jm7Qgd8BCNlaT89wdRZDcY0tI
 03uNNZSDJsQevpAJN61D4ZUDGsW8YtVuceSIGf9h3R94lF46C5p2A2YvOx5/XTYMcBD6
 hMzoNiX+bLEA0AcU3MjogUXeKqJ2KHfBq3z+LKqtJ1cnilb7RGege6bbWROZ5HqTvk1y
 oCIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NamJLTvp
Subject: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.45.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License hash changed due to year removal:
https://github.com/marshmallow-code/flask-smorest/commit/d813c73f84f624c32ccf9495c292b9f3e8e719a1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 6 +++---
 package/python-flask-smorest/python-flask-smorest.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 70349bebff..685464c7e4 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  33ffe61fd1e4661503b3ae10fbbe3a78  flask-smorest-0.44.0.tar.gz
-sha256  13f6e39d807c8847a56dc40656c2bbc0a2b2a430d8a4bb4a21836046757f7cef  flask-smorest-0.44.0.tar.gz
+md5  98b3b197fcfb944954d768f6d84416ee  flask_smorest-0.45.0.tar.gz
+sha256  1490291a59e572be5c02e0a769589584180eceba65bc1949456760856b3e990b  flask_smorest-0.45.0.tar.gz
 # Locally computed sha256 checksums
-sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
+sha256  c8a48548bbb732a0bbd6a0dc2c556cfa1e6e5fe35d888cdf6a1974d69e0e312a  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index bd4114880a..323d1ec191 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.44.0
-PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/e7/4f/901bf249e7e19cdfd496247379f58c4ef2f1136c3df0bb542ca0d26a88bd
-PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
+PYTHON_FLASK_SMOREST_VERSION = 0.45.0
+PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/29/cc/ad32be9d2a2148000c4c845d234f12cee10d6ec9cc3724fe7a3ff9e93f99
+PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
