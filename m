Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 17:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C719260E4D;
	Mon, 20 Dec 2021 17:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njWlMUnmOcAq; Mon, 20 Dec 2021 17:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4384060E4A;
	Mon, 20 Dec 2021 17:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAF31BF418
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 17:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F205E4098E
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 17:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fn8n7-wLmGlf for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 17:56:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D96FC40966
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 17:56:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4794E826D2; Mon, 20 Dec 2021 17:51:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 18:56:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acc0d51c53d5da45fc0da725513cd0ab8a2d4107
X-Git-Newrev: 7a947133abd44eb297a63e2605b77658ca93ccc6
X-Patchwork-Hint: ignore
Message-Id: <20211220175118.4794E826D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_php_lua: fix flake8
 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a947133abd44eb297a63e2605b77658ca93ccc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/testing/tests/package/test_php_lua.py:35:1: E302 expected 2 blank lines, found 1

Add the missing line before class definition.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_php_lua.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_php_lua.py b/support/testing/tests/package/test_php_lua.py
index 2494c2bcdf..e3c57938fc 100644
--- a/support/testing/tests/package/test_php_lua.py
+++ b/support/testing/tests/package/test_php_lua.py
@@ -32,6 +32,7 @@ class TestPhpLuaLua(infra.basetest.BRTest):
         # bumping package version.
         self.assertEqual(output[2][0:25], "lua extension version => ")
 
+
 class TestPhpLuaLuajit(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
