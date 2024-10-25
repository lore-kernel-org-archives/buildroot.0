Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24801D149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD86940701;
	Fri, 25 Oct 2024 16:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5Hi52rwjfJU; Fri, 25 Oct 2024 16:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 739BB4070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 739BB4070F;
	Fri, 25 Oct 2024 16:55:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B020C2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA2CB4070F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bqyJxXVqo2Q for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 16:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DAA640701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DAA640701
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DAA640701
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:55:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83abe7fc77eso85149039f.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729875332; x=1730480132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SErd9jDFonEObfvtdV/2JC3GbObCzl54fCwbecn2slw=;
 b=QwAOhwe2Vy9IjW6TFpu9YvdZuTJ+BfSwWO2QbNFAXI2h3FMsshO++/Dg916ELBC+wr
 hj3CfUIbgJUHMTkgjMsyc7iIahV0DWa3YNZQ2ghZdH+adtE0j9sJ8WaOru99JOiSEz/N
 bUfq2ERomC0QRsEaKLuzbyBYtx2EPgQrnJKT062O/XEVF7UAFOTN76DnAEClqBbQq83Q
 As5oX6ljO3ab/MGiMMykELe7x0DvoEE1YlwGoaHCGupe4eBDTXJ8DCAQZV1Zh8mzSLwC
 mAtb9/nGlwIYOCxw/CCU2K5N3bZ9RIP5rS2Kp3ddwX1yrpscRPj5mWgLB+zJr6BMxY+t
 INIg==
X-Gm-Message-State: AOJu0YzWYJ36oqs7amTwqLTSHFekQ67VwlezIBxeYXmmAU4AQPGSCzCl
 wRQCyoUtGanckN9dz1wAWV51+XzxAlD7LSOQbDntj3FtN0BAB8CMqbmJ/w==
X-Google-Smtp-Source: AGHT+IElvPKwKzpBj7PbWNm307pWQlz3G+QRjr2xA1goEX9CwXA7IbH+NWerI0HPXsAe9J4a/4s6Pg==
X-Received: by 2002:a05:6602:1603:b0:83a:f443:875 with SMTP id
 ca18e2360f4ac-83b1c5cd7bdmr284339f.15.1729875332010; 
 Fri, 25 Oct 2024 09:55:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137dc5bdsm30411339f.12.2024.10.25.09.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:55:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 10:55:29 -0600
Message-Id: <20241025165529.3523312-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729875332; x=1730480132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SErd9jDFonEObfvtdV/2JC3GbObCzl54fCwbecn2slw=;
 b=Fez8Qq8m9XhOidyJakOmDGPUIcjJEHRZX1wXppz5PbpFQLmqMLMBSeaqFoD2FZOaaw
 cjNU7Y7Cmwe8qkqhiZN5NWqlz4D3yatuUo1MfXzM/UzYWrI41SpOKkdz5UZfW91aumFf
 VNVk0m+FLD4kB0ScEWHg8DFmLPPh4SdFS1Is3iq55Ox6jUjdsV8wdd9RMAY/K6QNtMLm
 UCFtFxI2lMZEWBMERLgqL0rpTbyH+QaOoHTTqHS48NJ55dlMEhU5MrmQEgV7ePG2G4dH
 MY15P0OT9A4fJFEi65pKEJ2M9sxTZZTliEL7DScPHK+jptrEYsv2h8dkrg7U90A8sVtC
 RO9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fez8Qq8m
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.6.2.post1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index b378c32203..cfd65ee92f 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  24b255a1f6c85757cea820e9355387df  anyio-4.6.0.tar.gz
-sha256  137b4559cbb034c477165047febb6ff83f390fc3b20bf181c1fc0a728cb8beeb  anyio-4.6.0.tar.gz
+md5  3aae01d9007bd08538158c7a7fa18c39  anyio-4.6.2.post1.tar.gz
+sha256  4c8bc31ccdb51c7f7bd251f51c609e038d63e34219b44aa86e47576389880b4c  anyio-4.6.2.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index b63c83166e..74c49c2e73 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.6.0
+PYTHON_ANYIO_VERSION = 4.6.2.post1
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/78/49/f3f17ec11c4a91fe79275c426658e509b07547f874b14c1a526d86a83fc8
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/9f/09/45b9b7a6d4e45c6bcb5bf61d19e3ab87df68e0601fa8c5293de3542546cc
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
