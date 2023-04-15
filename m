Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3B0C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 12:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E58540C15;
	Sat, 15 Apr 2023 12:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E58540C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxkNI0sgpQ63; Sat, 15 Apr 2023 12:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03E5741CBD;
	Sat, 15 Apr 2023 12:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03E5741CBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C07E1C4008
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 256A5845A0
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256A5845A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8SgdhVGKRHl for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 12:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C22884596
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C22884596
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 12:12:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3826D5FFA8;
 Sat, 15 Apr 2023 14:12:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 14:12:12 +0200
Date: Sat, 15 Apr 2023 14:12:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230415121212.GH2819@scaer>
References: <20230415081412.8053-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415081412.8053-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681560736;
 bh=Qp62rkAWjJmZsXbHcFJN3cruY0BCBAHmzInRLBoL8Bs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JDp3SdDkfEqL9JcRpxIw81oZof1Z1QdrZ+vEzLYuKJUBDfztxgvptPcbgAnwqBh74
 +omRAf5ton/2fr+41TWEUyd8hTsTV4SeWwSuzRmnCtVnfRHPujLGM9H3LVKG5xKdWk
 l45Q5/5UeAg9G6jc5XPsi7KAfmmuZVjsb9nqRlXTvmm1sqDQjXxRFmHKDBaOpT2f9o
 r5fCyKRzAok+6Pe+oRnz7klV9Pg7bgPmrZMrvbPNeaoBrHnB4EJMF5a2IFgYuw/vdw
 gaimDKLeSjqqbnjpfcp5b3G21uRJfC5R7kuzMKYA308DKYej6iZpLipcqvIe7Zs1Qp
 yR5FmYDnPRoBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JDp3SdDk
