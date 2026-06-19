Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1289DCDB466
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E6484D33;
	Fri, 19 Jun 2026 09:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjKhKQxSmlLs; Fri, 19 Jun 2026 09:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B4684D73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859928;
	bh=HRToZk4++c0OQcjHexhdJ8AeloiXqhJm+2quEc1PHE8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IJO0V2XYouRZlM/XuCZ4xzKbzLHPd2DsJI+LjYNQC8aTMj0s8PgPJRXEd/llBCYG1
	 3pF3aEP/4sMpyZNGd96F+a9GyoTvRO7kOHjh9OMwHsWlsJrNAxGHd7IdeRPpjnROwb
	 lwxoc1yF1O6gYQ4tmxMPF9ymFfLvhflFGsi0JoO6dVjF33XV9Fm10RQDNWgciADBVB
	 W9qSTCHD4p+ewySyP8wRO4ngqH5vcefksZQNxeuiybc9lLwL7IM/cYwhqVaEIVxIxX
	 8tgLdCrIpn/9HOLwdl8IbxoIXvrSu3TzyF7tKiXSl2gaUrikazWN0AyE0iuEU4Hglq
	 f0Omz1Zi6wjhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B4684D73;
	Fri, 19 Jun 2026 09:05:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B0CD06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28C7684C32
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6XJ0BKwEbJq for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B31584C72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B31584C72
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAEB081639; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c566e5c6453ef60c0f710080ecb157d7557e0575
X-Git-Newrev: a0b5a634f01acb6ebf402e61dfc02c8a03eba221
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.CAEB081639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_libgpgme.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0b5a634f01acb6ebf402e61dfc02c8a03eba221
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_libgpgme.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
index b497891249..5d0ee34aa6 100644
--- a/support/testing/tests/package/test_libgpgme.py
+++ b/support/testing/tests/package/test_libgpgme.py
@@ -31,8 +31,7 @@ class TestLibGpgme(infra.basetest.BRTest):
         # We did not create a gpg key yet. We should not be able to
         # list our key.
         gpgme_listkey = f"echo LISTKEYS | gpgme-tool | grep '{gpg_userid}'"
-        _, exit_code = self.emulator.run(gpgme_listkey)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(gpgme_listkey)
 
         # We now create our gpg key.
         cmd = "gpg --batch --passphrase ''"
@@ -66,8 +65,7 @@ class TestLibGpgme(infra.basetest.BRTest):
 
         # The output encrypted file is also expected to be different
         # from the input plain text file.
-        _, exit_code = self.emulator.run(f"cmp {plain_file} {enc_file}")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(f"cmp {plain_file} {enc_file}")
 
         # We now decrypt the encrypted file using gpgme-tool commands.
         gpgme_dec_cmds = [
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
