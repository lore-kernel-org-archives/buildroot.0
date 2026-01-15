Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5975DCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB1981E30;
	Mon, 19 Jan 2026 10:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raImeX1F4Tnl; Mon, 19 Jan 2026 10:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8469981E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816860;
	bh=OlOUis5QiJlLrw746MEZ6351zGUHvDJAroHhgysw2Kg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n4CARMXb4n2Zksji1FVuI282zJhAPTd2S0OasExOO3izRfrI9yUpsjHdLlRD175ZA
	 +KvvOQ4L4hHTsee4rpFrPw6m4jv8nJYgN/QFtTHx5O5WrUYzatr3qC+vXLTMjofRlz
	 lrEfSmnZFYIK18TrUUkxR0/Q9pHVF+Q3OAitMAyua1LMV6201R5R+JPTHab5MhKx1A
	 RKxN5yO9GnboUkemp5v4b4rqcbTeNn96/U89lJPpaRkxgD4th4mu61iUbBgiwVZ+rb
	 t3MD0LDoWZUIXpGQ+DAeZp9+A+MJabg9ovAHtDZ7d1awa13BeHpIY+Hg4Xj+8ELs95
	 uQuTl9s6xS8qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8469981E31;
	Mon, 19 Jan 2026 10:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C4F160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61CE406D7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8kyNyvbQrVH for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35561406BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35561406BB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE1388587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 08:44:47 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 1f642b56de2eb2476bae24a2282d51977f487b7e
X-Git-Newrev: 9527a010f2f4aa1680bfef307c9c94b93c5e2d7d
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.2CE1388587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/efl: bump to
 version 1.28.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9527a010f2f4aa1680bfef307c9c94b93c5e2d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Some important addition and several bug fixes for gcc-15. Some of those
fixes are committed but not part of version 1.28.1 so they are added as
local patches while dropping old patches except the tslib one.

See Release Notes of all versions:
https://www.enlightenment.org/news/2025-03-17-efl-1.28.1
https://www.enlightenment.org/news/2025-01-11-efl-1.28.0
https://www.enlightenment.org/news/2023-12-23-efl-1.27.0

COPYING.images was removed as part of upstream commit
83d598a79c16b532113aeda8b1d3ff8a0816bde7.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c7a1b73f1758855e47c188c38617dd309b2c2428)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   4 +-
 ...engines-drm-meson.build-use-gl_deps-as-en.patch |  36 -
 ...ch => 0001-ecore_fb-fix-build-with-tslib.patch} |   0
 ...engines-drm-meson.build-fix-gl_drm-includ.patch |  37 -
 ...c-codec-move-to-Eina_Bool-from-bool-for-c.patch | 198 +++++
 .../efl/0003-eldbus-silence-gcc-15-warnings.patch  | 106 +++
 ...004-efl-all-gcc-15-break-older-c-std-code.patch | 857 +++++++++++++++++++++
 .../0005-ecore-file-silence-gcc-15-warnings.patch  |  40 +
 ...-gcc15-break-adapt-to-new-keywords-in-c23.patch |  75 ++
 ...-evas-gl-full-builds-after-gcc-15-changes.patch |  30 +
 ...gcc-15-breaks-builds-new-keyword-constexp.patch | 155 ++++
 package/efl/efl.hash                               |   5 +-
 package/efl/efl.mk                                 |   7 +-
 13 files changed, 1467 insertions(+), 83 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 294b7ebc7a..a9b561ae14 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -337,9 +337,7 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
