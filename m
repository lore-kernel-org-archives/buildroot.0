Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F9BECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A660B40C41;
	Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A660B40C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JByjG1emfX6i; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D284340C0B;
	Mon, 29 Aug 2022 11:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D284340C0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5041BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34692831F2
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34692831F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQeRhZ5cg0ud for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C2B82FE7
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C2B82FE7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B91687F3E; Mon, 29 Aug 2022 11:21:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:15:17 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 242d743689041d4d2afe99caf9228d0077c7afcf
X-Git-Newrev: 7526e7c88a06ecf36c0e213f9cbcab38d76296f3
X-Patchwork-Hint: ignore
Message-Id: <20220829112105.7B91687F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/diffutils: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=7526e7c88a06ecf36c0e213f9cbcab38d76296f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
