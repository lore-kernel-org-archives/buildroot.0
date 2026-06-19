Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3934CCD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F84F6F608;
	Fri, 19 Jun 2026 09:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAa9lgJwKQcI; Fri, 19 Jun 2026 09:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 400A46F641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859935;
	bh=FIyapRA1kF86ilBSXeKXF8HV9HuPTdIpDv81S5BWkZI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YXlM2a61MFbjqtcQEPtMi1rYIhGkfA8JyhU2Zw2hdadx0w9J+EhAA+6agdz2aqB6F
	 V/odQlPw1NxwiLFH8qkuZow4pbBADopHLySgbGF4mZW0sgcRe11ttxpRLYykEPdyQA
	 yiuPj1Jgf7q9iYkInPK3oV8ak7tbSS/NL8Bn+5PDkkWxTfqEKD8e+VZP61zLUgr/5R
	 PE1TeezLenLnDoPQGEJMY5AaZyJP+MK2nzFL/IFbfJJABSNQxjukgxwUIZ+4MCnBXn
	 C+XwAIl+T1sz3+m2mxjAfeFLQvI02Eza6LBaMshnWqSEE+pQGxV73u2IhvfE+Bfrp6
	 r3VNJarL3pmDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400A46F641;
	Fri, 19 Jun 2026 09:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F95B367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E1F642DD9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCfPT7kOu2uz for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2715242DBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2715242DBE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7E4C81639; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3942975c49804cec7b2e5288cc9fba906dcafdc
X-Git-Newrev: 75ae191b5f8bbe7fc971283922bb6b356a5e0c4d
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.A7E4C81639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_iptables.py: use
 assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75ae191b5f8bbe7fc971283922bb6b356a5e0c4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_iptables.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 6e4db0ac06..72f2dd71a4 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -68,8 +68,7 @@ class TestIptables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # Save the current rules to test the init script later.
         self.assertRunOk("/etc/init.d/S35iptables save")
@@ -85,8 +84,7 @@ class TestIptables(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S35iptables start")
 
         # Ping to 127.0.0.2 is expected to fail again.
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # And flush the rules again.
         self.assertRunOk("/etc/init.d/S35iptables stop")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
