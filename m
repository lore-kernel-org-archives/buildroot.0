Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E8FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2E4408C9;
	Tue, 15 Mar 2022 21:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiETa5AvmbYX; Tue, 15 Mar 2022 21:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B823E4092C;
	Tue, 15 Mar 2022 21:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB8A1BF9AA
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3083D60BA4
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnVk6_ekpav5 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132B360C30
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F9208408A; Tue, 15 Mar 2022 21:12:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c2f90f44d6d563d4a641d3f634aab8637e53bfb
X-Git-Newrev: 12588a667a6e4d3c852a82a9d89c58bcf43eea1e
X-Patchwork-Hint: ignore
Message-Id: <20220315211223.1F9208408A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_rust.py: fix flake8
 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=12588a667a6e4d3c852a82a9d89c58bcf43eea1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix flake8 errors introduced in commit f0d1f21195

Fixes:
support/testing/tests/package/test_rust.py:2:1: F401 'tempfile' imported but unused
support/testing/tests/package/test_rust.py:3:1: F401 'subprocess' imported but unused
support/testing/tests/package/test_rust.py:4:1: F401 'shutil' imported but unused
support/testing/tests/package/test_rust.py:18:1: E302 expected 2 blank lines, found 1
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
