Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C40C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 19:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6258440491;
	Sun, 12 Mar 2023 19:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6258440491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYM4738wlQ1U; Sun, 12 Mar 2023 19:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B63C404CC;
	Sun, 12 Mar 2023 19:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B63C404CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89DF61BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6492140453
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6492140453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hqt8ZjAKW7Sd for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 19:28:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9528640106
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 19:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9528640106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 815DD86FA5; Sun, 12 Mar 2023 19:28:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 20:27:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bcf9d2f51cd5c80191b63020412631a548e32a7d
X-Git-Newrev: 9c3cdee11a21380f8141ec4379f8a67dea4481a7
X-Patchwork-Hint: ignore
Message-Id: <20230312192833.815DD86FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_shadow.py: drop blank line at end of
 file
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c3cdee11a21380f8141ec4379f8a67dea4481a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

support/testing/tests/package/test_shadow.py:55:1: W391 blank line at end of file
1     W391 blank line at end of file
make: *** [Makefile:1253: check-flake8] Error 123

https://gitlab.com/buildroot.org/buildroot/-/jobs/3918132888

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_shadow.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_shadow.py b/support/testing/tests/package/test_shadow.py
index c5151b4fdb..09b580de59 100644
--- a/support/testing/tests/package/test_shadow.py
+++ b/support/testing/tests/package/test_shadow.py
@@ -52,4 +52,3 @@ class TestShadow(BRTest):
         self.assertRunOk(f'usermod {username} --home {new_home}')
         self.assertRunOk(f'test $(su {username} -c \'echo $HOME\') = {new_home}')
         self.assertRunOk(f'userdel {username}')
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
