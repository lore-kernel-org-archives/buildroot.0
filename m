Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC57FC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 12:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E814404C1;
	Wed, 14 Aug 2024 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cym7_C9ngpJR; Wed, 14 Aug 2024 12:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B65240BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B65240BF4;
	Wed, 14 Aug 2024 12:04:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E739C1BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 12:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1FB540644
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 12:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CinbFsSEp2e for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 12:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B437405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B437405D8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B437405D8
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 12:04:02 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6B2D62C833FB;
 Wed, 14 Aug 2024 14:04:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 14:03:59 +0200
Message-Id: <20240814120359.1380201-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723637040; bh=XEI1wZqdUFfUe3KX8Pe6TTcsKtqWlKsxs6HZgap3Ggo=;
 h=From:To:Cc:Subject:Date;
 b=U7q8GhEO2/qThcrjGxzGBejPNJKVeFIVocXH3FeGfK9wfXGr8e3aWt8MKTAM1aCXl
 LyVeeWLJ4SvvUPK96jva2UnP97VEM0KeLwXrQt2pCkoz0vAnuLj4juBjhAYSkzCxgn
 mLQGK2NKrGeRwiSDbLEVyQbkFx5PJJOFhTsI5H889aWI8oyAXZY+WSx279YVCjDBa+
 P6uHCLdRhsQWf2nnveRL3e+sHAPF3A6i3xsgA5E+r5m2v3SV7+55BkMbFOGXhZzauQ
 ZRb0teSqsclZpGDfvDAOTBclR6wIYoyTGPG5Druh4Ai7VNd4yyIxjzX5/W+Re9OTMF
 uK1ZWVbZ++RPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=U7q8GhEO
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.30.6
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

Changelog: https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0306-2024-08-13

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index e662adda1e..57839debd2 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  c43ec29f83c3706b99c48a7eeb0208ac  uvicorn-0.30.5.tar.gz
-sha256  ac6fdbd4425c5fd17a9fe39daf4d4d075da6fdc80f653e5894cdc2fd98752bee  uvicorn-0.30.5.tar.gz
+md5  d75153180f8c19a1bf8299818d3acdb2  uvicorn-0.30.6.tar.gz
+sha256  4b15decdda1e72be08209e860a1e10e92439ad5b97cf44cc945fcbee66fc5788  uvicorn-0.30.6.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 276aa89804..e9676d3765 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.5
+PYTHON_UVICORN_VERSION = 0.30.6
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/c3/ad/02b1b412e43605aa6aac8d0392c383ff3f6ae8267b7864e48e3b5f3f601e
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5a/01/5e637e7aa9dd031be5376b9fb749ec20b86f5a5b6a49b87fabd374d5fa9f
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
