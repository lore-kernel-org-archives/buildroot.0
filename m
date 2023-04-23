Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4385DC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F2081A12;
	Sun, 23 Apr 2023 19:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F2081A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YomVxMIDONHQ; Sun, 23 Apr 2023 19:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3591181947;
	Sun, 23 Apr 2023 19:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3591181947
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA8051C2B1E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C15AE81947
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C15AE81947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8aSiQZ8CGUS for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 19:55:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 113CC81934
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 19:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 113CC81934
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1AD7844C7; Sun, 23 Apr 2023 19:55:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 21:53:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3e796b74e98171518cdf72920875264eb685988
X-Git-Newrev: 4f38b5dcbd09ae8eb73ff64741c1df0be3b1c0f7
X-Patchwork-Hint: ignore
Message-Id: <20230423195504.F1AD7844C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: complete the grammar fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f38b5dcbd09ae8eb73ff64741c1df0be3b1c0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a3e796b74e98 (utils/check-package: fix grammar) only partially
fixed the test-case (git commit --amend missed the test-case...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/utils/test_check_package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 0bea0902c8..9aa117d211 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -228,9 +228,9 @@ class TestCheckPackage(unittest.TestCase):
                            self.WITH_UTILS_IN_PATH, subdir_path)
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:0: Indent was expected to fail, did you fix the file and forgot to update .checkpackageignore_outdated?"
+        self.assertIn("{}:0: Indent was expected to fail, did you fix the file and forget to update .checkpackageignore_outdated?"
                       .format(subdir_file), w)
-        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fix the file and forgot to update "
+        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fix the file and forget to update "
                       ".checkpackageignore_outdated?"
                       .format(subdir_file), w)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
