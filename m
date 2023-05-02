Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB22AC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5681141744;
	Tue,  2 May 2023 07:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5681141744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57h-WThOl-aw; Tue,  2 May 2023 07:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFD841696;
	Tue,  2 May 2023 07:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CFD841696
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931261BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE4B40920
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE4B40920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKpzqo7tBEth for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 642C9408BA
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642C9408BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5467A856A9; Tue,  2 May 2023 07:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:30:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 904966909dbdeb835d22b41166eebfcbaa5b46cf
X-Git-Newrev: f1b72dd33d8c20657fac557c2d3179e58ec26d92
X-Patchwork-Hint: ignore
Message-Id: <20230502072850.5467A856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/check-package: fix
 grammar
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1b72dd33d8c20657fac557c2d3179e58ec26d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The past participle for "to fix" is "fix". The "did you forget" got
eluded into "forget", so again a past participle.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a3e796b74e98171518cdf72920875264eb685988)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/utils/test_check_package.py | 4 ++--
 utils/check-package                               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index d2c1556845..77f8208043 100644
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
index 46f2897b51..5974781104 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -246,7 +246,7 @@ def check_file_using_lib(fname):
 
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
