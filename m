Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C351C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64DC3403FC;
	Mon, 15 Jul 2024 14:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJEp7FQVpMpg; Mon, 15 Jul 2024 14:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2672F40918
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2672F40918;
	Mon, 15 Jul 2024 14:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24CAF1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121AC60823
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW2xabIVrPxA for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417FF60838
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 417FF60838
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:51:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BADF86D21; Mon, 15 Jul 2024 14:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:49:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ba1fa13e43cc67869f0319cdc95db53f289b9ea
X-Git-Newrev: 9b843284d2196fc345b7415efb7336487f7894e7
X-Patchwork-Hint: ignore
Message-Id: <20240715145108.3BADF86D21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix
 package/test_s6_networking.py
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b843284d2196fc345b7415efb7336487f7894e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test fails with the following error

  -sh: s6-tcpserver4: not found

In release 2.6.0.0 of s6-networking the `s6-tcpserver4` was unified into
a new `s6-tcpserver` command[1].

[1] https://github.com/skarnet/s6-networking/blob/master/NEWS#L33

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_s6_networking.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_s6_networking.py b/support/testing/tests/package/test_s6_networking.py
index 1fe1b81668..bbbaefdf94 100644
--- a/support/testing/tests/package/test_s6_networking.py
+++ b/support/testing/tests/package/test_s6_networking.py
@@ -28,7 +28,7 @@ class TestS6Networking(infra.basetest.BRTest):
         self.assertEqual(output[1][0:5], "after")
 
         # Test the TCP server and client
-        _, exit_code = self.emulator.run("s6-tcpserver4 127.0.0.1 1024 cat &")
+        _, exit_code = self.emulator.run("s6-tcpserver 127.0.0.1 1024 cat &")
         self.emulator.run("sleep 2")
         cmd = "echo foobar | s6-tcpclient 127.0.0.1 1024 s6-ioconnect -67"
         output, exit_code = self.emulator.run(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
