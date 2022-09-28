Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D4C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 722CF40CE3;
	Wed, 28 Sep 2022 21:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722CF40CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYsrrCSIR6tI; Wed, 28 Sep 2022 21:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9445D40CCA;
	Wed, 28 Sep 2022 21:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9445D40CCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E93AC1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D010080D2A
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D010080D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48e6_SfzizKY for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15DCA80D4D
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DCA80D4D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06BD986439; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:23:44 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: becebebe7c8cc69966f119c7abc71db607cf7ec0
X-Git-Newrev: 7d4ee97a6299499f9810b22042ee91251e7ba5b9
X-Patchwork-Hint: ignore
Message-Id: <20220928212329.06BD986439@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/test-pkg: show
 default build dir in help test
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d4ee97a6299499f9810b22042ee91251e7ba5b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Avoid the "Where did it put my builds?" step.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ca9fbfd5eeab5ecd63b9e2a0ee882723105ba706)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index ce6e43b965..4ebfd9af66 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -257,6 +257,7 @@ Options:
 
     -d DIR, --build-dir DIR
         Do the builds in directory DIR, one sub-dir per toolchain.
+        If not specified, defaults to \${HOME}/br-test-pkg
 
     -p PKG, --package PKG
         Test-build the package PKG, by running 'make PKG'; if not specified,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
