Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AC8C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A6D418F8;
	Thu, 26 Jun 2025 17:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SorCAAnTHYEO; Thu, 26 Jun 2025 17:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370C1418E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 370C1418E7;
	Thu, 26 Jun 2025 17:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D86BE11A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C14FB413D8
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 17:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hx5FQAMg11_F for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 17:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 753F440240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753F440240
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 753F440240
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 17:46:28 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 313082C846A0;
 Thu, 26 Jun 2025 19:46:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 19:46:24 +0200
Message-ID: <20250626174625.170714-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1750959986; bh=UuBPw2MCl8WkM93XwwTPhktyxhhFWotyY2qoSrCaeUY=;
 h=From:To:Cc:Subject:Date;
 b=t0VE6KSX5YiK2gsXLNSIhCM+iaZx7iaQop2G/vzb2HnKOzXvrMYpOdKC8Job2HLGc
 T58A9dQ/q+0aJLwGeUWiD/Iyz/W5IKhL8gsKmcAaiPamln9WdfAdsuhn4sq9Cf/AtV
 57iLh3XjWF3uapom7i8noo660mq9rUfXOlGxSW+7l5JYiaEhTIRCrvruDlTz9sxE62
 yKsSD123bF9cqYpML88YQK+MsE7vrpJ1dBRABh5Pj/mhNjpe07HJNbrElDdyKoVwnz
 VU3DBSoGWanJqjKsYFr+PkSVLIJKom7MYfuUfD8k+gL+iQCq0Vkn4WhmEMED+Akk3g
 nhJEyPaZs8b1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=t0VE6KSX
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.115.14
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

Release notes:
https://github.com/fastapi/fastapi/releases/tag/0.115.14

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index ae5b5f84f1..3d0cead179 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5d2c702b69f11b6ba4cc9add2419b348  fastapi-0.115.13.tar.gz
-sha256  55d1d25c2e1e0a0a50aceb1c8705cd932def273c102bff0b1c1da88b3c6eb307  fastapi-0.115.13.tar.gz
+md5  bdb2a56a2a464ff29736d4b1c55d547c  fastapi-0.115.14.tar.gz
+sha256  b1de15cdc1c499a4da47914db35d0e4ef8f1ce62b624e94e0e5824421df99739  fastapi-0.115.14.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 8a605531f7..ab39fa29ab 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.13
+PYTHON_FASTAPI_VERSION = 0.115.14
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/20/64/ec0788201b5554e2a87c49af26b77a4d132f807a0fa9675257ac92c6aa0e
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ca/53/8c38a874844a8b0fa10dd8adf3836ac154082cf88d3f22b544e9ceea0a15
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
