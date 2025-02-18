Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F682C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2FB83B79;
	Tue, 18 Feb 2025 12:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8ZXSoNQl2QU; Tue, 18 Feb 2025 12:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B5F883B6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5F883B6C;
	Tue, 18 Feb 2025 12:09:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BDD8C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FB04412A6
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvIgt7Mmwd2E for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F564129C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F564129C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1272F877E3; Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 10:50:20 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: f54926d256f0d249888cefcf763c8989bdf18cec
X-Git-Newrev: ab5f8362bdc3a7cb60a08eb36c0725be0faa7fc7
X-Patchwork-Hint: ignore
Message-Id: <20250218120916.1272F877E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/testing:
 test_python_txaio: include twisted sample
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab5f8362bdc3a7cb60a08eb36c0725be0faa7fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Prior to b7d251293a20, txaio would test both asyncio and twisted.

Add back the twisted sample and include the twisted package in the
config so both modes of the package are tested.

Fixes: b7d251293a20 ("package/python-txaio: drop python 2 support")
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 41b08a779b46082f20a1bd54b1a6af47a52a421c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
