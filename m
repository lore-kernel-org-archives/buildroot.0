Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D0BCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD25C4057B;
	Sat, 12 Oct 2024 14:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-f7yRRv8LPS; Sat, 12 Oct 2024 14:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A548C415B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A548C415B5;
	Sat, 12 Oct 2024 14:04:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 584101BF8B4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6104760623
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcNJYUHpLgEQ for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770B960624
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 770B960624
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 729F885C7F; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:57:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 933c693f5a3106e9c8783fa58d753475ae9ea6ee
X-Git-Newrev: 8d760c3d102f8cc92e8f195d3bbe74e580e774f2
X-Patchwork-Hint: ignore
Message-Id: <20241012140334.729F885C7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/tests/package/test_bash.py: fix 'running' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d760c3d102f8cc92e8f195d3bbe74e580e774f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c62de54852239da4e74fc1a3d23e60cdfd296751)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_bash.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
index f0ee8cadc1..7ec6e85ef9 100644
--- a/support/testing/tests/package/test_bash.py
+++ b/support/testing/tests/package/test_bash.py
@@ -28,7 +28,7 @@ class TestBash(infra.basetest.BRTest):
         self.assertEqual(out[0], "", "Already running bash instead of busybox' sh")
 
         self.assertRunOk("bash -il")
-        # Twist! The above command is still runing, it's just that
+        # Twist! The above command is still running, it's just that
         # bash did display the prompt we expect. Check we are indeed
         # actually bash
         out, _ = self.emulator.run('echo "${BASH}"')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
