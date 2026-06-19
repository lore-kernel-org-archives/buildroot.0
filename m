Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFAACD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8442C42DB0;
	Fri, 19 Jun 2026 09:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ApekSBSsqm2; Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9FEB42DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859917;
	bh=NhA/ZkvDAHpFOqs6NL32cn47qKQsn/N6P+qZyjKadK4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EmM8xAkmbN5DgaWTTj0FAKhWSvWfKQLW+LU3gyjc6raP85XjFGx5OZvxyjYp006xc
	 ddk/SMSfjCsvHC9jIYMqWnndXEyEwCBjVzcgbBOe9KN5gfc5Zk5z2FtLhBY1/aRn6N
	 LdsFzBrubZ0XQxRRzKru564+WzH024Hq6ICvjUt/R137YjG6McXdWt+4qvfai+HKAn
	 2wVZsrjSTMEdCUKZxvCKpCwW2vZYPHrVa+vrd0IAbjQmRwplaI9hMUlz+rFCOC8nUY
	 cRzgExpO7DUpQsbCY+5INltC9J1iScEr5teuGGcq6LAoPuZSN8lAaVrz6koKCymCbF
	 +4DLK3aLFVKow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9FEB42DFE;
	Fri, 19 Jun 2026 09:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 202AA367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 876F442DDB
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XalQcYGC8_fW for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D422A42DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D422A42DB2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FEB681639; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2889d0f05277cf22fe10268026aa2f551739e2a9
X-Git-Newrev: 69948ba028f9da153b44d6004ee8ef94193a75bc
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.5FEB681639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_cryptsetup.py: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69948ba028f9da153b44d6004ee8ef94193a75bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
