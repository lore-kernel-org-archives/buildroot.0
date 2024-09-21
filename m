Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82F0CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C5C4246C;
	Sat, 21 Sep 2024 18:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 076gsllhnIRJ; Sat, 21 Sep 2024 18:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFF2042479
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF2042479;
	Sat, 21 Sep 2024 18:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACA071BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E0CB606E5
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPPaYS4yOu1j for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102A6606EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102A6606EA
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2A158353B; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68316831e478417066ff7515774ef0aeda2bb6a3
X-Git-Newrev: 28c56bc26f2c8b4cbeb8124178b349b1bf5b6f57
X-Patchwork-Hint: ignore
Message-Id: <20240921184812.F2A158353B@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_cryptsetup.py: fix 'encrypted' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=28c56bc26f2c8b4cbeb8124178b349b1bf5b6f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_cryptsetup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
index 759dfd7c5f..e409ea93e6 100644
--- a/support/testing/tests/package/test_cryptsetup.py
+++ b/support/testing/tests/package/test_cryptsetup.py
@@ -109,7 +109,7 @@ class TestCryptSetup(infra.basetest.BRTest):
         self.assertRunOk(f"cryptsetup close {dm_name}")
 
         # We are NOT supposed to find our plain text message on the
-        # crypted storage device.
+        # encrypted storage device.
         _, ret = self.emulator.run(f"grep -Fq '{msg}' {dev}", timeout=10)
         self.assertNotEqual(ret, 0)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
