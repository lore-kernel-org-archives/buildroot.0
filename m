Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE9C3ABDE
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C588960AED;
	Wed, 14 May 2025 15:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsAkAhI_PAqk; Wed, 14 May 2025 15:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0BB60FFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0BB60FFF;
	Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5385012A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39F90401CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWi5zYgSu_sc for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43388408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43388408A8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43388408A8
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:03 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ED6B02C845CE;
 Wed, 14 May 2025 17:13:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:40 +0200
Message-ID: <20250514151255.2316205-6-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235581; bh=oJtRrjLzkNY26gcs4zl7n/mju5fIPSihQYWS4RF1jxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mR3Br/HYQStKKsuAakThVcvGOSEIOJJ/ewMBZdtHnK+OaywhytPqtFrGPuioQSN6l
 xtIjqJcAMcQ5d2USCWmBU/T8N9a1OSuEKqIRgc0eh9yA70qfHzSZleSDxcIp36+1mP
 DD4gssJpoW+YwVefY0kBrK1QQADvaSFtGrXeU7tsQowscl9jtdj6a4MlXwF3GOw5VC
 xIRlO2SbgK08udAqKrJHNRclJ9XumdVVW/K4tothxnfsQ9ZlBvpFa3ntZO+ltwSv5U
 FQ6j/MquUo2nxdhyGEdWBHaqjcxrbj4nELLLFwLO9mzB9RKJSZeP1uT2AvrQ0i7H/R
 5og3SJwWB+Rdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=mR3Br/HY
Subject: [Buildroot] [PATCH v2 06/12] package/python-pydantic: bump 2.11.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: fix package by actually packaging new typing-inspection
          dependency
---
 package/python-pydantic/Config.in            | 4 ++--
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index e9cd2e6780..eebfb3a1f7 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
 	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
-	  Data validation and settings management using python 3.6
-	  type hinting.
+	  Data validation using Python type hints.
 
 	  https://github.com/pydantic/pydantic
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 72470e1f19..d639fc0da7 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  46b0048f4ad780b0e8a15f602b56c5a1  pydantic-2.10.6.tar.gz
-sha256  ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236  pydantic-2.10.6.tar.gz
+md5  13bdd5856e805abdce75516cdb98935f  pydantic-2.11.4.tar.gz
+sha256  32738d19d63a226a52eed76645a98ee07c1f410ee41d93b4afbfa85ed8111c2d  pydantic-2.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b5808e0201..f82cdd3c16 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.10.6
+PYTHON_PYDANTIC_VERSION = 2.11.4
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/ae/d5220c5c52b158b1de7ca89fc5edb72f304a70a4c540c84c8844bf4008de
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/77/ab/5250d56ad03884ab5efd07f734203943c8a8ab40d551e208af81d0257bf2
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
