Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA01C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4817783300;
	Wed,  9 Feb 2022 21:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lyxf40sCbg4B; Wed,  9 Feb 2022 21:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888118318C;
	Wed,  9 Feb 2022 21:44:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5B01BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EC5832C7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g6n6ZLn5wm9G for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D378322E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AD1EC8323E; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35fb719b57ee5e4e872e954d8217cea2a833a6b2
X-Git-Newrev: 30cb3dfab2ffe0c69b95b0f29363613b38d1ba52
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.AD1EC8323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websocket-client: drop
 python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=30cb3dfab2ffe0c69b95b0f29363613b38d1ba52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-websocket-client/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
index 0fbb15b328..519e506615 100644
--- a/package/python-websocket-client/Config.in
+++ b/package/python-websocket-client/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
 	bool "python-websocket-client"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  WebSocket client for python. hybi13 is supported.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
