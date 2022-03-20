Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D228C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8FF81498;
	Sun, 20 Mar 2022 18:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3IIcwMmAHtZ; Sun, 20 Mar 2022 18:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B578144D;
	Sun, 20 Mar 2022 18:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4F21BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BFD2401AE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3bDLlmfmZVz for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93A45405A3
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BBFE68461D; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:42:14 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cf0c9830c0eef17116081d04ccc10a1aa0850553
X-Git-Newrev: ae50728e7665662c17a4bb2a9ad3c98bc463e227
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.BBFE68461D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/testing:
 test_rust.py: fix flake8 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae50728e7665662c17a4bb2a9ad3c98bc463e227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix flake8 errors introduced in commit f0d1f21195

Fixes:
support/testing/tests/package/test_rust.py:2:1: F401 'tempfile' imported but unused
support/testing/tests/package/test_rust.py:3:1: F401 'subprocess' imported but unused
support/testing/tests/package/test_rust.py:4:1: F401 'shutil' imported but unused
support/testing/tests/package/test_rust.py:18:1: E302 expected 2 blank lines, found 1

(cherry picked from commit 12588a667a6e4d3c852a82a9d89c58bcf43eea1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_rust.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index a1abd20c09..fb9dd2d916 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -1,7 +1,4 @@
 import os
-import tempfile
-import subprocess
-import shutil
 
 import infra.basetest
 
@@ -15,6 +12,7 @@ class TestRustBase(infra.basetest.BRTest):
                            options=["-initrd", img])
         self.emulator.login()
 
+
 class TestRustBin(TestRustBase):
     config = \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
