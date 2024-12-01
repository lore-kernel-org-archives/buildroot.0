Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625BCD4977B
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 17:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BFB4F10E;
	Sun,  1 Dec 2024 17:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cx2i1PrBk-XG; Sun,  1 Dec 2024 17:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D571E4ED83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D571E4ED83;
	Sun,  1 Dec 2024 17:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF156C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661764A150
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KzUR0f2Y2rU for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05F946260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F05F946260
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0C2867C8; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 18:42:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ae0e6d14d547c0d71cf68c75c821f4b2c1d367dd
X-Git-Newrev: a6a92a08b35ccecd1ed70feae97a247c7a8bb8aa
X-Patchwork-Hint: ignore
Message-Id: <20241201174550.DC0C2867C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wlroots: bump to
 version 0.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6a92a08b35ccecd1ed70feae97a247c7a8bb8aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.1
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.0
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.4
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.2
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.1
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.0

This commit updates the license file hash, due to the contributor
line update. See [1].

This commit also removes the package patch, which was merged
upstream in [2] (included in v0.18.0).

Also, upstream commit [3] (included in 0.17.0), added a new dependency
on libdisplay-info when using the DRM backend. This commit adds this
new dependency.

[1] https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/77d5631e42fbcf3ceb51a1d607219228aeaabb00
[2] https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/220df2aa0f8025ffe99287c3f5ea0e05436e3d08
[3] https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/35da9970019be6580394d5d6234b8ede0b2f0d5a

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien:
  - add new line before S-o-b
  - fix license hash, add commit log comment
  - add link in commit log justifying the patch removal
  - add link in commit log justifying the new dependency
  - moved BR2_PACKAGE_LIBDISPLAY_INFO to keep alphabetical order
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Add-feature-macros-to-more-C-files.patch  | 181 ---------------------
 package/wlroots/Config.in                          |   1 +
 package/wlroots/wlroots.hash                       |   8 +-
 package/wlroots/wlroots.mk                         |   3 +-
 4 files changed, 8 insertions(+), 185 deletions(-)

diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
deleted file mode 100644
index 9467318b31..0000000000
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 7854cd141f6f4c896afdc86229671d443ca7ba10 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Thu, 18 Feb 2021 22:31:39 +0000
-Subject: [PATCH] Add feature macros to more C files
-
-These source files use "struct timespec", which is POSIX 1993.09.
-
-Upstream: Rejected (Upstream does not want these workarounds)
-see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-[Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: refreshed the patch to be applied with fuzz factor 0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- backend/wayland/output.c                  | 1 +
- types/data_device/wlr_data_device.c       | 1 +
- types/data_device/wlr_drag.c              | 1 +
- types/wlr_export_dmabuf_v1.c              | 1 +
- types/wlr_idle.c                          | 1 +
- types/wlr_keyboard_shortcuts_inhibit_v1.c | 1 +
- types/wlr_pointer_constraints_v1.c        | 1 +
- types/wlr_primary_selection.c             | 1 +
- types/wlr_relative_pointer_v1.c           | 1 +
- types/wlr_screencopy_v1.c                 | 1 +
- types/wlr_virtual_pointer_v1.c            | 1 +
- types/wlr_xdg_decoration_v1.c             | 1 +
- types/xdg_shell/wlr_xdg_popup.c           | 1 +
- types/xdg_shell/wlr_xdg_positioner.c      | 1 +
- types/xdg_shell/wlr_xdg_shell.c           | 1 +
- types/xdg_shell/wlr_xdg_surface.c         | 1 +
- 16 files changed, 16 insertions(+)
-
-diff --git a/backend/wayland/output.c b/backend/wayland/output.c
-index c4b95e1..d5699d3 100644
---- a/backend/wayland/output.c
-+++ b/backend/wayland/output.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdint.h>
- #include <stdio.h>
-diff --git a/types/data_device/wlr_data_device.c b/types/data_device/wlr_data_device.c
-index 7e67479..2db13a6 100644
---- a/types/data_device/wlr_data_device.c
-+++ b/types/data_device/wlr_data_device.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/data_device/wlr_drag.c b/types/data_device/wlr_drag.c
-index c1fa801..8981ea0 100644
---- a/types/data_device/wlr_drag.c
-+++ b/types/data_device/wlr_drag.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/wlr_export_dmabuf_v1.c b/types/wlr_export_dmabuf_v1.c
-index c1d26e6..cd06615 100644
---- a/types/wlr_export_dmabuf_v1.c
-+++ b/types/wlr_export_dmabuf_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/types/wlr_idle.c b/types/wlr_idle.c
-index cb3a1cc..5f1fa95 100644
---- a/types/wlr_idle.c
-+++ b/types/wlr_idle.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/wlr_keyboard_shortcuts_inhibit_v1.c b/types/wlr_keyboard_shortcuts_inhibit_v1.c
-index cc9bac1..3924893 100644
---- a/types/wlr_keyboard_shortcuts_inhibit_v1.c
-+++ b/types/wlr_keyboard_shortcuts_inhibit_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/types/wlr_compositor.h>
-diff --git a/types/wlr_pointer_constraints_v1.c b/types/wlr_pointer_constraints_v1.c
-index 7a8d209..70b0984 100644
---- a/types/wlr_pointer_constraints_v1.c
-+++ b/types/wlr_pointer_constraints_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <limits.h>
- #include <pixman.h>
-diff --git a/types/wlr_primary_selection.c b/types/wlr_primary_selection.c
-index d576bf0..bac4daa 100644
---- a/types/wlr_primary_selection.c
-+++ b/types/wlr_primary_selection.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/types/wlr_primary_selection.h>
-diff --git a/types/wlr_relative_pointer_v1.c b/types/wlr_relative_pointer_v1.c
-index 44da791..f6925b8 100644
---- a/types/wlr_relative_pointer_v1.c
-+++ b/types/wlr_relative_pointer_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <inttypes.h>
- #include <stdlib.h>
-diff --git a/types/wlr_screencopy_v1.c b/types/wlr_screencopy_v1.c
-index 4ca659a..76c582e 100644
---- a/types/wlr_screencopy_v1.c
-+++ b/types/wlr_screencopy_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <drm_fourcc.h>
-diff --git a/types/wlr_virtual_pointer_v1.c b/types/wlr_virtual_pointer_v1.c
-index b452ff5..661e613 100644
---- a/types/wlr_virtual_pointer_v1.c
-+++ b/types/wlr_virtual_pointer_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/interfaces/wlr_pointer.h>
-diff --git a/types/wlr_xdg_decoration_v1.c b/types/wlr_xdg_decoration_v1.c
-index fcd97a5..1850665 100644
---- a/types/wlr_xdg_decoration_v1.c
-+++ b/types/wlr_xdg_decoration_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdbool.h>
- #include <stdlib.h>
-diff --git a/types/xdg_shell/wlr_xdg_popup.c b/types/xdg_shell/wlr_xdg_popup.c
-index fa99acd..8361eef 100644
---- a/types/xdg_shell/wlr_xdg_popup.c
-+++ b/types/xdg_shell/wlr_xdg_popup.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/xdg_shell/wlr_xdg_positioner.c b/types/xdg_shell/wlr_xdg_positioner.c
-index 6a991bb..dae879b 100644
---- a/types/xdg_shell/wlr_xdg_positioner.c
-+++ b/types/xdg_shell/wlr_xdg_positioner.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/util/edges.h>
-diff --git a/types/xdg_shell/wlr_xdg_shell.c b/types/xdg_shell/wlr_xdg_shell.c
-index 70b777d..16d275a 100644
---- a/types/xdg_shell/wlr_xdg_shell.c
-+++ b/types/xdg_shell/wlr_xdg_shell.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include "types/wlr_xdg_shell.h"
-diff --git a/types/xdg_shell/wlr_xdg_surface.c b/types/xdg_shell/wlr_xdg_surface.c
-index a03b90a..a6267cf 100644
---- a/types/xdg_shell/wlr_xdg_surface.c
-+++ b/types/xdg_shell/wlr_xdg_surface.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.45.2
-
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index d81506c375..02bd54c999 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PNP_IDS
+	select BR2_PACKAGE_LIBDISPLAY_INFO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 8ab05393b1..ccfcd6ac42 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,7 @@
-# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.16.2/downloads/wlroots-0.16.2.tar.gz.sig
-sha256  83e9a11605f23d4bf781ab1947089483d9ec3f7e9ba65398e0609593b77d44aa  wlroots-0.16.2.tar.gz
+# Locally calculated after checking pgp signature
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.1/downloads/wlroots-0.18.1.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  b9c4bfef4123fe9f8662280b851e3c5741927457174315826827bfbb70612878  wlroots-0.18.1.tar.gz
 
 # Hashes for license files:
-sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
+sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index fdd2fb8250..8fa7408717 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.16.2
+WLROOTS_VERSION = 0.18.1
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -14,6 +14,7 @@ WLROOTS_DEPENDENCIES = \
 	host-pkgconf \
 	host-wayland \
 	hwdata \
+	libdisplay-info \
 	libinput \
 	libxkbcommon \
 	libegl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
