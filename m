Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF81CCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 11:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C20840C4;
	Wed, 15 Oct 2025 11:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R9cQbUAOmo7; Wed, 15 Oct 2025 11:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4722840C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4722840C6;
	Wed, 15 Oct 2025 11:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E73D21BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BFF840C6
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuBF5UCwCIiS for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 11:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E5DE840C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5DE840C4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E5DE840C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:02:32 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2C67F2C80CE5;
 Wed, 15 Oct 2025 13:02:30 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 13:02:29 +0200
Message-ID: <20251015110230.2738967-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760526150; bh=9dtkxrs+bgCgXUr8/YyhlrwozLGOody+r0v7sgB8+6Q=;
 h=From:To:Cc:Subject:Date;
 b=mMj/9XWaWz7CHRa9qWIYY/ATlsMP1KFRoOwC1707A+Xtykh3d/VGFOMTrlHEc8awl
 28i8iJ7JdyRYMCB36IJDoOj8amL1jFdvgrst9jzAxhGjNtQzrDP4s16PrrhFDnzTZM
 6DbtmvnAiVy7NnBdQcmdnG07F7+KWsf8R8EPy5sWcgX96hL88i7SFxmeH+aMXYDbL1
 b4MRm6WvtSEGjPAcDES1/BwW3/KAM7U1kmDYwx8+kIBfP8pvCbiGPhJg1fL+iw5VvI
 iMHSDYlM57lOUYaDnitWqBYlfbmvJXdQfwKPy4+TGV6eWHDK/COYGDukMwOVy36e4k
 /N63THj3ay88A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=mMj/9XWa
Subject: [Buildroot] [PATCH] package/python-jc: bump to version 1.25.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.6

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 6e80024639..d2eb47d41c 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  40bc4d9fa71e3809c236954a1bd2354f  jc-1.25.5.tar.gz
-sha256  f8ac0e4bc427b0ee8a3bdb07a254cc9df6b6036cd440f6c425e2e519cdbda78a  jc-1.25.5.tar.gz
+md5  f3fbc012843d192e446462e45ab2ebe1  jc-1.25.6.tar.gz
+sha256  27f58befc7ae0a4c63322926c5f1ec892e3eac4a065eff3b07cfe420a6924a07  jc-1.25.6.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 16bdc05895..0404275277 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.5
+PYTHON_JC_VERSION = 1.25.6
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/1b/da/f6ec6a79f8dea70671f41d7162cfefdfe97e9c5b6c2227c1737183c05cd6
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/7c/fa/f174bfb1ecfd3bdc6259b2de32052f09cccba11c9a1b733aedf618fadd05
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
