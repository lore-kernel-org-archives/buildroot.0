Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F406CC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C767440B56;
	Fri, 26 Jun 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYDwvcQIKOyH; Fri, 26 Jun 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1284D40A12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485427;
	bh=gxWtbPUHoMPO80ELs/JUJokrxouEwJ2jiteBOyIFwAM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2uV+P2sXGrCSj8mSahHwQykh+wLWXVnvpsIEZsnGwgMoYfvukBgyKggtSj5QZ7bG
	 6QP9cFFSk1hvJPcb69BfvywV8bExCCyV4QApUXLMdch5Nx3QhM7ukzQQd8waeoZRzv
	 8lBAXNP55ZCQncRMNk2jqbY2Q5AmxtiHwSzaJWOSTGzI3Hqg0+85A5MjnsS+AJxrhu
	 sgtYXIEzt0XaYj7o4yElKYgIsylUXn9GXHVyKha5DHkSajV+tBHI1hZZu9/nLykxEW
	 l6bMzxe5r6yWe+FRLnG+Vkea/06uq9zKrw1Qbibz5btw2diLeDuL5Tl3KYsQzkRGEM
	 JYU1MOzq16bAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1284D40A12;
	Fri, 26 Jun 2026 14:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 866DF231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F1D81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEWUFYf97gno for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E9981FC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E9981FC8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3779686391; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:40:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3b5e1a62f6f38cd4944516f09e3cb3ddcb544c47
X-Git-Newrev: 2e5451895d218c1e404dd8ffed94792e513a865b
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.3779686391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e5451895d218c1e404dd8ffed94792e513a865b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
