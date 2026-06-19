Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07525CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D247D42E03;
	Fri, 19 Jun 2026 09:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmgJ5BMaNNOm; Fri, 19 Jun 2026 09:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9842E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859924;
	bh=dVprshP+uMVHZwb70tGCnSccefHF/TwVwXQNa8g94IA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qc+RINMA/MCBr0PiyAY/l0gpVZtlZMHcN/MnTWK9pKmeG902i9n7jHyX1yIVBg5Wx
	 hgsuuyBb7ZKd4/Rhup42/Sz4cvvw9vK68bx8eFG2liSLkaj94ZmIZesncs9Ip0MwDm
	 5SnjS3GwBYOalpqJN63CxqAteYunoV1XNPL5VqjW6Lp5bSnZZEhXY4rPzE4oLWEhEm
	 CSQ+UnkC7lSBFOWoVVc207BRM3iZ3R+eJJHAwB90USW4lpe42ChPGmpxTlJ6lkUnLb
	 HofyzJTmJOzk4Vx80HkH0Ya9alcnH0KMAZWLZlmZnGG1W2+/v4279Qp2cD2sAAznY9
	 s6wcUnPhmfE7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B9842E08;
	Fri, 19 Jun 2026 09:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEB9D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D6C42DEA
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwdW_cFO_TtW for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC3342DBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC3342DBA
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B0F81639; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1d42e5d477ae3c5be3fe50490585243b05c5c8
X-Git-Newrev: cb791850ada782beca4b03e26356fd8506912d52
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.90B0F81639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_gnupg2.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb791850ada782beca4b03e26356fd8506912d52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_gnupg2.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 2b18f54fa3..6f862c31ce 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -49,8 +49,7 @@ class TestGnupg2(infra.basetest.BRTest):
         # Test a failed decrypt with a bad password
         cmd = "gpg --batch --decrypt"
         cmd += " --passphrase 'A-Bad-Password' {}".format(gpg_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Test the generation of an asymmetric key
         cmd = "gpg --batch --passphrase ''"
@@ -106,9 +105,7 @@ class TestGnupg2(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
         cmd = "gpg --verify {}".format(sig_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         cmd = "gpg --armor --verify {}".format(asc_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOK(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
