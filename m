Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF04AC43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCE541194;
	Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifPK5VBG0hJC; Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE15041195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485533;
	bh=9qf69BMasspnPRS8zYKU3mbGFUsT8uhfiABjd936qCk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=icWeVH0194uhri8jhrMwdLVxjM59EkmaD7pzxuytfoGPM/GfgmZYZD3eOTxHaSoqQ
	 SF/httYkV9b8GBHYl+KfLhmZPa9j0TXJbrAKuUHm91Na1Qq6JSi08tAKCjp4+x4rAk
	 m6TiHz5PsusP+dlWayNL0ojWX9ffpfPB26wnAvZuYIaFue+IQLcDxS1FIKQM1t0wa0
	 Z0Wy/m1YofN+0+fMLqRKEExrfPAMu5gYEu8PYBckNZ+4L2GbloNpoywbtC0q7433KP
	 FIXpFWDSZmqVoHAnaC53w+SdB02M8vrTSOM7H4l+zZYEnPYvhA53T4VRJ2jRjOlD+f
	 XrkWp/iXEA8eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE15041195;
	Fri, 26 Jun 2026 14:52:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2178F231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0783F4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXq7d6vsEMen for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8E740702
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D8E740702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E18F847A3; Fri, 26 Jun 2026 14:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:40:55 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6f44e2660c486f64814b2f220b18a7c9ddce55c4
X-Git-Newrev: 31ea7acc54c301f78c9224cf8f12b9f1eef83203
X-Patchwork-Hint: ignore
Message-Id: <20260626145121.2E18F847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_screen.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31ea7acc54c301f78c9224cf8f12b9f1eef83203
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 50ed1540f3952bf090430fa358c626755ef28d59)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_screen.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
index b6264d34df..977aa5b59a 100644
--- a/support/testing/tests/package/test_screen.py
+++ b/support/testing/tests/package/test_screen.py
@@ -27,8 +27,7 @@ class TestScreen(infra.basetest.BRTest):
 
         # There is no "screen" running yet. Listing sessions is
         # expected to fail.
-        _, exit_code = self.emulator.run("screen -ls")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("screen -ls")
 
         # We now start a detached and named session.
         self.assertRunOk(f"screen -dmS {session_name}")
@@ -57,5 +56,4 @@ class TestScreen(infra.basetest.BRTest):
 
         # Since the session is supposed to be terminated, listing
         # sessions is expected to fail (again).
-        _, exit_code = self.emulator.run("screen -ls")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("screen -ls")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
