Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B410FC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D0B605EE;
	Thu, 27 Aug 2026 19:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxSyDr8Uc7L7; Thu, 27 Aug 2026 19:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858517;
	bh=//Y/p4nlD89VXvQSMUZQDenBv4L67jj6dAdAL1lRbcw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tp1sVAn39FbWc5GRXWEpt+j7kEcXFvkeis5iH63D9Znzuq+NRsJBNFLCqLfWiZ5n+
	 x4M3n9XWf1i6Cx69Vm1Egz+xnrNYt0QMMC8ag7cifV06kMhwAb/YmGYVQiEpPSxIZv
	 bfZzp0vuPAqEHwirjtEmzjH+tZUClAmBXOt0qoTUX6GZhUnc5MIwzfISPQ4Th+v8Al
	 Y3lV9DKCO6EyRRU9AAj+A2ziBfnOOtc5nC9kpD9UemFREHf7Aw6yw7AVGP91H5RJNa
	 AhVeD2//8CNJf5lNX6gbgk0HFYtPeoAMB+AAxSQMxWCNYoiMOrNTCpFqmQ8XsHkmBA
	 lEhDLgPvPLD9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91DB6607E0;
	Thu, 27 Aug 2026 19:21:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 347FECBC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2712180EC4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HUHg828Ushf for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352F480EC1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9185B9201E; Thu, 27 Aug 2026 19:20:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:55:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bd3d5004df09ccb13e54d7fcb2719c629602c40
X-Git-Newrev: 803cac2271f6c033f37ac2b76e88dce78354a110
X-Patchwork-Hint: ignore
Message-Id: <20260827192057.9185B9201E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestFirewalld{Systemd,
 SysVInit}: fix expected ouput
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/803cac2271f6c033f37ac2b76e88dce78354a110
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Firewalld v2.4.3 [1] firewall-cmd added a new log line while
waiting for dbus connection [2].

  [BRTEST# firewall-cmd --state
  Waiting on dbus connection...
  running

The line "Waiting on dbus connection..." is not always printed by
firewall-cmd, so we have to search explicitely for the expected
string to get a reproducible test result.

Update both TestFirewalld accordingly.

This change is required to fix:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

[1] 380dd8a348dc7c5edf2b187245b8d4e70a3d96c2
[2] https://github.com/firewalld/firewalld/commit/5e1c37c9664f57d81236ba999f13e60bf753ba45

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_firewalld.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
index 9a1bd41f62..49a553947a 100644
--- a/support/testing/tests/package/test_firewalld.py
+++ b/support/testing/tests/package/test_firewalld.py
@@ -59,7 +59,10 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
 
         cmd = "firewall-cmd --state"
         output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertIn("running", output[0])
+        # Ignore any unexpected log from firewall-cmd
+        # like "Waiting on dbus connection..."
+        expected_line = next(ln for ln in output if ln.strip().startswith('running'))
+        self.assertIn("running", expected_line)
         self.assertEqual(exit_code, 0)
 
 
@@ -104,5 +107,8 @@ class TestFirewalldSysVInit(infra.basetest.BRTest):
         self.emulator.login(timeout=120)
         cmd = "firewall-cmd --state"
         output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertIn("running", output[0])
+        # Ignore any unexpected log from firewall-cmd
+        # like "Waiting on dbus connection..."
+        expected_line = next(ln for ln in output if ln.strip().startswith('running'))
+        self.assertIn("running", expected_line)
         self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
