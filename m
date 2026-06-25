Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7979DC44500
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E72A8149A;
	Fri, 26 Jun 2026 14:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTnM-dWKnYba; Fri, 26 Jun 2026 14:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D351810E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485518;
	bh=q5FBRyXcTHJrkdqIETa9qDT0/15oWLSimPJEyJ3b8zk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kJKOGXLPO5toC79+5F9PmK5Lt7aj/+0xBzgbeSd98aEVa82/nvjRTD69x6x5E8riN
	 sO2lMVNX56Mw54SEkwOYPeLrOTLfyAH6wpddrMYAzIcv7VbKjg71N9gaytTk65yOiP
	 q7ntH3QqNSf5RQnXVK7CZtGraGhqXo7/R2DWTg7Z43GGjKykJk3OxIMaU1/ryNTjJ3
	 dHv/h+UNyVBFBqu2jW+abAg34+8QseNtXNhAABzTbNcYCIOjebUsrG4naNIuCN0bGp
	 BPu4kbiwJdRBSJLC8MrPig8iauJj/ggyyHvMuTsJoQ0t0yM1poM2u0zrGLE13RrRmh
	 NYxM1sE9yvpng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D351810E0;
	Fri, 26 Jun 2026 14:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 210773A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0538B40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbVdI0ZA3Uds for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 497DF4070B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 497DF4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E165864B9; Fri, 26 Jun 2026 14:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:37:40 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0c7e7d29567082d027324d99453e0da6e12b18a5
X-Git-Newrev: e2e56f99d2f2f789b468b2383baeb19cd39294c5
X-Patchwork-Hint: ignore
Message-Id: <20260626145113.3E165864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_iptables.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2e56f99d2f2f789b468b2383baeb19cd39294c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75ae191b5f8bbe7fc971283922bb6b356a5e0c4d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_iptables.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 6e4db0ac06..72f2dd71a4 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -68,8 +68,7 @@ class TestIptables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # Save the current rules to test the init script later.
         self.assertRunOk("/etc/init.d/S35iptables save")
@@ -85,8 +84,7 @@ class TestIptables(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S35iptables start")
 
         # Ping to 127.0.0.2 is expected to fail again.
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # And flush the rules again.
         self.assertRunOk("/etc/init.d/S35iptables stop")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
