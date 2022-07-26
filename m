Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14012C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC4C4017C;
	Tue, 26 Jul 2022 22:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC4C4017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqoDwbaRu4Kh; Tue, 26 Jul 2022 22:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDFC44019B;
	Tue, 26 Jul 2022 22:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDFC44019B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 400011BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A24B607EC
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A24B607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWN04SR1L5W1 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A196607D0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A196607D0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A253A86401; Tue, 26 Jul 2022 21:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 00:01:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7403e4d35c89f14a6663dcd471382734b2a75ca
X-Git-Newrev: 2d366a2ad26ac16b9d2c7ab5980a5301d21bf391
X-Patchwork-Hint: ignore
Message-Id: <20220726214921.A253A86401@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: drop host variant
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d366a2ad26ac16b9d2c7ab5980a5301d21bf391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was only used by opkg-utils, but we now rely on the host system
provided diffutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
