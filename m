Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83548CDB46D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5403442DBE;
	Fri, 19 Jun 2026 09:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1p7gJ_na7xx; Fri, 19 Jun 2026 09:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A87E42DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859939;
	bh=TdfKKG6s40Ora5HNHHGEUyK4C//ze1vMlBnqQYomPTY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pk3wzY8lF5UkNXRNR77DcbJZXQ4GbAI+gzTdKWp5rVzCng4jy25AQIbNw8WHGc+hV
	 pxHJLsGn7a4N0ecDHHH22kb6AD7Ui33FvSDDWv44A9PMx4EFWKkF3kkenk1TglYGIZ
	 Vg9T/1goyCkGyjKAiCemqnNnotCEP7patPIpsnoqMHTE/0ZMjw09mFn6kkO5Ixzkit
	 VVfcdvG1osshFncWH5rQf5MUcSgI2v78vDAQ+oYv4yqUQXQyG6yB4nEB7UxEjhrJV6
	 YjNhWbj3f+Dnrz7lZ1bg5OsGACIEMRp7bjAkdkaZAjfF/RDQ7poJDZI/ZeCwWo6Rul
	 xHkaK7KVHZaXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A87E42DD6;
	Fri, 19 Jun 2026 09:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7A6367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BED942DF3
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ufYcmG1IG6I for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDEFB42DE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDEFB42DE9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49A8E81656; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50ed1540f3952bf090430fa358c626755ef28d59
X-Git-Newrev: 59d15f8ada3e14a056050a0d07b1a7fcc5d35f7b
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.49A8E81656@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_swipl.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59d15f8ada3e14a056050a0d07b1a7fcc5d35f7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_swipl.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
index 0f317bb617..4005e02e5b 100644
--- a/support/testing/tests/package/test_swipl.py
+++ b/support/testing/tests/package/test_swipl.py
@@ -27,8 +27,7 @@ class TestSWIPL(infra.basetest.BRTest):
 
         # Check swipl fails when goal is false.
         cmd = "swipl -g false"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Test output.
         string = "Hello Buildroot !"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
