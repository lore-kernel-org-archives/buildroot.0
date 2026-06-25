Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654C5C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3992460FF9;
	Fri, 26 Jun 2026 14:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzm8GXrfmZ-6; Fri, 26 Jun 2026 14:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF7B60FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485522;
	bh=GSWTgdoQIpiHp3aTg2x9bbZZpAbNVobQOn0MYIgPFz8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGf98MSzIH+bA1MFvPyvptvgEWaT95pkpYip8wg7U/+MmHZFKM2LsNhYeLIV7k4hR
	 e5w2qbq+ooysF0bHRvJvb6g7Y5spyIgPKLzJZHXtqM+DZRrXdzYvcGbZQg/C0d+1/A
	 yMEon3b4LDPz2c1mqMJZk1axSUO+Q3Rnslx7TB+2d0usMuZBGjlkwvNtxnFFjbaWfz
	 bvc18w6o78ZnuICEjnq6E7/Q2kTW8uJ9eq6J805QxsJDF2hyoG4gg5bnHjMh0pyB8b
	 91lersc8Qum99+d9habrZevko6LFgWCTlXuJ88iRQZNrsaXtTuxilchTil8D+O4vGo
	 kTwhFPJmxCq3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF7B60FFE;
	Fri, 26 Jun 2026 14:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E82E3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA734070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICtCvUWkO5ox for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A06540702
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A06540702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F8C9864B7; Fri, 26 Jun 2026 14:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:35 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e43036522348e9c286383ec57ddc4bbb7065e12b
X-Git-Newrev: 64f5559e11a7d9ef28f0b6544581c2a09f8f7c41
X-Patchwork-Hint: ignore
Message-Id: <20260626145116.6F8C9864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_lsof.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64f5559e11a7d9ef28f0b6544581c2a09f8f7c41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aae70a3ab5d25f192babf8ecd91416eee176c216)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_lsof.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
index b0478dfbb7..336a951549 100644
--- a/support/testing/tests/package/test_lsof.py
+++ b/support/testing/tests/package/test_lsof.py
@@ -28,8 +28,7 @@ class TestLsof(infra.basetest.BRTest):
         self.assertRunOk("lsof")
 
         # Check lsof fails if requested file is not opened
-        _, exit_code = self.emulator.run("lsof {}".format(test_file))
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("lsof {}".format(test_file))
 
         # Open the test file from the shell on descriptor 10
         self.assertRunOk("exec 10> {}".format(test_file))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
