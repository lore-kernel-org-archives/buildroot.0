Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34639C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4F0408D7;
	Fri, 26 Jun 2026 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOsA09t9JrjP; Fri, 26 Jun 2026 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2710E40B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485430;
	bh=LxkovHuY0p1o34oI2VeX/JShtJWqnV32idWSQMl3bhY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oYmtkIlhy7VvzCRgv+Q/rjcVXHK6Iaypo5uF2F1pgWqXmxtd0yvU5a0c7hgzfqD+q
	 4tWHQQB6igIGKgiuNVXbS0tIguryQ2wSSuM1amwnvMXExQIlQdRtZlbf5Q/D6M+qiC
	 bcFM5r438TNn3kNZ1y+R00fOKYLFKH4200mUNEq0H525mu+yBwgfDXO+cnXmogV0ix
	 +ySOjbAW1TAt26wSg/EG6Ypm99CyO26tnwOb/KOG9LSEo7s4PGNhY2JmlH+47g5fFI
	 vj8KbMZPH1StH7Ma983wwpJzCBw/wxbACHUUHcLBxCCcbUsZcgI4W0biLf4m0IuHdh
	 YQ+3WZXmpNrng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2710E40B4B;
	Fri, 26 Jun 2026 14:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E86A1231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF2DE81FBF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5DBu6ffwaRU for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EECC8221D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EECC8221D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FBDA863C5; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:39:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af35c9461aadac9dc492ca9b4ea314b793b0a975
X-Git-Newrev: e37adc76dc16789afe1c3cd1eb5bffe93ba42aea
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.1FBDA863C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_polkit.py: use assertRun{, Not}Ok()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e37adc76dc16789afe1c3cd1eb5bffe93ba42aea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a4ef71a5927897c01326c1388f81f0c6c34b953b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_polkit.py | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3414fd5159..8ff02d91df 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -43,20 +43,16 @@ class TestPolkitSystemd(TestPolkitInfra):
         rule_file = "systemd-timesyncd-restart.rules"
         for rule_path in TestPolkitInfra.rule_paths:
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertNotEqual(exit_code, 0)
+            self.assertRunNotOk(cmd, 10)
 
             cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
 
 class TestPolkitInitd(TestPolkitInfra):
@@ -73,8 +69,7 @@ class TestPolkitInitd(TestPolkitInfra):
             self.assertEqual(output[0], "Error executing command as another user: Not authorized")
 
             cmd = "cp /root/{file} {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "su brtest -c 'pkexec hello-polkit'"
             output, exit_code = self.emulator.run(cmd, 10)
@@ -82,5 +77,4 @@ class TestPolkitInitd(TestPolkitInfra):
             self.assertEqual(output[0], "Hello polkit!")
 
             cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
