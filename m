Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58833C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B7A709ED;
	Fri, 28 Feb 2025 17:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y_RlvJO-cCU; Fri, 28 Feb 2025 17:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1920E70D21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1920E70D21;
	Fri, 28 Feb 2025 17:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B8368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 877A041954
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCzizHgBEfp6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5329D41A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5329D41A00
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B30F875B1; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 12:05:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: acb81d4a690ab30d6d9cedc811b20d89ff128376
X-Git-Newrev: 41b08a779b46082f20a1bd54b1a6af47a52a421c
X-Patchwork-Hint: ignore
Message-Id: <20250228163041.4B30F875B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
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

commit: https://git.buildroot.net/buildroot/commit/?id=41b08a779b46082f20a1bd54b1a6af47a52a421c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Prior to b7d251293a20, txaio would test both asyncio and twisted.

Add back the twisted sample and include the twisted package in the
config so both modes of the package are tested.

Fixes: b7d251293a20 ("package/python-txaio: drop python 2 support")
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
