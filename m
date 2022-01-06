Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82C4C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853EA428D2;
	Thu,  6 Jan 2022 09:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNB1C8ktT74c; Thu,  6 Jan 2022 09:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D357E428AC;
	Thu,  6 Jan 2022 09:29:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5641BF868
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C0940A08
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIVABD3ZT_ds for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:29:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA7640139
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:29:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C7BCE8343E; Thu,  6 Jan 2022 09:22:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 10:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dee09d36735c1e7c1dcf45fa2de620cc3532299
X-Git-Newrev: 007b5b483f2505c7af1f8b466b0f1b96e41d21fb
X-Patchwork-Hint: ignore
Message-Id: <20220106092256.C7BCE8343E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/download/sshd.py:
 fix flake8 warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=007b5b483f2505c7af1f8b466b0f1b96e41d21fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/testing/tests/download/sshd.py:50:28: E261 at least two spaces before inline comment
1     E261 at least two spaces before inline comment

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/download/sshd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/download/sshd.py b/support/testing/tests/download/sshd.py
index 3345f768cc..6555f0499f 100644
--- a/support/testing/tests/download/sshd.py
+++ b/support/testing/tests/download/sshd.py
@@ -47,7 +47,7 @@ class OpenSSHDaemon():
         server_keyfile = os.path.join(builddir, SSHD_KEY)
         auth_keys_file = os.path.join(builddir, SSH_AUTH_KEYS_FILE)
         daemon_cmd = [SSHD_PATH,
-                      "-D", # or use -ddd to debug
+                      "-D",  # or use -ddd to debug
                       "-e",
                       "-h", server_keyfile,
                       "-f", "/dev/null",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