-package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_patch.Upstream
-package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
-package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
+package/efl/0001-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
diff --git a/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
deleted file mode 100644
index 8fa4658f06..0000000000
--- a/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 00833baac6935bd1e3e9856211bc165c5b02a7bd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 1 Aug 2020 02:25:47 +0200
-Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
- dependencies
-
-Meson trigger an error since "engine_gl_drm" variable doesn't exist.
-
-src/modules/ecore_evas/engines/drm/meson.build:10:2: ERROR: Unknown variable "engine_gl_drm".
-
-Instead use "gl_deps" as engine dependencies.
-
-Upstream status:
-https://sourceforge.net/p/enlightenment/mailman/message/37075016/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/modules/ecore_evas/engines/drm/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
-index 58071010d0..0741d7fccd 100644
---- a/src/modules/ecore_evas/engines/drm/meson.build
-+++ b/src/modules/ecore_evas/engines/drm/meson.build
-@@ -3,7 +3,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
- 
- if get_option('opengl') != 'none'
-   config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
--  engine_deps += [engine_gl_drm]
-+  engine_deps += [gl_deps]
- endif
- 
- engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
--- 
-2.31.1
-
diff --git a/package/efl/0003-ecore_fb-fix-build-with-tslib.patch b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
similarity index 100%
rename from package/efl/0003-ecore_fb-fix-build-with-tslib.patch
rename to package/efl/0001-ecore_fb-fix-build-with-tslib.patch
diff --git a/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
deleted file mode 100644
index 3465fc50aa..0000000000
--- a/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a21e71cc2284a19a34c913aff757e656e3a8c14a Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 1 Aug 2020 01:01:00 +0200
-Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
- directory
-
-The Evas_Engine_GL_Drm.h file is in "gl_drm" directory, not "drm".
-
-../src/modules/ecore_evas/engines/drm/ecore_evas_drm.c:23:11: fatal error: Evas_Engine_GL_Drm.h: No such file or directory
-   23 | # include <Evas_Engine_GL_Drm.h>
-      |           ^~~~~~~~~~~~~~~~~~~~~~
-compilation terminated.
-
-Upstream status:
-https://sourceforge.net/p/enlightenment/mailman/message/37075004/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/modules/ecore_evas/engines/drm/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
-index 0741d7fccd..edda1abd71 100644
---- a/src/modules/ecore_evas/engines/drm/meson.build
-+++ b/src/modules/ecore_evas/engines/drm/meson.build
-@@ -6,7 +6,7 @@ if get_option('opengl') != 'none'
-   engine_deps += [gl_deps]
- endif
- 
--engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
-+engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'gl_drm'))
- 
- shared_module(mod_full_name, engine_src,
-   include_directories : config_dir + [engine_include_dir],
--- 
-2.31.1
-
diff --git a/package/efl/0002-evas-fix-etc-codec-move-to-Eina_Bool-from-bool-for-c.patch b/package/efl/0002-evas-fix-etc-codec-move-to-Eina_Bool-from-bool-for-c.patch
new file mode 100644
index 0000000000..46fe7497f9
--- /dev/null
+++ b/package/efl/0002-evas-fix-etc-codec-move-to-Eina_Bool-from-bool-for-c.patch
@@ -0,0 +1,198 @@
+From 0fcaf460c4a33eb54a51b9d8cb38321603019529 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Thu, 24 Apr 2025 10:54:38 +0100
+Subject: [PATCH] evas - fix etc codec - move to Eina_Bool from bool for c23
+ changes
+
+fixes #84
+
+@fix
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/0fcaf460c4a33eb54a51b9d8cb38321603019529
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/static_libs/rg_etc/rg_etc1.c | 44 ++++++++++++++++----------------
+ src/static_libs/rg_etc/rg_etc1.h |  6 ++---
+ 2 files changed, 25 insertions(+), 25 deletions(-)
+
+diff --git a/src/static_libs/rg_etc/rg_etc1.c b/src/static_libs/rg_etc/rg_etc1.c
+index 9b889a3995..49e1aa3eff 100644
+--- a/src/static_libs/rg_etc/rg_etc1.c
++++ b/src/static_libs/rg_etc/rg_etc1.c
+@@ -1074,7 +1074,7 @@ rg_etc1_block_color4_pack(unsigned int color, unsigned char scaled, unsigned cha
+ 
+ static inline void
+ rg_etc1_block_color4_component_unpack(unsigned char *r, unsigned char *g, unsigned char *b,
+-                                      unsigned short packed_color4, bool scaled)
++                                      unsigned short packed_color4, Eina_Bool scaled)
+ {
+    *r = (packed_color4 >> 8) & 15;
+    *g = (packed_color4 >> 4) & 15;
+@@ -1103,7 +1103,7 @@ rg_etc1_block_color4_unpack(unsigned short packed_color4, unsigned char scaled,
+ 
+ static inline unsigned char
+ rg_etc1_block_color5_delta3_component_unpack(unsigned char *r, unsigned char *g, unsigned char *b,
+-                                             unsigned short packed_color5, unsigned short packed_delta3, bool scaled)
++                                             unsigned short packed_color5, unsigned short packed_delta3, Eina_Bool scaled)
+ {
+    unsigned char success = 1;
+    char dc_r, dc_g, dc_b;
+@@ -1136,7 +1136,7 @@ rg_etc1_block_color5_delta3_component_unpack(unsigned char *r, unsigned char *g,
+ static inline unsigned char
+ rg_etc1_block_color5_delta3_unpack(unsigned int *result,
+                                    unsigned short packed_color5, unsigned short packed_delta3,
+-                                   bool scaled, unsigned char alpha)
++                                   Eina_Bool scaled, unsigned char alpha)
+ {
+    unsigned char success;
+    unsigned char r, g, b;
+@@ -1220,8 +1220,8 @@ rg_etc1_block_subblock_color4_abs_get(unsigned int dst[4], unsigned short packed
+ }
+ 
+ // This is the exported function to unpack a block
+-bool
+-rg_etc1_unpack_block(const void *ETC1_block, unsigned int *pDst_pixels_BGRA, bool preserve_alpha)
++Eina_Bool
++rg_etc1_unpack_block(const void *ETC1_block, unsigned int *pDst_pixels_BGRA, Eina_Bool preserve_alpha)
+ {
+    unsigned char diff_flag, flip_flag, table_index0, table_index1;
+    unsigned int subblock_colors0[4] = { 0 };
+@@ -1627,12 +1627,12 @@ struct _rg_etc1_optimizer_params
+    uint m_num_src_pixels;
+    const color_quad_u8* m_pSrc_pixels;
+ 
+-   bool m_use_color4;
++   Eina_Bool m_use_color4;
+    const int* m_pScan_deltas;
+    uint m_scan_delta_size;
+ 
+    color_quad_u8 m_base_color5;
+-   bool m_constrain_against_base_color5;
++   Eina_Bool m_constrain_against_base_color5;
+ };
+ 
+ static inline void
+@@ -1665,7 +1665,7 @@ typedef struct
+    uint m_block_inten_table;
+    uint m_n;
+    uint8* m_pSelectors;
+-   bool m_block_color4;
++   Eina_Bool m_block_color4;
+ } rg_etc1_optimizer_results;
+ 
+ static inline void
+@@ -1685,7 +1685,7 @@ typedef struct
+    Etc1_Solution_Coordinates m_coords;
+    uint8                      m_selectors[8];
+    uint64                     m_error;
+-   bool                       m_valid;
++   Eina_Bool                  m_valid;
+ } rg_etc1_potential_solution;
+ 
+ static inline void
+@@ -1730,14 +1730,14 @@ rg_etc1_optimizer_clear(rg_etc1_optimizer *optimizer)
+    rg_etc1_potential_solution_clear(&optimizer->m_trial_solution);
+ }
+ 
+-static bool rg_etc1_optimizer_evaluate_solution(rg_etc1_optimizer *optimizer, const Etc1_Solution_Coordinates* coords,
+-                                                rg_etc1_potential_solution* trial_solution,
+-                                                rg_etc1_potential_solution* pBest_solution);
+-static bool rg_etc1_optimizer_evaluate_solution_fast(rg_etc1_optimizer *optimizer,const Etc1_Solution_Coordinates *coords,
+-                                                     rg_etc1_potential_solution *trial_solution,
+-                                                     rg_etc1_potential_solution *pBest_solution);
++static Eina_Bool rg_etc1_optimizer_evaluate_solution(rg_etc1_optimizer *optimizer, const Etc1_Solution_Coordinates* coords,
++                                                     rg_etc1_potential_solution* trial_solution,
++                                                     rg_etc1_potential_solution* pBest_solution);
++static Eina_Bool rg_etc1_optimizer_evaluate_solution_fast(rg_etc1_optimizer *optimizer,const Etc1_Solution_Coordinates *coords,
++                                                          rg_etc1_potential_solution *trial_solution,
++                                                          rg_etc1_potential_solution *pBest_solution);
+ 
+-static bool
++static Eina_Bool
+ rg_etc1_optimizer_compute(rg_etc1_optimizer *optimizer)
+ {
+    const uint n = optimizer->m_pParams->m_num_src_pixels;
+@@ -1811,7 +1811,7 @@ rg_etc1_optimizer_compute(rg_etc1_optimizer *optimizer)
+                        color_quad_u8 base_color;
+                        float avg_delta_r_f, avg_delta_g_f, avg_delta_b_f;
+                        int br1, bg1, bb1;
+-                       bool skip;
++                       Eina_Bool skip;
+                        Etc1_Solution_Coordinates coords1;
+                        rg_etc1_solution_coordinates_get_scaled_color(&base_color, &optimizer->m_best_solution.m_coords);
+ 
+@@ -1958,14 +1958,14 @@ rg_etc1_optimizer_init(rg_etc1_optimizer *optimizer, const rg_etc1_optimizer_par
+    optimizer->m_best_solution.m_error = cUINT64_MAX;
+ }
+ 
+-static bool
++static Eina_Bool
+ rg_etc1_optimizer_evaluate_solution(rg_etc1_optimizer *optimizer, const Etc1_Solution_Coordinates* coords,
+                                     rg_etc1_potential_solution* trial_solution, rg_etc1_potential_solution* pBest_solution)
+ {
+    color_quad_u8 base_color;
+    const uint n = 8;
+    uint inten_table;
+-   bool success = EINA_FALSE;
++   Eina_Bool success = EINA_FALSE;
+ 
+    trial_solution->m_valid = EINA_FALSE;
+ 
+@@ -2062,14 +2062,14 @@ rg_etc1_optimizer_evaluate_solution(rg_etc1_optimizer *optimizer, const Etc1_Sol
+    return success;
+ }
+ 
+-static bool
++static Eina_Bool
+ rg_etc1_optimizer_evaluate_solution_fast(rg_etc1_optimizer *optimizer, const Etc1_Solution_Coordinates *coords,
+                                          rg_etc1_potential_solution *trial_solution, rg_etc1_potential_solution *pBest_solution)
+ {
+    color_quad_u8 base_color;
+    const uint n = 8;
+    int inten_table;
+-   bool success = EINA_FALSE;
++   Eina_Bool success = EINA_FALSE;
+ 
+    if (optimizer->m_pParams->m_constrain_against_base_color5)
+      {
+@@ -2380,7 +2380,7 @@ rg_etc1_pack_block_solid_color(unsigned char *block, const color_quad_u8 *color,
+ static uint
+ rg_etc1_pack_block_solid_color_constrained(rg_etc1_optimizer_results *results,uint num_colors,
+                                            const uint8* pColor, rg_etc1_pack_params *pack_params EINA_UNUSED,
+-                                           bool use_diff, const color_quad_u8* pBase_color5_unscaled)
++                                           Eina_Bool use_diff, const color_quad_u8* pBase_color5_unscaled)
+ {
+    static uint s_next_comp[4] = { 1, 2, 0, 1 };
+    uint best_error = cUINT32_MAX, best_i = 0;
+diff --git a/src/static_libs/rg_etc/rg_etc1.h b/src/static_libs/rg_etc/rg_etc1.h
+index 4a695dc2d0..28742ca768 100644
+--- a/src/static_libs/rg_etc/rg_etc1.h
++++ b/src/static_libs/rg_etc/rg_etc1.h
+@@ -3,13 +3,13 @@
+ #ifndef __RG_ETC1_H__
+ #define __RG_ETC1_H__
+ 
+-typedef unsigned char bool;
++#include <Eina.h>
+ 
+ // Unpacks an 8-byte ETC1 compressed block to a block of 4x4 32bpp RGBA pixels.
+ // Returns false if the block is invalid. Invalid blocks will still be unpacked with clamping.
+ // This function is thread safe, and does not dynamically allocate any memory.
+ // If preserve_alpha is true, the alpha channel of the destination pixels will not be overwritten. Otherwise, alpha will be set to 255.
+-bool rg_etc1_unpack_block(const void *pETC1_block, unsigned int* pDst_pixels_rgba, bool preserve_alpha);
++Eina_Bool rg_etc1_unpack_block(const void *pETC1_block, unsigned int* pDst_pixels_rgba, Eina_Bool preserve_alpha);
+ 
+ // Quality setting = the higher the quality, the slower.
+ // To pack large textures, it is highly recommended to call pack_etc1_block() in parallel, on different blocks, from multiple threads (particularly when using cHighQuality).
+@@ -23,7 +23,7 @@ typedef enum {
+ typedef struct
+ {
+    rg_etc1_quality m_quality;
+-   bool m_dithering;
++   Eina_Bool m_dithering;
+ } rg_etc1_pack_params;
+ 
+ // pack_etc1_block_init() should be called before calling pack_etc1_block(),
+-- 
+2.47.3
+
diff --git a/package/efl/0003-eldbus-silence-gcc-15-warnings.patch b/package/efl/0003-eldbus-silence-gcc-15-warnings.patch
new file mode 100644
index 0000000000..91a89cbdde
--- /dev/null
+++ b/package/efl/0003-eldbus-silence-gcc-15-warnings.patch
@@ -0,0 +1,106 @@
+From 9948f15ebdfae6b39f88ab58623e28c2b9320e0b Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Mon, 28 Apr 2025 12:53:01 +0100
+Subject: [PATCH] eldbus - silence gcc 15 warnings
+
+nmo bug here - just warnings for perfectly ok code and people using
+-Werror ...
+
+fixes #85
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/9948f15ebdfae6b39f88ab58623e28c2b9320e0b
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/lib/eldbus/eldbus_core.c         |  2 +-
+ src/lib/emile/emile_cipher_openssl.c | 54 ++++++++++++++++++++--------
+ 2 files changed, 41 insertions(+), 15 deletions(-)
+
+diff --git a/src/lib/eldbus/eldbus_core.c b/src/lib/eldbus/eldbus_core.c
+index 513314741a..3f4aedd442 100644
+--- a/src/lib/eldbus/eldbus_core.c
++++ b/src/lib/eldbus/eldbus_core.c
+@@ -103,7 +103,7 @@ eldbus_fd_handler_del(Eldbus_Handler_Data *hd)
+ }
+ 
+ static void
+-_eldbus_fork_reset()
++_eldbus_fork_reset(void *data EINA_UNUSED)
+ {
+    int i;
+ 
+diff --git a/src/lib/emile/emile_cipher_openssl.c b/src/lib/emile/emile_cipher_openssl.c
+index 7dd2033db1..52575e653a 100644
+--- a/src/lib/emile/emile_cipher_openssl.c
++++ b/src/lib/emile/emile_cipher_openssl.c
+@@ -313,7 +313,6 @@ EAPI Emile_SSL *
+ emile_cipher_server_listen(Emile_Cipher_Type t)
+ {
+    Emile_SSL *r;
+-   DH *dh_params = NULL;
+    int options;
+    int dh = 0;
+ 
+@@ -343,20 +342,47 @@ emile_cipher_server_listen(Emile_Cipher_Type t)
+ 
+    if (!r->ssl_ctx) goto on_error;
+ 
+-   dh_params = DH_new();
+-   if (!dh_params) goto on_error;
+-   if (!DH_generate_parameters_ex(dh_params, 1024, DH_GENERATOR_5, NULL))
+-     goto on_error;
+-   if (!DH_check(dh_params, &dh))
+-     goto on_error;
+-   if ((dh & DH_CHECK_P_NOT_PRIME) || (dh & DH_CHECK_P_NOT_SAFE_PRIME))
+-     goto on_error;
+-   if (!DH_generate_key(dh_params))
+-     goto on_error;
+-   if (!SSL_CTX_set_tmp_dh(r->ssl_ctx, dh_params))
+-     goto on_error;
++//#define OPENSSL_DH_OLD 1
++
++   do
++     {
++#ifdef OPENSSL_DH_OLD
++       DH *dh_params = DH_new();
++       if (!dh_params) goto on_error;
++       if (!DH_generate_parameters_ex(dh_params, 1024, DH_GENERATOR_5, NULL))
++         goto on_error;
++       if (!DH_check(dh_params, &dh))
++         goto on_error;
++       if ((dh & DH_CHECK_P_NOT_PRIME) || (dh & DH_CHECK_P_NOT_SAFE_PRIME))
++         goto on_error;
++       if (!DH_generate_key(dh_params))
++         goto on_error;
++       if (!SSL_CTX_set_tmp_dh(r->ssl_ctx, dh_params))
++         goto on_error;
++       DH_free(dh_params);
++#else
++       EVP_PKEY *params = NULL;
++       EVP_PKEY_CTX *pctx = EVP_PKEY_CTX_new_id(EVP_PKEY_DH, NULL);
++       if (!pctx)
++         goto on_error;
++       if (EVP_PKEY_paramgen_init(pctx) <= 0)
++         goto on_error2;
++       if (EVP_PKEY_CTX_set_dh_paramgen_prime_len(pctx, 1024) <= 0)
++         goto on_error2;
++       if (EVP_PKEY_CTX_set_dh_paramgen_generator(pctx, 5) <= 0)
++         goto on_error2;
++       if (EVP_PKEY_paramgen(pctx, &params) <= 0)
++         goto on_error2;
++       if (SSL_CTX_set0_tmp_dh_pkey(r->ssl_ctx, params) <= 0)
++         goto on_error2;
++on_error2:
++       if (params) EVP_PKEY_free(params);
++       EVP_PKEY_CTX_free(pctx);
++       if (!params) goto on_error;
++#endif
++     }
++   while (0);
+ 
+-   DH_free(dh_params);
+    INF("DH params successfully generated and applied!");
+ 
+    if (!SSL_CTX_set_cipher_list(r->ssl_ctx,
+-- 
+2.47.3
+
diff --git a/package/efl/0004-efl-all-gcc-15-break-older-c-std-code.patch b/package/efl/0004-efl-all-gcc-15-break-older-c-std-code.patch
new file mode 100644
index 0000000000..b77b4bcdab
--- /dev/null
+++ b/package/efl/0004-efl-all-gcc-15-break-older-c-std-code.patch
@@ -0,0 +1,857 @@
+From 60217eff9672e55c67454df13a16236d106fc92f Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Sat, 3 May 2025 15:08:54 +0100
+Subject: [PATCH] efl all - gcc 15 break older c std code
+
+gcc 15 default policy of breaking existing code. adapt. this time it's
+the old func() == i take zero or more arguments func not NO arguments.
+gcc15 made this a compile error and efl used it as a shortcut all over
+to save being verbose when not needed.
+
+adapt
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/60217eff9672e55c67454df13a16236d106fc92f
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/bin/elementary/test_win_stack.c           |   2 +-
+ src/bin/exactness/player.c                    |   2 +-
+ src/bin/exactness/recorder.c                  |   2 +-
+ src/lib/ecore_imf/ecore_imf_context.c         |  19 ++-
+ src/lib/ecore_imf/ecore_imf_private.h         |   4 +-
+ src/lib/eeze/eeze_udev_watch.c                |   2 +-
+ src/lib/efl_canvas_wl/efl_canvas_wl.c         |  16 +-
+ src/lib/efl_canvas_wl/x11.x                   |   2 +-
+ src/lib/efreet/efreet_cache.c                 |   2 +-
+ src/lib/eio/eio_monitor_inotify.c             |   2 +-
+ .../system/systemd/ecore_system_systemd.c     |   2 +-
+ .../ecore/system/upower/ecore_system_upower.c |   2 +-
+ .../evas/engines/gl_common/evas_gl_context.c  | 158 ++++++++----------
+ .../evas/engines/gl_common/evas_gl_core.c     |   2 +-
+ src/modules/evas/engines/gl_drm/evas_engine.c |  28 +---
+ src/modules/evas/engines/gl_x11/evas_engine.c |  94 +++++------
+ src/modules/evas/engines/gl_x11/evas_x_main.c |   4 +-
+ .../evas/engines/wayland_egl/evas_engine.c    |  31 +---
+ 18 files changed, 172 insertions(+), 202 deletions(-)
+
+diff --git a/src/bin/elementary/test_win_stack.c b/src/bin/elementary/test_win_stack.c
+index e3ca2b943e..96e0b54f41 100644
+--- a/src/bin/elementary/test_win_stack.c
++++ b/src/bin/elementary/test_win_stack.c
+@@ -92,7 +92,7 @@ _bt_pressed(void *data, Evas_Object *obj EINA_UNUSED, void *event_info EINA_UNUS
+ }
+ 
+ static void
+-_del()
++_del(void *data EINA_UNUSED, Evas *e EINA_UNUSED, Evas_Object *o EINA_UNUSED, void *info EINA_UNUSED)
+ {
+    level = 0;
+    popto_win = NULL;
+diff --git a/src/bin/exactness/player.c b/src/bin/exactness/player.c
+index 6802c72efe..7e47a15664 100644
+--- a/src/bin/exactness/player.c
++++ b/src/bin/exactness/player.c
+@@ -1040,7 +1040,7 @@ _write_unit_file(void)
+ }
+ #ifdef HAVE_DLSYM
+ # define ORIGINAL_CALL_T(t, name, ...) \
+-   t (*_original_init_cb)(); \
++   t (*_original_init_cb)(...); \
+    _original_init_cb = dlsym(RTLD_NEXT, name); \
+    original_return = _original_init_cb(__VA_ARGS__);
+ #else
+diff --git a/src/bin/exactness/recorder.c b/src/bin/exactness/recorder.c
+index f161100cbc..45394c3c59 100644
+--- a/src/bin/exactness/recorder.c
++++ b/src/bin/exactness/recorder.c
+@@ -301,7 +301,7 @@ _setup_ee_creation(void)
+ 
+ #ifdef HAVE_DLSYM
+ # define ORIGINAL_CALL_T(t, name, ...) \
+-   t (*_original_init_cb)(); \
++   t (*_original_init_cb)(...); \
+    _original_init_cb = dlsym(RTLD_NEXT, name); \
+    original_return = _original_init_cb(__VA_ARGS__);
+ #else
+diff --git a/src/lib/ecore_imf/ecore_imf_context.c b/src/lib/ecore_imf/ecore_imf_context.c
+index 5ade47002b..cea45ba54e 100644
+--- a/src/lib/ecore_imf/ecore_imf_context.c
++++ b/src/lib/ecore_imf/ecore_imf_context.c
+@@ -780,7 +780,7 @@ ecore_imf_context_event_callback_add(Ecore_IMF_Context *ctx, Ecore_IMF_Callback_
+    fn = calloc(1, sizeof (Ecore_IMF_Func_Node));
+    if (!fn) return;
+ 
+-   fn->func = func;
++   fn->func = (void *)func;
+    fn->data = data;
+    fn->type = type;
+ 
+@@ -806,7 +806,7 @@ ecore_imf_context_event_callback_del(Ecore_IMF_Context *ctx, Ecore_IMF_Callback_
+ 
+    EINA_LIST_FOREACH_SAFE(ctx->callbacks, l, l_next, fn)
+      {
+-        if ((fn) && (fn->func == func) && (fn->type == type))
++        if ((fn) && (fn->func == (void *)func) && (fn->type == type))
+           {
+              void *tmp = (void *)fn->data;
+              free(fn);
+@@ -833,7 +833,11 @@ ecore_imf_context_event_callback_call(Ecore_IMF_Context *ctx, Ecore_IMF_Callback
+    EINA_LIST_FOREACH(ctx->callbacks, l, fn)
+      {
+         if ((fn) && (fn->type == type) && (fn->func))
+-          fn->func(fn->data, ctx, event_info);
++         {
++           Ecore_IMF_Event_Cb cb = (Ecore_IMF_Event_Cb)fn->func;
++
++           cb((void *)fn->data, ctx, event_info);
++         }
+      }
+ }
+ 
+@@ -1210,6 +1214,8 @@ ecore_imf_context_input_panel_state_get(Ecore_IMF_Context *ctx)
+    return state;
+ }
+ 
++typedef void (*Ecore_IMF_Input_Panel_Callback) (void *data, Ecore_IMF_Context *ctx, int value);
++
+ EAPI void
+ ecore_imf_context_input_panel_event_callback_add(Ecore_IMF_Context *ctx,
+                                                  Ecore_IMF_Input_Panel_Event type,
+@@ -1230,7 +1236,7 @@ ecore_imf_context_input_panel_event_callback_add(Ecore_IMF_Context *ctx,
+    fn = calloc(1, sizeof (Ecore_IMF_Input_Panel_Callback_Node));
+    if (!fn) return;
+ 
+-   fn->func = func;
++   fn->func = (void *)func;
+    fn->data = data;
+    fn->type = type;
+ 
+@@ -1258,7 +1264,7 @@ ecore_imf_context_input_panel_event_callback_del(Ecore_IMF_Context *ctx,
+ 
+    EINA_LIST_FOREACH_SAFE(ctx->input_panel_callbacks, l, l_next, fn)
+      {
+-        if ((fn) && (fn->func == func) && (fn->type == type))
++        if ((fn) && (fn->func == (void *)func) && (fn->type == type))
+           {
+              free(fn);
+              ctx->input_panel_callbacks = eina_list_remove_list(ctx->input_panel_callbacks, l);
+@@ -1284,7 +1290,8 @@ ecore_imf_context_input_panel_event_callback_call(Ecore_IMF_Context *ctx, Ecore_
+      {
+         if ((fn) && (fn->type == type) && (fn->func))
+           {
+-             fn->func(fn->data, ctx, value);
++             Ecore_IMF_Input_Panel_Callback cb = (Ecore_IMF_Input_Panel_Callback)fn->func;
++             cb((void *)fn->data, ctx, value);
+              if (type == ECORE_IMF_INPUT_PANEL_STATE_EVENT &&
+                  value == ECORE_IMF_INPUT_PANEL_STATE_HIDE &&
+                  show_req_ctx == ctx)
+diff --git a/src/lib/ecore_imf/ecore_imf_private.h b/src/lib/ecore_imf/ecore_imf_private.h
+index 22d2942109..b9622bd165 100644
+--- a/src/lib/ecore_imf/ecore_imf_private.h
++++ b/src/lib/ecore_imf/ecore_imf_private.h
+@@ -77,14 +77,14 @@ struct _Ecore_IMF_Module
+ 
+ struct _Ecore_IMF_Func_Node
+ {
+-   void (*func) ();
++   void *func; // cast at call time
+    const void *data;
+    Ecore_IMF_Callback_Type type;
+ };
+ 
+ struct _Ecore_IMF_Input_Panel_Callback_Node
+ {
+-   void (*func) ();
++   void *func;
+    const void *data;
+    Ecore_IMF_Input_Panel_Event type;
+ };
+diff --git a/src/lib/eeze/eeze_udev_watch.c b/src/lib/eeze/eeze_udev_watch.c
+index 7245f9d0a6..ba5b231a34 100644
+--- a/src/lib/eeze/eeze_udev_watch.c
++++ b/src/lib/eeze/eeze_udev_watch.c
+@@ -362,7 +362,7 @@ error:
+ }
+ 
+ static void
+-_eeze_udev_watch_reset()
++_eeze_udev_watch_reset(void *data EINA_UNUSED)
+ {
+    Eeze_Udev_Watch *watch;
+ 
+diff --git a/src/lib/efl_canvas_wl/efl_canvas_wl.c b/src/lib/efl_canvas_wl/efl_canvas_wl.c
+index 51ecde1b92..f0ef4a076c 100644
+--- a/src/lib/efl_canvas_wl/efl_canvas_wl.c
++++ b/src/lib/efl_canvas_wl/efl_canvas_wl.c
+@@ -3199,11 +3199,11 @@ shell_surface_toplevel_set_app_id(struct wl_client *client EINA_UNUSED, struct w
+ }
+ 
+ static void
+-shell_surface_toplevel_show_window_menu(){}
++shell_surface_toplevel_show_window_menu(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED, struct wl_resource *resource2 EINA_UNUSED, uint32_t a EINA_UNUSED, int32_t b EINA_UNUSED, int32_t c EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_move(){}
++shell_surface_toplevel_move(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED, struct wl_resource *resource2 EINA_UNUSED, uint32_t a EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_resize(){}
++shell_surface_toplevel_resize(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED, struct wl_resource *resource2 EINA_UNUSED, uint32_t a EINA_UNUSED, uint32_t b EINA_UNUSED){}
+ 
+ static void
+ shell_surface_toplevel_set_max_size(struct wl_client *client EINA_UNUSED, struct wl_resource *resource, int32_t w, int32_t h)
+@@ -3224,15 +3224,15 @@ shell_surface_toplevel_set_min_size(struct wl_client *client EINA_UNUSED, struct
+ }
+ 
+ static void
+-shell_surface_toplevel_set_maximized(){}
++shell_surface_toplevel_set_maximized(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_unset_maximized(){}
++shell_surface_toplevel_unset_maximized(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_set_fullscreen(){}
++shell_surface_toplevel_set_fullscreen(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED, struct wl_resource *resource2 EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_unset_fullscreen(){}
++shell_surface_toplevel_unset_fullscreen(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED){}
+ static void
+-shell_surface_toplevel_set_minimized(){}
++shell_surface_toplevel_set_minimized(struct wl_client *client EINA_UNUSED, struct wl_resource *resource EINA_UNUSED){}
+ 
+ static const struct xdg_toplevel_interface shell_surface_toplevel_interface =
+ {
+diff --git a/src/lib/efl_canvas_wl/x11.x b/src/lib/efl_canvas_wl/x11.x
+index 2d7a88352f..93d5e21f01 100644
+--- a/src/lib/efl_canvas_wl/x11.x
++++ b/src/lib/efl_canvas_wl/x11.x
+@@ -640,7 +640,7 @@ x11_kbd_apply(Comp_Seat *s)
+ static void seat_keymap_update(Comp_Seat *s);
+ 
+ static Eina_Bool
+-x11_xkb_refresh()
++x11_xkb_refresh(void *data EINA_UNUSED, int event EINA_UNUSED, void *info EINA_UNUSED)
+ {
+    Eina_List *l;
+    Comp *c;
+diff --git a/src/lib/efreet/efreet_cache.c b/src/lib/efreet/efreet_cache.c
+index dd4dfb0b99..62134fdcd0 100644
+--- a/src/lib/efreet/efreet_cache.c
++++ b/src/lib/efreet/efreet_cache.c
+@@ -222,7 +222,7 @@ _cb_server_del(void *data EINA_UNUSED, int type EINA_UNUSED, void *event)
+ }
+ 
+ static void
+-_efreet_cache_reset()
++_efreet_cache_reset(void *data EINA_UNUSED)
+ {
+    const char *s;
+    int len = 0;
+diff --git a/src/lib/eio/eio_monitor_inotify.c b/src/lib/eio/eio_monitor_inotify.c
+index e266877134..4c3353e832 100644
+--- a/src/lib/eio/eio_monitor_inotify.c
++++ b/src/lib/eio/eio_monitor_inotify.c
+@@ -159,7 +159,7 @@ _eio_inotify_handler(void *data EINA_UNUSED, Ecore_Fd_Handler *fdh)
+  */
+ static Eina_Bool reseting;
+ static void
+-_eio_monitor_reset()
++_eio_monitor_reset(void *data EINA_UNUSED)
+ {
+    Eina_Hash *h = _inotify_monitors;
+    Eina_Iterator *it;
+diff --git a/src/modules/ecore/system/systemd/ecore_system_systemd.c b/src/modules/ecore/system/systemd/ecore_system_systemd.c
+index ab19ff36cd..3295e8f713 100644
+--- a/src/modules/ecore/system/systemd/ecore_system_systemd.c
++++ b/src/modules/ecore/system/systemd/ecore_system_systemd.c
+@@ -253,7 +253,7 @@ static Eina_Bool _ecore_system_systemd_init(void);
+ static unsigned int reseting = 0;
+ 
+ static void
+-_ecore_system_systemd_reset()
++_ecore_system_systemd_reset(void *data EINA_UNUSED)
+ {
+    reseting = 1;
+    _ecore_system_systemd_shutdown();
+diff --git a/src/modules/ecore/system/upower/ecore_system_upower.c b/src/modules/ecore/system/upower/ecore_system_upower.c
+index 17ef5170c8..9e0a3d04b4 100644
+--- a/src/modules/ecore/system/upower/ecore_system_upower.c
++++ b/src/modules/ecore/system/upower/ecore_system_upower.c
+@@ -413,7 +413,7 @@ static void _ecore_system_upower_shutdown(void);
+ static unsigned int reseting;
+ 
+ static void
+-_ecore_system_upower_reset()
++_ecore_system_upower_reset(void *data EINA_UNUSED)
+ {
+    reseting = 1;
+    _ecore_system_upower_shutdown();
+diff --git a/src/modules/evas/engines/gl_common/evas_gl_context.c b/src/modules/evas/engines/gl_common/evas_gl_context.c
+index 85035d42f9..5c7deb4b30 100644
+--- a/src/modules/evas/engines/gl_common/evas_gl_context.c
++++ b/src/modules/evas/engines/gl_common/evas_gl_context.c
+@@ -42,14 +42,6 @@ const char *(*glsym_glGetStringi) (GLenum name, GLuint index) = NULL;
+ #  define GL_LINE_SMOOTH 0x0B20
+ # endif
+ 
+-// just used for finding symbols :)
+-typedef void (*_eng_fn) (void);
+-
+-typedef _eng_fn (*glsym_func_eng_fn) ();
+-typedef int  (*secsym_func_int) ();
+-typedef unsigned int  (*secsym_func_uint) ();
+-typedef void         *(*secsym_func_void_ptr) ();
+-
+ unsigned int   (*eglsym_eglDestroyImage)              (void *a, void *b) = NULL;
+ void           (*secsym_glEGLImageTargetTexture2DOES) (int a, void *b) = NULL;
+ void          *(*secsym_eglMapImageSEC)               (void *a, void *b, int c, int d) = NULL;
+@@ -71,10 +63,6 @@ int  (*secsym_tbm_surface_map) (void *surface, int opt, void *info) = NULL;
+ int  (*secsym_tbm_surface_unmap) (void *surface) = NULL;
+ int  (*secsym_tbm_surface_get_info) (void *surface, void *info) = NULL;
+ ////////////////////////////////////
+-#else
+-typedef void (*_eng_fn) (void);
+-
+-typedef _eng_fn (*glsym_func_eng_fn) ();
+ #endif
+ 
+ static int dbgflushnum = -1;
+@@ -216,27 +204,27 @@ evas_gl_symbols(void *(*GetProcAddress)(const char *name), const char *extsn)
+ 
+    glsym_glGetStringi = dlsym(RTLD_DEFAULT, "glGetStringi");
+ 
+-#define FINDSYM(dst, sym, ext, typ) do { \
++#define FINDSYM(dst, sym, ext) do { \
+    if (!dst) { \
+       if (_has_ext(ext, &exts, &num) && GetProcAddress) \
+-        dst = (typ) GetProcAddress(sym); \
++        dst = GetProcAddress(sym); \
+       if (!dst) \
+-        dst = (typ) dlsym(RTLD_DEFAULT, sym); \
++        dst = dlsym(RTLD_DEFAULT, sym); \
+    }} while (0)
+-#define FALLBAK(dst, typ) do { \
++#define FALLBAK(dst) do { \
+    if (!dst) { \
+       ERR("Symbol '%s' could not be found!", (#dst) + 6); \
+-      dst = (typ) sym_missing; \
++      dst = (void *)sym_missing; \
+       failed = EINA_TRUE; \
+    }} while (0)
+ 
+ #ifdef GL_GLES
+ 
+-   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffers", NULL, glsym_func_void);
+-   FALLBAK(glsym_glGenFramebuffers, glsym_func_void);
++   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffers", NULL);
++   FALLBAK(glsym_glGenFramebuffers);
+ 
+-   FINDSYM(glsym_glBindFramebuffer, "glBindFramebuffer", NULL, glsym_func_void);
+-   FALLBAK(glsym_glBindFramebuffer, glsym_func_void);
++   FINDSYM(glsym_glBindFramebuffer, "glBindFramebuffer", NULL);
++   FALLBAK(glsym_glBindFramebuffer);
+ 
+ #else
+ 
+@@ -274,79 +262,79 @@ evas_gl_symbols(void *(*GetProcAddress)(const char *name), const char *extsn)
+    glGenFramebuffers, glBindFramebuffer, glFramebufferTexture2D, glDeleteFramebuffers
+    */
+ 
+-   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffers", NULL, glsym_func_void);
+-   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffersARB", "GL_ARB_framebuffer_object", glsym_func_void);
+-   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffersEXT", "GL_EXT_framebuffer_object", glsym_func_void);
+-   FALLBAK(glsym_glGenFramebuffers, glsym_func_void);
++   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffers", NULL);
++   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffersARB", "GL_ARB_framebuffer_object");
++   FINDSYM(glsym_glGenFramebuffers, "glGenFramebuffersEXT", "GL_EXT_framebuffer_object");
++   FALLBAK(glsym_glGenFramebuffers);
+ 
+-   FINDSYM(glsym_glBindFramebuffer, "glBindFramebuffer", NULL, glsym_func_void);
+-   FINDSYM(glsym_glBindFramebuffer, "glBindFramebufferARB", "GL_ARB_framebuffer_object", glsym_func_void);
+-   FINDSYM(glsym_glBindFramebuffer, "glBindFramebufferEXT", "GL_EXT_framebuffer_object", glsym_func_void);
+-   FALLBAK(glsym_glBindFramebuffer, glsym_func_void);
++   FINDSYM(glsym_glBindFramebuffer, "glBindFramebuffer", NULL);
++   FINDSYM(glsym_glBindFramebuffer, "glBindFramebufferARB", "GL_ARB_framebuffer_object");
++   FINDSYM(glsym_glBindFramebuffer, "glBindFramebufferEXT", "GL_EXT_framebuffer_object");
++   FALLBAK(glsym_glBindFramebuffer);
+ 
+ #endif
+ 
+-   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2D", NULL, glsym_func_void);
+-   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2DARB", "GL_ARB_framebuffer_object", glsym_func_void);
+-   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2DEXT", "GL_EXT_framebuffer_object", glsym_func_void);
+-   FALLBAK(glsym_glFramebufferTexture2D, glsym_func_void);
++   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2D", NULL);
++   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2DARB", "GL_ARB_framebuffer_object");
++   FINDSYM(glsym_glFramebufferTexture2D, "glFramebufferTexture2DEXT", "GL_EXT_framebuffer_object");
++   FALLBAK(glsym_glFramebufferTexture2D);
+ 
+-   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffers", NULL, glsym_func_void);
+-   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffersARB", "GL_ARB_framebuffer_object", glsym_func_void);
+-   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffersEXT", "GL_EXT_framebuffer_object", glsym_func_void);
+-   FALLBAK(glsym_glDeleteFramebuffers, glsym_func_void);
++   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffers", NULL);
++   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffersARB", "GL_ARB_framebuffer_object");
++   FINDSYM(glsym_glDeleteFramebuffers, "glDeleteFramebuffersEXT", "GL_EXT_framebuffer_object");
++   FALLBAK(glsym_glDeleteFramebuffers);
+ 
+    // Not sure there's an EXT variant
+-   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinary", NULL, glsym_func_void);
+-   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinaryOES", "GL_OES_get_program_binary", glsym_func_void);
+-   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinaryEXT", "GL_EXT_get_program_binary", glsym_func_void);
++   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinary", NULL);
++   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinaryOES", "GL_OES_get_program_binary");
++   FINDSYM(glsym_glGetProgramBinary, "glGetProgramBinaryEXT", "GL_EXT_get_program_binary");
+ 
+    // Not sure there's an EXT variant
+-   FINDSYM(glsym_glProgramBinary, "glProgramBinary", NULL, glsym_func_void);
+-   FINDSYM(glsym_glProgramBinary, "glProgramBinaryOES", "GL_OES_get_program_binary", glsym_func_void);
+-   FINDSYM(glsym_glProgramBinary, "glProgramBinaryEXT", "GL_EXT_get_program_binary", glsym_func_void);
++   FINDSYM(glsym_glProgramBinary, "glProgramBinary", NULL);
++   FINDSYM(glsym_glProgramBinary, "glProgramBinaryOES", "GL_OES_get_program_binary");
++   FINDSYM(glsym_glProgramBinary, "glProgramBinaryEXT", "GL_EXT_get_program_binary");
+ 
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteri", NULL, glsym_func_void);
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriEXT", "GL_EXT_separate_shader_objects", glsym_func_void);
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriARB", "GL_ARB_geometry_shader4", glsym_func_void);
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteri", NULL);
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriEXT", "GL_EXT_separate_shader_objects");
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriARB", "GL_ARB_geometry_shader4");
+ 
+-   FINDSYM(glsym_glReleaseShaderCompiler, "glReleaseShaderCompiler", NULL, glsym_func_void);
++   FINDSYM(glsym_glReleaseShaderCompiler, "glReleaseShaderCompiler", NULL);
+ #ifndef GL_GLES
+-   FINDSYM(glsym_glReleaseShaderCompiler, "glReleaseShaderCompiler", "GL_ARB_ES2_compatibility", glsym_func_void);
++   FINDSYM(glsym_glReleaseShaderCompiler, "glReleaseShaderCompiler", "GL_ARB_ES2_compatibility");
+ #endif
+ 
+    // Not sure there's a core variant, glActivateTileQCOM is strange as well
+-   FINDSYM(glsym_glStartTiling, "glStartTilingQCOM", "GL_QCOM_tiled_rendering", glsym_func_void);
+-   FINDSYM(glsym_glStartTiling, "glStartTiling", NULL, glsym_func_void);
+-   FINDSYM(glsym_glStartTiling, "glActivateTileQCOM", NULL, glsym_func_void);
+-   FINDSYM(glsym_glEndTiling, "glEndTilingQCOM", "GL_QCOM_tiled_rendering", glsym_func_void);
+-   FINDSYM(glsym_glEndTiling, "glEndTiling", NULL, glsym_func_void);
++   FINDSYM(glsym_glStartTiling, "glStartTilingQCOM", "GL_QCOM_tiled_rendering");
++   FINDSYM(glsym_glStartTiling, "glStartTiling", NULL);
++   FINDSYM(glsym_glStartTiling, "glActivateTileQCOM", NULL);
++   FINDSYM(glsym_glEndTiling, "glEndTilingQCOM", "GL_QCOM_tiled_rendering");
++   FINDSYM(glsym_glEndTiling, "glEndTiling", NULL);
+ 
+    if (!getenv("EVAS_GL_MAPBUFFER_DISABLE"))
+      {
+         // Not sure there's an EXT variant. (probably no KHR variant)
+-        FINDSYM(glsym_glMapBuffer, "glMapBuffer", NULL, glsym_func_void_ptr);
+-        FINDSYM(glsym_glMapBuffer, "glMapBufferOES", "GL_OES_mapbuffer", glsym_func_void_ptr);
+-        FINDSYM(glsym_glMapBuffer, "glMapBufferARB", "GL_ARB_vertex_buffer_object", glsym_func_void_ptr);
+-        FINDSYM(glsym_glMapBuffer, "glMapBufferARB", "GLX_ARB_vertex_buffer_object", glsym_func_void_ptr);
+-        FINDSYM(glsym_glMapBuffer, "glMapBufferEXT", NULL, glsym_func_void_ptr);
+-
+-        FINDSYM(glsym_glUnmapBuffer, "glUnmapBuffer", NULL, glsym_func_boolean);
+-        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferOES", "GL_OES_mapbuffer", glsym_func_boolean);
+-        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferARB", "GL_ARB_vertex_buffer_object", glsym_func_boolean);
+-        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferARB", "GLX_ARB_vertex_buffer_object", glsym_func_boolean);
+-        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferEXT", NULL, glsym_func_boolean);
++        FINDSYM(glsym_glMapBuffer, "glMapBuffer", NULL);
++        FINDSYM(glsym_glMapBuffer, "glMapBufferOES", "GL_OES_mapbuffer");
++        FINDSYM(glsym_glMapBuffer, "glMapBufferARB", "GL_ARB_vertex_buffer_object");
++        FINDSYM(glsym_glMapBuffer, "glMapBufferARB", "GLX_ARB_vertex_buffer_object");
++        FINDSYM(glsym_glMapBuffer, "glMapBufferEXT", NULL);
++
++        FINDSYM(glsym_glUnmapBuffer, "glUnmapBuffer", NULL);
++        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferOES", "GL_OES_mapbuffer");
++        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferARB", "GL_ARB_vertex_buffer_object");
++        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferARB", "GLX_ARB_vertex_buffer_object");
++        FINDSYM(glsym_glUnmapBuffer, "glUnmapBufferEXT", NULL);
+      }
+ 
+-   FINDSYM(glsym_glRenderbufferStorageMultisample, "glRenderbufferStorageMultisample", NULL, glsym_func_void);
++   FINDSYM(glsym_glRenderbufferStorageMultisample, "glRenderbufferStorageMultisample", NULL);
+ 
+ #ifdef GL_GLES
+-#define FINDSYMN(dst, sym, ext, typ) do { \
++#define FINDSYMN(dst, sym, ext) do { \
+    if (!dst) { \
+       if (_ckext(extsn, ext) && GetProcAddress) \
+-        dst = (typ) GetProcAddress(sym); \
++        dst = GetProcAddress(sym); \
+       if (!dst) \
+-        dst = (typ) dlsym(RTLD_DEFAULT, sym); \
++        dst = dlsym(RTLD_DEFAULT, sym); \
+    }} while (0)
+ 
+ // yes - gl core looking for egl stuff. i know it's odd. a reverse-layer thing
+@@ -374,22 +362,22 @@ evas_gl_symbols(void *(*GetProcAddress)(const char *name), const char *extsn)
+         {
+            eglsym_eglCreateImage = NULL;
+            eglsym_eglDestroyImage = NULL;
+-           FINDSYMN(eglsym_eglCreateImageKHR, "eglCreateImageKHR", "EGL_KHR_image_base", secsym_func_void_ptr);
+-           FINDSYMN(eglsym_eglDestroyImage, "eglDestroyImageKHR", "EGL_KHR_image_base", secsym_func_uint);
++           FINDSYMN(eglsym_eglCreateImageKHR, "eglCreateImageKHR", "EGL_KHR_image_base");
++           FINDSYMN(eglsym_eglDestroyImage, "eglDestroyImageKHR", "EGL_KHR_image_base");
+         }
+    }
+ 
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteri", NULL, glsym_func_void);
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriEXT", "GL_EXT_geometry_shader4", glsym_func_void);
+-   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriARB", "GL_ARB_geometry_shader4", glsym_func_void);
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteri", NULL);
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriEXT", "GL_EXT_geometry_shader4");
++   FINDSYM(glsym_glProgramParameteri, "glProgramParameteriARB", "GL_ARB_geometry_shader4");
+ 
+-   FINDSYM(secsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image_external", glsym_func_void);
+-   FINDSYM(secsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image", glsym_func_void);
++   FINDSYM(secsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image_external");
++   FINDSYM(secsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image");
+ 
+    // Old SEC extensions
+-   FINDSYMN(secsym_eglMapImageSEC, "eglMapImageSEC", NULL, secsym_func_void_ptr);
+-   FINDSYMN(secsym_eglUnmapImageSEC, "eglUnmapImageSEC", NULL, secsym_func_uint);
+-   FINDSYMN(secsym_eglGetImageAttribSEC, "eglGetImageAttribSEC", NULL, secsym_func_uint);
++   FINDSYMN(secsym_eglMapImageSEC, "eglMapImageSEC", NULL);
++   FINDSYMN(secsym_eglUnmapImageSEC, "eglUnmapImageSEC", NULL);
++   FINDSYMN(secsym_eglGetImageAttribSEC, "eglGetImageAttribSEC", NULL);
+ 
+ #undef FINDSYMN
+ 
+@@ -421,19 +409,19 @@ tbm_symbols(void)
+         return;
+      }
+ 
+-#define FINDSYM(dst, sym, typ) \
+-   if (!dst) dst = (typ)dlsym(tbm_lib_handle, sym); \
++#define FINDSYM(dst, sym) \
++   if (!dst) dst = dlsym(tbm_lib_handle, sym); \
+    if (!dst)  \
+      { \
+         ERR("Symbol not found %s\n", sym); \
+         return; \
+      }
+ 
+-   FINDSYM(secsym_tbm_surface_create, "tbm_surface_create", secsym_func_void_ptr);
+-   FINDSYM(secsym_tbm_surface_destroy, "tbm_surface_destroy", secsym_func_int);
+-   FINDSYM(secsym_tbm_surface_map, "tbm_surface_map", secsym_func_int);
+-   FINDSYM(secsym_tbm_surface_unmap, "tbm_surface_unmap", secsym_func_int);
+-   FINDSYM(secsym_tbm_surface_get_info, "tbm_surface_get_info", secsym_func_int);
++   FINDSYM(secsym_tbm_surface_create, "tbm_surface_create");
++   FINDSYM(secsym_tbm_surface_destroy, "tbm_surface_destroy");
++   FINDSYM(secsym_tbm_surface_map, "tbm_surface_map");
++   FINDSYM(secsym_tbm_surface_unmap, "tbm_surface_unmap");
++   FINDSYM(secsym_tbm_surface_get_info, "tbm_surface_get_info");
+ 
+ #undef FINDSYM
+ #endif
+diff --git a/src/modules/evas/engines/gl_common/evas_gl_core.c b/src/modules/evas/engines/gl_common/evas_gl_core.c
+index c7d453ffbd..40518b5cd9 100644
+--- a/src/modules/evas/engines/gl_common/evas_gl_core.c
++++ b/src/modules/evas/engines/gl_common/evas_gl_core.c
+@@ -21,7 +21,7 @@ EVGL_Engine *evgl_engine = NULL;
+ int _evas_gl_log_dom   = -1;
+ int _evas_gl_log_level = -1;
+ 
+-typedef void           *(*glsym_func_void_ptr) ();
++typedef void           *(*glsym_func_void_ptr) (void *);
+ glsym_func_void_ptr glsym_evas_gl_native_context_get = NULL;
+ glsym_func_void_ptr glsym_evas_gl_engine_data_get = NULL;
+ 
+diff --git a/src/modules/evas/engines/gl_drm/evas_engine.c b/src/modules/evas/engines/gl_drm/evas_engine.c
+index d59f762160..1d57b69f4b 100644
+--- a/src/modules/evas/engines/gl_drm/evas_engine.c
++++ b/src/modules/evas/engines/gl_drm/evas_engine.c
+@@ -74,11 +74,7 @@ static struct gbm_device *gbm_dev = NULL;
+ static int gbm_dev_refs = 0;
+ 
+ /* local function prototype types */
+-typedef void (*glsym_func_void)();
+-typedef void *(*glsym_func_void_ptr)();
+-typedef int (*glsym_func_int)();
+-typedef unsigned int (*glsym_func_uint)();
+-typedef const char *(*glsym_func_const_char_ptr)();
++typedef void *(*glsym_func_void_ptr)(void);
+ 
+ /* external dynamic loaded Evas_GL function pointers */
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_ref = NULL;
+@@ -255,26 +251,20 @@ eng_egl_symbols(EGLDisplay edsp)
+ 
+    if (done) return;
+ 
+-#define FINDSYM(dst, sym, typ) \
+-   if (!dst) dst = (typ)glsym_eglGetProcAddress(sym);
++#define FINDSYM(dst, sym) \
++   if (!dst) dst = glsym_eglGetProcAddress(sym)
+ 
+    exts = eglQueryString(edsp, EGL_EXTENSIONS);
+ 
+-   FINDSYM(glsym_glEGLImageTargetTexture2DOES,
+-           "glEGLImageTargetTexture2DOES", glsym_func_void);
++   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES");
+ 
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT",
+-           glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL",
+-           glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage",
+-           glsym_func_uint);
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage");
+ 
+-   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR",
+-           glsym_func_uint);
++   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR");
+ 
+-   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL",
+-           glsym_func_uint);
++   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL");
+ 
+    if (_ckext(exts, "EGL_IMG_context_priority"))
+      _extn_have_context_priority = 1;
+diff --git a/src/modules/evas/engines/gl_x11/evas_engine.c b/src/modules/evas/engines/gl_x11/evas_engine.c
+index 72edcbf50e..86f5064cf3 100644
+--- a/src/modules/evas/engines/gl_x11/evas_engine.c
++++ b/src/modules/evas/engines/gl_x11/evas_engine.c
+@@ -33,13 +33,11 @@ static int gl_wins = 0;
+ static int extn_have_y_inverted = 1;
+ #endif
+ 
+-typedef void            (*_eng_fn) (void);
+-typedef _eng_fn         (*glsym_func_eng_fn) ();
+-typedef void            (*glsym_func_void) ();
+-typedef void           *(*glsym_func_void_ptr) ();
+-typedef int             (*glsym_func_int) ();
+-typedef unsigned int    (*glsym_func_uint) ();
+-typedef const char     *(*glsym_func_const_char_ptr) ();
++typedef void           *(*glsym_func_void_ptr) (void);
++
++typedef void            (*glsym_func_void_in_voidp) (void *);
++typedef void            (*glsym_func_void_in_int) (int);
++typedef int             (*glsym_func_int_in_voidp) (void *);
+ 
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_ref = NULL;
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_unref = NULL;
+@@ -68,14 +66,14 @@ Evas_GL_Preload_Render_Call glsym_evas_gl_preload_render_lock = NULL;
+ Evas_GL_Preload_Render_Call glsym_evas_gl_preload_render_unlock = NULL;
+ Evas_GL_Preload_Render_Call glsym_evas_gl_preload_render_relax = NULL;
+ 
+-glsym_func_void     glsym_evas_gl_common_shaders_flush = NULL;
+-glsym_func_void     glsym_evas_gl_common_error_set = NULL;
+-glsym_func_int      glsym_evas_gl_common_error_get = NULL;
+-glsym_func_void_ptr glsym_evas_gl_common_current_context_get = NULL;
++glsym_func_void_in_voidp glsym_evas_gl_common_shaders_flush = NULL;
++glsym_func_void_in_int   glsym_evas_gl_common_error_set = NULL;
++glsym_func_int_in_voidp  glsym_evas_gl_common_error_get = NULL;
++glsym_func_void_ptr      glsym_evas_gl_common_current_context_get = NULL;
+ 
+ #ifdef GL_GLES
+ 
+-_eng_fn      (*glsym_eglGetProcAddress)            (const char *a) = NULL;
++void        *(*glsym_eglGetProcAddress)            (const char *a) = NULL;
+ EGLImageKHR  (*glsym_evas_gl_common_eglCreateImage)(EGLDisplay a, EGLContext b, EGLenum c, EGLClientBuffer d, const EGLAttrib *e) = NULL;
+ int          (*glsym_evas_gl_common_eglDestroyImage) (EGLDisplay a, void *b) = NULL;
+ void         (*glsym_glEGLImageTargetTexture2DOES) (int a, void *b)  = NULL;
+@@ -87,7 +85,7 @@ unsigned int (*glsym_eglQueryWaylandBufferWL)(EGLDisplay a, /*struct wl_resource
+ 
+ typedef XID     (*glsym_func_xid) ();
+ 
+-_eng_fn  (*glsym_glXGetProcAddress)  (const char *a) = NULL;
++void    *(*glsym_glXGetProcAddress)  (const char *a) = NULL;
+ void     (*glsym_glXBindTexImage)    (Display *a, GLXDrawable b, int c, int *d) = NULL;
+ void     (*glsym_glXReleaseTexImage) (Display *a, GLXDrawable b, int c) = NULL;
+ int      (*glsym_glXGetVideoSync)    (unsigned int *a) = NULL;
+@@ -1310,19 +1308,19 @@ gl_symbols(void)
+    LINK2GENERIC(evas_gl_common_current_context_get);
+    LINK2GENERIC(evas_gl_common_shaders_flush);
+ 
+-#define FINDSYM(dst, sym, typ) if (!dst) dst = (typ)dlsym(RTLD_DEFAULT, sym);
++#define FINDSYM(dst, sym) if (!dst) dst = dlsym(RTLD_DEFAULT, sym)
+ #ifdef GL_GLES
+ 
+-   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressKHR", glsym_func_eng_fn);
+-   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressEXT", glsym_func_eng_fn);
+-   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressARB", glsym_func_eng_fn);
+-   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddress", glsym_func_eng_fn);
++   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressKHR");
++   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressEXT");
++   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddressARB");
++   FINDSYM(glsym_eglGetProcAddress, "eglGetProcAddress");
+ 
+ #else
+ 
+-   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddressEXT", glsym_func_eng_fn);
+-   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddressARB", glsym_func_eng_fn);
+-   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddress", glsym_func_eng_fn);
++   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddressEXT");
++   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddressARB");
++   FINDSYM(glsym_glXGetProcAddress, "glXGetProcAddress");
+ 
+ #endif
+ #undef FINDSYM
+@@ -1348,12 +1346,12 @@ eng_gl_symbols(Outbuf *ob)
+     */
+ 
+ #ifdef GL_GLES
+-#define FINDSYM(dst, sym, ext, typ) do { \
++#define FINDSYM(dst, sym, ext) do { \
+    if (!dst) { \
+       if (_has_ext(exts, ext) && glsym_eglGetProcAddress) \
+-        dst = (typ) glsym_eglGetProcAddress(sym); \
++        dst = glsym_eglGetProcAddress(sym); \
+       if (!dst) \
+-        dst = (typ) dlsym(RTLD_DEFAULT, sym); \
++        dst = dlsym(RTLD_DEFAULT, sym); \
+    }} while (0)
+ 
+    // Find EGL extensions
+@@ -1365,23 +1363,23 @@ eng_gl_symbols(Outbuf *ob)
+    LINK2GENERIC(evas_gl_common_eglCreateImage);
+    LINK2GENERIC(evas_gl_common_eglDestroyImage);
+ 
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage", NULL, glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT", "EGL_EXT_swap_buffers_with_damage", glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageKHR", "EGL_KHR_swap_buffers_with_damage", glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL", "EGL_INTEL_swap_buffers_with_damage", glsym_func_uint);
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage", NULL);
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT", "EGL_EXT_swap_buffers_with_damage");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageKHR", "EGL_KHR_swap_buffers_with_damage");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL", "EGL_INTEL_swap_buffers_with_damage");
+ 
+-   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR", "EGL_KHR_partial_update", glsym_func_uint);
++   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR", "EGL_KHR_partial_update");
+ 
+-   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL", "EGL_WL_bind_wayland_display", glsym_func_uint);
++   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL", "EGL_WL_bind_wayland_display");
+ 
+    // This is a GL extension
+    exts = (const char *) glGetString(GL_EXTENSIONS);
+-   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image_external", glsym_func_void);
+-   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image", glsym_func_void);
++   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image_external");
++   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES", "GL_OES_EGL_image");
+ 
+ #else
+ 
+-#define FINDSYM(dst, sym, ext, typ) do { \
++#define FINDSYM(dst, sym, ext) do { \
+    if (!dst) { \
+       if (_has_ext(exts, ext) && glsym_glXGetProcAddress) \
+         dst = (typ) glsym_glXGetProcAddress(sym); \
+@@ -1395,30 +1393,30 @@ eng_gl_symbols(Outbuf *ob)
+    // Find GL extensions
+    glsym_evas_gl_symbols((void*)glsym_glXGetProcAddress, exts);
+ 
+-   FINDSYM(glsym_glXBindTexImage, "glXBindTexImage", NULL, glsym_func_void);
+-   FINDSYM(glsym_glXBindTexImage, "glXBindTexImageEXT", "GLX_EXT_texture_from_pixmap", glsym_func_void);
+-   FINDSYM(glsym_glXBindTexImage, "glXBindTexImageARB", "GLX_ARB_render_texture", glsym_func_void);
++   FINDSYM(glsym_glXBindTexImage, "glXBindTexImage", NULL);
++   FINDSYM(glsym_glXBindTexImage, "glXBindTexImageEXT", "GLX_EXT_texture_from_pixmap");
++   FINDSYM(glsym_glXBindTexImage, "glXBindTexImageARB", "GLX_ARB_render_texture");
+ 
+-   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImage", NULL, glsym_func_void);
+-   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImageEXT", "GLX_EXT_texture_from_pixmap", glsym_func_void);
+-   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImageARB", "GLX_ARB_render_texture", glsym_func_void);
++   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImage", NULL);
++   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImageEXT", "GLX_EXT_texture_from_pixmap");
++   FINDSYM(glsym_glXReleaseTexImage, "glXReleaseTexImageARB", "GLX_ARB_render_texture");
+ 
+-   FINDSYM(glsym_glXGetVideoSync, "glXGetVideoSyncSGI", "GLX_SGI_video_sync", glsym_func_int);
+-   FINDSYM(glsym_glXWaitVideoSync, "glXWaitVideoSyncSGI", "GLX_SGI_video_sync", glsym_func_int);
++   FINDSYM(glsym_glXGetVideoSync, "glXGetVideoSyncSGI", "GLX_SGI_video_sync");
++   FINDSYM(glsym_glXWaitVideoSync, "glXWaitVideoSyncSGI", "GLX_SGI_video_sync");
+ 
+    // GLX 1.3
+-   FINDSYM(glsym_glXCreatePixmap, "glXCreatePixmap", NULL, glsym_func_xid);
+-   FINDSYM(glsym_glXDestroyPixmap, "glXDestroyPixmap", NULL, glsym_func_void);
+-   FINDSYM(glsym_glXQueryDrawable, "glXQueryDrawable", NULL, glsym_func_void);
++   FINDSYM(glsym_glXCreatePixmap, "glXCreatePixmap", NULL);
++   FINDSYM(glsym_glXDestroyPixmap, "glXDestroyPixmap", NULL);
++   FINDSYM(glsym_glXQueryDrawable, "glXQueryDrawable", NULL);
+ 
+    // swap interval: MESA and SGI take (interval)
+-   FINDSYM(glsym_glXSwapIntervalSGI, "glXSwapIntervalMESA", "GLX_MESA_swap_control", glsym_func_int);
+-   FINDSYM(glsym_glXSwapIntervalSGI, "glXSwapIntervalSGI", "GLX_SGI_swap_control", glsym_func_int);
++   FINDSYM(glsym_glXSwapIntervalSGI, "glXSwapIntervalMESA", "GLX_MESA_swap_control");
++   FINDSYM(glsym_glXSwapIntervalSGI, "glXSwapIntervalSGI", "GLX_SGI_swap_control");
+ 
+    // swap interval: EXT takes (dpy, drawable, interval)
+-   FINDSYM(glsym_glXSwapIntervalEXT, "glXSwapIntervalEXT", "GLX_EXT_swap_control", glsym_func_void);
++   FINDSYM(glsym_glXSwapIntervalEXT, "glXSwapIntervalEXT", "GLX_EXT_swap_control");
+ 
+-   FINDSYM(glsym_glXReleaseBuffersMESA, "glXReleaseBuffersMESA", "GLX_MESA_release_buffers", glsym_func_void);
++   FINDSYM(glsym_glXReleaseBuffersMESA, "glXReleaseBuffersMESA", "GLX_MESA_release_buffers");
+ 
+ #endif
+ #undef FINDSYM
+diff --git a/src/modules/evas/engines/gl_x11/evas_x_main.c b/src/modules/evas/engines/gl_x11/evas_x_main.c
+index 3bc2b0b6e5..06e05f8e4d 100644
+--- a/src/modules/evas/engines/gl_x11/evas_x_main.c
++++ b/src/modules/evas/engines/gl_x11/evas_x_main.c
+@@ -7,8 +7,8 @@
+ static Eina_TLS _outbuf_key = 0;
+ static Eina_TLS _context_key = 0;
+ 
+-typedef void (*glsym_func_void) ();
+-glsym_func_void glsym_evas_gl_common_context_restore_set = NULL;
++typedef void (*glsym_func_void_in_bool) (Eina_Bool);
++glsym_func_void_in_bool glsym_evas_gl_common_context_restore_set = NULL;
+ 
+ Eina_Bool gles3_supported = EINA_FALSE;
+ 
+diff --git a/src/modules/evas/engines/wayland_egl/evas_engine.c b/src/modules/evas/engines/wayland_egl/evas_engine.c
+index 58eb54a467..3d1b106ecf 100644
+--- a/src/modules/evas/engines/wayland_egl/evas_engine.c
++++ b/src/modules/evas/engines/wayland_egl/evas_engine.c
+@@ -27,13 +27,6 @@ struct _Render_Engine
+    Render_Output_GL_Generic generic;
+ };
+ 
+-/* local function prototypes */
+-typedef void (*glsym_func_void) ();
+-typedef void *(*glsym_func_void_ptr) ();
+-typedef int (*glsym_func_int) ();
+-typedef unsigned int (*glsym_func_uint) ();
+-typedef const char *(*glsym_func_const_char_ptr) ();
+-
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_ref = NULL;
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_unref = NULL;
+ Evas_GL_Common_Image_Call glsym_evas_gl_common_image_free = NULL;
+@@ -142,11 +135,11 @@ eng_gl_symbols(EGLDisplay edsp)
+    const char *exts = NULL;
+ 
+    if (done) return;
+-#define FINDSYM(dst, sym, typ) \
++#define FINDSYM(dst, sym) \
+    if (glsym_eglGetProcAddress) { \
+-      if (!dst) dst = (typ)glsym_eglGetProcAddress(sym); \
++      if (!dst) dst = glsym_eglGetProcAddress(sym); \
+    } else { \
+-      if (!dst) dst = (typ)dlsym(RTLD_DEFAULT, sym); \
++      if (!dst) dst = dlsym(RTLD_DEFAULT, sym); \
+    }
+ 
+    // Find EGL extensions
+@@ -155,20 +148,14 @@ eng_gl_symbols(EGLDisplay edsp)
+    // Find GL extensions
+    glsym_evas_gl_symbols(glsym_eglGetProcAddress, exts);
+ 
+-   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES",
+-           glsym_func_void);
++   FINDSYM(glsym_glEGLImageTargetTexture2DOES, "glEGLImageTargetTexture2DOES");
+ 
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT",
+-           glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL",
+-           glsym_func_uint);
+-   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage",
+-           glsym_func_uint);
+-   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR",
+-           glsym_func_uint);
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageEXT");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamageINTEL");
++   FINDSYM(glsym_eglSwapBuffersWithDamage, "eglSwapBuffersWithDamage");
++   FINDSYM(glsym_eglSetDamageRegionKHR, "eglSetDamageRegionKHR");
+ 
+-   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL",
+-           glsym_func_uint);
++   FINDSYM(glsym_eglQueryWaylandBufferWL, "eglQueryWaylandBufferWL");
+ 
+    done = EINA_TRUE;
+ }
+-- 
+2.47.3
+
diff --git a/package/efl/0005-ecore-file-silence-gcc-15-warnings.patch b/package/efl/0005-ecore-file-silence-gcc-15-warnings.patch
new file mode 100644
index 0000000000..b7053506e1
--- /dev/null
+++ b/package/efl/0005-ecore-file-silence-gcc-15-warnings.patch
@@ -0,0 +1,40 @@
+From 6e63309b26c25cc1c09228b9d06fd47bd6b13884 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Mon, 28 Apr 2025 18:27:37 +0100
+Subject: [PATCH] ecore-file: silence gcc 15 warnings
+
+no bug here - just warnings for perfectly ok code and people using -Werror ...
+
+fixes #85
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/6e63309b26c25cc1c09228b9d06fd47bd6b13884
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/lib/ecore_file/ecore_file_monitor_inotify.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/ecore_file/ecore_file_monitor_inotify.c b/src/lib/ecore_file/ecore_file_monitor_inotify.c
+index 988893de4f..b187fbc2c1 100644
+--- a/src/lib/ecore_file/ecore_file_monitor_inotify.c
++++ b/src/lib/ecore_file/ecore_file_monitor_inotify.c
+@@ -51,7 +51,7 @@ static Eina_Bool reseting;
+ static Eina_Hash *monitor_hash;
+ 
+ static void
+-_ecore_file_monitor_inotify_reset()
++_ecore_file_monitor_inotify_reset(void *data EINA_UNUSED)
+ {
+    Eina_Iterator *it;
+    Ecore_File_Monitor *em;
+@@ -132,7 +132,7 @@ ecore_file_monitor_backend_add(const char *path,
+    if (_inotify_fd_pid == -1) return NULL;
+ 
+    if (_inotify_fd_pid != getpid())
+-     _ecore_file_monitor_inotify_reset();
++     _ecore_file_monitor_inotify_reset(NULL);
+ 
+    em = (Ecore_File_Monitor *)calloc(1, sizeof(Ecore_File_Monitor_Inotify));
+    if (!em) return NULL;
+-- 
+2.47.3
+
diff --git a/package/efl/0006-edje-edit-gcc15-break-adapt-to-new-keywords-in-c23.patch b/package/efl/0006-edje-edit-gcc15-break-adapt-to-new-keywords-in-c23.patch
new file mode 100644
index 0000000000..33e550dddd
--- /dev/null
+++ b/package/efl/0006-edje-edit-gcc15-break-adapt-to-new-keywords-in-c23.patch
@@ -0,0 +1,75 @@
+From 628c40cce2de0a18818b40615d3351b0c9e9b889 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Sat, 3 May 2025 15:04:54 +0100
+Subject: [PATCH] edje - edit - gcc15 break - adapt to new keywords in c23
+
+gcc 15 default policy of breaking existing code. adapt.
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/628c40cce2de0a18818b40615d3351b0c9e9b889
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/lib/edje/edje_edit.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib/edje/edje_edit.c b/src/lib/edje/edje_edit.c
+index 70294fd824..e4a5b4a1da 100644
+--- a/src/lib/edje/edje_edit.c
++++ b/src/lib/edje/edje_edit.c
+@@ -7757,11 +7757,11 @@ edje_edit_state_map_backface_cull_get(Evas_Object *obj, const char *part, const
+ }
+ 
+ EAPI Eina_Bool
+-edje_edit_state_map_backface_cull_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool bool)
++edje_edit_state_map_backface_cull_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool b)
+ {
+    GET_PD_OR_RETURN(EINA_FALSE);
+ 
+-   pd->map.backcull = bool;
++   pd->map.backcull = b;
+ 
+    edje_object_calc_force(obj);
+    return EINA_TRUE;
+@@ -7776,11 +7776,11 @@ edje_edit_state_map_perspective_on_get(Evas_Object *obj, const char *part, const
+ }
+ 
+ EAPI Eina_Bool
+-edje_edit_state_map_perspective_on_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool bool)
++edje_edit_state_map_perspective_on_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool b)
+ {
+    GET_PD_OR_RETURN(EINA_FALSE);
+ 
+-   pd->map.persp_on = bool;
++   pd->map.persp_on = b;
+ 
+    edje_object_calc_force(obj);
+    return EINA_TRUE;
+@@ -7795,22 +7795,22 @@ edje_edit_state_map_alpha_get(Evas_Object *obj, const char *part, const char *st
+ }
+ 
+ EAPI Eina_Bool
+-edje_edit_state_map_alpha_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool bool)
++edje_edit_state_map_alpha_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool b)
+ {
+    GET_PD_OR_RETURN(EINA_FALSE);
+ 
+-   pd->map.alpha = bool;
++   pd->map.alpha = b;
+ 
+    edje_object_calc_force(obj);
+    return EINA_TRUE;
+ }
+ 
+ EAPI Eina_Bool
+-edje_edit_state_map_smooth_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool bool)
++edje_edit_state_map_smooth_set(Evas_Object *obj, const char *part, const char *state, double value, Eina_Bool b)
+ {
+    GET_PD_OR_RETURN(EINA_FALSE);
+ 
+-   pd->map.smooth = bool;
++   pd->map.smooth = b;
+ 
+    edje_object_calc_force(obj);
+    return EINA_TRUE;
+-- 
+2.47.3
+
diff --git a/package/efl/0007-evas-gl-fix-evas-gl-full-builds-after-gcc-15-changes.patch b/package/efl/0007-evas-gl-fix-evas-gl-full-builds-after-gcc-15-changes.patch
new file mode 100644
index 0000000000..ea0eebefa5
--- /dev/null
+++ b/package/efl/0007-evas-gl-fix-evas-gl-full-builds-after-gcc-15-changes.patch
@@ -0,0 +1,30 @@
+From c7ff646ed8b62e60159bdf0ff77132c3a242d919 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Sun, 4 May 2025 09:29:41 +0100
+Subject: [PATCH] evas - gl - fix evas gl full builds after gcc 15 changes
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/c7ff646ed8b62e60159bdf0ff77132c3a242d919
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/modules/evas/engines/gl_x11/evas_engine.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/modules/evas/engines/gl_x11/evas_engine.c b/src/modules/evas/engines/gl_x11/evas_engine.c
+index 86f5064cf3..8926c6afea 100644
+--- a/src/modules/evas/engines/gl_x11/evas_engine.c
++++ b/src/modules/evas/engines/gl_x11/evas_engine.c
+@@ -1382,9 +1382,9 @@ eng_gl_symbols(Outbuf *ob)
+ #define FINDSYM(dst, sym, ext) do { \
+    if (!dst) { \
+       if (_has_ext(exts, ext) && glsym_glXGetProcAddress) \
+-        dst = (typ) glsym_glXGetProcAddress(sym); \
++        dst = glsym_glXGetProcAddress(sym); \
+       if (!dst) \
+-        dst = (typ) dlsym(RTLD_DEFAULT, sym); \
++        dst = dlsym(RTLD_DEFAULT, sym); \
+    }} while (0)
+ 
+    // Find GLX extensions
+-- 
+2.47.3
+
diff --git a/package/efl/0008-emrbyo-new-gcc-15-breaks-builds-new-keyword-constexp.patch b/package/efl/0008-emrbyo-new-gcc-15-breaks-builds-new-keyword-constexp.patch
new file mode 100644
index 0000000000..bffebd8655
--- /dev/null
+++ b/package/efl/0008-emrbyo-new-gcc-15-breaks-builds-new-keyword-constexp.patch
@@ -0,0 +1,155 @@
+From fc4c5ec8afc3d1d145eff9807e5235ae6bfeea83 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Sat, 3 May 2025 15:02:45 +0100
+Subject: [PATCH] emrbyo - new gcc 15  breaks builds - new keyword constexpr
+
+gcc 15 default policy of breaking existing code. adapt.
+
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/fc4c5ec8afc3d1d145eff9807e5235ae6bfeea83
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/bin/embryo/embryo_cc_sc.h  |  2 +-
+ src/bin/embryo/embryo_cc_sc1.c | 28 ++++++++++++++--------------
+ src/bin/embryo/embryo_cc_sc2.c |  2 +-
+ 3 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/src/bin/embryo/embryo_cc_sc.h b/src/bin/embryo/embryo_cc_sc.h
+index f6271afec0..19fc084501 100644
+--- a/src/bin/embryo/embryo_cc_sc.h
++++ b/src/bin/embryo/embryo_cc_sc.h
+@@ -432,7 +432,7 @@ symbol     *fetchfunc(char *name, int tag);
+ char       *operator_symname(char *symname, char *opername, int tag1,
+ 				     int tag2, int numtags, int resulttag);
+ char       *funcdisplayname(char *dest, char *funcname);
+-int         constexpr(cell * val, int *tag);
++int         constexpress(cell * val, int *tag);
+ constvalue *append_constval(constvalue * table, char *name, cell val,
+ 				    short index);
+ constvalue *find_constval(constvalue * table, char *name, short index);
+diff --git a/src/bin/embryo/embryo_cc_sc1.c b/src/bin/embryo/embryo_cc_sc1.c
+index 9fbeb4dcf0..4cc0da293f 100644
+--- a/src/bin/embryo/embryo_cc_sc1.c
++++ b/src/bin/embryo/embryo_cc_sc1.c
+@@ -1513,7 +1513,7 @@ init(int ident, int *tag)
+ 	  }			/* if */
+ 	*tag = 0;
+      }
+-   else if (constexpr(&i, tag))
++   else if (constexpress(&i, tag))
+      {
+ 	stowlit(i);		/* store expression result in literal table */
+      }				/* if */
+@@ -1532,7 +1532,7 @@ needsub(int *tag)
+    *tag = 0;
+    if (matchtoken(']'))		/* we've already seen "[" */
+       return 0;			/* null size (like "char msg[]") */
+-   constexpr(&val, tag);	/* get value (must be constant expression) */
++   constexpress(&val, tag);	/* get value (must be constant expression) */
+    if (val < 0)
+      {
+ 	error(9);		/* negative array size is invalid; assumed zero */
+@@ -1561,7 +1561,7 @@ decl_const(int vclass)
+    strncpy(constname, str, sizeof(constname) - 1);	/* save symbol name */
+    constname[sizeof(constname) - 1] = 0;
+    needtoken('=');
+-   constexpr(&val, &exprtag);	/* get value */
++   constexpress(&val, &exprtag);	/* get value */
+    needtoken(tTERM);
+    /* add_constant() checks for duplicate definitions */
+    if (!matchtag(tag, exprtag, FALSE))
+@@ -1627,15 +1627,15 @@ decl_enum(int vclass)
+      {
+ 	if (matchtoken(taADD))
+ 	  {
+-	     constexpr(&increment, NULL);
++	     constexpress(&increment, NULL);
+ 	  }
+ 	else if (matchtoken(taMULT))
+ 	  {
+-	     constexpr(&multiplier, NULL);
++	     constexpress(&multiplier, NULL);
+ 	  }
+ 	else if (matchtoken(taSHL))
+ 	  {
+-	     constexpr(&lexval, NULL);
++	     constexpress(&lexval, NULL);
+ 	     while (lexval-- > 0)
+ 		multiplier *= 2;
+ 	  }			/* if */
+@@ -1659,9 +1659,9 @@ decl_enum(int vclass)
+ 	constname[sNAMEMAX] = 0;
+ 	size = increment;	/* default increment of 'val' */
+ 	if (tok == tLABEL || matchtoken(':'))
+-	   constexpr(&size, NULL);	/* get size */
++	   constexpress(&size, NULL);	/* get size */
+ 	if (matchtoken('='))
+-	   constexpr(&enumvalue, NULL);	/* get value */
++	   constexpress(&enumvalue, NULL);	/* get value */
+ 	/* add_constant() checks whether a variable (global or local) or
+ 	 * a constant with the same name already exists */
+ 	add_constant(constname, enumvalue, vclass, tag);
+@@ -2137,7 +2137,7 @@ funcstub(int native)
+ 	       }
+ 	     else
+ 	       {
+-		  constexpr(&val, NULL);
++		  constexpress(&val, NULL);
+ 		  sym->addr = val;
+ 		  /*
+ 		   * ?? Must mark this address, so that it won't be generated again
+@@ -2758,7 +2758,7 @@ doarg(char *name, int ident, int offset, int tags[], int numtags,
+ 	       }
+ 	     else
+ 	       {
+-		  constexpr(&arg->defvalue.val, &arg->defvalue_tag);
++		  constexpress(&arg->defvalue.val, &arg->defvalue_tag);
+ 		  assert(numtags > 0);
+ 		  if (!matchtag(tags[0], arg->defvalue_tag, TRUE))
+ 		     error(213);	/* tagname mismatch */
+@@ -3391,10 +3391,10 @@ doexpr(int comma, int chkeffect, int allowarray, int mark_endexpr,
+      }				/* if */
+ }
+ 
+-/*  constexpr
++/*  constexpress
+  */
+ int
+-constexpr(cell * val, int *tag)
++constexpress(cell * val, int *tag)
+ {
+    int                 constant, idx;
+    cell                cidx;
+@@ -3728,7 +3728,7 @@ doswitch(void)
+ 		   * parse all expressions until that special token.
+ 		   */
+ 
+-		  constexpr(&val, NULL);
++		  constexpress(&val, NULL);
+ 		  /* Search the insertion point (the table is kept in sorted
+ 		   * order, so that advanced abstract machines can sift the
+ 		   * case table with a binary search). Check for duplicate
+@@ -3753,7 +3753,7 @@ doswitch(void)
+ 		    {
+ 		       cell                end;
+ 
+-		       constexpr(&end, NULL);
++		       constexpress(&end, NULL);
+ 		       if (end <= val)
+ 			  error(50);	/* invalid range */
+ 		       while (++val <= end)
+diff --git a/src/bin/embryo/embryo_cc_sc2.c b/src/bin/embryo/embryo_cc_sc2.c
+index 5a51655a54..f0416e86c9 100644
+--- a/src/bin/embryo/embryo_cc_sc2.c
++++ b/src/bin/embryo/embryo_cc_sc2.c
+@@ -742,7 +742,7 @@ preproc_expr(cell * val, int *tag)
+    term = strchr(pline, '\0');
+    assert(term != NULL);
+    chrcat(pline, PREPROC_TERM);	/* the "DEL" code (see SC.H) */
+-   result = constexpr(val, tag);	/* get value (or 0 on error) */
++   result = constexpress(val, tag);	/* get value (or 0 on error) */
+    *term = '\0';		/* erase the token (if still present) */
+    lexclr(FALSE);		/* clear any "pushed" tokens */
+    return result;
+-- 
+2.47.3
+
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 72ff3199d0..e325fa6b3a 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,9 +1,8 @@
-# From https://www.enlightenment.org/news/2022-09-16-efl-1.26.3
-sha256  d9f83aa0fd9334f44deeb4e4952dc0e5144683afac786feebce6030951617d15  efl-1.26.3.tar.xz
+# From https://www.enlightenment.org/news/2025-03-17-efl-1.28.1
+sha256  84cf6145f9cc82bfff690005be24392c8f3c52f8e00ff04d8eea371429c09424  efl-1.28.1.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
-sha256  e5133b4034a4749a781e2220ffb230b60a282b88861f1124d69a58abd5143994  COPYING.images
 sha256  c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c  licenses/COPYING.ASL
 sha256  af4ffe7ed1795a6e9cd3b3ce8747fdc45da449ff58cf35b8027c0699a66fd5cf  licenses/COPYING.BSD
 sha256  e60d07dfb2c5264f9f405fa52bf0d4f85429dd9ae1bc2ffcff8af1924ef720d1  licenses/COPYING.FTL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 29b3b1955a..c49181d11d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.26.3
+EFL_VERSION = 1.28.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
-	COPYING.images \
 	licenses/COPYING.ASL \
 	licenses/COPYING.BSD \
 	licenses/COPYING.FTL \
@@ -214,7 +213,7 @@ endif
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
-EFL_EVAS_LOADERS_DISABLER = avif gst heif json ps
+EFL_EVAS_LOADERS_DISABLER = avif gst heif json ps jxl
 
 # efl already depends on jpeg.
 ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
@@ -348,7 +347,7 @@ HOST_EFL_CONF_OPTS += \
 
 # List of modular image/vector loaders to disable in efl
 HOST_EFL_EVAS_LOADERS_DISABLER = avif bmp dds eet generic gst heif ico json \
-	jp2k pdf pmaps ps psd raw rsvg tga tgv tiff wbmp webp xcf xpm
+	jp2k jxl pdf pmaps ps psd raw rsvg tga tgv tiff wbmp webp xcf xpm
 
 HOST_EFL_CONF_OPTS += -Devas-loaders-disabler=$(subst $(space),$(comma),$(HOST_EFL_EVAS_LOADERS_DISABLER))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
