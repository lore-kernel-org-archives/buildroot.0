Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C32FC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F6040232;
	Thu, 27 Jul 2023 10:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F6040232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCNQfmOw7jUP; Thu, 27 Jul 2023 10:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7820641887;
	Thu, 27 Jul 2023 10:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7820641887
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4107C1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1592441887
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1592441887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EUwWnXPQo8I for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A675440232
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A675440232
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92922836F6; Thu, 27 Jul 2023 10:48:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0403bdd9297ba4d58f515f1a9d5bd80ac7789b32
X-Git-Newrev: 318f08715c3db7fbe76635384cbd4c615e1fe6b4
X-Patchwork-Hint: ignore
Message-Id: <20230727104817.92922836F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to version 12.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=318f08715c3db7fbe76635384cbd4c615e1fe6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Drop no longer supported weston-launch/launcher-logind.

Drop no longer supported color-management-colord config option.

Remove duplicate backend-headless config option.

Add new libgbm requirement for renderer-gl.

Add new freerdp server requirement for backend-rdp.

Add support for new screenshare feature.

Add support for new rdp as backend default feature.

Add support for new pipewire backend feature.

Always enable libseat launcher.

Disable new unsupported vnc backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pendency-on-screenshooter-client-protocol.patch | 38 ----------------
 package/weston/Config.in                           | 22 ++++++++-
 package/weston/weston.hash                         |  6 +--
 package/weston/weston.mk                           | 53 +++++++---------------
 4 files changed, 39 insertions(+), 80 deletions(-)

