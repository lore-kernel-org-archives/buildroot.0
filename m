Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D3FC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74C74104A;
	Fri, 26 Jun 2026 14:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkuB6nqnXIy1; Fri, 26 Jun 2026 14:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BDEF410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485517;
	bh=COY4tTzjhLpnNmtgsQz2BeprjuCcayAjbR4GmcxgezQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+sFspL1EzEbV+N/sH63a/RHhWimDAr11vhCPyA8Uu/NgqQ8epNK3lXgNpFPaJXUp
	 uYyUXUhhaG8NQE2yPNO08xYj+dz6xsDojKD71w2sH5HS2zzVwt63IU7Lwbd2sLfiYw
	 dNrazsIdN4EURa0pQVaAQw5zq4/sirnQI4xiunWVLt1imKv0OR9jjXeM1dNjx6ksQO
	 MuLa5+hBf/6IrTfEvZc1Bz4JCVi8aScZ5chkESL79NubfPehbeI3h1b2ECcwIy41xu
	 Hwhx5mlwwsbOOLAtFux782IVqXLPX+kB1X3K3Q02+pW6LheTAcRpyJWg+HpCHJnVn+
	 NiHiao651/ThQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDEF410B8;
	Fri, 26 Jun 2026 14:51:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04AA914A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF6FB60F83
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKQbf8ndAcgw for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E74760F8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E74760F8B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FE598649C; Fri, 26 Jun 2026 14:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:36:06 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 288b47d79bbe661c39ad605db332452fcf423204
X-Git-Newrev: 00055d4ea0a6015e253cac40281bb5ea36a7fc11
X-Patchwork-Hint: ignore
Message-Id: <20260626145113.1FE598649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00055d4ea0a6015e253cac40281bb5ea36a7fc11
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
