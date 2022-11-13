Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC51BC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C2740260;
	Sun, 13 Nov 2022 16:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65C2740260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNlO89gQlrJQ; Sun, 13 Nov 2022 16:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551784024F;
	Sun, 13 Nov 2022 16:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551784024F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 219D31BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0554049C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A0554049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWJKUH4wMbOz for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 359F94049A
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 359F94049A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25D9D83737; Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:24:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6ee6bd566dcbd673f88de507bcda05086039b0e0
X-Git-Newrev: 8b94b7ec32e63208837a18cb8793ff3d35f8a078
X-Patchwork-Hint: ignore
Message-Id: <20221113163436.25D9D83737@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exfatprogs: drop
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b94b7ec32e63208837a18cb8793ff3d35f8a078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

host-pkgconf is not a dependency since bump to version 1.0.3 in commit
fbad745139125ea0995a436fd81ce7ea233638c0 and
https://github.com/exfatprogs/exfatprogs/commit/843124cd9a2087281e00bd1b9d710db59acfbced

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11ff62234ab139296ead705869c44c0a233682da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfatprogs/exfatprogs.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 2911d21f4f..44679c7d60 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -9,8 +9,6 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
-EXFATPROGS_DEPENDENCIES = host-pkgconf
-HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
