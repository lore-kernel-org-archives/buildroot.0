Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5B4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67603402E9;
	Sun,  6 Feb 2022 14:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVyMeUOLpxyQ; Sun,  6 Feb 2022 14:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD214028C;
	Sun,  6 Feb 2022 14:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 540001BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AFE4028C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkqcYM9tzDb4 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADDC40266
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6F4182BCD; Sun,  6 Feb 2022 14:28:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:35:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc254881e6dff16a9a4ff98ba981ca2a160e6483
X-Git-Newrev: a9061b7e689db1345afc863d9e60085dd2d83db8
X-Patchwork-Hint: ignore
Message-Id: <20220206142819.D6F4182BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: add python3-pytest
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9061b7e689db1345afc863d9e60085dd2d83db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... so the unit tests for check-package can run in the GitLab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 5ca087546e..120e301b7c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -41,6 +41,7 @@ RUN apt-get install -y --no-install-recommends \
         python3-flake8 \
         python3-nose2 \
         python3-pexpect \
+        python3-pytest \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
