Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C90C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 09:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74EF140585;
	Mon, 26 Aug 2024 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8VHHof03ae4; Mon, 26 Aug 2024 09:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55C254056F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C254056F;
	Mon, 26 Aug 2024 09:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3002D1BF388
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E14460732
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-rYAV40rSJ7 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 09:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98D7360590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D7360590
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98D7360590
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 09:47:59 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4FCEF2C80012;
 Mon, 26 Aug 2024 11:47:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 11:47:55 +0200
Message-Id: <20240826094756.38632-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724665677; bh=a37HV2uc4nIURuD9yerR1I1z5FUWUD+iKKc10+5FbJc=;
 h=From:To:Cc:Subject:Date;
 b=f4HGtTgl0OJsLuOAzx8S1Dw9lNmH6kw/Voq65Lrudz84acJFVBupyoqpHrTEDPLX1
 Ks1f3CIinSxEapLpRJeKfA1wUPWdxekxcvbp9Gm2TDFI0kRhX/aujcXZCCcRV9127l
 g/GwjHEMFLZoVtO9iA5x+WayAye1VtTdAEApN2xiowqvP15+Dn1xcoEvdxoDhXNGyw
 Z1oi/mCcyuGx5U9RhaCoAaq5kS6h4ifbv53D3z1JVUhnFU5HTVG5eU52haHlYI/xbV
 mEVDppnQdC/ZD9xpQe232rR+A2MAdhpxxZ0/AcjkOWI5elW+zwOEqLdbq6dzQXXKFf
 9oalbaDx09Ltg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=f4HGtTgl
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.112.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://fastapi.tiangolo.com/release-notes/#01122

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 203af3e915..810f31023c 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  f42ce6731bca9412b36b0537672cf568  fastapi-0.112.1.tar.gz
-sha256  b2537146f8c23389a7faa8b03d0bd38d4986e6983874557d95eed2acc46448ef  fastapi-0.112.1.tar.gz
+md5  c9d319aa5b12df82e51b77573e419e01  fastapi-0.112.2.tar.gz
+sha256  3d4729c038414d5193840706907a41839d839523da6ed0c2811f1168cac1798c  fastapi-0.112.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 5fd91c691b..210abcfa3d 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.112.1
+PYTHON_FASTAPI_VERSION = 0.112.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/09/71a961740a1121d7cc90c99036cc3fbb507bf0c69860d08d4388f842196b
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/9c/11/4874d165e7ef97aa803a567a4be8f9c8b0bd7cced6d536d44033ef7d4bfa
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
