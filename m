Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC3C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F57813F5;
	Mon, 25 Mar 2024 15:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1Ft47KspTXi; Mon, 25 Mar 2024 15:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0034481418
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0034481418;
	Mon, 25 Mar 2024 15:22:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86331BF330
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B8D40B7B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 15:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiI-47LVwGzt for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 15:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA41E4094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA41E4094B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA41E4094B
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:22:50 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1BBD52C80C87;
 Mon, 25 Mar 2024 16:22:48 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:22:47 +0100
Message-Id: <20240325152247.179206-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711380168; bh=SJw2c8EchY3Xa5F7j1rJyLOxARPwOkNSHS1tKSb48lg=;
 h=From:To:Cc:Subject:Date;
 b=WmSrcezIZCin6/cnS2NQqbO7KQiu2SxGwoVc3w4aiR+WCgIU3ZHG6XtEq8aKaZQdx
 cZuWVyEkZjPSMVpE+8Xd1DQZyvYEwl5D1pBpHdRuOPDKletIEXXSdys3pJ/U3Z9NXZ
 iAMxu5/NX836vZDWlwLKZtQ1E4FfiL+46KfI+nslY/M/koVxlJH2ztx/ERYIKNeqwd
 f5kZ7bYWIT34vopG8fCwHLWlAnFAHMO6eTbvlecxEn0DmiuupsUqO8Jk8+A6xHbTRd
 uThPDEoyZBbMM4sNLZLEWCzPHbe9u7LctpH6HVrCK1DgMp7sEebU78csDFq8DGGwLE
 5lxW/0rePuB+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=WmSrcezI
Subject: [Buildroot] [PATCH] package/python-jc: bump to version 1.25.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index f54e69eaeb..6bcb886a47 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  80e4c7d46ec856255577c6b364e7f931  jc-1.25.1.tar.gz
-sha256  683352e903ece9a86eae0c3232188e40178139e710c740a466ef91ed87c4cc7e  jc-1.25.1.tar.gz
+md5  e042a82acf978e5dc16dd1ac9371e97a  jc-1.25.2.tar.gz
+sha256  97ada193495f79550f06fe0cbfb119ff470bcca57c1cc593a5cdb0008720e0b3  jc-1.25.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index ec8826d1c2..c57c9e8acc 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.1
+PYTHON_JC_VERSION = 1.25.2
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/53/a6/065f0796a0a21bc040bc88c8a33410c12729a2a6f4c269d0349f685796da
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/39/2e/c0d557b2ee673e2e0aef24a01e732aa232f6b1e180f339058f674f391ab8
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
