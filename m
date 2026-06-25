Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C85AC43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A323402FF;
	Fri, 26 Jun 2026 14:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVCcULiAaeTY; Fri, 26 Jun 2026 14:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F2140F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485417;
	bh=tgUDq95wVW9AC6WrBvriCfGsqS9nMImbray8on5Zdwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oh2MVOr86wbq253baPTYd2Ix98zE1vDh+KLRJTffWS96EecQxZtB+qDVK+cOaCDEG
	 mB9Z0AcsMyU7/2+5NpNFsVmgFPvG8JE2THMS/lHyrB/VRkYvDNI00q5jkAKVs9HUUq
	 M1DEtPKGUlBF6YMsx+EzINY5uk1UygRX9e7laB2hnu/ikNioSH35VevML7PZq66zuE
	 rfUjTcG94Ebv1g/7VZKcHBKdmdUr+iYzYE/qffLYxqMXLCbzRyYglaZcIqnRAVzGyH
	 G5qWlCP3haA0mHwBFDUQBXoWQErT9ql5Eg0cUtVspa/uGuq+BXaUN8HV0GvpnMZJxh
	 fCQXnFL2belhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F2140F62;
	Fri, 26 Jun 2026 14:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E435E14A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D609D81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc5AMOA6K01i for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9838E821FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9838E821FC
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98F9F8649F; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f05b25d566f7bf75528f448ceae3813b671daf5
X-Git-Newrev: df353e4d2a5b3d5b995a560da09b809b1e99af9d
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.98F9F8649F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df353e4d2a5b3d5b995a560da09b809b1e99af9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
