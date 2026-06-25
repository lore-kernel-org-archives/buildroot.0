Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A50C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5DC8215C;
	Fri, 26 Jun 2026 14:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9uM1Fpj3sSF; Fri, 26 Jun 2026 14:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCC4821EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485398;
	bh=qiBuvHX+VKjCTfTkJHNwgPKgig3ohxLrEwRBplU41tM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o6eLXy3CtNnSb/lefyRDXrcy/zmQ5I031/mgubIL4i+qpJFLh1ruUTIta1Fpk6yT/
	 +elax2ddHBQs/EnHmYRRs8RZYR5XMq2YbTCO/dEglbw0PQ930wEEt7Y2riievsSYTT
	 9dvj1WKBf++EXol+qyrCxItddJtbV47BI/a6Jw/cmHBZ8z0oEAIlgYb6bzbxJSI5Ny
	 q6EkQUKDtuxUB698Uelmu6Iuk9512V8V1L3ZWcs9u+mLatLebuOmj0k+paP/VS+k8W
	 XZdnXsEfyx4TylVnm6bx1oozQy6DDGGgpYeGaztB7CLP20gS89td+B0/zUbDJjG/c9
	 m7mirMOW6he7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCCC4821EC;
	Fri, 26 Jun 2026 14:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D17E214A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B768260F25
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Os67hgIOAFXy for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E9960F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8E9960F27
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA980863D9; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:38:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7726966d8660245e8cce195cbbccd6ab06fc87c2
X-Git-Newrev: 407e28d0d29b1707b9d1cc0813f89c8d6860ff13
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.DA980863D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_libgpgme.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/407e28d0d29b1707b9d1cc0813f89c8d6860ff13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0b5a634f01acb6ebf402e61dfc02c8a03eba221)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
