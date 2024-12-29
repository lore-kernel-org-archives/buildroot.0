Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E086BE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF2C80D78;
	Sun, 29 Dec 2024 19:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ocgim8_xMAl; Sun, 29 Dec 2024 19:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B31CF80D71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B31CF80D71;
	Sun, 29 Dec 2024 19:54:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6EFC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CECA960783
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftS6cvpoVaAb for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E2C6059B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2E2C6059B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F25C876F4; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56bc9cb2b7abd620587e32d640595d52e35cd2df
X-Git-Newrev: 1b9fde0c2badf0b0c7fe597ad134bac9c465a6a8
X-Patchwork-Hint: ignore
Message-Id: <20241229195346.8F25C876F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/links: drop directfb support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b9fde0c2badf0b0c7fe597ad134bac9c465a6a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the DirectFB package, let's drop DirectFB
support in links.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/links/Config.in |  6 +++---
 package/links/links.mk  | 11 +----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/links/Config.in b/package/links/Config.in
index cc2389c9f1..e7fffaf130 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_LINKS
 
 config BR2_PACKAGE_LINKS_GRAPHICS
 	bool "use graphics"
-	depends on BR2_PACKAGE_GPM || BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_GPM || BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LINKS_GRAPHICS
 	  Framebuffer output requires GPM (console mouse).
 	  Otherwise links will be text-mode only.
 
-comment "links graphics needs GPM, DirectFB or X11"
-	depends on !BR2_PACKAGE_GPM && !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7
+comment "links graphics needs GPM or X11"
+	depends on !BR2_PACKAGE_GPM && !BR2_PACKAGE_XORG7
 
 endif
diff --git a/package/links/links.mk b/package/links/links.mk
index 7ebe3af474..a2833c9514 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -11,6 +11,7 @@ LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
 LINKS_CPE_ID_VENDOR = twibright
+LINKS_CONF_OPTS = --without-directfb
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
@@ -24,16 +25,6 @@ LINKS_DEPENDENCIES += xlib_libXt
 else
 LINKS_CONF_OPTS += --without-x
 endif
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-ifeq ($(BR2_STATIC_LIBS),y)
-LINKS_CONF_ENV += LIBS=-lstdc++
-endif
-LINKS_CONF_OPTS += --with-directfb
-LINKS_DEPENDENCIES += directfb
-else
-LINKS_CONF_OPTS += --without-directfb
-endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LINKS_CONF_OPTS += --with-libjpeg
 LINKS_DEPENDENCIES += jpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
