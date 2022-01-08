Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5951CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 08:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E891D60B36;
	Sat,  8 Jan 2022 08:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siVJP8iPSmbN; Sat,  8 Jan 2022 08:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F7F60B14;
	Sat,  8 Jan 2022 08:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 074301BF3F7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 08:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88C040348
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 08:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMTIIdYFogVB for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 08:20:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2D0402B9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 08:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0E6B382946; Sat,  8 Jan 2022 08:14:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 09:15:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829777c1c9a0d40c8c5753e6fe86acfc78edfc92
X-Git-Newrev: 0233b84204766f3e6eefbc773e121a71b827eaf7
X-Patchwork-Hint: ignore
Message-Id: <20220108081426.0E6B382946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: tyest_python_pybind.py:
 fix flake8 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=0233b84204766f3e6eefbc773e121a71b827eaf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/testing/tests/package/test_python_pybind.py:1:1: F401 'os' imported but unused
support/testing/tests/package/test_python_pybind.py:3:1: F401 'subprocess' imported but unused
support/testing/tests/package/test_python_pybind.py:6:1: E302 expected 2 blank lines, found 1
1     E302 expected 2 blank lines, found 1
2     F401 'os' imported but unused

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_pybind.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_python_pybind.py b/support/testing/tests/package/test_python_pybind.py
index 5e3c3b9cc5..c0af7331a2 100644
--- a/support/testing/tests/package/test_python_pybind.py
+++ b/support/testing/tests/package/test_python_pybind.py
@@ -1,8 +1,7 @@
-import os
 import infra
-import subprocess
 from tests.package.test_python import TestPythonPackageBase
 
+
 class TestPythonPybind (TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
