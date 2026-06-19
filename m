Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B281CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E401342DF3;
	Fri, 19 Jun 2026 09:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QB_bjDS4jX7; Fri, 19 Jun 2026 09:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBE242E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859927;
	bh=6PNVULjIsEErEpFzRcHAR6XTwjtDL82Nwn3RmDvmTlc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aag28g8aCMlVStv+t4tattETb+Z1euKZ+Ke0RPrwcZnynCV1fsATwf1Ek6OyI70cQ
	 pZPlFNlkGwTDwUYtw77k/zu8yU6J5a+mpogb4kqRnezq+pxQyqgPy2WT4Nye/JHYEe
	 ZJmaRw8IMq8Up6LqfI5zaIACim16lGeQ2Nc8LGuu9WPngpHyucvv23V/1CYiC1yk2c
	 wSWTMW3P01k0e+1nHGxmki1zZO70O7u77aNGrcf7nnNlhWXaDEDImv6B1Nl8mjZWSb
	 dOk9AtvuoQ4msBRQCRTM8huNMc5tJzpES0X9UvTn77VD54wiKoavdOoHo6TLVNt0OP
	 BFoZYetxvQXVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBE242E21;
	Fri, 19 Jun 2026 09:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 049C8367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E02142DD6
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqlquKsKf1na for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567D142DD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 567D142DD9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D660881645; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0b5a634f01acb6ebf402e61dfc02c8a03eba221
X-Git-Newrev: aae70a3ab5d25f192babf8ecd91416eee176c216
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.D660881645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_lsof.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aae70a3ab5d25f192babf8ecd91416eee176c216
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_lsof.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
index b0478dfbb7..336a951549 100644
--- a/support/testing/tests/package/test_lsof.py
+++ b/support/testing/tests/package/test_lsof.py
@@ -28,8 +28,7 @@ class TestLsof(infra.basetest.BRTest):
         self.assertRunOk("lsof")
 
         # Check lsof fails if requested file is not opened
-        _, exit_code = self.emulator.run("lsof {}".format(test_file))
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("lsof {}".format(test_file))
 
         # Open the test file from the shell on descriptor 10
         self.assertRunOk("exec 10> {}".format(test_file))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
