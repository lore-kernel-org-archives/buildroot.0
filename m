Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA7240243;
	Sun,  6 Feb 2022 17:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCL8hCILoEwl; Sun,  6 Feb 2022 17:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A624023D;
	Sun,  6 Feb 2022 17:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 436681BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CADE401A0
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLrjfBh3R3lT for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AD914014E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5513882C83; Sun,  6 Feb 2022 17:20:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 18:27:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d020368eeae5f85eb125788d07a7b013e13b34c2
X-Git-Newrev: 236e2343f39b0aeb6aa18be26c92a0dee7fd656e
X-Patchwork-Hint: ignore
Message-Id: <20220206172023.5513882C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: add shellcheck
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

commit: https://git.buildroot.net/buildroot/commit/?id=236e2343f39b0aeb6aa18be26c92a0dee7fd656e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow developers to run check-package for init scripts, that call
shellcheck, without having to install the tool.

Since the docker have a fixed version of the tool, there will be no
difference between runs in different machines.

One can call:
$ utils/docker-run utils/check-package package/package/S*
$ utils/docker-run shellcheck package/package/S*

This change also allows to eventually run check-package for init scripts
in the GitLab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 120e301b7c..f54c31b54a 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -45,6 +45,7 @@ RUN apt-get install -y --no-install-recommends \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
+        shellcheck \
         subversion \
         unzip \
         wget \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
