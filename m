Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538E0C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C583E80;
	Wed,  4 May 2022 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCoVsGGN1J6Y; Wed,  4 May 2022 20:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 234F1833A8;
	Wed,  4 May 2022 20:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD4051BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5DF60D88
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GQi7e5Wd4ON for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 20:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D44060D74
 for <buildroot@buildroot.org>; Wed,  4 May 2022 20:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A2A41857AF; Wed,  4 May 2022 19:51:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 May 2022 22:01:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4723bb9bd050729f7830bfb9da5695c343cfded
X-Git-Newrev: 1264dd50ef6fc563558f03c4fe39e1e21f9a88bd
X-Patchwork-Hint: ignore
Message-Id: <20220504195157.A2A41857AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_octave.py: fix flake8 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=1264dd50ef6fc563558f03c4fe39e1e21f9a88bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
support/testing/tests/package/test_octave.py:46:31: W605 invalid escape sequence '\ '

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_octave.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 31d0105503..82a70e09c2 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -43,7 +43,7 @@ class TestOctave(infra.basetest.BRTest):
         # Solve equation system example from Octave homepage
         octave_expr = "b = [4; 9; 2]; "
         octave_expr += "A = [ 3 4 5; 1 3 1; 3 5 9 ]; "
-        octave_expr += "x = A \ b; "
+        octave_expr += "x = A \\ b; "
         octave_expr += "assert(x, [-1.5; 4; -1.5], 1e-10)"
         cmd = self.octave_cmd(octave_expr)
         self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
