Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2212C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F02860D4E;
	Tue,  7 Feb 2023 09:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F02860D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyWh8tuJ6ian; Tue,  7 Feb 2023 09:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D712D60E1B;
	Tue,  7 Feb 2023 09:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D712D60E1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6396D1BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D46F81381
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D46F81381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdK_LX5L6Wne for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D1A081276
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1A081276
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CCCF83F78; Tue,  7 Feb 2023 09:06:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 10:06:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 588ccf38618e1d9401f6636c7565424d438a51b2
X-Git-Newrev: 63da115085ca0cb369ab3c644200ba4b025da48b
X-Patchwork-Hint: ignore
Message-Id: <20230207090641.4CCCF83F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_check_package.py:
 fix flake8 line length error
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

commit: https://git.buildroot.net/buildroot/commit/?id=63da115085ca0cb369ab3c644200ba4b025da48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d631615eb1b8 (support/testing: test check-package ignore list) added
a too long line causing the check-flake8 target to fail:

support/testing/tests/utils/test_check_package.py:233:133:
E501 line too long (138 > 132 characters)

https://gitlab.com/buildroot.org/buildroot/-/jobs/3726245521

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/utils/test_check_package.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index ce1998753c..580ad56d42 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -230,5 +230,6 @@ class TestCheckPackage(unittest.TestCase):
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:0: Indent was expected to fail, did you fixed the file and forgot to update .checkpackageignore_outdated?"
                       .format(subdir_file), w)
-        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update .checkpackageignore_outdated?"
+        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update "
+                      ".checkpackageignore_outdated?"
                       .format(subdir_file), w)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
