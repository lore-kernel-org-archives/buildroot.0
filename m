Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA9CD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E556F645;
	Fri, 19 Jun 2026 09:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YStM3pohErbP; Fri, 19 Jun 2026 09:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 167CC6F634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859929;
	bh=zOH+2nmZM+5PGFXlwBjSksz044P5lLIeWj8/56LBfVY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAPBd4EVr+eEKTUK8TKDm3Vi1u+die/sb9mlbyVvH2gq99xnA8QgtULVxEw2h1/b/
	 yfsJn1bYTkkPS9LGx3Qlx8uQMeVCQm6NmT8H4a1ISlIZzTx026xRDCvT+s1QC/TBg0
	 1XRHILxy1cNkdaJ9ZKoqhSJdAfT7wNuFMLawKJUdLsKrzxu3CHxOKQN/3EewYKupFY
	 3m9IPqu/jjmI/K3wrEa3QeZXBKGJimDaFcIgRFnw0DHBwtfZGoAjh2kWhCQJweavBw
	 nr76lo7u2C4XxbkOX3FgeBwg2w8rqmFnkvYMEvLup9Ql+drKj8TcGBr8LbY++7o2tj
	 eBg/UcCnN7Y6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167CC6F634;
	Fri, 19 Jun 2026 09:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2FD279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47AE384BDC
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zfa0I_QQO4oM for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 797E484BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797E484BDE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03EC681639; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae1ff2d8dce7a5e142758faf5fb567c572451ec9
X-Git-Newrev: 75ae817eb235c028a2747a501342372a5c0302dc
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.03EC681639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_nftables.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75ae817eb235c028a2747a501342372a5c0302dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_nftables.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
index 2622c7e822..62e14d5d35 100644
--- a/support/testing/tests/package/test_nftables.py
+++ b/support/testing/tests/package/test_nftables.py
@@ -69,8 +69,7 @@ class TestNftables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # We completely delete the table. This should also delete the
         # chain and the rule.
@@ -128,8 +127,7 @@ class TestNftablesInit(TestNftables):
         # should allow ping to 127.0.0.1, but not 127.0.0.2.
         ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
         self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
 
         # Stop should flush the rules, ping to both addresses should
         # work now.
@@ -140,5 +138,4 @@ class TestNftablesInit(TestNftables):
         # Start is essentially the same as reload, check that
         # 127.0.0.2 gets blocked again.
         self.assertRunOk("/etc/init.d/S35nftables start")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
