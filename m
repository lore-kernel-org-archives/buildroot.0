Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A9AE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B736126C;
	Wed,  4 Feb 2026 17:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmY3LBW7zlN4; Wed,  4 Feb 2026 17:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7797D61277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224936;
	bh=cZsH5WRs+wV2FKt+nEnMAT/cmb0tsER7xypBqf5It/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GdhOw3zFspchq7TQK6TYN0i9xIS1ZgywbJzasJm71+I+pFAnVzYRJjNNt+/8JzSWQ
	 IiCOkZ/aZpLVJPCSVnLUTboNeEWEFYtf0TcLQc6zo0YP0X4doKiz7Rx3zFnzqNUb1o
	 z5e1sFtvQKhwV8x9U+FWUnsSo9Feg691JegRnsIygTMvX3Gl8b5SCtMSBC8INhAt5T
	 IsFdhhs0b3Ag5dZ1wBpkPhZWLQ6Bhsjnd8yB1gv6bmXZRWRJSswT7/Z3R1cAVr5Ics
	 3Q48ZIe1D9MZN+bwUF+uyaoegHTFTv3vn41HCIdJP2H5uFx/+ukv76uE/YYR27MyWa
	 7PDvwvuKkzFJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7797D61277;
	Wed,  4 Feb 2026 17:08:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8DD173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C3EA4054D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvLX_coI30vb for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89E040567
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89E040567
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D6E486977; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 15865764abc1ca4eacb39fdd9f98d07eec3980aa
X-Git-Newrev: 52ff864c5889a2a20f8f71b504ecb6a85b6660f1
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.9D6E486977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
 test_python.py: disable interpreter colors
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52ff864c5889a2a20f8f71b504ecb6a85b6660f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Python 3.14 (not yet in Buildroot) introduced colors, enabled by
default, when the output is a terminal. This behavior can make the
pexpect pattern matching more difficult in some cases. See:
https://docs.python.org/3.14/using/cmdline.html#controlling-color

This commit globally disables the Python interpreter colors in the base
runtime Python test, by setting the NO_COLOR=1 environment variable.

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_python.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c9ecf9acda..e815376d21 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -17,6 +17,9 @@ class TestPythonBase(infra.basetest.BRTest):
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
+        # Disable Python colors for all Python tests, to make pexpect
+        # pattern matching easier.
+        self.assertRunOk("export NO_COLOR=1")
 
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
