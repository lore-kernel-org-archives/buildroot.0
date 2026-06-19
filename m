Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B6ACDB46C
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C314B42DB8;
	Fri, 19 Jun 2026 09:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjPb2nuvfaHC; Fri, 19 Jun 2026 09:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D235642DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859920;
	bh=/VyiPzcoezfrdAj2B6P4U64vB8Uw6CKb1GoxUlYgVBA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rme67SH/z5KYdUmtNMgTdQp5WgTvyMa1VoBtwUNhpfSdIjxPGUXToratmNWdE4/E4
	 gUEXwxAyPRK0VjiXluISAXFD1yw3qcv15u7Z7d7Sdybs0HvqzaS9iR2lI+ez/Gkb1c
	 rPut9LUzXWPPOzVB2vSKOrTY3BKqd+2TY3nAENKGOANWXIJ7EOqA0nRMuwJisxJ8Px
	 XaINXOXtlfGfKlC4S1SY8dRAbHtEPTk0Gs0AaBVM0W4EYtIVfTNbWYt+B4K1j+SQpS
	 iDUMydGLDO2F8RYKKs8FAOEd9LTe6M2cX1LUph3bQOaTZiFWxPz6XQXZwBGhjnaXVu
	 fMMDMayIXUC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D235642DDB;
	Fri, 19 Jun 2026 09:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF6D279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D12542DB2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lffSzzi2sv0u for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC49E42DB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC49E42DB8
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7797381639; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7284778a130e123cc9c1a3705b5da0a2f9a767d
X-Git-Newrev: 0b1ea65f3a0eb433a70a9814eedd86d73650cf1a
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.7797381639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_dos2unix.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b1ea65f3a0eb433a70a9814eedd86d73650cf1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
