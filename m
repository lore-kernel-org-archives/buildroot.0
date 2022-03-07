Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66C8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818B760EAD;
	Mon,  7 Mar 2022 20:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHTQnyLIfvw7; Mon,  7 Mar 2022 20:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C1F60B38;
	Mon,  7 Mar 2022 20:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A92B11BF2B9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 973AE404A9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeaINd5NHhTa for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:02:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8FD640364
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:02:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C4348103D; Mon,  7 Mar 2022 19:53:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 21:01:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e33e5908086a511294296f317f6e6f86fa84b1d
X-Git-Newrev: 6105ad3f72fcb98a7d9aba543c6bb7311827c1d4
X-Patchwork-Hint: ignore
Message-Id: <20220307195347.0C4348103D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: remove unused sqlite
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

commit: https://git.buildroot.net/buildroot/commit/?id=6105ad3f72fcb98a7d9aba543c6bb7311827c1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependency on sqlite has been removed since v17.04.0-ce.

See: https://github.com/moby/moby/pull/30208

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 911cbfe428..1f0efb8fcc 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
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
