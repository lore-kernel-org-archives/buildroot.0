Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ED1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E308461057
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E308461057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A83404A0;
	Sun,  1 Aug 2021 13:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDFGNKDHWgAb; Sun,  1 Aug 2021 13:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF8B4047B;
	Sun,  1 Aug 2021 13:58:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE72D1BF977
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF550831C1
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkB252PXe0qB for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13B92831AC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B3B488A46B; Sun,  1 Aug 2021 13:58:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 15:03:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca53ce905e4409358dd3b6364a58051250f4bf12
X-Git-Newrev: fcf01c247d1501ad4071364eaa1db0e5470cbc4a
X-Patchwork-Hint: ignore
Message-Id: <20210801135805.B3B488A46B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vnstat: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fcf01c247d1501ad4071364eaa1db0e5470cbc4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for vnstat is added by the services/vnstatd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vnstat/vnstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index c5836cf037..7f5ff67b82 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -8,6 +8,7 @@ VNSTAT_VERSION = 2.7
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
+VNSTAT_SELINUX_MODULES = vnstatd
 VNSTAT_DEPENDENCIES = host-pkgconf sqlite
 VNSTAT_CONF_OPTS = --disable-extra-paths
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
