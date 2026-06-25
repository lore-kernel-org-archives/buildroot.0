Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E85C44500
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09CC160F72;
	Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLizPu7moyPp; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0222060FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485509;
	bh=J8nDNANjAxCoNRS0jxXObe5225dyHcGpvWPQA74xbg8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jaXVb2MkgOh1qE9aEwojDRnt/ZHELCkL+ekvNz9V3bBBJsEvlXVB2n+MruCAEFnWf
	 /lViwj9htfkqqNpUcHwmSxrOG7/Il9rJ2O9GGzbtaonfaxUdpxIZNWD0zn5oHBhZG7
	 Iphtrxib4hsP1QG6bIr/jXaq+lL9vYto/U3FNF0pPN29Tb09UKZDzPcJvq0U5In9RK
	 lrxJXGXAbysUScXm/B59nPzgTE7tFdS3rJLuKwR92kUz1bd1NSXhGnxyYKBFHykI9l
	 C93uig14tVfa7H8mNDM8D0+IMXRvaAwUZ2b6AWQiOtKo55gq2qcfABKa+uXKNswRiu
	 +Vb3Wo9LawkOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0222060FA7;
	Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E7B14A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC4EE4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unnZmNIs5PIV for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4870540702
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4870540702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CCA6864B7; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:21 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6d480610fa86e6914d2a968ae060d08d500165c1
X-Git-Newrev: 45f26d60a9e1b08beb57d4f4001d50fbf3d639a9
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.3CCA6864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45f26d60a9e1b08beb57d4f4001d50fbf3d639a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
