Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C6CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 10:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D92EF81402;
	Wed, 15 Oct 2025 10:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_mWFjfOGndB; Wed, 15 Oct 2025 10:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49F78135B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49F78135B;
	Wed, 15 Oct 2025 10:10:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A98C4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C6DA81358
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV1O-120dtIu for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 10:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2816A81336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2816A81336
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2816A81336
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:10:03 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B84DC2C80CE5;
 Wed, 15 Oct 2025 12:10:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 12:10:00 +0200
Message-ID: <20251015101001.2719390-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760523000; bh=w13Vcu7kI6L0e88IOnHpCpooExufm6abPHkgrv9kB/A=;
 h=From:To:Cc:Subject:Date;
 b=uXtY9BXtL7RZwPC4kpK3PW7Y9Zt6xQahPhDg9lrs8KXp7Qkv8pcPXJiycEc6M5M7j
 c5eneg7+YaXNUDB3THFXViWHI9E5lL/gK8Tevy0QgIOw/YxyPATcD90/cMTAjJG+RL
 oebWnqe3s5s51Q3VAmXlG/WIxEab+WQhzxrI1aB3K9r3RCfKOxlK71ts4jP1du6WnJ
 T5DogCPa8PXKtMfUN7WKjj5BnrB/dfajIo+MlArqIuEy4ut2aj+xVSErmR+bGsSDqc
 QYxBEp7/z5PWivyIJbr7Pd0Lvcf0VZInNDrleQRUPX8B2tqcWhFqzI6YkfsPuX7fhS
 RPVcHZT4NwMlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=uXtY9BXt
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.119.0
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

Release Notes: https://fastapi.tiangolo.com/release-notes/#01190

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 1810e81e75..c4bbaccc33 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  6de51bff13da558df5f6249d7a33b888  fastapi-0.116.1.tar.gz
-sha256  ed52cbf946abfd70c5a0dccb24673f0670deeb517a88b3544d03c2a6bf283143  fastapi-0.116.1.tar.gz
+md5  8fcc33a9c143b2e7462064825e190ed7  fastapi-0.119.0.tar.gz
+sha256  451082403a2c1f0b99c6bd57c09110ed5463856804c8078d38e5a1f1035dbbb7  fastapi-0.119.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 745147dde8..a0d6412339 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.116.1
+PYTHON_FASTAPI_VERSION = 0.119.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/78/d7/6c8b3bfe33eeffa208183ec037fee0cce9f7f024089ab1c5d12ef04bd27c
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0a/f9/5c5bcce82a7997cc0eb8c47b7800f862f6b56adc40486ed246e5010d443b
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
