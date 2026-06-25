Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B8FC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10D28126C;
	Fri, 26 Jun 2026 14:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeA4U3PJT75u; Fri, 26 Jun 2026 14:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6AB081275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485515;
	bh=MUZWJk0pfyU3LpEW3hg5FhmfMmKRvIRUJI227fu9DzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f60NMDc5jXjSdbcW2sM6nDJ4bGUPqEqyiTCfG8J8BbgM+pj+AzqzRovRQOjrVksSL
	 XVzV7cQDahJ1PtwlnrVHQ/FNICRp8mLoplEllrcfxKEyGaPo67qPIAYSv+snih9f8/
	 b8AGkOR8joNJYgdhEGDAYf2QZCIVzWRhXHHHOakxfFi7ri1BofVVydFDc3U+4a9T4d
	 XzUbmpV019c5aouVqqPuPjS04ohfdtSPEZgfyYejA+/4DT0wVDEpYmPE/gaXOs0ua1
	 jTI9+gvkqZB/bsIUDgrUPD7wbVvL+lD1sKlNBxhnBXIIMiUesduhe4Z9crj9LUjDUL
	 Vt5fS4bcm+FBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6AB081275;
	Fri, 26 Jun 2026 14:51:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D62C414A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D6760F99
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXbNfTqOx9z2 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B6260F83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B6260F83
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB0F38649C; Fri, 26 Jun 2026 14:51:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:54 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 170f87572f26fd363a06401ee897b8cbab20f786
X-Git-Newrev: 5bccec2779e49b3ba0be27f14e6aa4afa99aa01b
X-Patchwork-Hint: ignore
Message-Id: <20260626145112.EB0F38649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_dos2unix.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5bccec2779e49b3ba0be27f14e6aa4afa99aa01b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b1ea65f3a0eb433a70a9814eedd86d73650cf1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_dos2unix.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
index af5850ae3e..1c0ecf5967 100644
--- a/support/testing/tests/package/test_dos2unix.py
+++ b/support/testing/tests/package/test_dos2unix.py
@@ -32,8 +32,7 @@ class TestDos2Unix(infra.basetest.BRTest):
         self.assertRunOk("unix2dos -n original.txt dos.txt")
 
         # DOS file is expected to be different than the UNIX file
-        _, exit_code = self.emulator.run("cmp original.txt dos.txt")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("cmp original.txt dos.txt")
 
         # The "cat -A" command should print '^M$' for CR-LF
         self.assertRunOk("cat -A dos.txt | grep -Fq '^M$'")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
