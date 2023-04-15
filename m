Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A24C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C00B40585;
	Sat, 15 Apr 2023 08:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C00B40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBVw2Hy2CD64; Sat, 15 Apr 2023 08:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0887F405E9;
	Sat, 15 Apr 2023 08:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0887F405E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AFA31BF28F
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F76C4274F
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F76C4274F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT8zb3sS4DVV for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 08:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0359D4273C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0359D4273C
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 08:14:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1ppjhO0CcK-00X1dS; Sat, 15
 Apr 2023 10:14:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 10:14:12 +0200
Message-Id: <20230415081412.8053-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:S1ZYX8jL9FVBicP86QzYGkXP/zd8vIz0ahOssFxkG+0H9s5XJf1
 vxww9VbxRM+XqL9O2fsXKEd78abt/PBkoyHMTmjpSSVQat0Sy+/xH7/26KFa1MeFUtEC+aM
 i9i7RNzBcWIh5X9a6KSWX6ljkqJ/kkhQ2hX0cCvwVokkZjxB2yLN/RxsTYPCYwV7v3RmksI
 SeNRiWjyPgIcMNOej1++Q==
UI-OutboundReport: notjunk:1;M01:P0:jOM2eMvGKT0=;6Mg/+DnbvrdfsbkOgGvE7eDrYOF
 xFNxbmvMpAO/72tqrJzU7GD9b0g+fCkieFz02MYQ8GJwQbzBRBmQvEuJ1mzEZ1EUbKalQfWI3
 +fVIwe0r67bOnTZr977qCeLKoL9+4SDYP/5lC3Xk6DT1PtoFpzoEed2AJleGs7+fpSFhjPItn
 Y5A5xdVBRJXS0gGLfYSMDGjIy0xh70zQJ1S8welRDrOsFQm+yCYExZp9AXHPCEoRJc3Sl9e2g
 2fgkLyLr/5+Uo7szBxx0IjV0fZaClZPrE6v/T5fVZdvhteQE3WMKGGo3VAFssAVTcKK8a+d6S
 InNSrQvR7M1OQoeCEnbwWjWzz2wEHiQSm5giyYdc8My0K7y0stxiYCIA1UQWnEvjN1RK7Qrdi
 DT6qcofHeoWp0uK+X5ScZu4BJAjSw855DpY1ZdsnZ+yvhUTjc7dIwIasUEg10ig3FfF9IkTH7
 TS8FOGqBji5GPzaouEp/K4cSm3DD6KkCC3OTaqci3FuvNlzRl9aT6tlz7JV1+Tl94c+Cjx7Ni
 df/+AyRYck5r47O5ruCZHViv8Z0aljIml+Wwdfxpf45hBrUO0Ht0GeaqMiJv2+uuqiUpPBF44
 rARGlFOX/k9uXMh4oDyouYdUTu0cLKKU96ytKJNscKM99ojk49HgASmieMNYbW8Clk2+0Akvt
 TCZKd2YiSODMqJPIO+6BaF/ofQgOBr8X+RNMbunti3sVr2LaJ5cxEjP8tBCGTLmcW+Qofs4N7
 p2u6YzPjMd3PAQtYbAfV5qC1XpmrzLLc5YzPPa0QCLTQeJeWHAKnaF+45C25QDJiV6s5SdDHm
 vr7gkzjtJZVZrpDkOdJXxtQ+WW1kUpVVape8Syp2JoT8xmPAVrTiN790TFCkC2topfrSiUYh4
 5fJRn8i+XMRR3SWUD/OXbrOragjWiZM84aiulCbbjlImE4khfHR19bdEfMHBaPp3n2IwIRJ82
 Bvk5MQkpUV+c3PucC46qK/vKi9M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1681546454; i=ps.report@gmx.net;
 bh=6ESQKsTz6+3PjRB9Yr1a3Tvld/UuPluYDN/SRWMTbTM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=M2GFwXLMtUCYC3w0GCsdLvmVSWd5+CRmHQ0dgoeqlZ/OAMnEsxIXgG8X4ZC7EdbbB
 ksJcj9pOJio7XxsYPtLJDfv90FlQ5OgzNguURKzBn7rNrc4H2qrH5IpyGgIb1NGGGX
 APX+8XTUoB9BgZ0oXqIG9LvCLZ0IqYKskZENaXz3ioSjdk/WP0rNEqBP/E68ag+JzM
 mxGtm5QQE08I0qWijzsZX3v0T7+QlxZlF3VXh0Q1V0Kr+Q6w61Z9i35Wm25pIHQqL7
 IVNFYFIPd+x87aGDqYeEyOMZddO95GKg9kjHiOWqYKKpBF6FZEIIQnP81D5eZaKIVt
 C13BisB+Y/Ydg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=M2GFwXLM
