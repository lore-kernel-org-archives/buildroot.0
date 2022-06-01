Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE259C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 504484183D;
	Wed,  1 Jun 2022 16:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tceAK4T0tYux; Wed,  1 Jun 2022 16:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26274183A;
	Wed,  1 Jun 2022 16:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20FD61BF9AD
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA41F40C09
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IQQy7vIYUYx for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AA4940FCF
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41790868BB; Wed,  1 Jun 2022 16:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 18:13:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 542f86d7e19854ec38966aaee12d9e06c88a445b
X-Git-Newrev: f4f8ed6d16307679f8f354f2788915b22d35c7b9
X-Patchwork-Hint: ignore
Message-Id: <20220601160252.41790868BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libnftnl: remove
 json support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4f8ed6d16307679f8f354f2788915b22d35c7b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

JSON support and the jansson dependency have been removed in version
1.1.2.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b634d504cb5a0b621f115f36c50a712e85fc8027)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
