Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F52FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E087840332;
	Wed, 24 Nov 2021 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1FwH7Bg4gUV; Wed, 24 Nov 2021 21:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3FD240362;
	Wed, 24 Nov 2021 21:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC34B1BF3EC
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94C0402A3
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 21:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtiSprnrqTCe for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 21:21:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F31BC40281
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBBo9MDyClCa6CyRMOXbSfo1TsQJuWOeR+e9Tu+8+9I=; b=FGii/Qpq8/yJhkDycQ8crb29av
 7VeKSYn3Vvce1NKFH/uqJtKlHJ5TOwtQj1B7cstdHrUCo777cx8hXz/ZeeC1RO2tCr1mkZDMYaBQl
 XusUsRJRleHvPLD6R5+o/GjaYM0FQDwzdf9b2w13ZRFvzolShDBG53AFyKp5TI3RYf/uKqLPasQW6
 2QnRiaf/eIqLSL6gABMUUgwPaFs5bm/j5IidddD6UFeFd6re/X367qPqOKKxcza2cbYNEOWEIXiQ1
 QjsK6COH7x25l3Ppps47rsXvAxaCHYJ/fsUgZ/RbSvHofOblowCC6JVngpptbklS6f9F0wixWKjsT
 YAYJ6iNA==;
Received: from 91-153-34-221.elisa-laajakaista.fi ([91.153.34.221] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1mpzhX-0004aQ-JD; Wed, 24 Nov 2021 22:21:11 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a2d81cea;
 Wed, 24 Nov 2021 21:21:01 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 23:21:01 +0200
Message-Id: <20211124212101.3037723-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/cog: bump to verion 0.12.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new release includes a number of improvements. Release notes:

  https://wpewebkit.org/release/cog-0.12.0.html

Small tweaks were needed due to the "fdo" platform backend being renamed
as "wl"; the symbol is kept as BR2_PACKAGE_COG_PLATFORM_FDO to avoid
breaking existing configurations. Also the new version supports building
with libsoup3, which is not yet packaged in Buildroot, so -DUSE_SOUP2=ON
is always passed to CMake.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/Config.in | 4 ++--
 package/cog/cog.hash  | 8 ++++----
 package/cog/cog.mk    | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 5f00c5a2dd..d4238750f9 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -28,12 +28,12 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  must be always specified in the command line.
 
 config BR2_PACKAGE_COG_PLATFORM_FDO
-	bool "FreeDesktop.org backend"
+	bool "Wayland backend"
 	default y
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
-	  Enable the FreeDesktop.org backend. Cog will interface with
+	  Enable the Wayland backend. Cog will interface with
 	  a compositor over the Wayland protocol.
 
 config BR2_PACKAGE_COG_PLATFORM_DRM
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 3abc5f2c83..6a9af1845d 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
-md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
-sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
-sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.0.tar.xz.sums
+md5  30d6f68914af0ba5c32ac14df504215a  cog-0.12.0.tar.xz
+sha1  de367b33fb45a1bca9e443ca5c1d6cae3833d759  cog-0.12.0.tar.xz
+sha256  aad413a8aaf15d400d70f9c909a28b92b138f7b0c0d825978de8788d0d75208a  cog-0.12.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 07b8e245ef..606374d9c3 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.10.1
+COG_VERSION = 0.12.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -16,13 +16,14 @@ COG_CONF_OPTS = \
 	-DCOG_PLATFORM_HEADLESS=ON \
 	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
-	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
+	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
+	-DUSE_SOUP2=ON
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
+COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
 else
-COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
+COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