Subject: [Buildroot] [PATCH v1] package/zstd: bump version to 1.5.5
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove 0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
  (from upstream, see [1])

For details see [2].

[1] https://github.com/facebook/zstd/commit/c78f434aa4f5f1097c8edb975f4c1635817a5a71
[2] https://github.com/facebook/zstd/releases/tag/v1.5.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-dll-build-missing-dependencies-3496.patch | 321 ------------------
 package/zstd/zstd.hash                        |   4 +-
 package/zstd/zstd.mk                          |   2 +-
 3 files changed, 3 insertions(+), 324 deletions(-)
 delete mode 100644 package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch

diff --git a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
deleted file mode 100644
index 60737159c6..0000000000
--- a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
+++ /dev/null
@@ -1,321 +0,0 @@
-From e47c7c0d5a923dcdc3b302f9944eb4a70b7ee0be Mon Sep 17 00:00:00 2001
-From: Yonatan Komornik <11005061+yoniko@users.noreply.github.com>
-Date: Sun, 12 Feb 2023 12:32:31 -0800
-Subject: [PATCH] Fix zstd-dll build missing dependencies (#3496)
-
-* Fixes zstd-dll build (https://github.com/facebook/zstd/issues/3492):
-- Adds pool.o and threading.o dependency to the zstd-dll target
-- Moves custom allocation functions into header to avoid needing to add dependency on common.o
-- Adds test target for zstd-dll
-- Adds github workflow that buildis zstd-dll
-
-[nolange79: backport from upstream c78f434aa4f5f1097c8edb975f4c1635817a5a71]
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
----
- .github/workflows/dev-short-tests.yml     |  9 +++-
- contrib/linux-kernel/zstd_common_module.c |  3 --
- lib/common/allocations.h                  | 55 +++++++++++++++++++++++
- lib/common/pool.c                         |  2 +-
- lib/common/zstd_common.c                  | 35 ---------------
- lib/common/zstd_internal.h                |  5 ---
- lib/compress/zstd_compress.c              |  1 +
- lib/compress/zstd_cwksp.h                 |  1 +
- lib/compress/zstdmt_compress.c            |  1 +
- lib/decompress/zstd_ddict.c               |  1 +
- lib/decompress/zstd_decompress.c          |  1 +
- programs/Makefile                         |  2 +-
- tests/Makefile                            |  8 +++-
- 13 files changed, 76 insertions(+), 48 deletions(-)
- create mode 100644 lib/common/allocations.h
-
-diff --git a/.github/workflows/dev-short-tests.yml b/.github/workflows/dev-short-tests.yml
-index 132dbb99..3ae2e9da 100644
---- a/.github/workflows/dev-short-tests.yml
-+++ b/.github/workflows/dev-short-tests.yml
-@@ -55,6 +55,14 @@ jobs:
-       run: |
-         make c89build V=1
- 
-+  build-zstd-dll:
-+    runs-on: ubuntu-latest
-+    steps:
-+    - uses: actions/checkout@ac593985615ec2ede58e132d2e21d2b1cbd6127c # tag=v3
-+    - name: build zstd bin against a dynamic lib (debuglevel for more dependencies)
-+      run: |
-+        make -C lib lib-mt-release 
-+        DEBUGLEVEL=2 make -C programs zstd-dll
- 
-   gcc-7-libzstd:
-     runs-on: ubuntu-latest
-@@ -328,7 +336,6 @@ jobs:
-         make -j -C programs allVariants MOREFLAGS=-O0
-         ./tests/test-variants.sh
- 
--
-   qemu-consistency:
-     name: QEMU ${{ matrix.name }}
-     runs-on: ubuntu-20.04
-diff --git a/contrib/linux-kernel/zstd_common_module.c b/contrib/linux-kernel/zstd_common_module.c
-index 2fead39e..466828e3 100644
---- a/contrib/linux-kernel/zstd_common_module.c
-+++ b/contrib/linux-kernel/zstd_common_module.c
-@@ -24,9 +24,6 @@ EXPORT_SYMBOL_GPL(HUF_readStats_wksp);
- EXPORT_SYMBOL_GPL(ZSTD_isError);
- EXPORT_SYMBOL_GPL(ZSTD_getErrorName);
- EXPORT_SYMBOL_GPL(ZSTD_getErrorCode);
--EXPORT_SYMBOL_GPL(ZSTD_customMalloc);
--EXPORT_SYMBOL_GPL(ZSTD_customCalloc);
--EXPORT_SYMBOL_GPL(ZSTD_customFree);
- 
- MODULE_LICENSE("Dual BSD/GPL");
- MODULE_DESCRIPTION("Zstd Common");
-diff --git a/lib/common/allocations.h b/lib/common/allocations.h
-new file mode 100644
-index 00000000..a3153c4b
---- /dev/null
-+++ b/lib/common/allocations.h
-@@ -0,0 +1,55 @@
-+/*
-+ * Copyright (c) Meta Platforms, Inc. and affiliates.
-+ * All rights reserved.
-+ *
-+ * This source code is licensed under both the BSD-style license (found in the
-+ * LICENSE file in the root directory of this source tree) and the GPLv2 (found
-+ * in the COPYING file in the root directory of this source tree).
-+ * You may select, at your option, one of the above-listed licenses.
-+ */
-+
-+/* This file provides custom allocation primitives
-+ */
-+
-+#define ZSTD_DEPS_NEED_MALLOC
-+#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
-+
-+#include "mem.h" /* MEM_STATIC */
-+#define ZSTD_STATIC_LINKING_ONLY
-+#include "../zstd.h" /* ZSTD_customMem */
-+
-+#ifndef ZSTD_ALLOCATIONS_H
-+#define ZSTD_ALLOCATIONS_H
-+
-+/* custom memory allocation functions */
-+
-+MEM_STATIC void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
-+{
-+    if (customMem.customAlloc)
-+        return customMem.customAlloc(customMem.opaque, size);
-+    return ZSTD_malloc(size);
-+}
-+
-+MEM_STATIC void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
-+{
-+    if (customMem.customAlloc) {
-+        /* calloc implemented as malloc+memset;
-+         * not as efficient as calloc, but next best guess for custom malloc */
-+        void* const ptr = customMem.customAlloc(customMem.opaque, size);
-+        ZSTD_memset(ptr, 0, size);
-+        return ptr;
-+    }
-+    return ZSTD_calloc(1, size);
-+}
-+
-+MEM_STATIC void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
-+{
-+    if (ptr!=NULL) {
-+        if (customMem.customFree)
-+            customMem.customFree(customMem.opaque, ptr);
-+        else
-+            ZSTD_free(ptr);
-+    }
-+}
-+
-+#endif /* ZSTD_ALLOCATIONS_H */
-diff --git a/lib/common/pool.c b/lib/common/pool.c
-index f3d9d085..d5ca5a78 100644
---- a/lib/common/pool.c
-+++ b/lib/common/pool.c
-@@ -10,9 +10,9 @@
- 
- 
- /* ======   Dependencies   ======= */
-+#include "../common/allocations.h"  /* ZSTD_customCalloc, ZSTD_customFree */
- #include "zstd_deps.h" /* size_t */
- #include "debug.h"     /* assert */
--#include "zstd_internal.h"  /* ZSTD_customCalloc, ZSTD_customFree */
- #include "pool.h"
- 
- /* ======   Compiler specifics   ====== */
-diff --git a/lib/common/zstd_common.c b/lib/common/zstd_common.c
-index 32085524..3f04c22a 100644
---- a/lib/common/zstd_common.c
-+++ b/lib/common/zstd_common.c
-@@ -14,7 +14,6 @@
- *  Dependencies
- ***************************************/
- #define ZSTD_DEPS_NEED_MALLOC
--#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
- #include "error_private.h"
- #include "zstd_internal.h"
- 
-@@ -47,37 +46,3 @@ ZSTD_ErrorCode ZSTD_getErrorCode(size_t code) { return ERR_getErrorCode(code); }
- /*! ZSTD_getErrorString() :
-  *  provides error code string from enum */
- const char* ZSTD_getErrorString(ZSTD_ErrorCode code) { return ERR_getErrorString(code); }
--
--
--
--/*=**************************************************************
--*  Custom allocator
--****************************************************************/
--void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
--{
--    if (customMem.customAlloc)
--        return customMem.customAlloc(customMem.opaque, size);
--    return ZSTD_malloc(size);
--}
--
--void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
--{
--    if (customMem.customAlloc) {
--        /* calloc implemented as malloc+memset;
--         * not as efficient as calloc, but next best guess for custom malloc */
--        void* const ptr = customMem.customAlloc(customMem.opaque, size);
--        ZSTD_memset(ptr, 0, size);
--        return ptr;
--    }
--    return ZSTD_calloc(1, size);
--}
--
--void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
--{
--    if (ptr!=NULL) {
--        if (customMem.customFree)
--            customMem.customFree(customMem.opaque, ptr);
--        else
--            ZSTD_free(ptr);
--    }
--}
-diff --git a/lib/common/zstd_internal.h b/lib/common/zstd_internal.h
-index 37836dc7..1f942f27 100644
---- a/lib/common/zstd_internal.h
-+++ b/lib/common/zstd_internal.h
-@@ -350,11 +350,6 @@ typedef struct {
- const seqStore_t* ZSTD_getSeqStore(const ZSTD_CCtx* ctx);   /* compress & dictBuilder */
- int ZSTD_seqToCodes(const seqStore_t* seqStorePtr);   /* compress, dictBuilder, decodeCorpus (shouldn't get its definition from here) */
- 
--/* custom memory allocation functions */
--void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem);
--void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem);
--void ZSTD_customFree(void* ptr, ZSTD_customMem customMem);
--
- 
- /* ZSTD_invalidateRepCodes() :
-  * ensures next compression will not use repcodes from previous block.
-diff --git a/lib/compress/zstd_compress.c b/lib/compress/zstd_compress.c
-index b55f684c..173ce242 100644
---- a/lib/compress/zstd_compress.c
-+++ b/lib/compress/zstd_compress.c
-@@ -11,6 +11,7 @@
- /*-*************************************
- *  Dependencies
- ***************************************/
-+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
- #include "../common/zstd_deps.h"  /* INT_MAX, ZSTD_memset, ZSTD_memcpy */
- #include "../common/mem.h"
- #include "hist.h"           /* HIST_countFast_wksp */
-diff --git a/lib/compress/zstd_cwksp.h b/lib/compress/zstd_cwksp.h
-index 97676693..9113cdbd 100644
---- a/lib/compress/zstd_cwksp.h
-+++ b/lib/compress/zstd_cwksp.h
-@@ -14,6 +14,7 @@
- /*-*************************************
- *  Dependencies
- ***************************************/
-+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customFree */
- #include "../common/zstd_internal.h"
- 
- #if defined (__cplusplus)
-diff --git a/lib/compress/zstdmt_compress.c b/lib/compress/zstdmt_compress.c
-index 7a2c7172..bf2de4a7 100644
---- a/lib/compress/zstdmt_compress.c
-+++ b/lib/compress/zstdmt_compress.c
-@@ -20,6 +20,7 @@
- 
- 
- /* ======   Dependencies   ====== */
-+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
- #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memset, INT_MAX, UINT_MAX */
- #include "../common/mem.h"         /* MEM_STATIC */
- #include "../common/pool.h"        /* threadpool */
-diff --git a/lib/decompress/zstd_ddict.c b/lib/decompress/zstd_ddict.c
-index ad5c34a7..309ec0d0 100644
---- a/lib/decompress/zstd_ddict.c
-+++ b/lib/decompress/zstd_ddict.c
-@@ -14,6 +14,7 @@
- /*-*******************************************************
- *  Dependencies
- *********************************************************/
-+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customFree */
- #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memmove, ZSTD_memset */
- #include "../common/cpu.h"         /* bmi2 */
- #include "../common/mem.h"         /* low level memory routines */
-diff --git a/lib/decompress/zstd_decompress.c b/lib/decompress/zstd_decompress.c
-index d487966c..3f3ca57c 100644
---- a/lib/decompress/zstd_decompress.c
-+++ b/lib/decompress/zstd_decompress.c
-@@ -55,6 +55,7 @@
- /*-*******************************************************
- *  Dependencies
- *********************************************************/
-+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
- #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memmove, ZSTD_memset */
- #include "../common/mem.h"         /* low level memory routines */
- #define FSE_STATIC_LINKING_ONLY
-diff --git a/programs/Makefile b/programs/Makefile
-index fcff41dc..8507abef 100644
---- a/programs/Makefile
-+++ b/programs/Makefile
-@@ -225,7 +225,7 @@ zstd-noxz : zstd
- .PHONY: zstd-dll
- zstd-dll : LDFLAGS+= -L$(LIBZSTD)
- zstd-dll : LDLIBS += -lzstd
--zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
-+zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c pool.c threading.c
- zstd-dll : zstd
- 
- 
-diff --git a/tests/Makefile b/tests/Makefile
-index 3eed19ea..778c7d67 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -95,7 +95,7 @@ allnothread: fullbench fuzzer paramgrill datagen decodecorpus
- dll: fuzzer-dll zstreamtest-dll
- 
- .PHONY: zstd zstd32 zstd-nolegacy  # only external makefile knows how to build or update them
--zstd zstd32 zstd-nolegacy:
-+zstd zstd32 zstd-nolegacy zstd-dll:
- 	$(MAKE) -C $(PRGDIR) $@ MOREFLAGS+="$(DEBUGFLAGS)"
- 
- .PHONY: libzstd
-@@ -328,13 +328,17 @@ test-all: test test32 test-decodecorpus-cli
- test-zstd: ZSTD = $(PRGDIR)/zstd
- test-zstd: zstd
- 
-+.PHONY: test-zstd-dll
-+test-zstd-dll: ZSTD = $(PRGDIR)/zstd
-+test-zstd-dll: zstd-dll
-+
- test-zstd32: ZSTD = $(PRGDIR)/zstd32
- test-zstd32: zstd32
- 
- test-zstd-nolegacy: ZSTD = $(PRGDIR)/zstd-nolegacy
- test-zstd-nolegacy: zstd-nolegacy
- 
--test-zstd test-zstd32 test-zstd-nolegacy: datagen
-+test-zstd test-zstd32 test-zstd-nolegacy test-zstd-dll: datagen
- 	file $(ZSTD)
- 	EXE_PREFIX="$(QEMU_SYS)" ZSTD_BIN="$(ZSTD)" DATAGEN_BIN=./datagen ./playTests.sh $(ZSTDRTTEST)
- 
--- 
-2.39.1
-
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index ca4e2fa0b9..abfb1d62e2 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.4/zstd-1.5.4.tar.gz.sha256
-sha256  0f470992aedad543126d06efab344dc5f3e171893810455787d38347343a4424  zstd-1.5.4.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz.sha256
+sha256  9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4  zstd-1.5.5.tar.gz
 
 # License files (locally computed)
 sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 45e8bf1bc2..e25202fd63 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.4
+ZSTD_VERSION = 1.5.5
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
