Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E1C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E825B81188;
	Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYYn4ob-xouG; Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1958580E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485511;
	bh=Ll5QCIiWeFB0By5VR1dIrlWcgzUyajDluHg5Se7jTw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nWnPWacF3fWUdsJLw6diPqUnt5mX4S60hcu3BHNvWh0J4Av4R7Bh2QWg9Lfzx8JHq
	 EP/u920VQMU9/BBnFBu6F+CNNy1HoBaNhc3d47NIE/U2mS0JlkPPWXh/uzcr6SjsEv
	 WM8s8m04soMzLgxtHZv5RGDNz9pDu2gcZrYVZsrUG4s/+KloEzTp0tsIgoUSTn80+M
	 77gHsAF9Na3OJtb06ELnjHTwCbLmcXEYWPu30buIfn7+AF345WmzQQF+w0bgxcqUaC
	 iBoJKqSB8RWAW4t2L1/gtI6KiSxj5WL9vOM+1DRoNJ3qNlg2v5cV3U77fw1ndc6KdE
	 5JcCFk9VGDaCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1958580E0D;
	Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F153A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71F4460F99
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBmMzHCU5-iY for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CBD60F61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68CBD60F61
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69175864B7; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4f342f960d3a32580df4b7c57dd8b9a5afdcffb5
X-Git-Newrev: 1035f0dfada0987ad31800e80903928b4f9b529a
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.69175864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_cryptsetup.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1035f0dfada0987ad31800e80903928b4f9b529a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 69948ba028f9da153b44d6004ee8ef94193a75bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_cryptsetup.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
index e409ea93e6..32a65210b5 100644
--- a/support/testing/tests/package/test_cryptsetup.py
+++ b/support/testing/tests/package/test_cryptsetup.py
@@ -65,8 +65,7 @@ class TestCryptSetup(infra.basetest.BRTest):
         # Check the device is NOT detected as a LUKS volume, because
         # it is not formatted yet.
         is_luks_cmd = f"cryptsetup isLuks {dev}"
-        _, ret = self.emulator.run(is_luks_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(is_luks_cmd)
 
         # Format the LUKS volume.
         cmd = f"echo {passkey} | cryptsetup luksFormat {dev}"
@@ -110,15 +109,13 @@ class TestCryptSetup(infra.basetest.BRTest):
 
         # We are NOT supposed to find our plain text message on the
         # encrypted storage device.
-        _, ret = self.emulator.run(f"grep -Fq '{msg}' {dev}", timeout=10)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"grep -Fq '{msg}' {dev}", timeout=10)
 
         # Try to open LUKS volume with a wrong password. This is
         # expected to fail.
         cmd = f"echo 'Wrong{passkey}' | "
         cmd += f"cryptsetup open --type luks {dev} {dm_name}"
-        _, ret = self.emulator.run(cmd, timeout=10)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd, timeout=10)
 
         # Check the device-mapper device was NOT created (since we
         # tried to open it with a wrong password).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
