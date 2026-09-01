Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B79C624D0
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0F980E66;
	Tue,  1 Sep 2026 19:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfCxBVI9TQTp; Tue,  1 Sep 2026 19:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788292135;
	bh=ESkn82h43/A7G6y0v5M7ODmaD/F9emdY7+C78MaG3oQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QsInmmLeb5ctAWgGLCzLjV9RSSc7ZVLGcVqNA/kTSVFvcWSMSOkXEMKvY8vQ9FzqF
	 Sm/Sq94Wrpy5Y7NwtPzEOX6RN2+R4rECGsC1SI9XKn85LacYindqfoGFTmmqULZgli
	 h4oxMNlFWctCbnO/3wiGgBCGeRtKBLYFQy12RFzuPsVDF021Jue5EQ2+qbxpZA5KuB
	 YwGeFcnTP463sLAl6tM5r8llqlsFjdGtiwKrOc93MTsrZs/Dk9loogEDy+ZVpO7n2V
	 YUN7FlWqH1Rlu9elmKHWu2v7voKT3SN5x5FFN59u4JxZ2Ek5WeL2TdHB92PbW09Ufp
	 aDEDVd1zj+9gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084A880E6A;
	Tue,  1 Sep 2026 19:48:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD99171E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE02C4026B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90GoFljft79z for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 234AD40265
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F00ED9356B; Tue,  1 Sep 2026 19:47:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 21:31:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45acb281caa9fa30799426ba7ef4694c0b61fa85
X-Git-Newrev: e56c6b32fdae124cf898ef823177ad7892b30538
X-Patchwork-Hint: ignore
Message-Id: <20260901194752.F00ED9356B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "support/testing: TestMdnsd:
 improve test reliability"
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e56c6b32fdae124cf898ef823177ad7892b30538
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The issue was reproduced in 2026.08-rc3 Gitlab-CI pipeline [1] despite
the fix applied.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555

This reverts commit b4b1de1f7f1865af25f5dc47beac06a37b929c4a.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 2637af7c12..214eea7dd9 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -1,5 +1,4 @@
 import os
-import time
 
 import infra.basetest
 
@@ -31,9 +30,6 @@ class TestMdnsd(infra.basetest.BRTest):
         # advertises the bundled _http._tcp service from /etc/mdns.d/.
         self.assertRunOk("pidof mdnsd")
 
-        # We wait for mdnsd to be ready...
-        time.sleep(1)
-
         # mdnsd only answers on multicast capable interfaces that are
         # up, so wait for eth0 to get its DHCP address before querying.
         cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
