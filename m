Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29B1E810D5
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 11:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBBE6140F;
	Wed, 27 Sep 2023 11:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBBE6140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTWLwcr2Z01W; Wed, 27 Sep 2023 11:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EAB61060;
	Wed, 27 Sep 2023 11:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EAB61060
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B15461BF335
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B25961060
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B25961060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkMyh4n0Ac8J for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 11:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC01B60BA2
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 11:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC01B60BA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABA9482277; Wed, 27 Sep 2023 11:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 13:43:38 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: de37ab0ca5542933e8b72aed6e656f4a4ac7bfa5
X-Git-Newrev: 7156bc753e43860c1949483504d611c7cdec5b01
X-Patchwork-Hint: ignore
Message-Id: <20230927114931.ABA9482277@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pppd: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=7156bc753e43860c1949483504d611c7cdec5b01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
