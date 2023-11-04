Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D48C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D34CF40189;
	Sat,  4 Nov 2023 18:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34CF40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv4_7cTVqY5h; Sat,  4 Nov 2023 18:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 429D04029F;
	Sat,  4 Nov 2023 18:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429D04029F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 606041BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3470E40189
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3470E40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSXkyg0iYujq for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:28:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D61BF4029F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D61BF4029F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C01D2866E9; Sat,  4 Nov 2023 18:28:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:25:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce918125e126a8b75f2dce68e09205bb0e78add6
X-Git-Newrev: 1b8d7e7bedb204b6fb1094a57822a4652206b44a
X-Patchwork-Hint: ignore
Message-Id: <20231104182840.C01D2866E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 23.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b8d7e7bedb204b6fb1094a57822a4652206b44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patches 0002 & 0004.
Removed patch 0006 which is included in this release.

Release notes:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.2/docs/relnotes/23.2.1.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...on-option-to-disable-optional-neon-suppor.patch |  4 +-
 package/mesa3d/0004-Fix-uClibc-build.patch         | 19 +++++----
 ...e-i915-Gallium-driver-includes-Intel-sour.patch | 46 ----------------------
 package/mesa3d/mesa3d.hash                         |  5 +--
 package/mesa3d/mesa3d.mk                           |  2 +-
 6 files changed, 17 insertions(+), 61 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e70d3fe137..3bc12ca86e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.8
+MESA3D_HEADERS_VERSION = 23.2.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 430bd3b4b9..f3919478a6 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.2.0, 20.3.0, 21.1.0 & 23.1.0]
+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
@@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
 index 8e0bf2a..1cf0e07 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -116,6 +116,13 @@ option(
+@@ -124,6 +124,13 @@ option(
    description : 'enable gallium va frontend.',
  )
  
diff --git a/package/mesa3d/0004-Fix-uClibc-build.patch b/package/mesa3d/0004-Fix-uClibc-build.patch
index ae1fc25f48..faa86b0d1b 100644
--- a/package/mesa3d/0004-Fix-uClibc-build.patch
+++ b/package/mesa3d/0004-Fix-uClibc-build.patch
@@ -26,6 +26,8 @@ Fixes build errors with uClibc and gcc-9.3.0:
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[rebased for 23.2.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/util/compiler.h | 10 ++++++++++
  src/util/macros.h   |  1 +
@@ -35,10 +37,11 @@ diff --git a/src/util/compiler.h b/src/util/compiler.h
 index d184ad455af..b5c56807acc 100644
 --- a/src/util/compiler.h
 +++ b/src/util/compiler.h
-@@ -36,6 +36,16 @@
+@@ -35,6 +35,17 @@
  
- #include <assert.h>
  
+ #include <assert.h>
++
 +/*
 + * C11 static_assert() macro
 + * assert.h only defines that name for C11 and above
@@ -49,21 +52,21 @@ index d184ad455af..b5c56807acc 100644
 +#endif
 +#endif
 +
- #include "util/macros.h"
- 
- 
+ #include <limits.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
 diff --git a/src/util/macros.h b/src/util/macros.h
 index 22b18303826..8f73ee72693 100644
 --- a/src/util/macros.h
 +++ b/src/util/macros.h
-@@ -27,6 +27,7 @@
+@@ -31,6 +31,7 @@
  #include <stddef.h>
  #include <stdint.h>
  #include <stdio.h>
 +#include "util/compiler.h"
  
- /* Compute the size of an array */
- #ifndef ARRAY_SIZE
+ #ifdef _GAMING_XBOX
+ #define strdup _strdup
 -- 
 2.34.1
 
diff --git a/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch b/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
deleted file mode 100644
index 6831bdafd3..0000000000
--- a/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From cd861b7f38e448822ce765aee61304d1e0a3a8b5 Mon Sep 17 00:00:00 2001
-From: James Knight <james.d.knight@live.com>
-Date: Thu, 13 Apr 2023 16:38:51 -0400
-Subject: meson: ensure i915 Gallium driver includes Intel sources
-
-Ensure builds flag the use of Intel sources when the i915 Gallium driver
-is configured (`-Dgallium-drivers=i915`). Otherwise, a build may fail if
-other Intel-based configuration options are not enabled:
-
-    ./src/gallium/winsys/i915/drm/meson.build:21:0: ERROR: Unknown variable "libintel_common".
-
-Signed-off-by: James Knight <james.d.knight@live.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22490>
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/cd861b7f38e448822ce765aee61304d1e0a3a8b5
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- meson.build | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-(limited to 'meson.build')
-
-diff --git a/meson.build b/meson.build
-index 23d2d965b37..a3e3c5478a8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -245,7 +245,14 @@ with_microsoft_vk = _vulkan_drivers.contains('microsoft-experimental')
- with_any_vk = _vulkan_drivers.length() != 0
- 
- with_any_broadcom = with_gallium_vc4 or with_gallium_v3d or with_broadcom_vk
--with_any_intel = with_intel_vk or with_intel_hasvk or with_gallium_iris or with_gallium_crocus or with_intel_tools
-+with_any_intel = [
-+  with_gallium_crocus,
-+  with_gallium_i915,
-+  with_gallium_iris,
-+  with_intel_hasvk,
-+  with_intel_tools,
-+  with_intel_vk,
-+].contains(true)
- 
- if with_swrast_vk and not with_gallium_softpipe
-   error('swrast vulkan requires gallium swrast')
--- 
-cgit v1.2.1
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index a88ec5909f..0f4ca05831 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,4 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-September/000730.html
-sha256  45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad  mesa-23.1.8.tar.xz
-sha512  02dc6f8b10dd3827a2b62fba3035726b1b60ec0c3188817deea2ad14f80f332a37272e9f15c5f653f20cecb14f8ff91697d73c89afc83674c19b686a674b677d  mesa-23.1.8.tar.xz
+# From https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.2/docs/relnotes/23.2.1.rst
+sha256  64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc  mesa-23.2.1.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2a10f92c2a..4b360c8a8f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.8
+MESA3D_VERSION = 23.2.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
