Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF41C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 618CA40F65;
	Fri, 26 Jun 2026 14:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5qVgqbGn1HX; Fri, 26 Jun 2026 14:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D0040F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485407;
	bh=WK8VwWJ9eR0TEt8k4pZZk2HCPlbTqeBvMWtUN1kzTg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TF3C3VPCDphc6N3Q4em5BQt5U0klBUhCLBJ/FTr/JLwhBy+jxGz2fqChGxmKr1UYS
	 ftuKM3XS/TqI1B7nhFAn74SVp1CPaseJdEt5n6MjwKeFAKcS4h12hgmfhl23L8XT10
	 FlsWA6BSbMfhoHDllkGZGIMLD+PdaUE18AcWOLowg4QEM3By3PEvCHc32uiP/KEpqK
	 YMUGF1cIyUVpQ/64DV1vCVs/Wc18NOWOm+7HeIAmfq4E85hfNX90E43oubGW6F69xp
	 W+ZtTUR77ALuooARQy/XIp1Fsoni/2zmfkuOOgnw8Lw7L3bHtEGmZFLKIt0CN1S/xn
	 ne6gfs3OPtXAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D0040F2B;
	Fri, 26 Jun 2026 14:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE31D231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFFC981FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MbYZk_KTBI1 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400B88217F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400B88217F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 418A3864A8; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:34:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aeb8e127a23232efb67de32af9eced0f8310f1c1
X-Git-Newrev: b0e734b11a2c61e3560a7f3334cba44ba1a78e18
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.418A3864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_systemd.py: use assertRun{, Not}Ok()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0e734b11a2c61e3560a7f3334cba44ba1a78e18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c301eed0e43ab03b195ca7a64a07e07d02881ce)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/init/test_systemd.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 3e47c7cdfc..ff88863766 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -320,19 +320,16 @@ class InitSystemSystemdBaseOverlayfs():
 
         # /var/foo/bar is from the pre-populated /var, so it should
         # not be present in the upper of the overlay
-        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
 
         # We can write in /var/foo/bar
-        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("echo barfoo >/var/foo/bar")
         # ... and it contains the new content
         out, exit_code = self.emulator.run("cat /var/foo/bar")
         self.assertEqual(exit_code, 0)
         self.assertEqual(out[0], "barfoo")
         # ... and it to appears in the upper
-        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
         # ... with the new content
         out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/upper/foo/bar")
         self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
