Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10065CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3ADA404D9;
	Sun, 24 Sep 2023 18:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3ADA404D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpHuPg75kgad; Sun, 24 Sep 2023 18:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A049A4030E;
	Sun, 24 Sep 2023 18:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A049A4030E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDF081BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B76A040A15
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76A040A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXZbQHUwvY-x for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:23:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8F6F40A92
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F6F40A92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5642840C5; Sun, 24 Sep 2023 18:23:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:20:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 278d1db56becb4c6b5784c9bb9a0c452ea73ae16
X-Git-Newrev: 0a0dd63c824c1c8a104e09b4f773764daf5b3e3f
X-Patchwork-Hint: ignore
Message-Id: <20230924182302.D5642840C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a0dd63c824c1c8a104e09b4f773764daf5b3e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
https://github.com/ppp-project/ppp/commit/c41092dd4c49267f232f6cba3d31c6c68bfdf68d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
