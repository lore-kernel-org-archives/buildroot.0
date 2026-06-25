Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA0EC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465E1822E2;
	Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sciK_Qgephoh; Fri, 26 Jun 2026 14:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B3782317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485534;
	bh=Ts+Rv3ngHWejtGxRhdHAuBDlgLytaTNFHYSwK1BAOFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qx3dlXnUuai05V8brkgArNv0jOnD16qDA+004Ag5hGNRTiOQq/ea9VV4ZF7hqnzT7
	 j40G7jnK5j+qRkNke4sf5nghgTdmu82aT56KOWUBE+CwY3EoYTZZmUr49D5+vf/2mK
	 WvACiYvCdAUgfA5ocGGmwI0gZhXQJJT/e2n18cUbIeVZoTAFIPpAZZ3XZuM1YatIHW
	 BT6TNaun1EY0UceENmaNoxWCv5d5h2LVlqBRupA7DTidRvB9kBZvUhecofQfKvBh8w
	 ND2hoUjZoclWEE11XZRchE4Ok8UefKKO/W2RoHNaUwKRfnooJRk+MKDU2PgSh8ZpcC
	 9/KFzNTwWYrGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B3782317;
	Fri, 26 Jun 2026 14:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90290231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7656681063
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoOqEMNjRm8t for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691688101D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691688101D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D5C18649C; Fri, 26 Jun 2026 14:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:18 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3536c9de39f3df9e9c6a92e4114c603ec724c74d
X-Git-Newrev: 7c110848aa0b65bec849985b1376b44eadd6a182
X-Patchwork-Hint: ignore
Message-Id: <20260626145121.5D5C18649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_weston.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c110848aa0b65bec849985b1376b44eadd6a182
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ffa0905607e7b642b30bcc6bb54b5feb5426704)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_weston.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index c8b243a6a7..737015f8c4 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -150,5 +150,4 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
         # Now weston is supposed to be stopped,
         # a simple client is expected to fail.
-        _, exit_code = self.emulator.run("wayland-info")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("wayland-info")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
