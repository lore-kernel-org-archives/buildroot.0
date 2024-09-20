Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC9C78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8341D42BB5;
	Fri, 20 Sep 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGSes3lg3Wxy; Fri, 20 Sep 2024 10:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0329C42C94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0329C42C94;
	Fri, 20 Sep 2024 10:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0BE41BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BEA184C31
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g3bKaJoilFl for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A13884C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A13884C41
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85D6E82386; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:34:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5067cd99cc13a5b582092b148ab0bbbdcc625a85
X-Git-Newrev: b422e8ffba5d12a0ad5dd2bcb49b929bd5af71fa
X-Patchwork-Hint: ignore
Message-Id: <20240920103452.85D6E82386@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nload: fix
 transferred typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=b422e8ffba5d12a0ad5dd2bcb49b929bd5af71fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7281269982a063b800e289b50ccabe8b25a47243)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nload/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nload/Config.in b/package/nload/Config.in
index c938d8eae8..6c2cab7fe4 100644
--- a/package/nload/Config.in
+++ b/package/nload/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NLOAD
 	  nload is a console application which monitors network traffic
 	  and bandwidth usage in real time. It visualizes the in- and
 	  outgoing traffic using two graphs and provides additional info
-	  like total amount of transfered data and min/max network
+	  like total amount of transferred data and min/max network
 	  usage.
 
 	  http://www.roland-riegel.de/nload/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
