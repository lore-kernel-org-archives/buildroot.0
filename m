Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B23CD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5390742E03;
	Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdBYorF1jBdP; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3093F42DBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859911;
	bh=TbowoAvJ0WEF+xQgzpKQyV1avg1v9RVGSfphyqWwL34=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jho7cX9sWygEK9w08Sg02FwOzPSF7fGToeMdaWcQu/UL4lKg/cl89waETt3gKw9O6
	 fibk8v33YkEX5jfNVh8mA7Kw5tMze4w4B0Ac6JzKhnW7n/uKc/OwccUAW4D72dPiS/
	 2T4GzMllp4httmKbSSTUFR43fbhA8WqSn3UZEaGTiAZhOthJjGO0zLLhV92JMygkE9
	 gR2arQCVoLkCHS7jj9miwsLpRCPhFsi8fKscIpaYVdAFG2DYiOUkJSQaKtQw7AgOBS
	 BXPoDAABfbGZGok/o9Krma6hgMRcf/zYsJs2Dy/QQxQNl8RjBPuFGa4qV74s8H05BM
	 OUFHPVK4Uz84Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3093F42DBE;
	Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 647C1367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5185B6F5F9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0MOvOv-Kt3F for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AE86F57B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96AE86F57B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F7BE81645; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03783de150dc782cb0fc7326a87406dec72bc2eb
X-Git-Newrev: 8c301eed0e43ab03b195ca7a64a07e07d02881ce
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.1F7BE81645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_systemd.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c301eed0e43ab03b195ca7a64a07e07d02881ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
