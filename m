Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAFFCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342A6409E2;
	Mon,  1 Jun 2026 20:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-xrBvc2TNzc; Mon,  1 Jun 2026 20:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1E0409E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780344441;
	bh=YylkROu7XvUEDujZvwMvADaoqyI/glNOFgFmlyg1QXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OWqno93yLVNR8DwqRSWoYuY2E1SVNZCWn6lf6DNr2B4sJ5JacyWyego1ipnQXuVlc
	 Ad6Pg036hLlQ9CleCpcktqFBIflch9hwA2+ifnbjAvlEAQOoAs5uh6q6SFkuzqIj09
	 WinNFLALT1LAvYN2EAnsXyVelU6BjUnbtc1xOqaO5S2IRXsxX1z38FIJ2DN2wDbchS
	 af1TmArHw8SVriQMrXLgCoalytvAChQ8CriMjx0CnWV1mdxgxzH5YwYJBHvlmbBkgF
	 Behg0hQFEoBHnoSk1ynKZWwni0EAIyK8VUIibHuBbjFgNKOtfdRYqYrBR5GqlAtokp
	 TE6qiLE711H5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1E0409E7;
	Mon,  1 Jun 2026 20:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DAE1D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233BC409E5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAke96p-6XvV for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2E4409E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2E4409E2
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03FD086F62; Mon,  1 Jun 2026 20:07:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:19:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51d8351e286a6528b88ddb9f2dbfd1c5c86aba7b
X-Git-Newrev: 9d85c36577f19715545cdfc6bee792913377e096
X-Patchwork-Hint: ignore
Message-Id: <20260601200705.03FD086F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/weston: bump version
 to 15.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d85c36577f19715545cdfc6bee792913377e096
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...erer-guard-surface-output-creation-with-b.patch | 151 ---------------------
 package/weston/weston.hash                         |   6 +-
 package/weston/weston.mk                           |   2 +-
 3 files changed, 4 insertions(+), 155 deletions(-)

diff --git a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
deleted file mode 100644
index 8d88730336..0000000000
--- a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 60e0ec39183f932b7b4ba60070a5b2ac64b42d30 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Thu, 5 Mar 2026 17:29:06 +0100
-Subject: [PATCH] vulkan-renderer: guard surface output creation with backend
- defines
-
-Fix compilation errors when compiling with x11 or wayland backends
-disabled or not available.
-
-Fixes: 8f56d03d ("libweston: Vulkan renderer")
-
-Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/ba10e6d81462fc8628dd340ba9404e13745eae18
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- .../vulkan-renderer-internal.h                | 17 ++++++++++----
- libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
- 2 files changed, 31 insertions(+), 8 deletions(-)
-
-diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libweston/renderer-vulkan/vulkan-renderer-internal.h
-index aadfc6e4..f8604227 100644
---- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
-+++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
-@@ -35,17 +35,21 @@
- #include <stdbool.h>
- #include <time.h>
- 
--#include <wayland-util.h>
- #include <vulkan/vulkan.h>
- #include "shared/helpers.h"
- #include "libweston/libweston.h"
- #include "libweston/libweston-internal.h"
--#include <xcb/xcb.h>
- 
--#define VK_USE_PLATFORM_XCB_KHR
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- #define VK_USE_PLATFORM_WAYLAND_KHR
- #include <vulkan/vulkan_wayland.h>
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+#define VK_USE_PLATFORM_XCB_KHR
-+#include <xcb/xcb.h>
- #include <vulkan/vulkan_xcb.h>
-+#endif
- 
- #define MAX_NUM_IMAGES 5
- #define MAX_CONCURRENT_FRAMES 2
-@@ -173,10 +177,15 @@ struct vulkan_renderer {
- 	struct wl_list pipeline_list;
- 	struct dmabuf_allocator *allocator;
- 
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
--	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_presentation_support;
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_support;
-+#endif
- 
- 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
- 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
-diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/renderer-vulkan/vulkan-renderer.c
-index 9f701913..b15eff46 100644
---- a/libweston/renderer-vulkan/vulkan-renderer.c
-+++ b/libweston/renderer-vulkan/vulkan-renderer.c
-@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_inst_ext_table[] = {
- 		.name = VK_KHR_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_SURFACE,
- 	},
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	{
- 		.name = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_WAYLAND_SURFACE,
- 		.instance_dep = EXTENSION_KHR_SURFACE,
- 	},
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
- 	{
- 		.name = VK_KHR_XCB_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_XCB_SURFACE,
- 		.instance_dep = EXTENSION_KHR_SURFACE,
- 	},
-+#endif
- };
- 
- /* Keep in sync with vulkan-renderer-internal.h. */
-@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 	struct vulkan_renderer *vr = get_renderer(ec);
- 	struct vulkan_output_state *vo = get_output_state(output);
- 	VkResult result;
--	VkBool32 supported;
-+	VkBool32 supported = 0;
- 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
- 
-+	vo->swapchain.surface = VK_NULL_HANDLE;
-+
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (options->wayland_display && options->wayland_surface) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
- 
-@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 		result = vr->create_wayland_surface(vr->inst, &wayland_surface_create_info, NULL,
- 						    &vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
--	} else if (options->xcb_connection && options->xcb_window) {
-+	}
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
-+	if (options->xcb_connection && options->xcb_window) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
- 
- 		supported = vr->get_xcb_presentation_support(vr->phys_dev, 0, options->xcb_connection, options->xcb_visualid);
-@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 		result = vr->create_xcb_surface(vr->inst, &xcb_surface_create_info, NULL,
- 						&vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
--	} else {
--		assert(0);
- 	}
-+#endif
-+	assert(vo->swapchain.surface != VK_NULL_HANDLE);
- 
- 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.surface, &supported);
- 	assert(supported);
-@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, const char *func, void *proc_ptr)
- static void
- vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
- {
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayland_surface);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupportKHR", &vr->get_wayland_presentation_support);
- 	}
-+#endif
- 
-+#if defined(BUILD_X11_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surface);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR", &vr->get_xcb_presentation_support);
- 	}
-+#endif
- }
- 
- static void
--- 
-2.43.0
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 24f0f08bab..b002942696 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
-sha256  58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973  weston-15.0.0.tar.xz
-sha512  1196db00b473f036ba290e1073729c2b9e29ac061d9687b30dfad14e3b139313d3ca9c8000838e1b9c39713e96a2c544ec05d80bafad0b8ea1d1f380befa250d  weston-15.0.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u
+sha256  551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f8025d8a64b791f6d  weston-15.0.1.tar.xz
+sha512  555731ddfaf7e3ef9bf43be682e20338ee207b434a72011b730c9b0ebde4daeaeb9cc9d09a707c32798f0184a55144f64e818551efe7e71413876e45e3cb3523  weston-15.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e160c89477..5caf5903d1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 15.0.0
+WESTON_VERSION = 15.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
