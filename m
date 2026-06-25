Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01139C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE42A60F2D;
	Fri, 26 Jun 2026 14:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5akUtGZSlkDY; Fri, 26 Jun 2026 14:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0F760F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485406;
	bh=dKWSrFH/1j985eFmdfRR7Y7fFa6bkBEclY8mlqRWTao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I8xAueTPqH6jNRJFfFgGp80DV5y4JeiRoc+lhRk2h2jQ+L14WvfKS0dhO9LDisIBp
	 e5J0ZnloNxsXvydf+mtfuyPjXy5cDuNjfwvyctnieaEye61R17rw+w0Wk+15ex8vxQ
	 pv3SvZ5dQlBKEUOWegeCZlwP5aMmm+9D6on3wsoPH++obzGXlKhK6yxC1nucFHDm7y
	 OXLPLHXOBrHlNlrPt3QYZblOD9Ehvq/zIQrX7dP9mkXPASkl7FVg3ziXQEcgxAjGYH
	 6cvRHU689MrtTxxY3syCghD32vbpmkKZtyA3UiC2p2IJLlKMaavzJcnyFbDKe7la6x
	 pV7uhSlBLfZEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC0F760F34;
	Fri, 26 Jun 2026 14:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3845231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5ACF81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqNAue4KqoJd for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F2188218C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F2188218C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FC4B864AD; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b0e734b11a2c61e3560a7f3334cba44ba1a78e18
X-Git-Newrev: 8efc2ef588ee2e22b86c8804d333f9d4652dc15d
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.4FC4B864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8efc2ef588ee2e22b86c8804d333f9d4652dc15d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
