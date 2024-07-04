Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC84BC3271E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 13:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263714088F;
	Thu,  4 Jul 2024 13:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vnsvdh-TiHS1; Thu,  4 Jul 2024 13:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F51407BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F51407BC;
	Thu,  4 Jul 2024 13:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCD51BF2AB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20B3784596
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSiRxxNImx9q for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 13:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84D8484592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D8484592
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D8484592
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 13:05:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 053DFB0051E;
 Thu,  4 Jul 2024 15:05:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 15:05:22 +0200
Message-ID: <20240704130522.145701-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720098333;
 bh=gRMbPxrB73QmNpeLV3YSkGWsb1/UCTt0t7Mh6DzKNJI=;
 h=From:To:Cc:Subject:Date:From;
 b=ik6aNObQHJEatFsfOeBPNP22bFCHeLY+KY6mIzc2H9eqtZfFWmLLfr5lYeOCNXhAh
 Yc884yEjsdBsXU5m5XZRErxIARU4cflwLV7y1I5A49dplsQUbT+H+eDZbhtA+S9zjz
 tCOyeL+ptrFgoSZGqqz84aghmzr8hrkblOjQpo/01VOVs40Qx62/RTgSD04GGShPOa
 qn9JnQXb8jQsGmkKfXww3fxeK3//TbA/s12zqdEi5ewGbPaKsz1jkmP/V7GGVNhzDx
 hrjfdd5NHBMjUinyrtKBH/sIHzlH+Jhmd5LhvXj5qM2VstWJCacwK/BEfm63ECTrDa
 d6b7gjFHnU5PA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ik6aNObQ
Subject: [Buildroot] [PATCH 1/1] package/wlroots: update the patches to be
 applied with fuzz 0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, wlroots fails to build with output:

    Applying 0001-Add-feature-macros-to-more-C-files-.patch using patch:
    patching file backend/wayland/output.c
    patching file types/data_device/wlr_data_device.c
    patching file types/data_device/wlr_drag.c
    patching file types/wlr_export_dmabuf_v1.c
    patching file types/wlr_idle.c
    patching file types/wlr_keyboard_shortcuts_inhibit_v1.c
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file types/wlr_keyboard_shortcuts_inhibit_v1.c.rej
    patching file types/wlr_pointer_constraints_v1.c
    patching file types/wlr_primary_selection.c
    patching file types/wlr_relative_pointer_v1.c
    patching file types/wlr_screencopy_v1.c
    patching file types/wlr_virtual_pointer_v1.c
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file types/wlr_virtual_pointer_v1.c.rej
    patching file types/wlr_xdg_decoration_v1.c
    patching file types/xdg_shell/wlr_xdg_popup.c
    patching file types/xdg_shell/wlr_xdg_positioner.c
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file types/xdg_shell/wlr_xdg_positioner.c.rej
    patching file types/xdg_shell/wlr_xdg_shell.c
    patching file types/xdg_shell/wlr_xdg_surface.c

This commit refreshes the package patch on the current package version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Add-feature-macros-to-more-C-files.patch} | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)
 rename package/wlroots/{0001-Add-feature-macros-to-more-C-files-.patch => 0001-Add-feature-macros-to-more-C-files.patch} (87%)

diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
similarity index 87%
rename from package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
rename to package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
index 0e1ae9d87aa..9467318b314 100644
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
+++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
@@ -1,4 +1,4 @@
-From cf37ba4c0bf31316b698ba23015f91903766871d Mon Sep 17 00:00:00 2001
+From 7854cd141f6f4c896afdc86229671d443ca7ba10 Mon Sep 17 00:00:00 2001
 From: Paul Cercueil <paul@crapouillou.net>
 Date: Thu, 18 Feb 2021 22:31:39 +0000
 Subject: [PATCH] Add feature macros to more C files
