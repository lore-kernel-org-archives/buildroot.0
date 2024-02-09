Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430AC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 17:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E31B41D94;
	Fri,  9 Feb 2024 17:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4T9uS_WNado; Fri,  9 Feb 2024 17:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E898F40386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E898F40386;
	Fri,  9 Feb 2024 17:56:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CDD51BF995
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 17:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB2D607EB
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 17:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id we2DZJs4S6Pp for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 17:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D718607C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D718607C7
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D718607C7
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 17:56:38 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bf2c826a5aso49928239f.0
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 09:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707501397; x=1708106197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYescd7Y3U775GWTCn1+iOSW588Fle0k4h010PJ1UTQ=;
 b=P5kN4rPdwrRe9eUqN2MGNnmxDyeI7iCwxOhSCOhkT3iYYgqAymd/5KCXth691FOJsd
 57PHIMq4Ik8kS9PJrj+uRKzyE0pU+H4pQgRol/890oq+V8NjiYQVb8hWk4ecoLdI6gjk
 9t+m7TQJV2SaOfnIVHGbD5986IcnPsIFWg+jYEPwzJSGvx9nrr0IheYopQTQYbBoza+e
 pCw4/zsnzFI6Nedi75paR7MQXQ1xcYBuIwoQnprSKu2ve6FWJ1C2gaPsUK5Q7O0kfWph
 IIxs73nYLmq7dFQrHJP29bqZZkCm70w19cehPn1U5FRNJu57KcyI9fn9iE1t2eN+RtdQ
 KIEQ==
X-Gm-Message-State: AOJu0YxHvvCrpxlVXauKdFvaFvQvhJ90nM7oLvEWlReiN/dPryB6zuwd
 QiA64BKcQi+KfyqdnLI1EBFtDM6jRhjXCjWqOG5ec9qGp0/ECmDzewitERfqqAE=
X-Google-Smtp-Source: AGHT+IFFcr5LI6L1C8q8jzA5NGkCZgr94m0sIXC42g7v06eKtEfgfO2h6bllcunva82ae1s9b3guaw==
X-Received: by 2002:a05:6e02:96e:b0:363:d6be:c87e with SMTP id
 q14-20020a056e02096e00b00363d6bec87emr2435318ilt.27.1707501397116; 
 Fri, 09 Feb 2024 09:56:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUgl0aXN+at5L1q+mOEyNKglHvVwDw3aBjMtadGu48AuYobDkcehdTbNyEi4gr/1gN1mAxzB5CQNTJk64PJUzi0714Blreo8MrHpuTlW6XnsPVQfoYUP+qmuRDEDnw1JTQ9g8yDvTrkYashDczDFIhVzouL+B9P5BDz/iEye46zmnwr/PDnDYZAD9cJPPz+Qw=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 a18-20020a027352000000b0046e33e82782sm492326jae.135.2024.02.09.09.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 09:56:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 10:56:31 -0700
Message-Id: <20240209175631.1337370-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240209175631.1337370-1-james.hilliard1@gmail.com>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707501397; x=1708106197; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYescd7Y3U775GWTCn1+iOSW588Fle0k4h010PJ1UTQ=;
 b=aRHn6t3KF21Trl2ENBL5J+Ay5Bw5v56uYXm02CfZjddcz6q4mZeqX64OnW4t0cENhE
 cGR5A5/baZzg9ByRJyNEmb0jdL7OUaAXw5McOMUpbhjSblvOT4c8q7arMHLP0TmYv3bz
 c8OP1Q637Ys7r3Fre6WM8vFL5s19EEWFfZy8l6y6isUWggJdPdVKU5cRlCGj3HV8SUbu
 v9VIvubvMVnYi9YFqtL1PiicmllusQ/5kZ/2/a71s/OqaSLOmDxMBmD/ro0UMf5Veo8I
 A7KfOHzerKyqc1fWgJI3mCgaC8JdQsZC8Ny7crWVNQqdsAPatxZzUk020M0jwpsMY0Sa
 q7Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aRHn6t3K
Subject: [Buildroot] [PATCH 2/2] package/python-cython: bump to version 3.0.8
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to changing links from http to https:
https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 6 +++---
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08ad8f6d84..55e4a6f203 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
-sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
+md5  9f7baaa983e1bd06eaeb4fa0adfc77e5  Cython-3.0.8.tar.gz
+sha256  8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6  Cython-3.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
+sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 47e105c065..d76bfb766d 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.36
+PYTHON_CYTHON_VERSION = 3.0.8
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/68/09/ffb61f29b8e3d207c444032b21328327d753e274ea081bc74e009827cc81
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
