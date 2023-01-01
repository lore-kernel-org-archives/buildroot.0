Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEE3C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512CE4086F;
	Sun,  1 Jan 2023 14:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512CE4086F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KpwA_50ruZY; Sun,  1 Jan 2023 14:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B71440673;
	Sun,  1 Jan 2023 14:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B71440673
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3204E1BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B51760BCC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B51760BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MdgK0gEAaq0S for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C9AA60A70
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9AA60A70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C31E86D10; Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 15:32:03 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: dcf8d650bc4427e5754ee165606895b9c7886702
X-Git-Newrev: 4da09740c69e406bcc1b3b5519d43e44109a52bf
X-Patchwork-Hint: ignore
Message-Id: <20230101143640.4C31E86D10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] support/testing: remove
 leftover kernel config fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=4da09740c69e406bcc1b3b5519d43e44109a52bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit 86d32208b62a (support/testing/tests/init/test_systemd.py: use
downloaded kernel) stopped building a custom kernel for the systemd
tests, but forgot to drop the associated kernel config fragment.

That fragment is now not used in any test case, so we can drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0627cb0e8a9e19d1ac19c1a72302b25ab7b938dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/binfmt-misc-kernel-fragment.config | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/testing/conf/binfmt-misc-kernel-fragment.config b/support/testing/conf/binfmt-misc-kernel-fragment.config
deleted file mode 100644
index 7c992ff71b..0000000000
--- a/support/testing/conf/binfmt-misc-kernel-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# Needed for binfmt_misc service: "Arbitrary Executable File Formats File System"
-CONFIG_BINFMT_MISC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