@@ -11,6 +11,8 @@ see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
 Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 [Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: refreshed the patch to be applied with fuzz factor 0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  backend/wayland/output.c                  | 1 +
  types/data_device/wlr_data_device.c       | 1 +
@@ -31,7 +33,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  16 files changed, 16 insertions(+)
 
 diff --git a/backend/wayland/output.c b/backend/wayland/output.c
-index d5410e0d32..8ff8fa2a00 100644
+index c4b95e1..d5699d3 100644
 --- a/backend/wayland/output.c
 +++ b/backend/wayland/output.c
 @@ -1,3 +1,4 @@
@@ -40,7 +42,7 @@ index d5410e0d32..8ff8fa2a00 100644
  #include <stdint.h>
  #include <stdio.h>
 diff --git a/types/data_device/wlr_data_device.c b/types/data_device/wlr_data_device.c
-index 6cd84ec0ab..beac496124 100644
+index 7e67479..2db13a6 100644
 --- a/types/data_device/wlr_data_device.c
 +++ b/types/data_device/wlr_data_device.c
 @@ -1,3 +1,4 @@
@@ -49,7 +51,7 @@ index 6cd84ec0ab..beac496124 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/types/data_device/wlr_drag.c b/types/data_device/wlr_drag.c
-index 53bf4066a1..e3c1e249b4 100644
+index c1fa801..8981ea0 100644
 --- a/types/data_device/wlr_drag.c
 +++ b/types/data_device/wlr_drag.c
 @@ -1,3 +1,4 @@
@@ -58,7 +60,7 @@ index 53bf4066a1..e3c1e249b4 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/types/wlr_export_dmabuf_v1.c b/types/wlr_export_dmabuf_v1.c
-index a8e2a4bde3..98ceae68f1 100644
+index c1d26e6..cd06615 100644
 --- a/types/wlr_export_dmabuf_v1.c
 +++ b/types/wlr_export_dmabuf_v1.c
 @@ -1,3 +1,4 @@
@@ -67,7 +69,7 @@ index a8e2a4bde3..98ceae68f1 100644
  #include <stdlib.h>
  #include <unistd.h>
 diff --git a/types/wlr_idle.c b/types/wlr_idle.c
-index 4c338931cc..80fd871fab 100644
+index cb3a1cc..5f1fa95 100644
 --- a/types/wlr_idle.c
 +++ b/types/wlr_idle.c
 @@ -1,3 +1,4 @@
@@ -76,16 +78,16 @@ index 4c338931cc..80fd871fab 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/types/wlr_keyboard_shortcuts_inhibit_v1.c b/types/wlr_keyboard_shortcuts_inhibit_v1.c
-index fe4e64b04e..8360a9c21c 100644
+index cc9bac1..3924893 100644
 --- a/types/wlr_keyboard_shortcuts_inhibit_v1.c
 +++ b/types/wlr_keyboard_shortcuts_inhibit_v1.c
 @@ -1,3 +1,4 @@
 +#define _POSIX_C_SOURCE 199309L
  #include <assert.h>
  #include <stdlib.h>
- #include <util/signal.h>
+ #include <wlr/types/wlr_compositor.h>
 diff --git a/types/wlr_pointer_constraints_v1.c b/types/wlr_pointer_constraints_v1.c
-index eca45984c4..f1db8e3415 100644
+index 7a8d209..70b0984 100644
 --- a/types/wlr_pointer_constraints_v1.c
 +++ b/types/wlr_pointer_constraints_v1.c
 @@ -1,3 +1,4 @@
@@ -94,7 +96,7 @@ index eca45984c4..f1db8e3415 100644
  #include <limits.h>
  #include <pixman.h>
 diff --git a/types/wlr_primary_selection.c b/types/wlr_primary_selection.c
-index 0875462c8c..7e0e11ddaa 100644
+index d576bf0..bac4daa 100644
 --- a/types/wlr_primary_selection.c
 +++ b/types/wlr_primary_selection.c
 @@ -1,3 +1,4 @@
@@ -103,7 +105,7 @@ index 0875462c8c..7e0e11ddaa 100644
  #include <stdlib.h>
  #include <wlr/types/wlr_primary_selection.h>
 diff --git a/types/wlr_relative_pointer_v1.c b/types/wlr_relative_pointer_v1.c
-index 8613f2b91c..3f8dd8b72a 100644
+index 44da791..f6925b8 100644
 --- a/types/wlr_relative_pointer_v1.c
 +++ b/types/wlr_relative_pointer_v1.c
 @@ -1,3 +1,4 @@
@@ -112,7 +114,7 @@ index 8613f2b91c..3f8dd8b72a 100644
  #include <inttypes.h>
  #include <stdlib.h>
 diff --git a/types/wlr_screencopy_v1.c b/types/wlr_screencopy_v1.c
-index 6feb074274..29864c2364 100644
+index 4ca659a..76c582e 100644
 --- a/types/wlr_screencopy_v1.c
 +++ b/types/wlr_screencopy_v1.c
 @@ -1,3 +1,4 @@
@@ -121,16 +123,16 @@ index 6feb074274..29864c2364 100644
  #include <stdlib.h>
  #include <drm_fourcc.h>
 diff --git a/types/wlr_virtual_pointer_v1.c b/types/wlr_virtual_pointer_v1.c
-index a9d1fd7bc4..5566e9e013 100644
+index b452ff5..661e613 100644
 --- a/types/wlr_virtual_pointer_v1.c
 +++ b/types/wlr_virtual_pointer_v1.c
 @@ -1,3 +1,4 @@
 +#define _POSIX_C_SOURCE 199309L
  #include <assert.h>
  #include <stdlib.h>
- #include <wlr/types/wlr_seat.h>
+ #include <wlr/interfaces/wlr_pointer.h>
 diff --git a/types/wlr_xdg_decoration_v1.c b/types/wlr_xdg_decoration_v1.c
-index 544035b7b8..904474c088 100644
+index fcd97a5..1850665 100644
 --- a/types/wlr_xdg_decoration_v1.c
 +++ b/types/wlr_xdg_decoration_v1.c
 @@ -1,3 +1,4 @@
@@ -139,7 +141,7 @@ index 544035b7b8..904474c088 100644
  #include <stdbool.h>
  #include <stdlib.h>
 diff --git a/types/xdg_shell/wlr_xdg_popup.c b/types/xdg_shell/wlr_xdg_popup.c
-index 69b4cfe19f..05d6551fc8 100644
+index fa99acd..8361eef 100644
 --- a/types/xdg_shell/wlr_xdg_popup.c
 +++ b/types/xdg_shell/wlr_xdg_popup.c
 @@ -1,3 +1,4 @@
@@ -148,16 +150,16 @@ index 69b4cfe19f..05d6551fc8 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/types/xdg_shell/wlr_xdg_positioner.c b/types/xdg_shell/wlr_xdg_positioner.c
-index f88bf323b8..8881c49916 100644
+index 6a991bb..dae879b 100644
 --- a/types/xdg_shell/wlr_xdg_positioner.c
 +++ b/types/xdg_shell/wlr_xdg_positioner.c
 @@ -1,3 +1,4 @@
 +#define _POSIX_C_SOURCE 199309L
  #include <assert.h>
  #include <stdlib.h>
- #include "types/wlr_xdg_shell.h"
+ #include <wlr/util/edges.h>
 diff --git a/types/xdg_shell/wlr_xdg_shell.c b/types/xdg_shell/wlr_xdg_shell.c
-index 0480d5f354..c93fe7c3fb 100644
+index 70b777d..16d275a 100644
 --- a/types/xdg_shell/wlr_xdg_shell.c
 +++ b/types/xdg_shell/wlr_xdg_shell.c
 @@ -1,3 +1,4 @@
@@ -166,7 +168,7 @@ index 0480d5f354..c93fe7c3fb 100644
  #include <stdlib.h>
  #include "types/wlr_xdg_shell.h"
 diff --git a/types/xdg_shell/wlr_xdg_surface.c b/types/xdg_shell/wlr_xdg_surface.c
-index edf562abcd..c1dfbfba7e 100644
+index a03b90a..a6267cf 100644
 --- a/types/xdg_shell/wlr_xdg_surface.c
 +++ b/types/xdg_shell/wlr_xdg_surface.c
 @@ -1,3 +1,4 @@
@@ -174,3 +176,6 @@ index edf562abcd..c1dfbfba7e 100644
  #include <assert.h>
  #include <stdlib.h>
  #include <string.h>
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
