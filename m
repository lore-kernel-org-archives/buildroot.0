Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2DEC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B308941180;
	Fri, 26 Jun 2026 14:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLRHRj9bV9ev; Fri, 26 Jun 2026 14:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8C114115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485529;
	bh=TiID01khpThPxqAuiC+6SiF6RuD9Vz553PoR+kagH/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jUmF9VPrAPQQ7MgpUKjRRkB8ZciOoszs+jEDoYm0Whtb9ZYtbrifGt8PJTAreqdWw
	 q93eKGlpu1uRxzixdo7Bb48tXW3sfGkRqEVEnlp1vPzvGzMblqzAFbjtfuDGgfbqgj
	 a/rpfE43jYfUeHcn7JO7zKSgVgEJgO3PB5IwqewUhjjeeA0//j/J3wDIPyc+5WabBc
	 /7ETh2uUPHrh+aAsgSVl0UeesY5tbz9d/nSXoWDZH3NR2dthdQSc4AB8qbw3/MpxeN
	 giJv3yOF00s8qUUSK/vEKTF3uC1O+F7eZUT6A3Jt1RHjBoO+eP/7khcj6539dh/yGv
	 TzURZ6nAylTNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C114115A;
	Fri, 26 Jun 2026 14:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEF3214A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0DAD6060D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XbHl_OjplSd for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBED60FBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBED60FBF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0B86864B9; Fri, 26 Jun 2026 14:51:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:40:06 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: aef386b2811eeaa83cb1b7b961b05c9eff8d265b
X-Git-Newrev: 6f44e2660c486f64814b2f220b18a7c9ddce55c4
X-Patchwork-Hint: ignore
Message-Id: <20260626145118.E0B86864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_rasdaemon.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f44e2660c486f64814b2f220b18a7c9ddce55c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f8cfb5584505428207a5e5c4f61bb1f4fbfa0225)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
