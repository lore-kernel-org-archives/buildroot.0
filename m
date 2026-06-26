Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93438C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEE560F30;
	Fri, 26 Jun 2026 14:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQWdIYAQ4qHg; Fri, 26 Jun 2026 14:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B14960F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485586;
	bh=QcQQeyE+i/XnhtiFZ5kHzQwpVj03F/2lgvJwKPiTYJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OTqySbKQk4eBkE8+5/5nyeag6hLJbhtxtKadIm1WbOcLoOhMN9gh9RHyUSiCAr7eM
	 avcyxBnJWTh5G6qcvhwuLT1IScUMG7kAYLjM2IkQxivWigJ7U8LIqvmCvxKflF72C1
	 lkqCjGO+auCkk1+kQ69+dAzyf4FyhRRJ8B7oHore71eK9jQOSIm4rcr375t6ktTuoa
	 53j0+oL0YJmUBp1Q0b/CVR6tSJXD08pD4bTZ+xKXwzPj0algPdTdnmUvy0T02kERU1
	 voUj4s4l2/hh3NEUwI8NEYXd/8wFtkW3AJhD+vS6CjgIHQa+mT1KOef4+NTHJA0AH6
	 dJQ6w42d7Twjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B14960F35;
	Fri, 26 Jun 2026 14:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 808B93A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7225E81314
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWrsBuOs7unj for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 988218110E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 988218110E
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9825C86391; Fri, 26 Jun 2026 14:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:52:25 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: eb8932bdde86363403650a2c9b14a26e3f42b234
X-Git-Newrev: 6d8efb145e50432b1c8662939a35ecb3ad39e5fd
X-Patchwork-Hint: ignore
Message-Id: <20260626145238.9825C86391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_nftables.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d8efb145e50432b1c8662939a35ecb3ad39e5fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75ae817eb235c028a2747a501342372a5c0302dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_nftables.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
index 2622c7e822..62e14d5d35 100644
--- a/support/testing/tests/package/test_nftables.py
+++ b/support/testing/tests/package/test_nftables.py
@@ -69,8 +69,7 @@ class TestNftables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # We completely delete the table. This should also delete the
         # chain and the rule.
@@ -128,8 +127,7 @@ class TestNftablesInit(TestNftables):
         # should allow ping to 127.0.0.1, but not 127.0.0.2.
         ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
         self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
 
         # Stop should flush the rules, ping to both addresses should
         # work now.
@@ -140,5 +138,4 @@ class TestNftablesInit(TestNftables):
         # Start is essentially the same as reload, check that
         # 127.0.0.2 gets blocked again.
         self.assertRunOk("/etc/init.d/S35nftables start")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
