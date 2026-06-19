Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F587CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC6384BDC;
	Fri, 19 Jun 2026 09:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKN7hlgFTzgy; Fri, 19 Jun 2026 09:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A80B84D3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859915;
	bh=gg9/MddmtI67GDKqZ89okbITZnyjwlG+PW5bPFR9MxA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kf+2GxujrzttqwdbUh6u3wRk9ZEgqlvd+XTgK1LH4aYT3CZpGFnVhFnxdJPk9qgs6
	 HpuZY+4ybUHi3rnUrd+s7zLIt0LjNI1uYU9TlNi+CxYCr0s1HDTp6xXzncJY4heI+s
	 VOaO62c4TRXPeHamsJzQhFvogecENOR5e+sX/qPJ9jOMI+26kGt8IVnSMQYokstD1m
	 Tv3CdKH2irLoww/DDWVFVfLtXWa8x3XIIuELY0zCqb8Ty7/aYXuOAR0S9llmQcv9fj
	 IWFr5vC7JrJs6DfdhpZbsFpgTA0sT44CVGKquI5faJOBlnj8U5MHf+jjAVsqVny+lj
	 YesyftMRFPWRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A80B84D3B;
	Fri, 19 Jun 2026 09:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C27D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 685D584BDC
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVfcsLEjqhef for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5D984BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF5D984BDE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36515815B6; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8caecb62a31aef9fa7d79c89abda41cc7a420c74
X-Git-Newrev: eb0ef1fd987a6b599c03b3b99499b882867cb58f
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.36515815B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_audit.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb0ef1fd987a6b599c03b3b99499b882867cb58f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_audit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
index f68a4b6831..722542a845 100644
--- a/support/testing/tests/package/test_audit.py
+++ b/support/testing/tests/package/test_audit.py
@@ -80,8 +80,7 @@ class TestAudit(infra.basetest.BRTest):
         # normal user. This command is expected to fail (as only root
         # can root is supposed to read this file).
         cmd = f"su - {user} -c 'cat /etc/shadow'"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Our last failed read attempt is supposed to have generated
         # an event. We check we can see it in the log.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
