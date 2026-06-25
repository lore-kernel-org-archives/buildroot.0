Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5F4C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D59E81062;
	Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRkYpBEi0t2d; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5F381087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485508;
	bh=CA+DE/s6zssbE4BuGKoiVk//tyXhMFwsj9zPfDren0c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hmh6KNj3Smrfn0dOyDUH9bcJJgYuFj7Vr7CRgUYRB4JYz8srBnokh83e1+IK5IY0j
	 /k8T4STLjpSE6fHO6EHueenTz3o50zM3y9YX7RkPISZgSP2Cq7YvtjvxlCXkftBo4S
	 rj410sHEjNOdLx2fxI24hAG8LfJW0KL5OBHj5Gbvn6QqsboWsy6PPKHZ7hCcIkkm0y
	 s5j6+U1Pqdae78na5E7Sr27YGhLOTivJ3JCrvI7D6gMETEXOS322HQFYYysptd/i0q
	 gFhb3VdmIv0Q7nB8lfBHRi40yrFAowI87USU9cIMDxuoQHOw/liZjnyrD01R9DzZ4O
	 q34vxVHsmSeng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5F381087;
	Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 005D63A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F4E408FC
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JPgJqocf95I for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3239440FC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3239440FC6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 267458649C; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:14 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 566e3a94148f82f93406ff179ed31604db6b569d
X-Git-Newrev: 6d480610fa86e6914d2a968ae060d08d500165c1
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.267458649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_acl.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d480610fa86e6914d2a968ae060d08d500165c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8caecb62a31aef9fa7d79c89abda41cc7a420c74)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
