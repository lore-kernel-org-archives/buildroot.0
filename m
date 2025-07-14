Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91936C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4815C60ABB;
	Mon, 14 Jul 2025 13:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMHJHPtuLzyT; Mon, 14 Jul 2025 13:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776FA607E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776FA607E0;
	Mon, 14 Jul 2025 13:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5565E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E938981A33
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pv5Gw-tQhnO for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C77A81B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C77A81B98
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C77A81B98
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:19:47 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 726C92C84ABF;
 Mon, 14 Jul 2025 15:19:45 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 15:19:43 +0200
Message-ID: <20250714131944.51753-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752499185; bh=7By5EpSfb0jQuO6t2rNMLO4V3AmwxQwh5ldlRm53qf0=;
 h=From:To:Cc:Subject:Date;
 b=jTd6bhHH1qh6ArWYTUGhFx25t7/TSvJXni7Wt4ldjYsJ6+Kjs/pVmF/JTl35TIKLa
 h/mlESCv39KwsalPdf4gscphbF2/sW5HYdLXX8WB2nSidcTmGna99nEqtmnm6txEcE
 TiW/8OjHkbYGVfYNr/IskqOKk5e3I8GPgSm/vxkHm1QmE7huJVld3rekzm1I0AmI04
 iZ191Ny/x+MVuJpB2y3n2KGFmrBz7qYooaTijup2tie1g38E6m27ub76XNTxIGV9g3
 DpnvGofl+x+bf3wyaHsPpYNJHGTy6jns/1xLeUPA80gUO0uw9MtXK6kMzG9YVEWa0I
 08HQcMt8hTi5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jTd6bhHH
Subject: [Buildroot] [PATCH] package/python-flit-core: bump to 3.12
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
https://flit.pypa.io/en/stable/history.html#version-3-12

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-flit-core/python-flit-core.hash | 6 +++---
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 80f8d915fe..580a99edf0 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  6d677b1acef1769c4c7156c7508e0dbd  flit_core-3.11.0.tar.gz
-sha256  6ceeee3219e9d2ea282041f3e027c441597b450b33007cb81168e887b6113a8f  flit_core-3.11.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flit-core/json
+md5  c538415c1f27bd69cbbbf3cdd5135d39  flit_core-3.12.0.tar.gz
+sha256  18f63100d6f94385c6ed57a72073443e1a71a4acb4339491615d0f16d6ff01b2  flit_core-3.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index e46453443c..ee958cece5 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.11.0
+PYTHON_FLIT_CORE_VERSION = 3.12.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/bc/18/b9b81cab2b8f63e6e7f72e1ba2766a0454fcd563e7a77b8299cb917ba805
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/69/59/b6fc2188dfc7ea4f936cd12b49d707f66a1cb7a1d2c16172963534db741b
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
