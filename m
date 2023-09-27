Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC79E810D5
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 11:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D80613CF;
	Wed, 27 Sep 2023 11:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D80613CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUb9kXTGPii7; Wed, 27 Sep 2023 11:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 262E7610B4;
	Wed, 27 Sep 2023 11:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 262E7610B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1D2D1BF275
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A264405A4
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A264405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DLYej9KmmWB for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A158403C8
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A158403C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56CAA82261; Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 13:45:01 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ef266a16b9455b7727e34dccb93b223df09db628
X-Git-Newrev: 4e7856226c37d192c5466b092404a309735507c8
X-Patchwork-Hint: ignore
Message-Id: <20230927114812.56CAA82261@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pppd: drop
 PPPD_DROP_INTERNAL_IF_PPOL2TP_H
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e7856226c37d192c5466b092404a309735507c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
https://github.com/ppp-project/ppp/commit/c41092dd4c49267f232f6cba3d31c6c68bfdf68d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0a0dd63c824c1c8a104e09b4f773764daf5b3e3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/pppd.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index d9d6244f10..25d017a84f 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -37,15 +37,6 @@ PPPD_DEPENDENCIES += libpcap
 PPPD_MAKE_OPTS += FILTER=y
 endif
 
-# pppd bundles some but not all of the needed kernel headers. The embedded
-# if_pppol2tp.h is unfortunately not compatible with kernel headers > 2.6.34,
-# and has been part of the kernel headers since 2.6.23, so drop it
-define PPPD_DROP_INTERNAL_IF_PPOL2TP_H
-	$(RM) $(@D)/include/linux/if_pppol2tp.h
-endef
-
-PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
-
 # pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
 # definitely not useful since the C library only uses
 # /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
