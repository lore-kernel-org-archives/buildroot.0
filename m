Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535B6C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02B5282203;
	Fri, 26 Jun 2026 14:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tQXMBTVbLEb; Fri, 26 Jun 2026 14:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27439821FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485395;
	bh=eSwl6iqWwha45lNDfiJtICcaK50g+Bb1o1hYdFVd9rs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YS6WQ8jxMmUE/uBstBNSTX5nfON+vuH+kA3KPNRBQtVIKYfgGVP1RlfIvmUsjz5Ko
	 bWHK38J2HqVM9/+PBpe1kY4lTIk22oXpv9A74o5OxaKYTyodR2nQAUMIesR2tyzJkd
	 odfqatWi71SrOXVZZ4xF50iEMnuWF81+xhz/eYHynQgC4B9wnQxmHnC5eVouilQ+LO
	 w3/9S7nJ8BqOsyqJPBQgMr9QT497YkOD97WDuSJYNLtb5qOSqzQi2VrefYL4fxZ6Tm
	 j7dQKVcKEswlorUQrjZy04oZ7FnAGwFLmgxAxIz804JLGzQ6VsHG6a2yIDcIV3fqd0
	 L27pJfV+X153w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27439821FF;
	Fri, 26 Jun 2026 14:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6986314A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B92C60EFD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khQ2xaYtq23e for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC33260F25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC33260F25
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD1C5864B9; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:36:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a0e108a5873cc62859b1883fd85e034ab9f1771
X-Git-Newrev: a76f24d70bbcfee34888bd09ebb508db3e94871e
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.AD1C5864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_gnupg2.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a76f24d70bbcfee34888bd09ebb508db3e94871e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb791850ada782beca4b03e26356fd8506912d52)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
