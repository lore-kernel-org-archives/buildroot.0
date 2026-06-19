Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D330CDB46D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C0A84BE0;
	Fri, 19 Jun 2026 09:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT0PVdDC9gys; Fri, 19 Jun 2026 09:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B58084DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859925;
	bh=lFAu6B5SRmB5h4sVgd8xu3lCSQJL+zun0UopJS1Ax1Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UC4NXBERJkR6dW1xk6VehDr8UDLQsK1Qo40X5HV1syb9X05Y+5WSXH1QXqWlqBLIv
	 5QuHyqgEqvWAfCVYystNOv7XWjhortcWJF4nOQv5D8nJsLG0TnPeGMd8NOtFj013Mh
	 Zea8dudEo4XwLrT0RJFUvMNyv5jZ9RvWoCzC9thi4XuCx7+4lGYQCZkCiuZBNwCh8M
	 cWeDGWPW/tvd4Yu4PTtdAV9FFOTp0pIMRRjmLJ26ccdXugxk0y/J+NAt8eVM0gdigT
	 pnlV1E2W6R2/WrGfTLLl4u+YXpaTW/EE+qV9Vg85OqP5CIlwINZdTOgFT3aqYtl1Wq
	 KSpIsG3aoyR1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B58084DA3;
	Fri, 19 Jun 2026 09:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A24279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CC442DF2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjgvYosuGT2l for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E46842DD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E46842DD6
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE21681645; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cab36bc293e99c54adbc14857098202724210b0f
X-Git-Newrev: c566e5c6453ef60c0f710080ecb157d7557e0575
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.BE21681645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_kmod.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c566e5c6453ef60c0f710080ecb157d7557e0575
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_kmod.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 3c06589b2b..a88257ef57 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -73,8 +73,7 @@ class TestKmod(infra.basetest.BRTest):
         # With this test configuration, we are not supposed to have an
         # eth0 Ethernet interface yet. Attempting to show info on this
         # interface is expected to fail .
-        _, ret = self.emulator.run("ip link show dev eth0")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("ip link show dev eth0")
 
         # We try to load the module.
         self.assertRunOk("modprobe virtio-net")
@@ -101,5 +100,4 @@ class TestKmod(infra.basetest.BRTest):
 
         # Now the driver is unloaded, we should no longer be able to
         # ping the emulator.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
