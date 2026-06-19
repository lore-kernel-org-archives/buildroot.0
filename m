Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24621CDB466
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E47A942DFB;
	Fri, 19 Jun 2026 09:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcN5UHU32Goj; Fri, 19 Jun 2026 09:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCC242E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859933;
	bh=5rOSUokWpTALpETBMX9CD+qrhBs8GGoXxD7cQWCnpc4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NL4XE2B+FzgfhvDh6Ugj7WV39urVkeGLDDRyLp5qY34Cj3DYo4Wx7tNSQ2XcpmryD
	 3tK8QT/wRrFlYXg+/VFmAr3edA+Rm/n1zBNwOK9Q9XRtUnR/KwcM14Q4FURvVwbN22
	 pGFGChKrioCk6etljHaqFXd5Gr6QhrwwPg0f0M4+tkRzjeScEJB8dL8yA0NY+0j2Rx
	 qGRUKGs6toUNoEPe7IIj5WQbu1+b0loUi+CI18vo7mOwA3u7vlG57362kqHEmgBOQn
	 wzamQmvdhGN3169rw+DFCBy2ZF6PqjAUfzIxB9MiuFneH43abIGHzS5iqTRoXYPVzL
	 v1BKAinvSr05A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCC242E3F;
	Fri, 19 Jun 2026 09:05:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10357279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B267342DB8
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MgBHbzpy1Tj for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE70442DBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE70442DBA
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AD988165A; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ffa0905607e7b642b30bcc6bb54b5feb5426704
X-Git-Newrev: 6f39a9ba291db640ec5171fb9a14b1ff7c69d186
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.6AD988165A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_which.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f39a9ba291db640ec5171fb9a14b1ff7c69d186
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
