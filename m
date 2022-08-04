Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7318C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 544446118B;
	Thu,  4 Aug 2022 21:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544446118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0UaqtZkcyYL; Thu,  4 Aug 2022 21:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD5360E90;
	Thu,  4 Aug 2022 21:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD5360E90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9836B1BF842
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73CFA80D37
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CFA80D37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b2EQfrlixME for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 21:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F60980D2B
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 21:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F60980D2B
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2189186E6C; Thu,  4 Aug 2022 20:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 Aug 2022 23:05:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1500b7d5c818fb021eaa8741eec8130cbbf3477e
X-Git-Newrev: 466d65d73e38545252528a81c31632ba316c77fa
X-Patchwork-Hint: ignore
Message-Id: <20220804205515.2189186E6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: enhance reporting error about
 empty VARS
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

commit: https://git.buildroot.net/buildroot/commit/?id=466d65d73e38545252528a81c31632ba316c77fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

USe $(error) to simplify the code (drop "exit 1") and sned the message
to stderr.

Reported-by: David Laight <David.Laight@ACULAB.COM>
Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 14b7ecd475..36a5741e7b 100644
--- a/Makefile
+++ b/Makefile
@@ -1059,8 +1059,7 @@ endif
 .PHONY: printvars
 printvars:
 ifndef VARS
-	@echo "Please pass a non-empty VARS to 'make printvars'"
-	@exit 1
+	$(error Please pass a non-empty VARS to 'make printvars')
 endif
 	@:
 	$(foreach V, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
