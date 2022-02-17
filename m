Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4276C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E90425CC;
	Thu, 17 Feb 2022 20:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIVBaCeEjkf2; Thu, 17 Feb 2022 20:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286BC415BF;
	Thu, 17 Feb 2022 20:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE521C1162
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AE254023B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTh1t87v9Zaq for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F8640227
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C63588379E; Thu, 17 Feb 2022 20:21:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:29:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 293d8f727a0858b647479013be72be2da565667f
X-Git-Newrev: 3f5843cd07df37fbef2b421a5857b1f86d098eb6
X-Patchwork-Hint: ignore
Message-Id: <20220217202156.C63588379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiconv: don't override
 LIBICONV_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f5843cd07df37fbef2b421a5857b1f86d098eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBICONV_CONF_OPTS is wrongly overridden in a conditional since commit
0d711a64d4753c0efa4158519907cca7ec284573

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libiconv/libiconv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index ec79a5d735..40763a92f8 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -11,7 +11,7 @@ LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS),y)
-LIBICONV_CONF_OPTS = --enable-extra-encodings
+LIBICONV_CONF_OPTS += --enable-extra-encodings
 endif
 
 # Don't build the preloadable library, as we don't need it (it's only
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
