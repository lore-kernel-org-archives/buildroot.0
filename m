Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9091EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:40:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549EA60295
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 549EA60295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C8260B20;
	Wed,  4 Aug 2021 00:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukFqDY7qlCpN; Wed,  4 Aug 2021 00:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74A7260B08;
	Wed,  4 Aug 2021 00:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8691BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBC640F78
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKwdwRkV3SMj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7BA94022E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3E50E83830; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6644c9705f7d9bc2d647b343d0dfedbe7923907
X-Git-Newrev: 84e7e8ae24127108bc7cb945dda180d490d1c2c6
X-Patchwork-Hint: ignore
Message-Id: <20210803211019.3E50E83830@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gpm: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=84e7e8ae24127108bc7cb945dda180d490d1c2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for gpm is added by the services/gpm module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpm/gpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index f59d059a41..695264348c 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -9,6 +9,7 @@ GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPL-2.0+
 GPM_LICENSE_FILES = COPYING
+GPM_SELINUX_MODULES = gpm
 GPM_INSTALL_STAGING = YES
 GPM_DEPENDENCIES = host-bison
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
