Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13774C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 15:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A7C605D5;
	Sun, 11 Dec 2022 15:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A7C605D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHSXLR2qCiJK; Sun, 11 Dec 2022 15:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D0460761;
	Sun, 11 Dec 2022 15:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D0460761
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44E3B1BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC9081386
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC9081386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDRguMvVAP6T for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 15:21:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC69E8137F
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC69E8137F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 15:21:56 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 4O9KpdwXfwtj04O9Kpr9vQ; Sun, 11 Dec 2022 16:21:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 16:21:53 +0100
Message-Id: <20221211152153.1833386-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO8ksOJ9y0rhoo8LEENOrIAilJ/hXPEccZ8F3OFefvaq7gnQRCjUunM/m8IBKbjDc9gKc1R6seEmx0+UcXptNMi71ys8ZJM17pAqOisEApJgD0XMDUFI
 ZI9Fk+rwCYD4lxQGXgN3M2D568ay6h7/qSiMnf99IEMPtf2usOPgq707OXpPTLEpwLONBQMTFWD3mQi89yjJ7w2wp+95UKSDTDq3+y+fDk56radsPlgFLcj3
 Hkmy54iKJATCxpWd4MHuE0eWwHFe0vJKA49fqFCGQuA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670772114; bh=Ih63tpKGUxadHLDrd5B13rSOOZ/gvz7h6FESzco6p0Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=A0+YqLZDQ4CsJdNElG+5x6CFFaGjokftFpbD98MPRUOZ7pKcfKJZDKuN5agn+QMgV
 p7p0how6ke9emVXdufcyDTKq78YQRqmEMIAeNgHEBPhg/vNf0ecuGmAuMAGz575nmB
 UCbENcy7dBv/rQSTlEhoPYKSwxmxZrc7eUR3s7GybIzrsRM1TB+CaZBv/Y7qBTcgvR
 vQayc4NC+gdl0IodIGQ9jM72IOIR5519DTX8rSv5Db1exbH5ivBn1I4NArwWwI0fMA
 ROdYIYzzvq9WkNvXIXGo2cBTC5w4XTYpxX+geXFMOYnHdNSrZZCuUCX2mX6PuO1Xt1
 kvYHoocvQNHKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=A0+YqLZD
Subject: [Buildroot] [PATCH] package/mali-driver: bump to latest version to
 build with Linux version up to 6.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add pending patches upstream[0] to fix build failure. Patches fix build
failure with Aarch64 and Linux 5.18/5.19/6.0

[0]: https://github.com/bootlin/mali-driver/pull/4

Fixes:
http://autobuild.buildroot.net/results/6f073fea149533a294dd838ce8373185236fe1d4/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ernel.h-fix-build-failure-on-aarch64.patch | 54 +++++++++++++++++++
 ...ence.c-fix-build-failure-on-dma_resv.patch | 53 ++++++++++++++++++
 ...ence.c-add-local-dma_resv_reserve_sh.patch | 38 +++++++++++++
 ...ence.c-add-local-dma_resv_add_shared.patch | 43 +++++++++++++++
 ...ild-failure-with-Linux-version-6.0.0.patch | 49 +++++++++++++++++
 5 files changed, 237 insertions(+)
 create mode 100644 package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch
 create mode 100644 package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch
 create mode 100644 package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch
 create mode 100644 package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch
 create mode 100644 package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch

diff --git a/package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch b/package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch
new file mode 100644
index 0000000000..e2b7c99272
--- /dev/null
+++ b/package/mali-driver/0001-mali_base_kernel.h-fix-build-failure-on-aarch64.patch
@@ -0,0 +1,54 @@
+From 255d18a2f1c0c7e55e5165602c83b0b9950de0a4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 22:48:21 +0100
+Subject: [PATCH] mali_base_kernel.h: fix build failure on aarch64
+
+Aarch64 PAGE_SHIFT is not 12 and this leads to build failure:
+```
+/home/giuliobenetti/br_reproduce/0e9207ab5806efc3885c27d1e98c7625574e57a3/output-1/build/mali-driver-3d697de9bce8bc68bf9408d5407873ce32d0f4fc/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c:2266:9: error: duplicate case value
+ 2266 |         case PFN_DOWN(BASEP_MEM_WRITE_ALLOC_PAGES_HANDLE):
+      |         ^~~~
+/home/giuliobenetti/br_reproduce/0e9207ab5806efc3885c27d1e98c7625574e57a3/output-1/build/mali-driver-3d697de9bce8bc68bf9408d5407873ce32d0f4fc/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c:2265:9: note: previously used here
+ 2265 |         case PFN_DOWN(BASEP_MEM_INVALID_HANDLE):
+      |         ^~~~
+```
+This because PFN_DOWN(x) expands to ((x) >> PAGE_SHIFT), PAGE_SHIFT is not
+always 12 and can be more like in Aarch64. This leads to override all
+switch case PFN_DOWN(0) with a 0 and so compiler complains for duplicate
+case values since all case values will be 0. Let's substitute magic number
+12 with Linux PAGE_SHIFT macro to fix this.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ r8p0/drivers/gpu/arm/midgard/mali_base_kernel.h | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_base_kernel.h b/r8p0/drivers/gpu/arm/midgard/mali_base_kernel.h
+index 6f5c68e..ded874d 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_base_kernel.h
++++ b/r8p0/drivers/gpu/arm/midgard/mali_base_kernel.h
+@@ -270,14 +270,14 @@ struct base_mem_import_user_buffer {
+  */
+ #define BASE_MEM_WRITE_ALLOC_PAGES_HANDLE ((base_mem_handle) { {BASEP_MEM_WRITE_ALLOC_PAGES_HANDLE} })
+ 
+-#define BASEP_MEM_INVALID_HANDLE               (0ull  << 12)
+-#define BASE_MEM_MMU_DUMP_HANDLE               (1ull  << 12)
+-#define BASE_MEM_TRACE_BUFFER_HANDLE           (2ull  << 12)
+-#define BASE_MEM_MAP_TRACKING_HANDLE           (3ull  << 12)
+-#define BASEP_MEM_WRITE_ALLOC_PAGES_HANDLE     (4ull  << 12)
++#define BASEP_MEM_INVALID_HANDLE               (0ull  << PAGE_SHIFT)
++#define BASE_MEM_MMU_DUMP_HANDLE               (1ull  << PAGE_SHIFT)
++#define BASE_MEM_TRACE_BUFFER_HANDLE           (2ull  << PAGE_SHIFT)
++#define BASE_MEM_MAP_TRACKING_HANDLE           (3ull  << PAGE_SHIFT)
++#define BASEP_MEM_WRITE_ALLOC_PAGES_HANDLE     (4ull  << PAGE_SHIFT)
+ /* reserved handles ..-64<<PAGE_SHIFT> for future special handles */
+-#define BASE_MEM_COOKIE_BASE                   (64ul  << 12)
+-#define BASE_MEM_FIRST_FREE_ADDRESS            ((BITS_PER_LONG << 12) + \
++#define BASE_MEM_COOKIE_BASE                   (64ul  << PAGE_SHIFT)
++#define BASE_MEM_FIRST_FREE_ADDRESS            ((BITS_PER_LONG << PAGE_SHIFT) + \
+ 						BASE_MEM_COOKIE_BASE)
+ 
+ /* Mask to detect 4GB boundary alignment */
+-- 
+2.34.1
+
diff --git a/package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch b/package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch
new file mode 100644
index 0000000000..1d73afc722
--- /dev/null
+++ b/package/mali-driver/0002-mali_kbase_dma_fence.c-fix-build-failure-on-dma_resv.patch
@@ -0,0 +1,53 @@
+From fc06033c81bec1a8dd78982d523150e8e1ccb2f0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 23:16:27 +0100
+Subject: [PATCH] mali_kbase_dma_fence.c: fix build failure on
+ dma_resv_get_fences() Linux 5.18 and 5.19
+
+dma_resv_get_fences() 2nd attribute pfence_excl is not required anymore
+starting from Linux 5.18[0] and it's been substituted with bool write that
+in our case we want set to true since previous dma_resv_get_fences() does
+write back all fences. Same goes for Linux 5.19[1] that introduces enum
+dma_resv_usage and for that we pass DMA_RESV_USAGE_WRITE.
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75ab2b3633ccddd8f7bdf6c76f9ab3f9b2fc5d9d
+[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7bc80a5462c37eab58a9ea386064307c0f447fd1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ .../gpu/arm/midgard/mali_kbase_dma_fence.c    | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+index 6b7e745..dadf5d3 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+@@ -218,7 +218,24 @@ kbase_dma_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+ 		kbase_dma_fence_queue_work(katom);
+ }
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 14, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 19, 0))
++static int dma_resv_get_fences_rcu(struct dma_resv *obj,
++		struct dma_fence **pfence_excl,
++		unsigned int *pshared_count,
++		struct dma_fence ***pshared)
++{
++	return dma_resv_get_fences(obj, DMA_RESV_USAGE_WRITE, pshared_count,
++				   pshared);
++}
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0))
++static int dma_resv_get_fences_rcu(struct dma_resv *obj,
++		struct dma_fence **pfence_excl,
++		unsigned int *pshared_count,
++		struct dma_fence ***pshared)
++{
++	return dma_resv_get_fences(obj, true, pshared_count, pshared);
++}
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 14, 0))
+ static int dma_resv_get_fences_rcu(struct dma_resv *obj,
+ 	        struct dma_fence **pfence_excl,
+ 	        unsigned int *pshared_count,
+-- 
+2.34.1
+
diff --git a/package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch b/package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch
new file mode 100644
index 0000000000..45ed969ab7
--- /dev/null
+++ b/package/mali-driver/0003-mali_kbase_dma_fence.c-add-local-dma_resv_reserve_sh.patch
@@ -0,0 +1,38 @@
+From 4b24cf96eaee891ac66ca46a166686461e8ccf2c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 23:38:57 +0100
+Subject: [PATCH] mali_kbase_dma_fence.c: add local dma_resv_reserve_shared()
+ for Linux 5.19
+
+Starting from Linux 5.19[0] dma_resv_reserve_shared() is renamed to
+dma_resv_reserve_fences() so let's implement locally
+dma_resv_reserve_shared() calling dma_resv_reserve_fences().
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8d4c18bfbc4ab467188dbe45cc8155759f49d9e
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+index dadf5d3..bb1565a 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+@@ -332,6 +332,13 @@ void kbase_dma_fence_add_reservation(struct dma_resv *resv,
+ 	(info->dma_fence_resv_count)++;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 19, 0))
++int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
++{
++	return dma_resv_reserve_fences(obj, num_fences);
++}
++#endif
++
+ int kbase_dma_fence_wait(struct kbase_jd_atom *katom,
+ 			 struct kbase_dma_fence_resv_info *info)
+ {
+-- 
+2.34.1
+
diff --git a/package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch b/package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch
new file mode 100644
index 0000000000..a1e6bcd7da
--- /dev/null
+++ b/package/mali-driver/0004-mali_kbase_dma_fence.c-add-local-dma_resv_add_shared.patch
@@ -0,0 +1,43 @@
+From 6aca0b5ae4b981bf836a6130bba8be53bb9a4e8f Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 23:49:48 +0100
+Subject: [PATCH] mali_kbase_dma_fence.c: add local
+ dma_resv_add_shared/excl_fence() for Linux 5.19
+
+Starting from Linux 5.19[0] dma_resv_add_shared/excl_fence() functions get
+hidden and unified with function dma_resv_add_fence() which third argument
+'enum dma_resv_usage usage' decides if create a shared(DMA_RESV_USAGE_READ)
+or exclusive(DMA_RESV_USAGE_WRITE) fence. So let's implement locally both
+functions calling dma_resv_add_fence() accordingly.
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73511edf8b196e6f1ccda0fdf294ff57aa2dc9db
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+index bb1565a..52194b2 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_dma_fence.c
+@@ -337,6 +337,16 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
+ {
+ 	return dma_resv_reserve_fences(obj, num_fences);
+ }
++
++void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
++{
++	dma_resv_add_fence(obj, fence, DMA_RESV_USAGE_READ);
++}
++
++void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
++{
++	dma_resv_add_fence(obj, fence, DMA_RESV_USAGE_WRITE);
++}
+ #endif
+ 
+ int kbase_dma_fence_wait(struct kbase_jd_atom *katom,
+-- 
+2.34.1
+
diff --git a/package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch b/package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch
new file mode 100644
index 0000000000..af5b15b302
--- /dev/null
+++ b/package/mali-driver/0005-Fix-build-failure-with-Linux-version-6.0.0.patch
@@ -0,0 +1,49 @@
+From bac84845f27b689fc614fb5b4a964e0177572905 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 10 Oct 2022 23:35:26 +0200
+Subject: [PATCH] Fix build failure with Linux version >= 6.0.0
+
+Function regsiter_shrinker() now needs a string as a second argument to
+log the caller, so let's pass "mali" string if Linux version >= 6.0.0
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c | 4 ++++
+ r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_pool.c  | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c
+index 20f86b9..710ebac 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_linux.c
+@@ -446,7 +446,11 @@ int kbase_mem_evictable_init(struct kbase_context *kctx)
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 1, 0)
+ 	kctx->reclaim.batch = 0;
+ #endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0)
++	register_shrinker(&kctx->reclaim, "mali");
++#else
+ 	register_shrinker(&kctx->reclaim);
++#endif
+ 	return 0;
+ }
+ 
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_pool.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_pool.c
+index 696730a..4d908ac 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_pool.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_mem_pool.c
+@@ -379,7 +379,11 @@ int kbase_mem_pool_init(struct kbase_mem_pool *pool,
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 1, 0)
+ 	pool->reclaim.batch = 0;
+ #endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0)
++	register_shrinker(&pool->reclaim, "mali");
++#else
+ 	register_shrinker(&pool->reclaim);
++#endif
+ 
+ 	pool_dbg(pool, "initialized\n");
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
