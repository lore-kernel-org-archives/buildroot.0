Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F310C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C5760F38
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07C5760F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE85424FC;
	Wed,  4 Aug 2021 00:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sSwXUZl1ELW; Wed,  4 Aug 2021 00:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DAD424F6;
	Wed,  4 Aug 2021 00:58:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEDF81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EB740EB2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ysDUL4MraRu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 478724069F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8EE0E87E2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 867e7a040ce1907cdc74d2040845ef155ede57d1
X-Git-Newrev: 047d7cb173ac9fa9f2c53886166a7b41fbf21909
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.8EE0E87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: needs
 dynamic libary
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

commit: https://git.buildroot.net/buildroot/commit/?id=047d7cb173ac9fa9f2c53886166a7b41fbf21909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

dynamic library is needed since bump to version 2021.04 in commit
2c6b0359c3b819fadb4437b2d780e95c32fdab21 and
https://github.com/sbabic/swupdate/commit/f802cfa427686c5c90245ae08da36f4c7e31862f

Fixes:
 - http://autobuild.buildroot.org/results/e4b937c7421024bfcc4fbfa1a90f016134d3307f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/Config.in   | 5 +++--
 package/swupdate/swupdate.mk | 9 +--------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index e87f695861..f601e45fcd 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SWUPDATE
 	bool "swupdate"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
@@ -70,6 +71,6 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  installed to /var/www/swupdate.
 endif
 
-comment "swupdate needs a toolchain w/ threads"
+comment "swupdate needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index fe967d7fd7..402aa0a91f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -93,7 +93,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBWEBSOCKETS=n
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
 define SWUPDATE_SET_LUA_VERSION
@@ -185,19 +185,12 @@ SWUPDATE_BUILD_CONFIG = $(@D)/.config
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-ifeq ($(BR2_STATIC_LIBS),y)
-define SWUPDATE_PREFER_STATIC
-	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC)
-endef
-endif
-
 SWUPDATE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
-	$(SWUPDATE_PREFER_STATIC)
 	$(SWUPDATE_SET_LUA_VERSION)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
