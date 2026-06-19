Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D00CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08B7810C5;
	Fri, 19 Jun 2026 09:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd0N7R-BkL_7; Fri, 19 Jun 2026 09:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E6D984DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859931;
	bh=043RD9IeEbOAXtzOzqw/jxiHgfg5nH7Vy75mRMIOD/M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yn6LtsTCvwrC1qsO7Wg4IB1YikfB7QgSUzWwU8fWBK4lbPqf4FpEyv/O16+ocs+O1
	 0fhclzBNLrSSJgxUnNXqROmZbe9/eVbqUt2G7I4pWtqNUF02xZVi9818wQ+K6gJNDN
	 o3xsVRwLgTNY9i1axzqSdtNu/c6C4ZdRYElm0/sxYiYMPHV8667Su5XONvdkbgk49a
	 sMcNsxNdjumGHnIdzVUbg/4niur4O6XsB/HW0S/D490Gz+U3VXgfMXLQf4LMfyBqsg
	 cbOr51SAKBxE0Q/ZM2Asf7f00kthf57zWJ5tcP2MOpN6HTZpr3I7jLES+2j1h5kNTQ
	 IsXUbhmu5T58A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E6D984DA6;
	Fri, 19 Jun 2026 09:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB35367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B6B242DB0
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBdNi31Pi5tF for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73CA42DB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A73CA42DB8
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3234B814B8; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 382146eff4d9706614d0167702df1caa20927266
X-Git-Newrev: f8cfb5584505428207a5e5c4f61bb1f4fbfa0225
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.3234B814B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_rasdaemon.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8cfb5584505428207a5e5c4f61bb1f4fbfa0225
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_rasdaemon.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
index ec29f1785b..2ae6fd2c28 100644
--- a/support/testing/tests/package/test_rasdaemon.py
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -43,5 +43,4 @@ class TestRasdaemon(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S95rasdaemon restart")
         self.assertRunOk("pidof /usr/sbin/rasdaemon")
         self.assertRunOk("/etc/init.d/S95rasdaemon stop")
-        _, ret = self.emulator.run("pidof /usr/sbin/rasdaemon")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("pidof /usr/sbin/rasdaemon")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
