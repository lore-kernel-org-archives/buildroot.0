Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E3FECE571
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B48F60659;
	Sat,  7 Sep 2024 20:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGw5LYGv0ZGQ; Sat,  7 Sep 2024 20:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8DA60676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8DA60676;
	Sat,  7 Sep 2024 20:59:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDEA1BF20B
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C38740125
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWTsv5-W3I8G for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 061AC400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061AC400F2
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 061AC400F2
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:59:40 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82cda617e1aso13881439f.2
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 13:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725742780; x=1726347580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=im1yLCKAbpE3Fpw76V5BAvTxPsdCvAh3iEXz/essBfw=;
 b=scH2miCVPr93N8deHJZwwq1cKuD4lxJ/quNFh0BU3F25Y9O5CulTvIfBr0+7W7SlSh
 bfQGX0RiW0anrzOzBaIpqQEAiu/RNah8pdoWW21hC1nm9O2Rluy5v+4nvUMHTQvEq2jL
 lbH2IDDW+4Q3Wxbg0k9Af8DvYG3xuIdPYTEtjPreIPhulwbY+197axG7dV/X6QE807rR
 SR4311Lch+7GfWGxv29Tc0XoDVpku1P45CMaUe5kzLhaGayL8+KqUIsZKRVg3P8yzW+K
 O6zd/SkA10Xkh6zxWR3FstcK8Y10kZoEEHJYKhecLVFmA6cRzSggOtU5wXiRDqntTTN5
 knPg==
X-Gm-Message-State: AOJu0Ywg9BP76G1SrC6myhIozKbZEdv9vBpTTSVeW33E2VIZBBId1frS
 utovqnn6Pe40mkBJ4AssAe0qKx7mNrbESXDS7oNlAfZ9AGtqkeGxzLB3SQ==
X-Google-Smtp-Source: AGHT+IH7/dl1IWWhlpL4pUg1U7nTUJGZ+gFO+G3OEKc3IdMpXPV+ByMIi1y5qobBo9A9i8XsR+KazA==
X-Received: by 2002:a05:6602:3ca:b0:82a:75e4:8e78 with SMTP id
 ca18e2360f4ac-82a9a25746cmr668798039f.6.1725742779649; 
 Sat, 07 Sep 2024 13:59:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d0945ae5e5sm353221173.76.2024.09.07.13.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 13:59:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 14:59:35 -0600
Message-Id: <20240907205935.242051-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725742780; x=1726347580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=im1yLCKAbpE3Fpw76V5BAvTxPsdCvAh3iEXz/essBfw=;
 b=Dcfy0zFAr0DmFeYw2YSGEdJZBKdh8sTzHcA1GfcVzaE4QOOzpkdML/UjRV2RhlYm+t
 HZA2ngjURh2/1AvPN3iVpZbsI97xQmWSOIJe6izEUx/puHucwpMhvhEwh6QzHOOFelb+
 Oh/qQJF6skRvd+UMvSK5YU5PHmFVCGl3iyKCG48wB95xf9gD9nyONOjDgVD3HsC/OGA0
 n+YdeyUw3Th96HPmgv8xdKnM4ZGxshSi+HWo3aeDt4p/2fI/rJLxgOfFZDBhFif4uw0X
 qS5tmbASFQ9GEELJMHLmAG1TwqaXtZd6P0J7CmYYfS3j/oKnhIrCVFfs2LrxM1xjicu8
 gMaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Dcfy0zFA
Subject: [Buildroot] [PATCH v2 1/1] package/python-cryptography: bump to
 version 43.0.1
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

Migrate from setuptools-rust to maturin pep517 backend.

License hash changed due to dropping PSF license:
https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53

We now need to enable chacha support when building with libopenssl.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - restore cargo2 archive suffix format
---
 package/python-cryptography/Config.in                | 1 +
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 213aa24fa8..d12f040656 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 5fbf69a208..bde94ab7ce 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,6 @@
 # Locally calculated after vendoring
-sha256  b55c6c011ba4bb803de0b557f40f1765bab9f63240e93516daaf75c3c68e6618  python-cryptography-39.0.2-cargo2.tar.gz
+sha256  c57ae743b2adfb29a3fc005b6f39bf1378e20d10529a859b6e2e425845bff8f3  python-cryptography-43.0.1-cargo2.tar.gz
 # Locally computed sha256 checksums
-sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
+sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1cbccd0d5c..1f3b4564d3 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
+PYTHON_CRYPTOGRAPHY_VERSION = 43.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/de/ba/0664727028b37e249e73879348cc46d45c5c1a2a2e81e8166462953c5755
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
