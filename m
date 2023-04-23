Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0471C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DDF781B83;
	Sun, 23 Apr 2023 19:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DDF781B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHF1ICchWy_N; Sun, 23 Apr 2023 19:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 700088186B;
	Sun, 23 Apr 2023 19:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 700088186B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912AF1C2B1E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66D7860E7A
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D7860E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3G_fimcucEe2 for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 19:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F42560E44
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 19:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F42560E44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B5BD844B9; Sun, 23 Apr 2023 19:52:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 21:49:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d8212c4b29d00caf20a3036ced885a3260678ec
X-Git-Newrev: a3e796b74e98171518cdf72920875264eb685988
X-Patchwork-Hint: ignore
Message-Id: <20230423195218.7B5BD844B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: fix grammar
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3e796b74e98171518cdf72920875264eb685988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The past participle for "to fix" is "fix". The "did you forget" got
eluded into "forget", so again a past participle.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/utils/test_check_package.py | 4 ++--
 utils/check-package                               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 87382e07b0..0bea0902c8 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -228,9 +228,9 @@ class TestCheckPackage(unittest.TestCase):
                            self.WITH_UTILS_IN_PATH, subdir_path)
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:0: Indent was expected to fail, did you fixed the file and forgot to update .checkpackageignore_outdated?"
+        self.assertIn("{}:0: Indent was expected to fail, did you fix the file and forgot to update .checkpackageignore_outdated?"
                       .format(subdir_file), w)
-        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update "
+        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fix the file and forgot to update "
                       ".checkpackageignore_outdated?"
                       .format(subdir_file), w)
 
diff --git a/utils/check-package b/utils/check-package
index 9a345522b4..83b9750f5a 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -256,7 +256,7 @@ def check_file_using_lib(fname):
 
     for should_fail in xfail:
         if should_fail not in failed:
-            print("{}:0: {} was expected to fail, did you fixed the file and forgot to update {}?"
+            print("{}:0: {} was expected to fail, did you fix the file and forget to update {}?"
                   .format(fname, should_fail, flags.ignore_filename))
             nwarnings += 1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
