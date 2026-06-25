Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1A5C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05F0A40F45;
	Fri, 26 Jun 2026 14:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0yM-D17xYh8; Fri, 26 Jun 2026 14:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E20E40EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485411;
	bh=eoDUaOuO6J0n7e8RWUy7w4iIBm25E8X02yb6Umg54yc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Iu28tZq0xaj5D0W3Z4i2sB5zo3zDquigRd5Cuui+KWOshpAaqFvCYLCzv8ajBkZcV
	 c0epMCQTgml4q0x5K+jsdv913SWIa+q6ISCe6ndmU01Xru1rZtuhv6M5ZEmrK9BGWN
	 qFO8JoHn+EZSTzdF/r//BZYkKzuCZ2T1LonjuAF0Ez0tKTP6newkGE4nVmrpzpTTWR
	 bcHVwIL7Jbrn3t/zrZ+SfXD2Gqy0f0VH743UUJ24eo5vKxFUbIH9RU32/0g8d4ygr6
	 FdtmVBGDyy+eAf3s3vR+1VViFfKHs73cW0hWOM6kCdl9Qb/fpqe4+lqXdjQeuaO7v3
	 qvyf9S84WsPyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E20E40EF0;
	Fri, 26 Jun 2026 14:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CFD5231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE1081FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TnydxRFhowx for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF7F82191
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF7F82191
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D1B6864A8; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8efc2ef588ee2e22b86c8804d333f9d4652dc15d
X-Git-Newrev: 0a891269b963874eba0925fef84650ba47456421
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.5D1B6864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_audit.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a891269b963874eba0925fef84650ba47456421
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb0ef1fd987a6b599c03b3b99499b882867cb58f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_audit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
index f68a4b6831..722542a845 100644
--- a/support/testing/tests/package/test_audit.py
+++ b/support/testing/tests/package/test_audit.py
@@ -80,8 +80,7 @@ class TestAudit(infra.basetest.BRTest):
         # normal user. This command is expected to fail (as only root
         # can root is supposed to read this file).
         cmd = f"su - {user} -c 'cat /etc/shadow'"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Our last failed read attempt is supposed to have generated
         # an event. We check we can see it in the log.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
