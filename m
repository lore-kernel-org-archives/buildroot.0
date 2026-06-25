Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BAC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2597440EF0;
	Fri, 26 Jun 2026 14:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDMCHDwFzqGR; Fri, 26 Jun 2026 14:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398FB40EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485414;
	bh=EuoGAS+0WY34gHh1dfoT7tvnQ66rX3FMBh/bAwe2Bro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cewIJ0oWJN50mK/A1fvEL0INdgobCBGwdtdvG3mZaAOFIIXEDSVW7ociQJIOtMmC0
	 b8gZb9BJ5cqV12G/Fzp2+IgISoN4R8Qgh06a+zeIQ2vaJN6UlAaF/N8KoZkIl7tDVq
	 yTZmDvjoJ8087TbkC5i5+BBn+csVmvC88DixdKvKKFEfxU+ifsvte+vEzim/SkWE3z
	 vDe1ktV848fzv1im10DXs4Zp7bHeOVKqsk5uKkzH3ZXjcwgdqvdTG+eTEX4GpKQEnH
	 W2U1amnSi1lVq1uI6H7rvYqL0mI/by7XxzMJXqSCrwrOmyhp0mN6B7GXzTsntkOC7m
	 Q5cBWUhKHEP/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 398FB40EFA;
	Fri, 26 Jun 2026 14:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE90C3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B1F81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui0hnt0ns44T for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5250482226
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5250482226
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5318D86391; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7444fe09802c29e103dc05e56db8fc5dbde27fc3
X-Git-Newrev: 33866bc42c181f9f42361e3d15076e28c606e5e3
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.5318D86391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_usbip.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33866bc42c181f9f42361e3d15076e28c606e5e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6e04f8f21f2770d5e2205f4afa44831d23e05982)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_usbip.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index da94d6f92c..2fae8f7f6a 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -56,8 +56,7 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is not running yet. Listing remote devices is
         # expected to fail.
-        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("usbip list --remote=127.0.0.1")
 
         # We start the USBIP daemon.
         self.assertRunOk("usbipd -D")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
