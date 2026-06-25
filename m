Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287B7C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F391F4118E;
	Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efp77EcYe3fH; Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B11E41196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485536;
	bh=AxaCaf4/cufAXnV3aqYGbgESaw/6ubEq9eIBRKt6plM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F05byUJyAdWX7TzxLd/myhqMKdre+mtToJdavq8Aqd8K6lVIiL6suLbOK15KWpvlJ
	 GY2mgESgi+R+3iirppnpVwAzte+wCDmu4EER0w5e8aPak3JUxp3+VM5EoTIkJEoBRJ
	 XIgdvVcyfcs3QnYGhXPKEi3MB3UvAPHQTdPKAOvpt6Gmr16fF/bzi9qYTkC8ncGjNb
	 CJV1w90FA37jFbVDSyvsrwvaZrxVkQFFLxiicx8NbKGIubaXrvEkmoc8Mygpf5+Zqr
	 Gflt+h7l8PyCEAL6hQWoHGyD1w+WzCcMsBMb/EcaIxjbFbBMgh1WMYAc/7/Eg8alYF
	 OcI9uEDTa0dOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B11E41196;
	Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 007763A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6AC1810AD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAOpQqntZF3I for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD56781063
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD56781063
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1D33847A3; Fri, 26 Jun 2026 14:51:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 7c110848aa0b65bec849985b1376b44eadd6a182
X-Git-Newrev: dbe1e0f6ca99379a221757004e5b7163fb995276
X-Patchwork-Hint: ignore
Message-Id: <20260626145122.B1D33847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_which.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbe1e0f6ca99379a221757004e5b7163fb995276
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f39a9ba291db640ec5171fb9a14b1ff7c69d186)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_which.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
index 38f528aa7f..05ed56ccb4 100644
--- a/support/testing/tests/package/test_which.py
+++ b/support/testing/tests/package/test_which.py
@@ -33,8 +33,7 @@ class TestWhich(infra.basetest.BRTest):
 
         # We check "which" returns an error when the program is not
         # found.
-        _, ret = self.emulator.run(f"which {alias_name}")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"which {alias_name}")
 
         # We define a shell alias.
         alias_cmd = "/bin/true"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
