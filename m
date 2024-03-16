Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C72C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95FB2415A2;
	Sat, 16 Mar 2024 22:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_JUNJ0shfFh; Sat, 16 Mar 2024 22:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A8C415D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A8C415D5;
	Sat, 16 Mar 2024 22:34:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 297781BF861
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2246860769
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 243il7MYFToS for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4749E60674
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4749E60674
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35126825BA; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:26:15 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 2b04b6a5b3b6bfe7fe76818fb2f651b988072b50
X-Git-Newrev: c2e76bae82e8d1dbd0aae891a7d4369e43679a07
X-Patchwork-Hint: ignore
Message-Id: <20240316223440.35126825BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] support/testing:
 TestCheckPackage: update expected strings
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2e76bae82e8d1dbd0aae891a7d4369e43679a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit dfed5acb56 ("utils/check-package: use https for the manual URL")
replaced the default url to the Buildroot manual while it was used
by TestCheckPackage test.

Update TestCheckPackage with https url.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243484

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a9990552eb8b88647104bbec82555b2c407aa6be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/utils/test_check_package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 9aa117d211..2125b34170 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -200,13 +200,13 @@ class TestCheckPackage(unittest.TestCase):
                            self.WITH_UTILS_IN_PATH, abs_path)
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
+        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
 
         w, m = call_script(["check-package", "-b", abs_file],
                            self.WITH_UTILS_IN_PATH, infra.basepath())
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
+        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
 
         # br2-external with ignore list
         topdir_path = infra.filepath("tests/utils/br2-external")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