diff --git a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
deleted file mode 100644
index 927215380e..0000000000
--- a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2ac6b6b084a877adde64db7faff2ed22eb3ea97a Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniels@collabora.com>
-Date: Tue, 8 Feb 2022 22:39:42 +0000
-Subject: [PATCH] tests: Add dependency on screenshooter client protocol
-
-Given that the test-helper code relies on the screenshooter protocol,
-make sure it's available for us to build, and the dependency ensures we
-build in order.
-
-Fixes: #588
-
-Signed-off-by: Daniel Stone <daniels@collabora.com>
-
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/weston/-/commit/2ac6b6b084a877adde64db7faff2ed22eb3ea97a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 2d464ddcc..222091cd1 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -29,8 +29,9 @@ lib_test_client = static_library(
- 		'weston-test-client-helper.c',
- 		'weston-test-fixture-compositor.c',
- 		weston_test_client_protocol_h,
--		weston_screenshooter_protocol_c,
- 		weston_test_protocol_c,
-+		weston_screenshooter_client_protocol_h,
-+		weston_screenshooter_protocol_c,
- 		viewporter_client_protocol_h,
- 		viewporter_protocol_c,
- 		'color_util.h',
--- 
-GitLab
-
diff --git a/package/weston/Config.in b/package/weston/Config.in
index d5dbf27bbd..22996805f6 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_SEATD
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
@@ -42,6 +43,15 @@ config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	bool "headless"
 	select BR2_PACKAGE_WESTON_HEADLESS
 
+config BR2_PACKAGE_WESTON_DEFAULT_RDP
+	bool "rdp"
+	depends on BR2_USE_MMU # freerdp, libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	depends on BR2_PACKAGE_XORG7 # freerdp-server
+	select BR2_PACKAGE_WESTON_RDP
+
 config BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	bool "wayland (nested)"
 	select BR2_PACKAGE_WESTON_WAYLAND
@@ -60,6 +70,7 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
 	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
 	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
+	default "rdp"      if BR2_PACKAGE_WESTON_DEFAULT_RDP
 	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	default "x11"      if BR2_PACKAGE_WESTON_DEFAULT_X11
 
@@ -73,7 +84,9 @@ config BR2_PACKAGE_WESTON_RDP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	depends on BR2_PACKAGE_XORG7 # freerdp-server
 	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_FREERDP_SERVER
 	help
 	  This enables the RDP backend, which allows accessing weston
 	  through the network with any RDP-compliant client.
@@ -87,10 +100,11 @@ config BR2_PACKAGE_WESTON_RDP
 	  /etc/freerdp/server/ so you may want to change them in a
 	  post-build script or a rootfs overlay.
 
-comment "RDP compositor needs a toolchain w/ wchar, C++"
+comment "RDP compositor needs a toolchain w/ wchar, C++, X.org"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_WESTON_HEADLESS
 	bool "headless (testing) compositor"
@@ -155,6 +169,10 @@ config BR2_PACKAGE_WESTON_SHELL_KIOSK
 	default y
 	select BR2_PACKAGE_WESTON_HAS_SHELL
 
+config BR2_PACKAGE_WESTON_SCREENSHARE
+	bool "screenshare"
+	default y
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index d58ca1ef70..0ecbaa4168 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
-sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
-sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-May/042725.html
+sha256  b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535  weston-12.0.1.tar.xz
+sha512  3dcfa1a2a6b9a605d3ecd597bf7ac0f87b0fd1971845b6e5c44b5e34296943ac146dae6e1cfea9be14ad7a9a8b6d30dc765f9289ef80920d7c516ebba1ba4688  weston-12.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 01f84178b2..437c6f2e38 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 10.0.1
+WESTON_VERSION = 12.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -13,13 +13,13 @@ WESTON_CPE_ID_VENDOR = wayland
 WESTON_INSTALL_STAGING = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng udev cairo libinput libdrm
+	libxkbcommon pixman libpng udev cairo libinput libdrm seatd
 
 WESTON_CONF_OPTS = \
-	-Dbackend-headless=false \
-	-Dcolor-management-colord=false \
 	-Ddoc=false \
 	-Dremoting=false \
+	-Dbackend-vnc=false \
+	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 # Uses VIDIOC_EXPBUF, only available from 3.8+
@@ -29,20 +29,6 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
-WESTON_CONF_OPTS += -Dlauncher-logind=true
-WESTON_DEPENDENCIES += dbus systemd
-else
-WESTON_CONF_OPTS += -Dlauncher-logind=false
-endif
-
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WESTON_CONF_OPTS += -Dlauncher-libseat=true
-WESTON_DEPENDENCIES += seatd
-else
-WESTON_CONF_OPTS += -Dlauncher-libseat=false
-endif
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
@@ -57,33 +43,20 @@ else
 WESTON_CONF_OPTS += -Dimage-webp=false
 endif
 
-# weston-launch must be u+s root in order to work properly
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-define WESTON_PERMISSIONS
-	/usr/bin/weston-launch f 4755 0 0 - - - - -
-endef
-define WESTON_USERS
-	- - weston-launch -1 - - - - Weston launcher group
-endef
-WESTON_CONF_OPTS += -Ddeprecated-weston-launch=true
-WESTON_DEPENDENCIES += linux-pam
-else
-WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 WESTON_CONF_OPTS += -Drenderer-gl=true
-WESTON_DEPENDENCIES += libegl libgles
+WESTON_DEPENDENCIES += libegl libgbm libgles
 ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
-WESTON_CONF_OPTS += -Dpipewire=true
+WESTON_CONF_OPTS += -Dpipewire=true -Dbackend-pipewire=true
 WESTON_DEPENDENCIES += pipewire
 else
-WESTON_CONF_OPTS += -Dpipewire=false
+WESTON_CONF_OPTS += -Dpipewire=false -Dbackend-pipewire=false
 endif
 else
 WESTON_CONF_OPTS += \
 	-Drenderer-gl=false \
-	-Dpipewire=false
+	-Dpipewire=false \
+	-Dbackend-pipewire=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
@@ -180,6 +153,12 @@ else
 WESTON_CONF_OPTS += -Dshell-kiosk=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SCREENSHARE),y)
+WESTON_CONF_OPTS += -Dscreenshare=true
+else
+WESTON_CONF_OPTS += -Dscreenshare=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
