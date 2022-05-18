Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AABBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2066940FD0;
	Wed, 18 May 2022 19:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lh1XlHPmPXTp; Wed, 18 May 2022 19:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A03A4021C;
	Wed, 18 May 2022 19:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286B91BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D8641030
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5Pd_lhG4eel for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E44841050
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4B4AB86065; Wed, 18 May 2022 19:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7535ccfaeaa3270640f52d4e0de892d412f15081
X-Git-Newrev: b634d504cb5a0b621f115f36c50a712e85fc8027
X-Patchwork-Hint: ignore
Message-Id: <20220518190953.4B4AB86065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: remove json support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b634d504cb5a0b621f115f36c50a712e85fc8027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JSON support and the jansson dependency have been removed in version
1.1.2.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libnftnl/Config.in   | 10 ----------
 package/libnftnl/libnftnl.mk |  7 -------
 package/nftables/nftables.mk |  4 ----
 3 files changed, 21 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 347223ce22..0d17751e50 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -13,13 +13,3 @@ config BR2_PACKAGE_LIBNFTNL
 	  currently used by nftables.
 
 	  http://netfilter.org/projects/libnftnl/index.html
-
-if BR2_PACKAGE_LIBNFTNL
-
-config BR2_PACKAGE_LIBNFTNL_JSON
-	bool "enable JSON support"
-	select BR2_PACKAGE_JANSSON
-	help
-	  Enable JSON parsing support
-
-endif
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 616afa6307..7ba1158154 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -12,11 +12,4 @@ LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
-ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
-LIBNFTNL_CONF_OPTS += --with-json-parsing
-LIBNFTNL_DEPENDENCIES += jansson
-else
-LIBNFTNL_CONF_OPTS += --without-json-parsing
-endif
-
 $(eval $(autotools-package))
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 232d541488..a64c36094e 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -42,10 +42,6 @@ else
 NFTABLES_CONF_OPTS += --disable-python
 endif
 
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
-NFTABLES_LIBS += -ljansson -lm
-endif
-
 NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
 define NFTABLES_LINUX_CONFIG_FIXUPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
