Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3A1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6874060243
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6874060243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D25960A41;
	Tue,  3 Aug 2021 23:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEHLfXyektXp; Tue,  3 Aug 2021 23:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 746BD6090C;
	Tue,  3 Aug 2021 23:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 118D71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2B3140F1E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bV5akYLjk5-M for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F35EA40E58
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46F3F83FEF; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 12:31:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 882c06c55bf7b39f92bbcead6fac1338039cb4b8
X-Git-Newrev: 80c1135d736722b1d219f0e078816fde00d87b4b
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.46F3F83FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi: enable optional
 vaapi support also for OpenGLES
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

commit: https://git.buildroot.net/buildroot/commit/?id=80c1135d736722b1d219f0e078816fde00d87b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream commit
https://github.com/xbmc/xbmc/commit/c638987dd8181765f975763cb643d6869a3f661b

removed the dependency to x11 support in libva keeping only libdrm as
dependency. This commit will enable the usage of libva with Kodi's
OpenGLES render system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  8 ++++++++
 package/kodi/Config.in | 18 ------------------
 package/kodi/kodi.mk   |  5 ++---
 3 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1049d7af3c..56b018a30c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_KODI_LIBVA
+	bool "kodi option to add libva support removed"
+	select BR2_LEGACY
+	help
+	  Kodi still has support for libva if the package is enabled but
+	  the kodi-specific dependencies limiting libva support to non-
+	  OPENGLES platforms were removed including this option.
+
 config BR2_PACKAGE_PHP_EXT_XMLRPC
 	bool "PHP XMLRPC extension removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f4cfc6380c..f702ae841a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,24 +238,6 @@ config BR2_PACKAGE_KODI_LIBUSB
 	help
 	  Enable libusb support.
 
-config BR2_PACKAGE_KODI_LIBVA
-	bool "va"
-	depends on \
-		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM || \
-		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND || \
-		(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
-			BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
-	select BR2_PACKAGE_LIBVA
-	help
-	  Enable libva support.
-
-comment "libva support needs platform 'gbm', 'Wayland' or 'X11/OpenGL'"
-	depends on \
-		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM && \
-		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND && \
-		(!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 || \
-			!BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
-
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
 	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index a5c9db1d7e..6f020b58b8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -315,9 +315,8 @@ ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 KODI_DEPENDENCIES += lirc-tools
 endif
 
-# kodi needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
-KODI_DEPENDENCIES += mesa3d libva
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+KODI_DEPENDENCIES += libva
 KODI_CONF_OPTS += -DENABLE_VAAPI=ON
 else
 KODI_CONF_OPTS += -DENABLE_VAAPI=OFF
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
