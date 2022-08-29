Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CA4ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF7E160F57;
	Mon, 29 Aug 2022 11:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7E160F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5L8wfUPARif; Mon, 29 Aug 2022 11:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E671560AF4;
	Mon, 29 Aug 2022 11:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E671560AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2249C1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793E940C1D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 793E940C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VA1WBXF6SDyT for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 902BC40C31
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902BC40C31
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 884EB87F55; Mon, 29 Aug 2022 11:21:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:15:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 05f18fd04d9d5e622f1960b0c4845aa75b6a84e7
X-Git-Newrev: 774e310383bc16f1918302693be57bbddaf780ac
X-Patchwork-Hint: ignore
Message-Id: <20220829112111.884EB87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/diffutils: drop
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=774e310383bc16f1918302693be57bbddaf780ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

It was only used by opkg-utils, but we now rely on the host system
provided diffutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d366a2ad26ac16b9d2c7ab5980a5301d21bf391)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/diffutils/diffutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 3d86541295..6db68af7ec 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -20,4 +20,3 @@ DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