Subject: Re: [Buildroot] [PATCH v1] package/zstd: bump version to 1.5.5
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-04-15 10:14 +0200, Peter Seiderer spake thusly:
> - remove 0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
>   (from upstream, see [1])
> 
> For details see [2].
> 
> [1] https://github.com/facebook/zstd/commit/c78f434aa4f5f1097c8edb975f4c1635817a5a71
> [2] https://github.com/facebook/zstd/releases/tag/v1.5.5
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-dll-build-missing-dependencies-3496.patch | 321 ------------------
>  package/zstd/zstd.hash                        |   4 +-
>  package/zstd/zstd.mk                          |   2 +-
>  3 files changed, 3 insertions(+), 324 deletions(-)
>  delete mode 100644 package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
> 
> diff --git a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
> deleted file mode 100644
> index 60737159c6..0000000000
> --- a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch
> +++ /dev/null
> @@ -1,321 +0,0 @@
> -From e47c7c0d5a923dcdc3b302f9944eb4a70b7ee0be Mon Sep 17 00:00:00 2001
> -From: Yonatan Komornik <11005061+yoniko@users.noreply.github.com>
> -Date: Sun, 12 Feb 2023 12:32:31 -0800
> -Subject: [PATCH] Fix zstd-dll build missing dependencies (#3496)
> -
> -* Fixes zstd-dll build (https://github.com/facebook/zstd/issues/3492):
> -- Adds pool.o and threading.o dependency to the zstd-dll target
> -- Moves custom allocation functions into header to avoid needing to add dependency on common.o
> -- Adds test target for zstd-dll
> -- Adds github workflow that buildis zstd-dll
> -
> -[nolange79: backport from upstream c78f434aa4f5f1097c8edb975f4c1635817a5a71]
> -Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ----
> - .github/workflows/dev-short-tests.yml     |  9 +++-
> - contrib/linux-kernel/zstd_common_module.c |  3 --
> - lib/common/allocations.h                  | 55 +++++++++++++++++++++++
> - lib/common/pool.c                         |  2 +-
> - lib/common/zstd_common.c                  | 35 ---------------
> - lib/common/zstd_internal.h                |  5 ---
> - lib/compress/zstd_compress.c              |  1 +
> - lib/compress/zstd_cwksp.h                 |  1 +
> - lib/compress/zstdmt_compress.c            |  1 +
> - lib/decompress/zstd_ddict.c               |  1 +
> - lib/decompress/zstd_decompress.c          |  1 +
> - programs/Makefile                         |  2 +-
> - tests/Makefile                            |  8 +++-
> - 13 files changed, 76 insertions(+), 48 deletions(-)
> - create mode 100644 lib/common/allocations.h
> -
> -diff --git a/.github/workflows/dev-short-tests.yml b/.github/workflows/dev-short-tests.yml
> -index 132dbb99..3ae2e9da 100644
> ---- a/.github/workflows/dev-short-tests.yml
> -+++ b/.github/workflows/dev-short-tests.yml
> -@@ -55,6 +55,14 @@ jobs:
> -       run: |
> -         make c89build V=1
> - 
> -+  build-zstd-dll:
> -+    runs-on: ubuntu-latest
> -+    steps:
> -+    - uses: actions/checkout@ac593985615ec2ede58e132d2e21d2b1cbd6127c # tag=v3
> -+    - name: build zstd bin against a dynamic lib (debuglevel for more dependencies)
> -+      run: |
> -+        make -C lib lib-mt-release 
> -+        DEBUGLEVEL=2 make -C programs zstd-dll
> - 
> -   gcc-7-libzstd:
> -     runs-on: ubuntu-latest
> -@@ -328,7 +336,6 @@ jobs:
> -         make -j -C programs allVariants MOREFLAGS=-O0
> -         ./tests/test-variants.sh
> - 
> --
> -   qemu-consistency:
> -     name: QEMU ${{ matrix.name }}
> -     runs-on: ubuntu-20.04
> -diff --git a/contrib/linux-kernel/zstd_common_module.c b/contrib/linux-kernel/zstd_common_module.c
> -index 2fead39e..466828e3 100644
> ---- a/contrib/linux-kernel/zstd_common_module.c
> -+++ b/contrib/linux-kernel/zstd_common_module.c
> -@@ -24,9 +24,6 @@ EXPORT_SYMBOL_GPL(HUF_readStats_wksp);
> - EXPORT_SYMBOL_GPL(ZSTD_isError);
> - EXPORT_SYMBOL_GPL(ZSTD_getErrorName);
> - EXPORT_SYMBOL_GPL(ZSTD_getErrorCode);
> --EXPORT_SYMBOL_GPL(ZSTD_customMalloc);
> --EXPORT_SYMBOL_GPL(ZSTD_customCalloc);
> --EXPORT_SYMBOL_GPL(ZSTD_customFree);
> - 
> - MODULE_LICENSE("Dual BSD/GPL");
> - MODULE_DESCRIPTION("Zstd Common");
> -diff --git a/lib/common/allocations.h b/lib/common/allocations.h
> -new file mode 100644
> -index 00000000..a3153c4b
> ---- /dev/null
> -+++ b/lib/common/allocations.h
> -@@ -0,0 +1,55 @@
> -+/*
> -+ * Copyright (c) Meta Platforms, Inc. and affiliates.
> -+ * All rights reserved.
> -+ *
> -+ * This source code is licensed under both the BSD-style license (found in the
> -+ * LICENSE file in the root directory of this source tree) and the GPLv2 (found
> -+ * in the COPYING file in the root directory of this source tree).
> -+ * You may select, at your option, one of the above-listed licenses.
> -+ */
> -+
> -+/* This file provides custom allocation primitives
> -+ */
> -+
> -+#define ZSTD_DEPS_NEED_MALLOC
> -+#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
> -+
> -+#include "mem.h" /* MEM_STATIC */
> -+#define ZSTD_STATIC_LINKING_ONLY
> -+#include "../zstd.h" /* ZSTD_customMem */
> -+
> -+#ifndef ZSTD_ALLOCATIONS_H
> -+#define ZSTD_ALLOCATIONS_H
> -+
> -+/* custom memory allocation functions */
> -+
> -+MEM_STATIC void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
> -+{
> -+    if (customMem.customAlloc)
> -+        return customMem.customAlloc(customMem.opaque, size);
> -+    return ZSTD_malloc(size);
> -+}
> -+
> -+MEM_STATIC void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
> -+{
> -+    if (customMem.customAlloc) {
> -+        /* calloc implemented as malloc+memset;
> -+         * not as efficient as calloc, but next best guess for custom malloc */
> -+        void* const ptr = customMem.customAlloc(customMem.opaque, size);
> -+        ZSTD_memset(ptr, 0, size);
> -+        return ptr;
> -+    }
> -+    return ZSTD_calloc(1, size);
> -+}
> -+
> -+MEM_STATIC void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
> -+{
> -+    if (ptr!=NULL) {
> -+        if (customMem.customFree)
> -+            customMem.customFree(customMem.opaque, ptr);
> -+        else
> -+            ZSTD_free(ptr);
> -+    }
> -+}
> -+
> -+#endif /* ZSTD_ALLOCATIONS_H */
> -diff --git a/lib/common/pool.c b/lib/common/pool.c
> -index f3d9d085..d5ca5a78 100644
> ---- a/lib/common/pool.c
> -+++ b/lib/common/pool.c
> -@@ -10,9 +10,9 @@
> - 
> - 
> - /* ======   Dependencies   ======= */
> -+#include "../common/allocations.h"  /* ZSTD_customCalloc, ZSTD_customFree */
> - #include "zstd_deps.h" /* size_t */
> - #include "debug.h"     /* assert */
> --#include "zstd_internal.h"  /* ZSTD_customCalloc, ZSTD_customFree */
> - #include "pool.h"
> - 
> - /* ======   Compiler specifics   ====== */
> -diff --git a/lib/common/zstd_common.c b/lib/common/zstd_common.c
> -index 32085524..3f04c22a 100644
> ---- a/lib/common/zstd_common.c
> -+++ b/lib/common/zstd_common.c
> -@@ -14,7 +14,6 @@
> - *  Dependencies
> - ***************************************/
> - #define ZSTD_DEPS_NEED_MALLOC
> --#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
> - #include "error_private.h"
> - #include "zstd_internal.h"
> - 
> -@@ -47,37 +46,3 @@ ZSTD_ErrorCode ZSTD_getErrorCode(size_t code) { return ERR_getErrorCode(code); }
> - /*! ZSTD_getErrorString() :
> -  *  provides error code string from enum */
> - const char* ZSTD_getErrorString(ZSTD_ErrorCode code) { return ERR_getErrorString(code); }
> --
> --
> --
> --/*=**************************************************************
> --*  Custom allocator
> --****************************************************************/
> --void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
> --{
> --    if (customMem.customAlloc)
> --        return customMem.customAlloc(customMem.opaque, size);
> --    return ZSTD_malloc(size);
> --}
> --
> --void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
> --{
> --    if (customMem.customAlloc) {
> --        /* calloc implemented as malloc+memset;
> --         * not as efficient as calloc, but next best guess for custom malloc */
> --        void* const ptr = customMem.customAlloc(customMem.opaque, size);
> --        ZSTD_memset(ptr, 0, size);
> --        return ptr;
> --    }
> --    return ZSTD_calloc(1, size);
> --}
> --
> --void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
> --{
> --    if (ptr!=NULL) {
> --        if (customMem.customFree)
> --            customMem.customFree(customMem.opaque, ptr);
> --        else
> --            ZSTD_free(ptr);
> --    }
> --}
> -diff --git a/lib/common/zstd_internal.h b/lib/common/zstd_internal.h
> -index 37836dc7..1f942f27 100644
> ---- a/lib/common/zstd_internal.h
> -+++ b/lib/common/zstd_internal.h
> -@@ -350,11 +350,6 @@ typedef struct {
> - const seqStore_t* ZSTD_getSeqStore(const ZSTD_CCtx* ctx);   /* compress & dictBuilder */
> - int ZSTD_seqToCodes(const seqStore_t* seqStorePtr);   /* compress, dictBuilder, decodeCorpus (shouldn't get its definition from here) */
> - 
> --/* custom memory allocation functions */
> --void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem);
> --void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem);
> --void ZSTD_customFree(void* ptr, ZSTD_customMem customMem);
> --
> - 
> - /* ZSTD_invalidateRepCodes() :
> -  * ensures next compression will not use repcodes from previous block.
> -diff --git a/lib/compress/zstd_compress.c b/lib/compress/zstd_compress.c
> -index b55f684c..173ce242 100644
> ---- a/lib/compress/zstd_compress.c
> -+++ b/lib/compress/zstd_compress.c
> -@@ -11,6 +11,7 @@
> - /*-*************************************
> - *  Dependencies
> - ***************************************/
> -+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
> - #include "../common/zstd_deps.h"  /* INT_MAX, ZSTD_memset, ZSTD_memcpy */
> - #include "../common/mem.h"
> - #include "hist.h"           /* HIST_countFast_wksp */
> -diff --git a/lib/compress/zstd_cwksp.h b/lib/compress/zstd_cwksp.h
> -index 97676693..9113cdbd 100644
> ---- a/lib/compress/zstd_cwksp.h
> -+++ b/lib/compress/zstd_cwksp.h
> -@@ -14,6 +14,7 @@
> - /*-*************************************
> - *  Dependencies
> - ***************************************/
> -+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customFree */
> - #include "../common/zstd_internal.h"
> - 
> - #if defined (__cplusplus)
> -diff --git a/lib/compress/zstdmt_compress.c b/lib/compress/zstdmt_compress.c
> -index 7a2c7172..bf2de4a7 100644
> ---- a/lib/compress/zstdmt_compress.c
> -+++ b/lib/compress/zstdmt_compress.c
> -@@ -20,6 +20,7 @@
> - 
> - 
> - /* ======   Dependencies   ====== */
> -+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
> - #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memset, INT_MAX, UINT_MAX */
> - #include "../common/mem.h"         /* MEM_STATIC */
> - #include "../common/pool.h"        /* threadpool */
> -diff --git a/lib/decompress/zstd_ddict.c b/lib/decompress/zstd_ddict.c
> -index ad5c34a7..309ec0d0 100644
> ---- a/lib/decompress/zstd_ddict.c
> -+++ b/lib/decompress/zstd_ddict.c
> -@@ -14,6 +14,7 @@
> - /*-*******************************************************
> - *  Dependencies
> - *********************************************************/
> -+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customFree */
> - #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memmove, ZSTD_memset */
> - #include "../common/cpu.h"         /* bmi2 */
> - #include "../common/mem.h"         /* low level memory routines */
> -diff --git a/lib/decompress/zstd_decompress.c b/lib/decompress/zstd_decompress.c
> -index d487966c..3f3ca57c 100644
> ---- a/lib/decompress/zstd_decompress.c
> -+++ b/lib/decompress/zstd_decompress.c
> -@@ -55,6 +55,7 @@
> - /*-*******************************************************
> - *  Dependencies
> - *********************************************************/
> -+#include "../common/allocations.h"  /* ZSTD_customMalloc, ZSTD_customCalloc, ZSTD_customFree */
> - #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memmove, ZSTD_memset */
> - #include "../common/mem.h"         /* low level memory routines */
> - #define FSE_STATIC_LINKING_ONLY
> -diff --git a/programs/Makefile b/programs/Makefile
> -index fcff41dc..8507abef 100644
> ---- a/programs/Makefile
> -+++ b/programs/Makefile
> -@@ -225,7 +225,7 @@ zstd-noxz : zstd
> - .PHONY: zstd-dll
> - zstd-dll : LDFLAGS+= -L$(LIBZSTD)
> - zstd-dll : LDLIBS += -lzstd
> --zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
> -+zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c pool.c threading.c
> - zstd-dll : zstd
> - 
> - 
> -diff --git a/tests/Makefile b/tests/Makefile
> -index 3eed19ea..778c7d67 100644
> ---- a/tests/Makefile
> -+++ b/tests/Makefile
> -@@ -95,7 +95,7 @@ allnothread: fullbench fuzzer paramgrill datagen decodecorpus
> - dll: fuzzer-dll zstreamtest-dll
> - 
> - .PHONY: zstd zstd32 zstd-nolegacy  # only external makefile knows how to build or update them
> --zstd zstd32 zstd-nolegacy:
> -+zstd zstd32 zstd-nolegacy zstd-dll:
> - 	$(MAKE) -C $(PRGDIR) $@ MOREFLAGS+="$(DEBUGFLAGS)"
> - 
> - .PHONY: libzstd
> -@@ -328,13 +328,17 @@ test-all: test test32 test-decodecorpus-cli
> - test-zstd: ZSTD = $(PRGDIR)/zstd
> - test-zstd: zstd
> - 
> -+.PHONY: test-zstd-dll
> -+test-zstd-dll: ZSTD = $(PRGDIR)/zstd
> -+test-zstd-dll: zstd-dll
> -+
> - test-zstd32: ZSTD = $(PRGDIR)/zstd32
> - test-zstd32: zstd32
> - 
> - test-zstd-nolegacy: ZSTD = $(PRGDIR)/zstd-nolegacy
> - test-zstd-nolegacy: zstd-nolegacy
> - 
> --test-zstd test-zstd32 test-zstd-nolegacy: datagen
> -+test-zstd test-zstd32 test-zstd-nolegacy test-zstd-dll: datagen
> - 	file $(ZSTD)
> - 	EXE_PREFIX="$(QEMU_SYS)" ZSTD_BIN="$(ZSTD)" DATAGEN_BIN=./datagen ./playTests.sh $(ZSTDRTTEST)
> - 
> --- 
> -2.39.1
> -
> diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
> index ca4e2fa0b9..abfb1d62e2 100644
> --- a/package/zstd/zstd.hash
> +++ b/package/zstd/zstd.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/facebook/zstd/releases/download/v1.5.4/zstd-1.5.4.tar.gz.sha256
> -sha256  0f470992aedad543126d06efab344dc5f3e171893810455787d38347343a4424  zstd-1.5.4.tar.gz
> +# From https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz.sha256
> +sha256  9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4  zstd-1.5.5.tar.gz
>  
>  # License files (locally computed)
>  sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 45e8bf1bc2..e25202fd63 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZSTD_VERSION = 1.5.4
> +ZSTD_VERSION = 1.5.5
>  ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
>  ZSTD_INSTALL_STAGING = YES
>  ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
