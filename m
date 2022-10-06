Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2B6C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 10:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00CDA40447;
	Thu,  6 Oct 2022 10:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00CDA40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utovdf6MQDgs; Thu,  6 Oct 2022 10:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E9840223;
	Thu,  6 Oct 2022 09:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E9840223
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 981B91BF957
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73AEE40223
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73AEE40223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1fiF0omKzrI for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 09:59:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A9640204
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53A9640204
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 09:58:59 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ogNeZ-00BGvz-0E; Thu, 06 Oct 2022 11:58:55 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id fcaf972c;
 Thu, 6 Oct 2022 09:58:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 12:58:33 +0300
Message-Id: <20221006095833.1116173-6-aperez@igalia.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221006095833.1116173-1-aperez@igalia.com>
References: <20221004133057.2003750-1-aperez@igalia.com>
 <20221006095833.1116173-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jbJXy1/oA3baXMTP0Suhy2GsH7qeG6/whYEZ1zejM2Q=; b=f7UY3xpqoX5+FE9e6Hfh0RW/Z7
 60Vl9jyJk14aJeq606oKf+ZFtiU+3Zrksb8gv1FsCdA9SRKGr4TfyRTxbZIDPN1MBMx+YPMhPKF6B
 QlabkAzdwY9VZJVVMwfs+AGacVbcxm8U+Jf3CMbt1+QHG456TBHTx3VGOTE8uK1ghb1fz5sy3qHz8
 lgvqycqeAwcOAKu2Up92x+I6Lf3OooLxCxqS5CrFjTV1c6h6R97n6MvBEKISTYtwGag5iOBqGv/6M
 lPiSA3wylUgLJlcAUuU8hTORvYjXKAFuV7npT5WLaxGvZ1WjZsULnZaXeSJHbWDk1o1IQSdbyC2rq
 D0j/qknA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=f7UY3xpq
Subject: [Buildroot] [PATCH v3 5/5] package/cog: bump to version 0.16.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new version includes support for setting proxy options and gamepad
support. Release notes:

  https://wpewebkit.org/release/cog-0.16.0.html

This imports a small patch to properly pick libdrm compiler flags,
fetched from the upstream repository.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...m-dependency-when-protocols-are-used.patch | 36 ++++++++++++++++++
 package/cog/cog.hash                          |  8 ++--
 package/cog/cog.mk                            | 37 ++++++++++---------
 3 files changed, 60 insertions(+), 21 deletions(-)
 create mode 100644 package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch

diff --git a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
new file mode 100644
index 0000000000..44e555c121
--- /dev/null
+++ b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
@@ -0,0 +1,36 @@
+From 9a1982c563e218b7695e6a174c8230d3b063eb27 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Thu, 6 Oct 2022 09:04:22 +0200
+Subject: [PATCH] wl: Fix libdrm dependency when protocols are used
+
+As the comment says, cog-platform-wl.c needs drm_fourcc.h to build
+properly when wayland_weston_direct_display is enabled.
+
+However, libdrm.pc doesn't specify "include/libdrm" as part of its
+includedir but whether in its cflags. So use the compile_args dep
+instead of includes to fix the build failure.
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+(cherry picked from commit 32c1d9533bcdc22cbc01d02bf2e6ac0d4bda2dc2)
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/Igalia/cog/pull/501]
+---
+ platform/wayland/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index f1e18ec..31e4460 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -67,7 +67,7 @@ if wayland_platform_weston_protocols.length() > 0
+ 
+     # The code uses definitions from the drm_fourcc.h header, but does not
+     # need to link the library; libdrm here is only a build-time dependency.
+-    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(includes: true)]
++    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(compile_args: true)]
+ endif
+ 
+ 
+-- 
+2.38.0
+
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index aa128d73d8..a2c55c4b94 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
-md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
-sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
-sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
+md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
+sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
+sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 1f24bebee4..241c4e309c 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.14.1
+COG_VERSION = 0.16.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -12,37 +12,40 @@ COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
-	-DCOG_BUILD_PROGRAMS=ON \
-	-DCOG_PLATFORM_HEADLESS=ON \
-	-DINSTALL_MAN_PAGES=OFF \
-	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
-	-DUSE_SOUP2=ON
+	-Ddocumentation=false \
+	-Dmanpages=false \
+	-Dprograms=true \
+	-Dsoup2=enabled \
+	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
+	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
+
+COG_PLATFORMS_LIST = headless
 
 ifeq ($(BR2_PACKAGE_WESTON),y)
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
+COG_CONF_OPTS += -Dwayland_weston_direct_display=true
 COG_DEPENDENCIES += weston
 else
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
+COG_CONF_OPTS += -Dwayland_weston_direct_display=false
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
+COG_PLATFORMS_LIST += wayland
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
+COG_PLATFORMS_LIST += drm
 COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
+COG_CONF_OPTS += -Dcog_dbus_control=system
 else
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
+COG_CONF_OPTS += -Dcog_dbus_control=user
 endif
 
-$(eval $(cmake-package))
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+COG_DEPENDENCIES += libmanette
+endif
+
+$(eval $(meson-package))
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
