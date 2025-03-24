Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24342C36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 10:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F6240EC5;
	Mon, 24 Mar 2025 10:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2EM8RVHggLQ; Mon, 24 Mar 2025 10:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB304411BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB304411BE;
	Mon, 24 Mar 2025 10:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E51215E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D674D40E22
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 10:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgdSCJ37TOCr for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 10:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7800F40DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7800F40DE3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7800F40DE3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 10:42:06 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DDD382C89081;
 Mon, 24 Mar 2025 11:42:03 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 11:42:00 +0100
Message-ID: <20250324104202.182473-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1742812924; bh=RmpDwZzs6rl2cDm1+pfQTCHkUA03eLfomUC36Pp1ORo=;
 h=From:To:Cc:Subject:Date;
 b=fn5IiyaFxfZNqbMIsJCZexHVTJ1MPeoRmWkNwizo6Uys26tJx90rzFMMQPoNZ1s1u
 g6fHc8H3sk4C+Lf3SKi6DaloZK7GPGUVpaoFpMgkENc0pIgzx4pFLPKLkAKt6Kn5Gm
 iS40PaTwBxWJzOefkazA5j3hOiRTypwio6RvgE0j9Br8fUxUgPwh0Ge28m1gcrTjYS
 TvVbw8LUXI4HuMzJL+EkP6ZRB901RTM7uB2+bSqX94lS3qIQQFbwHJ1e5EJ2J08cHT
 sBbqnPuL+Ua1oNsHyl0XEvg7aOH/ZWx4rZHpqoVVH73qvgvyZgaF4kr+b7DhwUPBAL
 NmYdAQ2JbPTNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=fn5IiyaF
Subject: [Buildroot] [PATCH 1/1] package/python-tzlocal: bump to 5.3.1
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-tzlocal/python-tzlocal.hash | 4 ++--
 package/python-tzlocal/python-tzlocal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
index dce19103a5..838e6ded21 100644
--- a/package/python-tzlocal/python-tzlocal.hash
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tzlocal/json
-md5  9d8d4c12b047d5d45e6eb72bb95fd90e  tzlocal-5.3.tar.gz
-sha256  2fafbfc07e9d8b49ade18f898d6bcd37ae88ce3ad6486842a2e4f03af68323d2  tzlocal-5.3.tar.gz
+md5  f8eb4bf0eb262ba422741d032d6cfedf  tzlocal-5.3.1.tar.gz
+sha256  cceffc7edecefea1f595541dbd6e990cb1ea3d19bf01b2809f362a03dd7921fd  tzlocal-5.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index c616974f64..2c1e5ff87a 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TZLOCAL_VERSION = 5.3
+PYTHON_TZLOCAL_VERSION = 5.3.1
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/33/cc/11360404b20a6340b9b4ed39a3338c4af47bc63f87f6cea94dbcbde07029
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/8b/2e/c14812d3d4d9cd1773c6be938f89e5735a1f11a9f184ac3639b93cef35d5
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
