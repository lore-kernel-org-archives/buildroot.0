Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6594DC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B4540CEB;
	Sat, 27 Jul 2024 14:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmqYpwrHc8mj; Sat, 27 Jul 2024 14:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEA7940CFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA7940CFB;
	Sat, 27 Jul 2024 14:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F16E31BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6B0381F95
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0A9DgZGNoeqP for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2904F81EE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2904F81EE6
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1026F875E7; Sat, 27 Jul 2024 14:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:23:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b70913703c4364f27ece83c07b23a6e0ef8225f
X-Git-Newrev: 7801890c3a076309362b477e9e27952dd4ebbab6
X-Patchwork-Hint: ignore
Message-Id: <20240727142426.1026F875E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add testing for eltest in
 execline test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8970587749981526946=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8970587749981526946==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7801890c3a076309362b477e9e27952dd4ebbab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous commit removes s6-test from the runtime tests. This
commit adds the same test for eltest, which replaced s6-test.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_execline.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/testing/tests/package/test_execline.py b/support/testing/tests/package/test_execline.py
index a7ea36c1a2..15ff92d762 100644
--- a/support/testing/tests/package/test_execline.py
+++ b/support/testing/tests/package/test_execline.py
@@ -21,3 +21,8 @@ class TestExecline(infra.basetest.BRTest):
         output, exit_code = self.emulator.run("execlineb -c 'echo hello world'")
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0].strip(), "hello world")
+
+        _, exit_code = self.emulator.run("mkfifo testpipe")
+        self.assertEqual(exit_code, 0)
+        _, exit_code = self.emulator.run("execlineb -c 'eltest -p testpipe'")
+        self.assertEqual(exit_code, 0)

--===============8970587749981526946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8970587749981526946==--
