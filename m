Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E458ECDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1716FACE;
	Sat, 20 Jun 2026 09:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZJsfGxf_LFO; Sat, 20 Jun 2026 09:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283D06FAD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946406;
	bh=BLR1qkkxOmoHoBnUyEvWZXxH7bjJqYXQnBlzwTKku0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P/9zdbASL2j/WIq37Mb1ZxAGleVAJLRBHfEHqAquiI/vtzoIJjalYnhqYNjlkdWmS
	 2wS1ha+UYVl20HDN7T/teL+SdUut7Ucl3TT3AfAyw0VPT/lyFDUOXsAqNwu5G+BbQI
	 lcWn4vmPxB5hdsWuBQLifM4dKQ1ub0mgGFJz3Fw3S+k7LVFNEdXUQCYCrNYKHLthDv
	 wMWTBaL1feSzjGealP1vamxoJuOz+VFVWJ7Zneir2z6Uf2kHzakDLfR5rP8Idc0MsU
	 Ls1y7Flf6A/lKbDxO6p0760sJxxcdH+vtjSEkX/n6uSSIuDISx6Ogda+aUrwRPueVp
	 QImPBI7XwkTcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283D06FAD5;
	Sat, 20 Jun 2026 09:06:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC5CD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3359780E4F
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLv3jIUTQ_GQ for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7922D8618E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7922D8618E
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80E0981E43; Sat, 20 Jun 2026 09:06:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a3f4bbe9145217946e0b8df4105712346cb31874
X-Git-Newrev: e50c8f179bc3184992789524c4331985e9e8ce86
X-Patchwork-Hint: ignore
Message-Id: <20260620090612.80E0981E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mesa3d: patch
 CVE-2026-40393
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
Content-Type: multipart/mixed; boundary="===============5354569509784496682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5354569509784496682==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e50c8f179bc3184992789524c4331985e9e8ce86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This patches CVE-2026-40393 by backporting the two patches from the
Merge Request listed in the CVE[1]. They don't apply cleanly when
backported. While the conflict is mechanically easy to resolve (simply
a few include directives missing in git context), it's not enough as
src/util/stack_array.h is not present on 24.0.9. Hence the three
additional patches before the patches listed in the Merge Request so
that file actually exists. Technically, only patch 8 is required but
patch 7 make for a conflict-free application of patch 8, itself only
conflict-free if patch 6 is applied.

[1] https://www.cve.org/CVERecord?id=CVE-2026-40393

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-Add-c99_compat.h-inclusion-for-cpp-restr.patch |  32 ++++++
 ...t-zero-initialize-STACK_ARRAY-s-stack-arr.patch | 124 +++++++++++++++++++++
 .../0008-util-Move-STACK_ARRAY-into-util.patch     | 120 ++++++++++++++++++++
 ...-spirv-Use-STACK_ARRAY-instead-of-NIR_VLA.patch | 108 ++++++++++++++++++
 ...10-nir-Use-STACK_ARRAY-instead-of-NIR_VLA.patch |  57 ++++++++++
 package/mesa3d/mesa3d.mk                           |   4 +
 6 files changed, 445 insertions(+)

