Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD31418A7;
	Thu, 17 Mar 2022 12:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJA5wxZhsA5d; Thu, 17 Mar 2022 12:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC6B41754;
	Thu, 17 Mar 2022 12:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C623A1C1135
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DB54046A
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50PK3oo39ArL for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC02940136
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 501DC8439A; Thu, 17 Mar 2022 12:11:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 13:12:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ead853e5b7c8371c65f32bcaf0507ab5cc05af6a
X-Git-Newrev: 56c9ec58d08cbe88f421c69e7e658e374f92c8cf
X-Patchwork-Hint: ignore
Message-Id: <20220317121107.501DC8439A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-engine:
 remove unused sqlite
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

commit: https://git.buildroot.net/buildroot/commit/?id=56c9ec58d08cbe88f421c69e7e658e374f92c8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Dependency on sqlite has been removed since v17.04.0-ce.

See: https://github.com/moby/moby/pull/30208

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6105ad3f72fcb98a7d9aba543c6bb7311827c1d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 4fa3b5a8c3..e99b2504c5 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
-	select BR2_PACKAGE_SQLITE # runtime dependency
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
