Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91057C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 17:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CA582CCB;
	Fri, 14 Feb 2025 17:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUvqPNqAt43Q; Fri, 14 Feb 2025 17:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 666C082F2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 666C082F2D;
	Fri, 14 Feb 2025 17:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 830141E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 711FB6066F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZJ9jhKU8DhF for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 17:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6EBA60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6EBA60655
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6EBA60655
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:45:11 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id F03C2206FB;
 Fri, 14 Feb 2025 11:45:10 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 14 Feb 2025 11:45:09 -0600
Message-Id: <20250214174509.2080655-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1739555111; bh=JKiy0kk3TKrkDY0MB1/SmegX2yfZwEokXx41TA1lWeU=;
 h=From:To:Cc:Subject:Date:From;
 b=BIEtTbsILVzhZpqhRGJst+8b4U9jGAwHV8CCAH86rj7hZBqu5OAvwPsnGvIVM/N93
 mZei0Qe5DEnNBo9Zwn3pZgIC9GIB1CzymiASf4DFu7Hp68nZh3ijG6J3R9/cR7DH5f
 glNQzKMRsEcNB3RZ3Z2Sj7bB5V/X8xpvVzwydrXU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=BIEtTbsI
Subject: [Buildroot] [PATCH] support/testing: test_python_txaio: include
 twisted sample
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Prior to b7d251293a20, txaio would test both asyncio and twisted.

Add back the twisted sample and include the twisted package in the
config so both modes of the package are tested.

Fixes: b7d251293a20 ("package/python-txaio: drop python 2 support")
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/testing/tests/package/test_python_txaio.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index f1bb2c79a6..9acbb60d2f 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -7,5 +7,6 @@ class TestPythonPy3Txaio(TestPythonPackageBase):
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXAIO=y
+        BR2_PACKAGE_PYTHON_TWISTED=y
         """
-    sample_scripts = ["tests/package/sample_python_txaio_asyncio.py"]
+    sample_scripts = ["tests/package/sample_python_txaio_asyncio.py", "tests/package/sample_python_txaio_twisted.py"]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
