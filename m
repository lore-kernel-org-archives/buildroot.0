Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20161C3ABCD
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 12:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10B96069C;
	Mon, 12 May 2025 12:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvUfh1zlOXPT; Mon, 12 May 2025 12:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127AF60711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127AF60711;
	Mon, 12 May 2025 12:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFA6154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 836C340750
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0e2lhd9khpK for <buildroot@buildroot.org>;
 Mon, 12 May 2025 12:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4864340744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4864340744
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4864340744
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:50:04 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AB5DB2C84435;
 Mon, 12 May 2025 14:50:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 14:49:59 +0200
Message-ID: <20250512125000.1099442-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747054201; bh=7jB3E3cdLHZUNrrLAPV0wy9JB93IxnmTkInm9Qle9lg=;
 h=From:To:Cc:Subject:Date;
 b=aSsy8md0qS3EXmoxIemSkqSkZaM7YqPNQiysGhj7xGbIST6Z7rkpmqCw56s6ZkRkl
 ZWM3dX9M096eoBQ3bPV/3gtbi8UCqBKfjuswCxCOVDLHmKu/878G7QxDaYYEMGh2dE
 44ZpczrBVdKBs0vSp/PGoolt/56VhX5VZUmqrFkgLEvkHQ6UrtbR0asFVcF6GNS8tM
 bOcdS0uNhqTripF8M/ahj95zyB4qBoLt7t29OonkfRvTS84g/DKCd5SiZnWXP6I9rH
 ZhIZD3G82zT9jLfLOZwubNrgQEtLAxCAfEGQUNmlW7VxrCxSroVMlpk3Ym35ukxKXo
 e+0nv3Vd2M7eQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aSsy8md0
Subject: [Buildroot] [PATCH] package/python-jc: bump to 1.25.5
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
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index d8ee918ac7..6e80024639 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  77e798f2c3fbe89c0dbf7b31dc35fc69  jc-1.25.4.tar.gz
-sha256  a32eaf029c56b582dadae48895f20784d0f84f2fa28a8e2b32f377a8bffa8b39  jc-1.25.4.tar.gz
+md5  40bc4d9fa71e3809c236954a1bd2354f  jc-1.25.5.tar.gz
+sha256  f8ac0e4bc427b0ee8a3bdb07a254cc9df6b6036cd440f6c425e2e519cdbda78a  jc-1.25.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 9a3754a0fa..16bdc05895 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.4
+PYTHON_JC_VERSION = 1.25.5
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/5b/82/146ef4c94297ef87c6a732c92dd57761bea2c2179e1b8ca8a6b9b8dd6ff7
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/1b/da/f6ec6a79f8dea70671f41d7162cfefdfe97e9c5b6c2227c1737183c05cd6
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
