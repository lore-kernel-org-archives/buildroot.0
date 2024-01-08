Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CCAC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7E660E3E;
	Mon,  8 Jan 2024 07:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7E660E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0yQtAVmeKwn; Mon,  8 Jan 2024 07:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5756660D88;
	Mon,  8 Jan 2024 07:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5756660D88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D68B51BF59C
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADF09400F1
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF09400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb-G1pWS_fW2 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:19:37 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 899F3400A4
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 899F3400A4
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b54so91632839f.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704698376; x=1705303176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zs8SVOMMk2DYj3f8WWvI4/YX/8t6hJeElDvJyXs2kyI=;
 b=r/4E3/7beNPLNWjfFdNDeaBGHrPgXr3w1WywPs8Djo58Ut5kCNRt549q2FFQi01NY0
 e7lMkn1aOYvezTHpO/BTWJFVARxcO4aeI0JmCU84gyFaFovNOKzSNwY6mJ2LADCVV01Q
 aik9RgHPHWld62TYoDgLcGeDlM2mdZvqpmIrRrrouwpwc/thkz3xtsw41nUHueBcpe78
 RgXInwuChWXfoiWo3i/d3Db7Qb3oKOjwr8eYywPomrMje6AOh+x7iv+hDztnznPyzGbh
 D1J9yNqZuC2k9D2ID6K0Krbi63PQkJ7Tnh5x0rY+tGfRgc6+Mu0txkGNPM+kEUdJ816V
 b3BA==
X-Gm-Message-State: AOJu0Ywx1NWx0ckh5579vAwDGuPhWHG6Ve589bA0wbJtduZYvDK4o6in
 zn5jLOLKEnVkODCG+ZSMj8aBzmowtOgHGg==
X-Google-Smtp-Source: AGHT+IFHFLIBoA9yJOnKtoosqahNaZcRBzClOVW/FhXtW+hmCiZ0tE+dFqFqEnnPdx24Rqjbtl4QLA==
X-Received: by 2002:a05:6e02:190b:b0:35f:eae4:3afc with SMTP id
 w11-20020a056e02190b00b0035feae43afcmr6992189ilu.33.1704698375687; 
 Sun, 07 Jan 2024 23:19:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a4-20020a0566380b0400b0046dfb833ea5sm2118758jab.17.2024.01.07.23.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:19:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:19:31 -0700
Message-Id: <20240108071931.3483703-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704698376; x=1705303176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zs8SVOMMk2DYj3f8WWvI4/YX/8t6hJeElDvJyXs2kyI=;
 b=U9fHfMWwxgyIADGLHMi3E0QDi2G1kv8ouvcgiGu/bXV4bRumm7hrLggkrSsjZN+RFb
 HPV5PwkfqDShmS66o65MyaYrwNkUOv6X02BiU5+vCFUn72P/WxWxir6LblnMwYmAR60r
 1w1/byR6KVQXFJtWDlYCqEezQ9M755NwgHYXO0q9Sg69ju1x5iU13mI1oziFhHY/5I9y
 65lJD49yH7aSDleEs0vba5tcp9nRkReoyhgpo+Jp/mmyqgPgyIbvDiv8wIATZCDx7bVn
 avRzPD5t0LdUYhpbtm0XiuP4WMV6umPYockPfR4/OYEv+dOmGBKEMfwkZh4a96OztShT
 A6Pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U9fHfMWw
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version 4.1.2
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

Migrate from generic setuptools infrastructure to setuptools-rust
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bcrypt/python-bcrypt.hash |  2 +-
 package/python-bcrypt/python-bcrypt.mk   | 19 ++++---------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index e148078699..29cd99344f 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70  bcrypt-4.0.1.tar.gz
+sha256  ac0dd9edb4ccc915382f50afe9c28b63b0fc18237917744083d15fa30d7cd1a8  bcrypt-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index cbd6855d9c..f4ef5aa984 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,23 +4,12 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.0.1
+PYTHON_BCRYPT_VERSION = 4.1.2
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
-PYTHON_BCRYPT_SETUP_TYPE = setuptools
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/72/07/6a6f2047a9dc9d012b7b977e4041d37d078b76b44b7ee4daf331c1e6fb35
+PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-PYTHON_BCRYPT_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-rustc
-PYTHON_BCRYPT_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_BCRYPT_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
+PYTHON_BCRYPT_CARGO_MANIFEST_PATH = src/_bcrypt/Cargo.toml
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
