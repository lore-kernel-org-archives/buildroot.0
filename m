Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02DC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 15:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3664F60B06;
	Fri, 16 Aug 2024 15:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C0hoIamcl7d; Fri, 16 Aug 2024 15:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1795F60ED0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1795F60ED0;
	Fri, 16 Aug 2024 15:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD0391BF5A2
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 15:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB5946069D
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 15:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeAr9Pq1k-4k for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 15:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B187460631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B187460631
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B187460631
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 15:38:29 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C5A552C88E43;
 Fri, 16 Aug 2024 17:38:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 17:38:24 +0200
Message-Id: <20240816153825.43499-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816153825.43499-1-buildroot@bubu1.eu>
References: <20240816153825.43499-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723822707; bh=jiSU2TrLW6I3fOn+vLqWQ3DPNvqUaxEW1EuwJ15VqFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jPeXdWdYUoRd0p7/46uLoYSKt0dKV+SOB3Uy6Zu7jJSqYWsQ3hBsZi7/+O17iv013
 fvzalaBDroPItNi4qEUcmgX7w5j597hetmcskWBVOD8IlZmAbAEzRkT1Jr/PuUG+If
 TUQm324Nh/gDdzkelJjvYolL1oLTCQ1Sn13WrFWvW0mj+qVqRs1tMZR8JIlrNCJ9ni
 n1eNgWfPKtkN/xZ2KZw5nRmXHnQ5ZwK+eXGWEa/gMNfa4lRvp1hw9OMRmYJxDO3vWW
 t85YDpbjo7vRsEp1bl1Z6nW9OPEWvemLcvrmMp6MCMc+P2Xaev6Yno+MRNgwzTR3PJ
 7XSdmnHSV/1iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=jPeXdWdY
Subject: [Buildroot] [PATCH 2/2] package/fastapi: bump to 0.112.1
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

Changelog:
* https://github.com/fastapi/fastapi/releases/tag/0.111.1
* https://github.com/fastapi/fastapi/releases/tag/0.112.0
* https://github.com/fastapi/fastapi/releases/tag/0.112.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 2be006a97d..203af3e915 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  32df7b178fb59e180d34729be33d5024  fastapi-0.111.0.tar.gz
-sha256  b9db9dd147c91cb8b769f7183535773d8741dd46f9dc6676cd82eab510228cd7  fastapi-0.111.0.tar.gz
+md5  f42ce6731bca9412b36b0537672cf568  fastapi-0.112.1.tar.gz
+sha256  b2537146f8c23389a7faa8b03d0bd38d4986e6983874557d95eed2acc46448ef  fastapi-0.112.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 262b166907..5fd91c691b 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.111.0
+PYTHON_FASTAPI_VERSION = 0.112.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0e/1f/f4a99e92c583780787e04b05aa9d8a8db9ec76d091d81545948a006f5b44
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/09/71a961740a1121d7cc90c99036cc3fbb507bf0c69860d08d4388f842196b
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
