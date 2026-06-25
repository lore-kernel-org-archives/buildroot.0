Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AFCC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDC2822F6;
	Fri, 26 Jun 2026 14:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2Bkd1zo7PMn; Fri, 26 Jun 2026 14:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E185822F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485527;
	bh=Txfs7hElthlqWnAcQQ6cOSS/o+HsmtdysY//anZfFrA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ayoZ4H4lbX7q4XpgQ/aI0o2I7HYrelhmwr8oO3BKKOdNj8YAcIxUky/48oN9WrzjQ
	 x/niOvrdmsFtXwmVo/RBJBW5ykBeTysQTj1gyh+d82NfvfFCU3Jdn2eoyaXFVQmbLj
	 9ZQV3Gen693KzojY+pKSXR18D5Q5eEP1ddmx8wt9O2PcUxfV7C+fQAjl0NwzjBDe4O
	 EFiQWVMMAAJT5GPrY+Yn+tMdAxkyJ43Q8CtxMS00/6C33jJHXDXq8cbKEMnehDzn6i
	 QblSzfF9OLx7iX9J62IF+DheZ3IZ2PRmXf+sS1KOHXDKlstNNyGdeRBWGrPEFlBhQb
	 7viUxJHLkHQDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E185822F3;
	Fri, 26 Jun 2026 14:52:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB253A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A27B6060D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No0t_dWxnAK2 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA14560F83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA14560F83
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F1888649C; Fri, 26 Jun 2026 14:51:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:39:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e9b1a3c0d5fd2419bb57b3b894704a11844a8141
X-Git-Newrev: d7204970beedbf2ba961be5c911b16ce74bd93b8
X-Patchwork-Hint: ignore
Message-Id: <20260626145118.9F1888649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7204970beedbf2ba961be5c911b16ce74bd93b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
