Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334BF99C63
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8279C40CDF;
	Fri, 17 Apr 2026 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LeUcFwJNi0k; Fri, 17 Apr 2026 20:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A4F440CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776459329;
	bh=sgnv3dqCLbOUSczSV38QWOTF8Ox7lqCcu2Uiw558Qrk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tIjUljRifkIMx6RewooTXalYaxLTTM25Ht5zrnVm0qgx8+DE5YzEtHXmqukDUIZJf
	 Orlk1pmcP0SqqSSakDKhzUQc8tSnx8x+HbFsCaMzX15B0jVYqvPhTfHJckwz9z/ZaC
	 +JSLn2pS2RrQUacCyXthrQqE/UDd7A/MgHT+JJ3l50EkRS/IGpfqVPFIwUnJT+zwtU
	 ZDjlpUIgRCV8XZ58L8IkJ424zb4GGYDZE3cwMXtUaB3FZ5YKWwAqG+Bzibf+evt3XC
	 kCLGgNLJHp03tSO/t6Wg+CYCuc5mTQc3T1inAiq8zM8gvGy1Y+e0GLHN6JxfVQZs9a
	 FU6esU5krqa5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A4F440CBE;
	Fri, 17 Apr 2026 20:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2641F259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C613813EB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64-JTzZHx0ED for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 20:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBA8812F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBBA8812F3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BE6681E69; Fri, 17 Apr 2026 20:55:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 22:00:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7179b0309f324e96d532a40999a4ac2d3106de6
X-Git-Newrev: 2e6b2b82d5301977cf2f59adfd633d8774830f69
X-Patchwork-Hint: ignore
Message-Id: <20260417205525.9BE6681E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to 15.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e6b2b82d5301977cf2f59adfd633d8774830f69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Announcement:

- 14.0.91: https://lore.freedesktop.org/wayland-devel/aUkQG3KWNC3drDYd@xpredator/T/#u
- 14.0.92: https://lore.freedesktop.org/wayland-devel/aWUJ7MMZmM5yrhSx@xpredator/T/#u
- 14.0.93: https://lore.freedesktop.org/wayland-devel/aW3jJBLBT_UXv1RT@xpredator/T/#u
- 14.0.94: https://lore.freedesktop.org/wayland-devel/aXcyB9n8QaRyFRxw@xpredator/T/#u
- 14.0.95: https://lore.freedesktop.org/wayland-devel/aYHCEa_-Q_v16WNn@xpredator/T/#u
- 14.0.96: https://lore.freedesktop.org/wayland-devel/aY9Vp5A3S-FpQbjC@xpredator/T/#u
- 14.0.97: https://lore.freedesktop.org/wayland-devel/aY9gbvuzD41IaNfo@xpredator/T/#u
- 15.0.0:  https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/T/#u

Changes:

- Support for renderer-vulkan, and shell-lua has been added.

- Some features, drm-screencast-vaapi, shell-fullscreen, and screenshare
  are now deprecated, but kept for this release.

- 0001-build-Allow-libdisplay-info-0.3.0.patch is dropped as it is upstream.

- 0001-vulkan-renderer-guard-surface-output-creation-with-b.patch has been added
  to fix a dependency on <xcb/xcb.h>, which is already upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-Allow-libdisplay-info-0.3.0.patch   |  37 -----
 ...erer-guard-surface-output-creation-with-b.patch | 151 +++++++++++++++++++++
 package/weston/Config.in                           |  17 +++
 package/weston/weston.hash                         |   6 +-
 package/weston/weston.mk                           |  28 +++-
 5 files changed, 192 insertions(+), 47 deletions(-)

