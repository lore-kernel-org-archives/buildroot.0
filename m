Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4398CDB46F
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B3E6F5FA;
	Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdP6aCIU6QfZ; Fri, 19 Jun 2026 09:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A276F60C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859916;
	bh=ZMAKOu34JSft/zbT+bK8sZBzZ/9wEHbk5nvtcQEsl4c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RYouzI/wCuHe2jnV0BvRkg35ZutNgVsfnQFEBBb1nsKtOsREbDknxPcZJnuKAQPux
	 o2CXOVtYSOSP156msigYd8pTaOVw1WGzkH+B34VUb4B4zIY1Hr/W6128w+UEnhn8ug
	 q4L7UbMEd7dkJhdRVT1S3DET4buY/CLuQs4fGS5qBo0shTb50oUpYa1T8Sb+VDZg27
	 4xFTTB0K6If9rDUxec3T1/adOjEZCgdMlsIUsSqW7xAKtfi7+ZEm4rGSEyjMXFODGG
	 uIaL2lyMLlcK0mYkxT6xxTiOIDEN4H3CpeuiZYBb9tL4eOa8ZTWO6bmRIRP4lI+h9/
	 PXZ9MmAWuTqtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A276F60C;
	Fri, 19 Jun 2026 09:05:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62A89367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47E2B6F5FA
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DA0fahfRIj0o for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B8676F57B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B8676F57B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19CEB81645; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5c017f6635b8cc1856e6bd74f87eca320dd3575
X-Git-Newrev: a4ef71a5927897c01326c1388f81f0c6c34b953b
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.19CEB81645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_polkit.py: use
 assertRun{, Not}Ok()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4ef71a5927897c01326c1388f81f0c6c34b953b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
