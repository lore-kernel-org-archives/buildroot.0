Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EDAC36007
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF2083B61;
	Sat, 22 Mar 2025 13:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmCCY6i92Nk2; Sat, 22 Mar 2025 13:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC4383EFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC4383EFA;
	Sat, 22 Mar 2025 13:01:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A351A0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A8F83F6F
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJy2XOXdmfLT for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FCE83EFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78FCE83EFA
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7119E88242; Sat, 22 Mar 2025 13:01:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 13:51:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a55e82cb80c971370010df6a5513a7e565f1a72
X-Git-Newrev: cf4f2f858d13aa8be1fc3d3215df66e64e7b57e6
X-Patchwork-Hint: ignore
Message-Id: <20250322130110.7119E88242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: fix build failure on
 musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf4f2f858d13aa8be1fc3d3215df66e64e7b57e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch has been on upstream main for close to 2 years.

The "uint" use was introduced with [1] and [2], released with
mesa3d-demos 9.0.0 from March 2023, and added to Buildroot with commit
80304d9911 "package/mesa3d-demos: bump version to 9.0.0". The affected
code is built only if Wayland and Vulkan support are enabled, that is:

BR2_PACKAGE_LIBDECOR=y
BR2_PACKAGE_VULKAN_LOADER=y
BR2_PACKAGE_WAYLAND=y

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...3-vulkan-wsi-use-unsigned-instead-of-uint.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
new file mode 100644
index 0000000000..160dc9010d
--- /dev/null
+++ b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
@@ -0,0 +1,68 @@
+From 3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Thu, 23 Mar 2023 21:18:56 +0000
+Subject: [PATCH] vulkan/wsi: use unsigned instead of uint
+
+uint is not a standard type name and fails to build against musl libc
+
+Reviewed-by: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Upstream: https://gitlab.freedesktop.org/mesa/demos/-/commit/3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ src/vulkan/wsi/wayland.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/vulkan/wsi/wayland.c b/src/vulkan/wsi/wayland.c
+index 444d2bb81..5958d283a 100644
+--- a/src/vulkan/wsi/wayland.c
++++ b/src/vulkan/wsi/wayland.c
+@@ -128,7 +128,7 @@ dispatch_key(xkb_keycode_t xkb_key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-handle_key(uint key, enum wl_keyboard_key_state state)
++handle_key(unsigned key, enum wl_keyboard_key_state state)
+ {
+    xkb_keycode_t xkb_key = key + 8;
+    struct itimerspec timer = {0};
+@@ -151,15 +151,15 @@ handle_key(uint key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-key(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint time, uint key, enum wl_keyboard_key_state state)
++key(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned time, unsigned key, enum wl_keyboard_key_state state)
+ {
+    handle_key(key, state);
+ }
+ 
+ static void
+-modifiers(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint mods_depressed, uint mods_latched, uint mods_locked, uint group)
++modifiers(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned mods_depressed, unsigned mods_latched, unsigned mods_locked, unsigned group)
+ {
+    xkb_state_update_mask(keyboard_data.xkb_state, mods_depressed, mods_latched,
+                          mods_locked, 0, 0, group);
+@@ -184,7 +184,7 @@ keymap(void *data, struct wl_keyboard *keyboard,
+ }
+ 
+ static void
+-enter(void *data, struct wl_keyboard *keyboard, uint serial,
++enter(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface, struct wl_array *keys)
+ {
+    uint32_t *key;
+@@ -194,7 +194,7 @@ enter(void *data, struct wl_keyboard *keyboard, uint serial,
+ }
+ 
+ static void
+-leave(void *data, struct wl_keyboard *keyboard, uint serial,
++leave(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface)
+ {
+    struct itimerspec timer = {0};
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
