Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126BECCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19AE40547;
	Thu, 16 Oct 2025 17:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53MxlQjUBHfp; Thu, 16 Oct 2025 17:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED9140536
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED9140536;
	Thu, 16 Oct 2025 17:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BEBBD8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F297640532
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV83zePO48BM for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E67BA4052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67BA4052C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E67BA4052C
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:39:58 +0000 (UTC)
Received: from framework-OT (unknown [93.240.174.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B8D852C801BD;
 Thu, 16 Oct 2025 19:39:56 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 19:39:53 +0200
Message-ID: <20251016173957.246866-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760636396; bh=8Ix2ZFjphDLdehxcd9Fz6fkLXAvHBoxl2IiLvTFfhrs=;
 h=From:To:Cc:Subject:Date;
 b=lMhCdUh8AznMySAGwjJbZj8WnMlrpmH5zORd/uKy/CYbiBukdtHC+xwgASArYjrNb
 jmlId3GMfy4k0NcIH905WHl0U8lQ3lZKmALLpI/O3SBsi0vlXfn/aCOCk88f4SgNhO
 m/WuFXiGzhMn+Tn7f3sy1QRwAtXL8+a+yC8SFb6fCuqKks+eOKkijjDu14vy9Mo0wT
 NEjZl6C9Eo2YgYuiVIB4QDiAM9zsDpDiReXtW9m1bfcYxXVXcBEoVr/DyzcbiWXsg3
 5C2KN/ux0lWK5J0GM5SIpaco4Q4NwL9cgm5Jgo4XxpQkbn7XDg7xSATlkNUxTMB6L3
 Y7kJmPt6uOD0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=lMhCdUh8
Subject: [Buildroot] [PATCH 1/3] package/python-typing-inspection: bump to
 0.4.2
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

Changelog: https://github.com/pydantic/typing-inspection/blob/main/HISTORY.md#v042-2025-10-01

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-typing-inspection/python-typing-inspection.hash    | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 4337913725..71ee5943a8 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  d451e03d8eac368f7af674f95db586f0  typing_inspection-0.4.1.tar.gz
-sha256  6ae134cc0203c33377d43188d4064e9b357dba58cff3185f22924610e70a9d28  typing_inspection-0.4.1.tar.gz
+md5  9271faadd8476a3600e9cf9d428d812c  typing_inspection-0.4.2.tar.gz
+sha256  ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464  typing_inspection-0.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index e7f1839525..c0af54056d 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.1
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.2
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/f8/b1/0c11f5058406b3af7609f121aaa6b609744687f1d158b3c3a5bf4cc94238
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
