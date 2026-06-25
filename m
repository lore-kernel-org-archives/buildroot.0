Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B307C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320F360F9B;
	Fri, 26 Jun 2026 14:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42kkaL8hI7uW; Fri, 26 Jun 2026 14:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19EC60FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485512;
	bh=2sLFQ7amdlnSprXANhjpmecvvB4JQWORxfgH8tyEqAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rPe8EpMkrnkP3/LXH66rikxayiE3XLzyMr6+aeROLN5R7ZKu3PFzA4GK9/4auhF6K
	 hj8EaB5VckUudMWCF03KcjeTgUbbFPwTNZzSSf1OwPmo2bDc1jn9koSLLDy8sGXkv5
	 XaFxY7BqMxHYFPGM9ywDTWtcIGkHzi0dYbrEhoRLaTraSpBZFirAulvdLZeAwvhQex
	 i6uGUBz9oiCxWQ18DBwr8U709lh/V28MJ9O9gowIiFHTTJsjsq6W99DjYT2bdhzI1v
	 bfVcbEw0OZi2D50qvLz1IOzQKbFhX8M2kjpHN3Ak2QC1L7+LrP6n364y78W8bHVPHD
	 NcyILe0xwTdEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19EC60FCF;
	Fri, 26 Jun 2026 14:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CF514A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CF7B60F61
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM9038uZV3S5 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7650260F3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7650260F3A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77CCE8649C; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:47 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1035f0dfada0987ad31800e80903928b4f9b529a
X-Git-Newrev: 170f87572f26fd363a06401ee897b8cbab20f786
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.77CCE8649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_ddrescue.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/170f87572f26fd363a06401ee897b8cbab20f786
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7284778a130e123cc9c1a3705b5da0a2f9a767d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_ddrescue.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index bd34694737..e7e71fefda 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -70,8 +70,7 @@ class TestDdrescue(infra.basetest.BRTest):
 
         # A normal 'dd' is expected to fail with I/O error
         cmd = f"dd if={dm_dev} of=/dev/null bs=512"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
         self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
