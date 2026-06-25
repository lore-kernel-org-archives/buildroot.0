Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E9C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEB382228;
	Fri, 26 Jun 2026 14:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZxrvT_3bRPd; Fri, 26 Jun 2026 14:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FAF8218C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485409;
	bh=CYL0PbaM67v25QbLAJKWsGwff9LrgSVi/Nv5YkxuDco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bGV0Lhuzo29iQveBl4aCcH+78anyGISAXCo1UZXuMx3+nPsTbsrgsPHUK2ezFFmV3
	 Vt4+0I+yCebjrO0iV4mHHWo43mQ2nmu9gluzailVTy3ROwVk0yp2CBb3/nc9E0c9mZ
	 FBcdy703bqjufbHXca9giXc1tloHtccArjw67syaWKLx4FQo0occAc3+eXdfiWTE/H
	 JEMjRH7mVzA9eq5cXgY2KgZgXZfCl3YrVDbOPcXBFu470/Y3Ne3NUWy86LhnVfbAt/
	 iFS4yfkPJIOkDYOlAQJXv6IkYqfnSCXPWJEG+NnXmoFAUUdY4gCb9oDHR+FBMm/Ink
	 cap1hWuLDaxYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FAF8218C;
	Fri, 26 Jun 2026 14:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17B6D231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0923081FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0yqsiSsWpk6 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E51BC8221C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E51BC8221C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E3A864A6; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 407e28d0d29b1707b9d1cc0813f89c8d6860ff13
X-Git-Newrev: a7241a9a55cc8a941b767b426bc4a673be3a3d41
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.E5E3A864A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_lsof.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7241a9a55cc8a941b767b426bc4a673be3a3d41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aae70a3ab5d25f192babf8ecd91416eee176c216)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