diff --git a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
deleted file mode 100644
index d97d1a9bf4..0000000000
--- a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 83b49400c1dfb72e3019267fd03f165d0bffec76 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Mon, 6 Oct 2025 15:20:26 +0200
-Subject: [PATCH] build: Allow libdisplay-info 0.3.0
-
-This is a backport of the change in upstream commit
-683eabb61ec43a270f2e3ed67c63bbe3754b1214 "build: Allow libdisplay-info 0.3.0"
-[1], applying the loosened version limit to the DRM backend only. The dependency
-definition was moved to the top level meson.build in [2], and the lower bound
-increased in [3].
-
-[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214
-[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/76e659f45edd23a8b1b253a93316ec73c709bc71
-[3] https://gitlab.freedesktop.org/wayland/weston/-/commit/82c5b386d860a479ed5a157f4dde58ffe202b948
-
-Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214 (backported)
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- libweston/backend-drm/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
-index 002669e6..a8f2ea59 100644
---- a/libweston/backend-drm/meson.build
-+++ b/libweston/backend-drm/meson.build
-@@ -4,7 +4,7 @@ endif
- 
- dep_libdisplay_info = dependency(
- 	'libdisplay-info',
--	version: ['>= 0.1.1', '< 0.3.0'],
-+	version: ['>= 0.1.1', '< 0.4.0'],
- 	fallback: ['display-info', 'di_dep'],
- 	default_options: [
- 		'werror=false',
--- 
-2.51.0
-
diff --git a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
new file mode 100644
index 0000000000..8d88730336
--- /dev/null
+++ b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
@@ -0,0 +1,151 @@
+From 60e0ec39183f932b7b4ba60070a5b2ac64b42d30 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Thu, 5 Mar 2026 17:29:06 +0100
+Subject: [PATCH] vulkan-renderer: guard surface output creation with backend
+ defines
+
+Fix compilation errors when compiling with x11 or wayland backends
+disabled or not available.
+
+Fixes: 8f56d03d ("libweston: Vulkan renderer")
+
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/ba10e6d81462fc8628dd340ba9404e13745eae18
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ .../vulkan-renderer-internal.h                | 17 ++++++++++----
+ libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
+ 2 files changed, 31 insertions(+), 8 deletions(-)
+
+diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+index aadfc6e4..f8604227 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
++++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+@@ -35,17 +35,21 @@
+ #include <stdbool.h>
+ #include <time.h>
+ 
+-#include <wayland-util.h>
+ #include <vulkan/vulkan.h>
+ #include "shared/helpers.h"
+ #include "libweston/libweston.h"
+ #include "libweston/libweston-internal.h"
+-#include <xcb/xcb.h>
+ 
+-#define VK_USE_PLATFORM_XCB_KHR
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ #define VK_USE_PLATFORM_WAYLAND_KHR
+ #include <vulkan/vulkan_wayland.h>
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++#define VK_USE_PLATFORM_XCB_KHR
++#include <xcb/xcb.h>
+ #include <vulkan/vulkan_xcb.h>
++#endif
+ 
+ #define MAX_NUM_IMAGES 5
+ #define MAX_CONCURRENT_FRAMES 2
+@@ -173,10 +177,15 @@ struct vulkan_renderer {
+ 	struct wl_list pipeline_list;
+ 	struct dmabuf_allocator *allocator;
+ 
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
+-	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_presentation_support;
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_support;
++#endif
+ 
+ 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
+ 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
+diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/renderer-vulkan/vulkan-renderer.c
+index 9f701913..b15eff46 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer.c
++++ b/libweston/renderer-vulkan/vulkan-renderer.c
+@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_inst_ext_table[] = {
+ 		.name = VK_KHR_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_SURFACE,
+ 	},
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_WAYLAND_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_XCB_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_XCB_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
+ };
+ 
+ /* Keep in sync with vulkan-renderer-internal.h. */
+@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 	struct vulkan_renderer *vr = get_renderer(ec);
+ 	struct vulkan_output_state *vo = get_output_state(output);
+ 	VkResult result;
+-	VkBool32 supported;
++	VkBool32 supported = 0;
+ 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
+ 
++	vo->swapchain.surface = VK_NULL_HANDLE;
++
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (options->wayland_display && options->wayland_surface) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
+ 
+@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_wayland_surface(vr->inst, &wayland_surface_create_info, NULL,
+ 						    &vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
+-	} else if (options->xcb_connection && options->xcb_window) {
++	}
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
++	if (options->xcb_connection && options->xcb_window) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
+ 
+ 		supported = vr->get_xcb_presentation_support(vr->phys_dev, 0, options->xcb_connection, options->xcb_visualid);
+@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_xcb_surface(vr->inst, &xcb_surface_create_info, NULL,
+ 						&vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
+-	} else {
+-		assert(0);
+ 	}
++#endif
++	assert(vo->swapchain.surface != VK_NULL_HANDLE);
+ 
+ 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.surface, &supported);
+ 	assert(supported);
+@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, const char *func, void *proc_ptr)
+ static void
+ vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
+ {
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayland_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupportKHR", &vr->get_wayland_presentation_support);
+ 	}
++#endif
+ 
++#if defined(BUILD_X11_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR", &vr->get_xcb_presentation_support);
+ 	}
++#endif
+ }
+ 
+ static void
+-- 
+2.43.0
+
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 614fef6bcc..774b75d5fb 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -144,6 +144,14 @@ comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_WESTON_VULKAN
+	bool "Vulkan support"
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_VULKAN_LOADER
+
+comment "Vulkan support needs gbm"
+	depends on !BR2_PACKAGE_HAS_LIBGBM
+
 # Weston needs at least one shell; this can be one of the bundled ones,
 # below, of from a third-party package, which should then select this.
 config BR2_PACKAGE_WESTON_HAS_SHELL
