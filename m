Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B35CDB466
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCEFE6F5FE;
	Fri, 19 Jun 2026 09:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSTaMZ7KiTpU; Fri, 19 Jun 2026 09:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1456F612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859919;
	bh=Oc5Ce0W3XiN+Rn7zFqppUfjVuS2dYX3+Ml0DV6fOwok=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TXZTov9K51ax7dG+RXkQ2CwcB/GC/xfdNX1hVWT703w25hPNzgkgVbtXYDGoyMX4T
	 /nT34+Dc05uhYINluROCpSyOQLtX9afbvV6XEjeQiWF8DNYCneb/V3e6pTaoLRF3eK
	 NMLnj3zIfL+DvA09hff4sBc3uTO9vxqAcH1lko/9M559jKjQ7Ew8LfDwX3iblYMTId
	 +6bnhHti9978dW52Lhtgj2kyK9ddIddQQWUr6Q9Zn0UbtYRLg8lnCgZ7CwpBHODump
	 Mm6Hd1i51Ap29ph4JQpJTzozgrcg9h/1OoCYmGRBTU9RIdiFvNsJLg7rGiTYUBVv6+
	 xnzQOWlNRRwUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1456F612;
	Fri, 19 Jun 2026 09:05:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1315279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A756F57B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ophpHmt2Ab0e for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94DB6F5F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C94DB6F5F9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54F0181666; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59d15f8ada3e14a056050a0d07b1a7fcc5d35f7b
X-Git-Newrev: 6e04f8f21f2770d5e2205f4afa44831d23e05982
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.54F0181666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_usbip.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e04f8f21f2770d5e2205f4afa44831d23e05982
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_usbip.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index da94d6f92c..2fae8f7f6a 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -56,8 +56,7 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is not running yet. Listing remote devices is
         # expected to fail.
-        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("usbip list --remote=127.0.0.1")
 
         # We start the USBIP daemon.
         self.assertRunOk("usbipd -D")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
