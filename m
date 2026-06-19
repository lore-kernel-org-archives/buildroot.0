Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCBACDB466
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D41D86F603;
	Fri, 19 Jun 2026 09:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1vxz83T3aeD; Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B0486F5F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859913;
	bh=1FYfAsrDIHrO4y1JCESQfGNWAU3CdfFO/3B74e4+1YE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gGjl4VURiUAXnUqs9FZ2Kzt6s6WvfropgFBfzIruXdiTjdWQKrnlBzsmySafLlb3G
	 FJbO0IH9YkKC2kpMF7XLygAEy/xUKkl4oGFvX+3MxJkTvbIGfRYSrOupZrUedcepTp
	 PROnalNVd+KFPHQlZZCnTZ1wDqLH+GhS90Y9r+6GobTZsbyDR9Fd/2qk6MUQDvcOY8
	 TdV4v5XZENoUPVxjt+l8/U3JqeaF0KFNg2DkDw1PMN0+7kSlGnHufGXb6zS8PdHCWM
	 KdBDPaAtK6tgPuRvYIknLlYbRno9pZ4arWpc0FYDs/dgKTEfpHgilpuZUYaqjlX9ED
	 lgXcGHPRXQLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B0486F5F9;
	Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B810F4D
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55DA542DD7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NxWJAn7PHbA for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F1842D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F1842D99
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 299AE81674; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c301eed0e43ab03b195ca7a64a07e07d02881ce
X-Git-Newrev: 8caecb62a31aef9fa7d79c89abda41cc7a420c74
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.299AE81674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_acl.py: use
 assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8caecb62a31aef9fa7d79c89abda41cc7a420c74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_acl.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
index e4827c7bec..4511c6db5b 100644
--- a/support/testing/tests/package/test_acl.py
+++ b/support/testing/tests/package/test_acl.py
@@ -52,8 +52,7 @@ class TestAcl(infra.basetest.BRTest):
 
         # Reading the file as the test user is expected to fail.
         test_read_cmd = f"su - {test_user} -c 'cat {test_file}'"
-        _, ret = self.emulator.run(test_read_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(test_read_cmd)
 
         # We add a special read ACL for the test user.
         cmd = f"setfacl -m u:{test_user}:r {test_file}"
@@ -73,8 +72,7 @@ class TestAcl(infra.basetest.BRTest):
         # Attempting to write to the file as the test user is expected
         # to fail (since we put an ACL only for reading).
         cmd = f"su - {test_user} -c 'echo WriteTest > {test_file}'"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Remove all ACLs. This could have been done with the command
         # "setfacl -b". Instead, we use the "chacl -B" command which
@@ -83,5 +81,4 @@ class TestAcl(infra.basetest.BRTest):
         self.assertRunOk(f"chacl -B {test_file}")
 
         # Reading the file as the test user is expected to fail again.
-        _, ret = self.emulator.run(test_read_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(test_read_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
