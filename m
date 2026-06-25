Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC37C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F02A821FF;
	Fri, 26 Jun 2026 14:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNmUyuuhlXsj; Fri, 26 Jun 2026 14:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD56382164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485418;
	bh=zxCsOI/Y1EBmlWXkSmQha9U8OWYSYCKjbso/zeMVWaM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DqxLU7A2KvTO8gEidVJPu6SfPNWboXcibDpxQ2YREjBCpXUfj4K4MrJUcG4s0vs7Z
	 We2c/1FVcLijXRDjtcHnsjryRHDigH10iYnSxhcnHIKZi1RTAdSpuw3hONnUkI076z
	 mZZfweQnjhwyIKQzcBBqkJrvP3YEsEu5bJqCOAyNtU2ZwIscea+EF4H7yWJgLQpkMG
	 XrVN1zeZNlnbvmF/Enn4oqpnKQXzq9gg5aoO2RFV8dJxGD8+OZEtAGRslf3+FuQF94
	 0COAUK0bb02hIcLrkbVjMJyEIQS4cZI3q3xC25AzVu+UsUuaL1SQ3OiVxSvXWrPtBl
	 rCKoTL4SyX9mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD56382164;
	Fri, 26 Jun 2026 14:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F057B14A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B238215C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9N24tZmtGiS for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C9FE82228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C9FE82228
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D4FE86391; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 44001e3e87db6b5749b2caa995d21ee418e713a7
X-Git-Newrev: 3077be13c58c4d731f67ba244df3d42dc027b0eb
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.6D4FE86391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_which.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3077be13c58c4d731f67ba244df3d42dc027b0eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f39a9ba291db640ec5171fb9a14b1ff7c69d186)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_which.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
index 38f528aa7f..05ed56ccb4 100644
--- a/support/testing/tests/package/test_which.py
+++ b/support/testing/tests/package/test_which.py
@@ -33,8 +33,7 @@ class TestWhich(infra.basetest.BRTest):
 
         # We check "which" returns an error when the program is not
         # found.
-        _, ret = self.emulator.run(f"which {alias_name}")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"which {alias_name}")
 
         # We define a shell alias.
         alias_cmd = "/bin/true"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
