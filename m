Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BCC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:13:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97353617E5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97353617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D2080D42;
	Mon,  8 Nov 2021 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9bWFhYfTntN; Mon,  8 Nov 2021 21:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A469B80D19;
	Mon,  8 Nov 2021 21:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9941BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A63B80C6E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z21nEValNnqU for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 21:13:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB1680C3D
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 21:13:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 398F38B709; Mon,  8 Nov 2021 21:10:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:12:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df2928afe536a67619ac19aeca52c3bec5b53f9
X-Git-Newrev: 7140ebbda5a11c2d84d16e03dbb5d6b0a9240c7f
X-Patchwork-Hint: ignore
Message-Id: <20211108211000.398F38B709@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_unittest_xml_reporting.py: fix
 flake8 warnings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7140ebbda5a11c2d84d16e03dbb5d6b0a9240c7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

support/testing/tests/package/test_python_unittest_xml_reporting.py:3:1: F401 'time' imported but unused
1     F401 'time' imported but unused
make: *** [Makefile:1220: check-flake8] Error 123

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_unittest_xml_reporting.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_unittest_xml_reporting.py b/support/testing/tests/package/test_python_unittest_xml_reporting.py
index f08c88e3da..446c231a00 100644
--- a/support/testing/tests/package/test_python_unittest_xml_reporting.py
+++ b/support/testing/tests/package/test_python_unittest_xml_reporting.py
@@ -1,6 +1,5 @@
 from tests.package.test_python import TestPythonPackageBase
 import os
-import time
 
 
 class TestPythonPy3UnitTestXmlReporting(TestPythonPackageBase):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
