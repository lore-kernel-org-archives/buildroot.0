Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC56C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE60960F61;
	Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id on2lTjdCkls9; Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B681060F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485502;
	bh=yy96vqkcTPOuzzzy34144Tnh6o+Wxcpu04dD9V4NpDY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O1w7B4Q52obobvkaftmUsvcTSdesx3MNcAr3ftXghOod5jbW7wgcH651U5CeF3kjn
	 M0P4TSUKU7kPyXrGRQS6HFloWwqehxrTYhfrgbZxR4K+cD0b+ZI251JNatMxdNlQEI
	 uN31rFqgc7wrc3lDMXdQW0Mmq6N7UYcCLy61jNyEnBhzGm5VYtxvoE433KahfugQ7D
	 tx7dVhllLDBTrM6x0vkP592McN+gTyr8tVrpPOy9A8b1qZV41POSEGuaV/25IwcUZw
	 cQuWhVCFn7PtTBFAUsSUAQuW35/g+RDUfoUidwiaTpj1O3lDF0Yr3KgrEWOyuZo5A8
	 L37WIwlKe3kCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B681060F75;
	Fri, 26 Jun 2026 14:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1918A14A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B66F80A90
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_OV7I-zqiNA for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61575809A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61575809A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 320F7864B7; Fri, 26 Jun 2026 14:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:34:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d19226ef06e9762b8c67e8f14263ba5e37c60c7d
X-Git-Newrev: 566e3a94148f82f93406ff179ed31604db6b569d
X-Patchwork-Hint: ignore
Message-Id: <20260626145108.320F7864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/566e3a94148f82f93406ff179ed31604db6b569d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c301eed0e43ab03b195ca7a64a07e07d02881ce)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/init/test_systemd.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 472a65db57..60b9c3d032 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -340,19 +340,16 @@ class InitSystemSystemdBaseOverlayfs():
 
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
