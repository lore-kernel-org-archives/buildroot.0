Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04915C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:15:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD211611C0
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD211611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9463B6083F;
	Mon,  8 Nov 2021 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-KWORQW9lG2; Mon,  8 Nov 2021 21:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9926084D;
	Mon,  8 Nov 2021 21:15:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 727061BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5D380E04
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfYsb4iffpO5 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 21:15:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F02C80E09
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 21:15:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D38898B70B; Mon,  8 Nov 2021 21:11:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:12:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7140ebbda5a11c2d84d16e03dbb5d6b0a9240c7f
X-Git-Newrev: 38c1c535ad3f2db12d211a60d165836c75bdb52a
X-Patchwork-Hint: ignore
Message-Id: <20211108211135.D38898B70B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/sample_python_unittest_xml_reporting.py: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c1c535ad3f2db12d211a60d165836c75bdb52a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

support/testing/tests/package/sample_python_unittest_xml_reporting.py:4:1: E302 expected 2 blank lines, found 1
support/testing/tests/package/sample_python_unittest_xml_reporting.py:8:1: E305 expected 2 blank lines after class or function definition, found 1
1     E302 expected 2 blank lines, found 1
1     E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/sample_python_unittest_xml_reporting.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/sample_python_unittest_xml_reporting.py b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
index 8fa92aaccc..cfef4df22a 100644
--- a/support/testing/tests/package/sample_python_unittest_xml_reporting.py
+++ b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
@@ -1,9 +1,11 @@
 import unittest
 import xmlrunner
 
+
 class Test1(unittest.TestCase):
     def test_something(self):
         self.assertTrue(True)
 
+
 if __name__ == '__main__':
     unittest.main(testRunner=xmlrunner.XMLTestRunner(output='test-reports'))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