@@ -168,6 +176,15 @@ config BR2_PACKAGE_WESTON_SHELL_KIOSK
 	default y
 	select BR2_PACKAGE_WESTON_HAS_SHELL
 
+config BR2_PACKAGE_WESTON_SHELL_LUA
+	bool "lua shell"
+	default y
+	depends on BR2_PACKAGE_LUA_5_4
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+comment "lua shell needs a Lua >= 5.4"
+	depends on !BR2_PACKAGE_LUA_5_4
+
 config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "screenshare"
 	default y
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index cd2a82508d..24f0f08bab 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2025-April/044158.html
-sha256  b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac  weston-14.0.2.tar.xz
-sha512  e8214ec893e6c3ae94eb3c92feba104b0201843e9143f726a3e9a4d396d02523c94da706c1348cf934bc339fb1a4bc1fecdb865f0ea914115fd346d9eda091f5  weston-14.0.2.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
+sha256  58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973  weston-15.0.0.tar.xz
+sha512  1196db00b473f036ba290e1073729c2b9e29ac061d9687b30dfad14e3b139313d3ca9c8000838e1b9c39713e96a2c544ec05d80bafad0b8ea1d1f380befa250d  weston-15.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 57869b7e63..e160c89477 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.2
+WESTON_VERSION = 15.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -70,6 +70,13 @@ WESTON_CONF_OPTS += \
 	-Dbackend-pipewire=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_VULKAN),y)
+WESTON_CONF_OPTS += -Drenderer-vulkan=true
+WESTON_DEPENDENCIES += host-python-glslang libgbm vulkan-loader
+else
+WESTON_CONF_OPTS += -Drenderer-vulkan=false
+endif
+
 WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
 
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
@@ -115,10 +122,10 @@ WESTON_CONF_OPTS += -Dxwayland=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
+WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=true
 WESTON_DEPENDENCIES += libva
 else
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
+WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
@@ -149,9 +156,9 @@ WESTON_CONF_OPTS += -Dshell-desktop=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
-WESTON_CONF_OPTS += -Dshell-fullscreen=true
+WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=true
 else
-WESTON_CONF_OPTS += -Dshell-fullscreen=false
+WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
@@ -166,10 +173,17 @@ else
 WESTON_CONF_OPTS += -Dshell-kiosk=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_LUA),y)
+WESTON_DEPENDENCIES += lua
+WESTON_CONF_OPTS += -Dshell-lua=true
+else
+WESTON_CONF_OPTS += -Dshell-lua=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_SCREENSHARE),y)
-WESTON_CONF_OPTS += -Dscreenshare=true
+WESTON_CONF_OPTS += -Ddeprecated-screenshare=true
 else
-WESTON_CONF_OPTS += -Dscreenshare=false
+WESTON_CONF_OPTS += -Ddeprecated-screenshare=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
