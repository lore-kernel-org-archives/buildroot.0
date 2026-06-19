Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4999CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748FC84F3D;
	Fri, 19 Jun 2026 09:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHn2bGpBDbmK; Fri, 19 Jun 2026 09:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BEB18512A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859940;
	bh=OcBf67AgC9xTJM5WF51F4O8eanCvxL8O284eWus8Gvs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MmKArM6BMU474TzLZuH2JESPRYmDGwsyf0vHHIev/4+tUb/3ufDRIMoboNHoArReg
	 jP1+SaGJtI5Zx8x7SJJnJ+CaBTNkbbL0Ub/IjTkQrFhHN0PNPDXFEExg+3h8/tJROK
	 R35pPeFP1xScGfJ0rQlNyopSYpnodadcVRsVoZTgoBH/xcJXC0865WGBJYRwl2rzlC
	 qaov+Lp4scUB7bYAIYDKICvdHqG9tgZ2hftMX8Bk1K3ml6kVrhguREb7AZDeRNv7kq
	 F27EjYnFxJiwuqqvDkFKdovnc3eGAQzJZ60iv/OK65pXTEe/6WI4RpGYMCtnNPL/kN
	 2BzbvmlkRg1GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEB18512A;
	Fri, 19 Jun 2026 09:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB6AD06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8205B84C3F
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juxn3i6mwhDZ for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B35E984CB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B35E984CB4
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EFA281645; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8cfb5584505428207a5e5c4f61bb1f4fbfa0225
X-Git-Newrev: 50ed1540f3952bf090430fa358c626755ef28d59
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.3EFA281645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_screen.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50ed1540f3952bf090430fa358c626755ef28d59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