diff --git a/package/mesa3d/0006-vulkan-util-Add-c99_compat.h-inclusion-for-cpp-restr.patch b/package/mesa3d/0006-vulkan-util-Add-c99_compat.h-inclusion-for-cpp-restr.patch
new file mode 100644
index 0000000000..bec78d949c
--- /dev/null
+++ b/package/mesa3d/0006-vulkan-util-Add-c99_compat.h-inclusion-for-cpp-restr.patch
@@ -0,0 +1,32 @@
+From 85d8bab69a7812908d9984c2783dc9a447e0d1ea Mon Sep 17 00:00:00 2001
+From: Aaron Ruby <aruby@qnx.com>
+Date: Mon, 13 Jan 2025 12:52:48 -0500
+Subject: [PATCH] vulkan/util: Add c99_compat.h inclusion for cpp 'restrict'
+ compatibility
+
+Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
+Reviewed-by: Aaron Ruby <None>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33006>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/e9663276f4824199fe9053ef8d6724f907b76bd1
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/vulkan/util/vk_util.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/vulkan/util/vk_util.h b/src/vulkan/util/vk_util.h
+index 295f6e474b4..4095de57b0c 100644
+--- a/src/vulkan/util/vk_util.h
++++ b/src/vulkan/util/vk_util.h
+@@ -23,9 +23,11 @@
+ #ifndef VK_UTIL_H
+ #define VK_UTIL_H
+ 
++#include "compiler/shader_enums.h"
+ #include "util/bitscan.h"
+ #include "util/macros.h"
+-#include "compiler/shader_enums.h"
++#include "c99_compat.h"
++
+ #include <stdlib.h>
+ #include <string.h>
+ 
diff --git a/package/mesa3d/0007-vulkan-don-t-zero-initialize-STACK_ARRAY-s-stack-arr.patch b/package/mesa3d/0007-vulkan-don-t-zero-initialize-STACK_ARRAY-s-stack-arr.patch
new file mode 100644
index 0000000000..224255f1c2
--- /dev/null
+++ b/package/mesa3d/0007-vulkan-don-t-zero-initialize-STACK_ARRAY-s-stack-arr.patch
@@ -0,0 +1,124 @@
+From 2094d5a43bee1878767ba0b957daf9436b71a7d6 Mon Sep 17 00:00:00 2001
+From: Paulo Zanoni <paulo.r.zanoni@intel.com>
+Date: Mon, 18 Mar 2024 16:33:54 -0700
+Subject: [PATCH] vulkan: don't zero-initialize STACK_ARRAY()'s stack array
+
+STACK_ARRAY() is used in a lot of places. When games are running we
+see STACK_ARRAY() arrays being used all the time: each queue
+submission uses 6, WaitSemaphores and syncobj waiting also uses them:
+they're constantly present in Vulkan runtime.
+
+There's no need for STACK_ARRAY()'s stack array to be initialized,
+callers cannot not depend on it. If the number of elements is greater
+than STACK_ARRAY_SIZE, then STACK_ARRAY() will just malloc() the array
+and return it not initialized: anybody depending of
+zero-initialization is going to break when the array is big.
+
+The reason why we're zero-intializing STACK_ARRAY()'s stack array is
+to silence -Wmaybe-uninitialized warnings: see commit d7957df31848
+("vulkan: fix uninitialized variables"). I don't think that commit is
+the ideal way to deal with the problem, so this patch proposes a
+better solution.
+
+The problem here is that zero-initializing it adds code we don't need
+for every single caller. STACK_ARRAY() already has 63 callers and only
+3 of them are affected by the -Wmaybe-uninitialized warining. So here
+we undo what commit d7957df31848 did and instead we fix the 3 cases
+that actually generate the -Wmaybe-uninitialized warnings.
+
+Gcc is only emitting those warinings because it knows that the number
+of elements in the array may be zero, so the loops we have that set
+elements to the array may end up do nothing, and then we pass the
+array uninitialized to other functions.
+
+For the cases related to vk_sync this is just returning VK_SUCCESS
+earlier, instead of relying on the check that eventually happens at
+__vk_sync_wait_many(). For the vkCmdWaitEvents() function, the Vulkan
+spec says that "eventCount must be greater than 0", so the early
+return doesn't hurt anybody either. In both cases we make the zero
+case faster by not defining an 8-sized array, zero-initializing it,
+then returning success without using it.
+
+Reference: d7957df31848 ("vulkan: fix uninitialized variables")
+Acked-by: Yonggang Luo <luoyonggang@gmail.com>
+Reviewed-by: Yiwei Zhang <zzyiwei@chromium.org>
+Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28288>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/b0653370d0ea7d6c72cd419451debed52e09653d
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/vulkan/runtime/vk_queue.c           |  4 ++++
+ src/vulkan/runtime/vk_sync_binary.c     |  3 +++
+ src/vulkan/runtime/vk_synchronization.c |  3 +++
+ src/vulkan/util/vk_util.h               | 14 +++++++-------
+ 4 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/src/vulkan/runtime/vk_queue.c b/src/vulkan/runtime/vk_queue.c
+index 81087dde7fc..36ebe0ef23f 100644
+--- a/src/vulkan/runtime/vk_queue.c
++++ b/src/vulkan/runtime/vk_queue.c
+@@ -1037,6 +1037,10 @@ vk_queue_wait_before_present(struct vk_queue *queue,
+       return VK_SUCCESS;
+ 
+    const uint32_t wait_count = pPresentInfo->waitSemaphoreCount;
++
++   if (wait_count == 0)
++      return VK_SUCCESS;
++
+    STACK_ARRAY(struct vk_sync_wait, waits, wait_count);
+ 
+    for (uint32_t i = 0; i < wait_count; i++) {
+diff --git a/src/vulkan/runtime/vk_sync_binary.c b/src/vulkan/runtime/vk_sync_binary.c
+index 3d2720f9348..c10cabe348a 100644
+--- a/src/vulkan/runtime/vk_sync_binary.c
++++ b/src/vulkan/runtime/vk_sync_binary.c
+@@ -91,6 +91,9 @@ vk_sync_binary_wait_many(struct vk_device *device,
+                          enum vk_sync_wait_flags wait_flags,
+                          uint64_t abs_timeout_ns)
+ {
++   if (wait_count == 0)
++      return VK_SUCCESS;
++
+    STACK_ARRAY(struct vk_sync_wait, timeline_waits, wait_count);
+ 
+    for (uint32_t i = 0; i < wait_count; i++) {
+diff --git a/src/vulkan/runtime/vk_synchronization.c b/src/vulkan/runtime/vk_synchronization.c
+index 53fb56e686d..701474164e4 100644
+--- a/src/vulkan/runtime/vk_synchronization.c
++++ b/src/vulkan/runtime/vk_synchronization.c
+@@ -249,6 +249,9 @@ vk_common_CmdWaitEvents(
+    VK_FROM_HANDLE(vk_command_buffer, cmd_buffer, commandBuffer);
+    struct vk_device *device = cmd_buffer->base.device;
+ 
++   if (eventCount == 0)
++      return;
++
+    STACK_ARRAY(VkDependencyInfo, deps, eventCount);
+ 
+    /* Note that dstStageMask and srcStageMask in the CmdWaitEvent2() call
+diff --git a/src/vulkan/util/vk_util.h b/src/vulkan/util/vk_util.h
+index 4095de57b0c..5c1ac5e1f25 100644
+--- a/src/vulkan/util/vk_util.h
++++ b/src/vulkan/util/vk_util.h
+@@ -360,14 +360,14 @@ vk_spec_info_to_nir_spirv(const VkSpecializationInfo *spec_info,
+ 
+ #define STACK_ARRAY_SIZE 8
+ 
+-#ifdef __cplusplus
+-#define STACK_ARRAY_ZERO_INIT {}
+-#else
+-#define STACK_ARRAY_ZERO_INIT {0}
+-#endif
+-
++/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
++ * places it can't verify that when size is 0 nobody down the call chain reads
++ * the array. Please don't try to fix it by zero-initializing the array here
++ * since it's used in a lot of different places. An "if (size == 0) return;"
++ * may work for you.
++ */
+ #define STACK_ARRAY(type, name, size) \
+-   type _stack_##name[STACK_ARRAY_SIZE] = STACK_ARRAY_ZERO_INIT; \
++   type _stack_##name[STACK_ARRAY_SIZE]; \
+    type *const name = \
+      ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
+ 
diff --git a/package/mesa3d/0008-util-Move-STACK_ARRAY-into-util.patch b/package/mesa3d/0008-util-Move-STACK_ARRAY-into-util.patch
new file mode 100644
index 0000000000..edf4dc94c4
--- /dev/null
+++ b/package/mesa3d/0008-util-Move-STACK_ARRAY-into-util.patch
@@ -0,0 +1,120 @@
+From 1f3496053b13451bd992c3ca390edb4d39c5ffa2 Mon Sep 17 00:00:00 2001
+From: Faith Ekstrand <faith.ekstrand@collabora.com>
+Date: Tue, 29 Jul 2025 03:10:41 -0400
+Subject: [PATCH] util: Move STACK_ARRAY into util
+
+It's useful for more than just Vulkan.
+
+Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
+Reviewed-by: Christoph Pillmayer <christoph.pillmayer@arm.com>
+(cherry picked from commit f43cff3728e58c377d1e03b13db62514217abfe1)
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39969>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/6167c7acf049330f37b59ea9bd155d8f644f4efa
+[removed changes to .pick_status.json, not applicable to 24.0.9]
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/util/meson.build      |  1 +
+ src/util/stack_array.h    | 45 +++++++++++++++++++++++++++++++++++++++
+ src/vulkan/util/vk_util.h | 17 +--------------
+ 3 files changed, 47 insertions(+), 16 deletions(-)
+ create mode 100644 src/util/stack_array.h
+
+diff --git a/src/util/meson.build b/src/util/meson.build
+index eb88f235c47..d7cba3a5966 100644
+--- a/src/util/meson.build
++++ b/src/util/meson.build
+@@ -122,6 +122,7 @@ files_mesa_util = files(
+   'softfloat.h',
+   'sparse_array.c',
+   'sparse_array.h',
++  'stack_array.h',
+   'string_buffer.c',
+   'string_buffer.h',
+   'strndup.h',
+diff --git a/src/util/stack_array.h b/src/util/stack_array.h
+new file mode 100644
+index 00000000000..e2133bdc2f4
+--- /dev/null
++++ b/src/util/stack_array.h
+@@ -0,0 +1,45 @@
++/*
++ * Copyright © 2025 Collabora, Ltd.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++ * IN THE SOFTWARE.
++ */
++
++#include <stdlib.h>
++
++#ifndef UTIL_STACK_ARRAY_H
++#define UTIL_STACK_ARRAY_H
++
++#define STACK_ARRAY_SIZE 8
++
++/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
++ * places it can't verify that when size is 0 nobody down the call chain reads
++ * the array. Please don't try to fix it by zero-initializing the array here
++ * since it's used in a lot of different places. An "if (size == 0) return;"
++ * may work for you.
++ */
++#define STACK_ARRAY(type, name, size) \
++   type _stack_##name[STACK_ARRAY_SIZE]; \
++   type *const name = \
++     ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
++
++#define STACK_ARRAY_FINISH(name) \
++   if (name != _stack_##name) free(name)
++
++#endif /* UTIL_STACK_ARRAY_H */
+diff --git a/src/vulkan/util/vk_util.h b/src/vulkan/util/vk_util.h
+index 5c1ac5e1f25..e1712e4a78d 100644
+--- a/src/vulkan/util/vk_util.h
++++ b/src/vulkan/util/vk_util.h
+@@ -26,6 +26,7 @@
+ #include "compiler/shader_enums.h"
+ #include "util/bitscan.h"
+ #include "util/macros.h"
++#include "util/stack_array.h"
+ #include "c99_compat.h"
+ 
+ #include <stdlib.h>
+@@ -358,22 +359,6 @@ struct nir_spirv_specialization*
+ vk_spec_info_to_nir_spirv(const VkSpecializationInfo *spec_info,
+                           uint32_t *out_num_spec_entries);
+ 
+-#define STACK_ARRAY_SIZE 8
+-
+-/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
+- * places it can't verify that when size is 0 nobody down the call chain reads
+- * the array. Please don't try to fix it by zero-initializing the array here
+- * since it's used in a lot of different places. An "if (size == 0) return;"
+- * may work for you.
+- */
+-#define STACK_ARRAY(type, name, size) \
+-   type _stack_##name[STACK_ARRAY_SIZE]; \
+-   type *const name = \
+-     ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
+-
+-#define STACK_ARRAY_FINISH(name) \
+-   if (name != _stack_##name) free(name)
+-
+ static inline uint8_t
+ vk_index_type_to_bytes(enum VkIndexType type)
+ {
diff --git a/package/mesa3d/0009-spirv-Use-STACK_ARRAY-instead-of-NIR_VLA.patch b/package/mesa3d/0009-spirv-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
new file mode 100644
index 0000000000..a4ea1ca068
--- /dev/null
+++ b/package/mesa3d/0009-spirv-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
@@ -0,0 +1,108 @@
+From 17d07f85828eca081d7fe1bcd9cbbf747fcc1300 Mon Sep 17 00:00:00 2001
+From: Ian Romanick <ian.d.romanick@intel.com>
+Date: Fri, 23 Jan 2026 09:58:26 -0800
+Subject: [PATCH] spirv: Use STACK_ARRAY instead of NIR_VLA
+
+The number of fields comes from the shader, so it could be a value large
+enough that using alloca would be problematic.
+
+Fixes: 2a023f30a64 ("nir/spirv: Add basic support for types")
+Reviewed-by: Caio Oliveira <caio.oliveira@intel.com>
+Reviewed-by: Ryan Neph <ryanneph@google.com>
+Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+(cherry picked from commit 3da828d2dd12e20ba2afc152db8d7236c7a48c13)
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39969>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/3db355dc37e823011666767ecc1f9d48bdc6e3a0
+[removed changes to .pick_status.json, not applicable to 24.0.9]
+[conflict in git context around the added include directive due to
+ missing 51d3c4c8896a ("spirv: support float8 spec constant op"),
+ 90e1b128903c ("spirv: Add bfloat16 support to SpecConstantOp"),
+ d21926bc0433 ("spirv: Emit code for NonSemantic.DebugPrintf if
+ supported"), 221371e9039b ("mesa: replace shader_info::source_sha1")]
+CVE: CVE-2026-40393
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/compiler/spirv/spirv_to_nir.c | 27 +++++++++++++++++----------
+ 1 file changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/src/compiler/spirv/spirv_to_nir.c b/src/compiler/spirv/spirv_to_nir.c
+index f57c9ba42a2..17ae5a64301 100644
+--- a/src/compiler/spirv/spirv_to_nir.c
++++ b/src/compiler/spirv/spirv_to_nir.c
+@@ -27,7 +27,6 @@
+ 
+ #include "glsl_types.h"
+ #include "vtn_private.h"
+-#include "nir/nir_vla.h"
+ #include "nir/nir_control_flow.h"
+ #include "nir/nir_constant_expressions.h"
+ #include "nir/nir_deref.h"
+@@ -37,6 +36,7 @@
+ #include "util/u_math.h"
+ #include "util/u_string.h"
+ #include "util/u_debug.h"
++#include "util/stack_array.h"
+ 
+ #include <stdio.h>
+ 
+@@ -1013,7 +1013,7 @@ vtn_type_get_nir_type(struct vtn_builder *b, struct vtn_type *type,
+       case vtn_base_type_struct: {
+          bool need_new_struct = false;
+          const uint32_t num_fields = type->length;
+-         NIR_VLA(struct glsl_struct_field, fields, num_fields);
++         STACK_ARRAY(struct glsl_struct_field, fields, num_fields);
+          for (unsigned i = 0; i < num_fields; i++) {
+             fields[i] = *glsl_get_struct_field_data(type->type, i);
+             const struct glsl_type *field_nir_type =
+@@ -1023,20 +1023,25 @@ vtn_type_get_nir_type(struct vtn_builder *b, struct vtn_type *type,
+                need_new_struct = true;
+             }
+          }
++
++         const struct glsl_type *result;
+          if (need_new_struct) {
+             if (glsl_type_is_interface(type->type)) {
+-               return glsl_interface_type(fields, num_fields,
+-                                          /* packing */ 0, false,
+-                                          glsl_get_type_name(type->type));
++               result = glsl_interface_type(fields, num_fields,
++                                            /* packing */ 0, false,
++                                            glsl_get_type_name(type->type));
+             } else {
+-               return glsl_struct_type(fields, num_fields,
+-                                       glsl_get_type_name(type->type),
+-                                       glsl_struct_type_is_packed(type->type));
++               result = glsl_struct_type(fields, num_fields,
++                                         glsl_get_type_name(type->type),
++                                         glsl_struct_type_is_packed(type->type));
+             }
+          } else {
+             /* No changes, just pass it on */
+-            return type->type;
++            result = type->type;
+          }
++
++         STACK_ARRAY_FINISH(fields);
++         return result;
+       }
+ 
+       case vtn_base_type_image:
+@@ -1647,7 +1652,7 @@ vtn_handle_type(struct vtn_builder *b, SpvOp opcode,
+       val->type->offsets = vtn_alloc_array(b, unsigned, num_fields);
+       val->type->packed = false;
+ 
+-      NIR_VLA(struct glsl_struct_field, fields, count);
++      STACK_ARRAY(struct glsl_struct_field, fields, count);
+       for (unsigned i = 0; i < num_fields; i++) {
+          val->type->members[i] = vtn_get_type(b, w[i + 2]);
+          const char *name = NULL;
+@@ -1703,6 +1708,8 @@ vtn_handle_type(struct vtn_builder *b, SpvOp opcode,
+                                             name ? name : "struct",
+                                             val->type->packed);
+       }
++
++      STACK_ARRAY_FINISH(fields);
+       break;
+    }
+ 
diff --git a/package/mesa3d/0010-nir-Use-STACK_ARRAY-instead-of-NIR_VLA.patch b/package/mesa3d/0010-nir-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
new file mode 100644
index 0000000000..123aa8a153
--- /dev/null
+++ b/package/mesa3d/0010-nir-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
@@ -0,0 +1,57 @@
+From ead2f775271612a5d06664355dd09e5fcfd09b08 Mon Sep 17 00:00:00 2001
+From: Ian Romanick <ian.d.romanick@intel.com>
+Date: Fri, 23 Jan 2026 10:07:27 -0800
+Subject: [PATCH] nir: Use STACK_ARRAY instead of NIR_VLA
+
+The number of fields comes from the shader, so it could be a value large
+enough that using alloca would be problematic.
+
+Fixes: c11833ab24d ("nir,spirv: Rework function calls")
+Reviewed-by: Caio Oliveira <caio.oliveira@intel.com>
+Reviewed-by: Ryan Neph <ryanneph@google.com>
+Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+(cherry picked from commit 9017d37e84771f921a63676dd8b955df9ef20f29)
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39969>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/cc3303b3d244121ce6f27b0ef1ffc9909fc75e52
+[removed changes to .pick_status.json, not applicable to 24.0.9]
+[conflict in git context around the added include directive due to
+ missing 76061b7fa33a ("nir: Don't include u_printf.h in nir.h, only
+ where necessary."), 91872c9c5158 ("nir: clang-format")]
+CVE: CVE-2026-40393
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ src/compiler/nir/nir_functions.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/compiler/nir/nir_functions.c b/src/compiler/nir/nir_functions.c
+index d17ebd83ead..abd5e8a095d 100644
+--- a/src/compiler/nir/nir_functions.c
++++ b/src/compiler/nir/nir_functions.c
+@@ -21,10 +21,10 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include "util/stack_array.h"
+ #include "nir.h"
+ #include "nir_builder.h"
+ #include "nir_control_flow.h"
+-#include "nir_vla.h"
+ 
+ /*
+  * TODO: write a proper inliner for GPUs.
+@@ -177,12 +177,13 @@ static bool inline_functions_pass(nir_builder *b,
+     * to an SSA value first.
+     */
+    const unsigned num_params = call->num_params;
+-   NIR_VLA(nir_def *, params, num_params);
++   STACK_ARRAY(nir_def *, params, num_params);
+    for (unsigned i = 0; i < num_params; i++) {
+       params[i] = call->params[i].ssa;
+    }
+ 
+    nir_inline_function_impl(b, call->callee->impl, params, NULL);
++   STACK_ARRAY_FINISH(params);
+    return true;
+ }
+ 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 202fc5cc74..d23c63876f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -262,4 +262,8 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=false
 endif
 
+# 0009-spirv-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
+# 0010-nir-Use-STACK_ARRAY-instead-of-NIR_VLA.patch
+MESA3D_IGNORE_CVES += CVE-2026-40393
+
 $(eval $(meson-package))

--===============5354569509784496682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5354569509784496682==--
