Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A6DC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6710E81CD0;
	Tue,  9 Apr 2024 21:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlUnJ69p82ux; Tue,  9 Apr 2024 21:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F2C881D16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2C881D16;
	Tue,  9 Apr 2024 21:28:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B83E21BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2079606B0
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ3YiZoUphth for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E74F6063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E74F6063C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E74F6063C
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:28:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CA66CB00535;
 Tue,  9 Apr 2024 23:28:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Apr 2024 23:27:57 +0200
Message-ID: <20240409212758.380547-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712698092;
 bh=Q2qTb6HszNY/rrjD5JwEPseXlgMNqR/yFXQfEmZvDGM=;
 h=From:To:Cc:Subject:Date:From;
 b=OU2E8GWx/MOXzfHeRgSJYcG0rAEfPmvm0BZ7pTEuCNwEmzLeN003kjoY7WaXuZ0e0
 G0ZPPe/hYLZ3gpM/8tn+NGF/BnDUnA1RAe1Nc1Pb+Rk5+ggJGrn9GTq16g/ZCfge8a
 6kAqyr4LkR+pRjWNSMVDd63Q0ioUyGOtd4nwjkc3qrinNvuB5OC8CNLvBVlg85x5Ke
 I8pOILJv6Z3So1jxltj6ljMp97pvcqvS7GW70gbuwqosTzz2hhCZVnLAbCXKF5JhWy
 wyI8H5ZHKPyRz/pcO5idz/Za4TYp1BFEH88sET280QIOYw0B7KG52ncc7UmT1eGHuc
 A/zLB/s6gcaoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OU2E8GWx
Subject: [Buildroot] [PATCH v2 1/2] package/rdma-core: bump to version v50.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v50.0

This commit drops the package patch, which is now included in the
release.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
No change between v1 and v2.
---
 ...-util-udma_barrier.h-fix-mips4-build.patch | 56 -------------------
 package/rdma-core/rdma-core.hash              |  2 +-
 package/rdma-core/rdma-core.mk                |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch

diff --git a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
deleted file mode 100644
index 6dfb476faaa..00000000000
--- a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1b1ca539f6e1f0b774e989f1022477686e4fc77f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Jan 2024 18:55:34 +0100
-Subject: [PATCH] util/udma_barrier.h: fix mips4 build
-
-The 'sync' instruction for MIPS was defined in MIPS-II as taking no
-operands. MIPS32 extended the define of 'sync' as taking an optional
-unsigned 5 bit immediate.
-
-As a result, replace "sync 0" by "sync" to fix the following build
-failure on mips4 raised since version 43.0 and
-https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:
-
-/tmp/ccrBy9fV.s: Assembler messages:
-/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'
-
-Fixes:
- - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/linux-rdma/rdma-core/commit/f3f0c06014c6de845032e6fe9f152674919b3ec6
----
- util/udma_barrier.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/util/udma_barrier.h b/util/udma_barrier.h
-index 0a1f8a45b..3793d2f18 100644
---- a/util/udma_barrier.h
-+++ b/util/udma_barrier.h
-@@ -101,7 +101,7 @@
- #elif defined(__riscv)
- #define udma_to_device_barrier() asm volatile("fence ow,ow" ::: "memory")
- #elif defined(__mips__)
--#define udma_to_device_barrier() asm volatile("sync 0" ::: "memory")
-+#define udma_to_device_barrier() asm volatile("sync" ::: "memory")
- #else
- #error No architecture specific memory barrier defines found!
- #endif
-@@ -139,7 +139,7 @@
- #elif defined(__riscv)
- #define udma_from_device_barrier() asm volatile("fence ir,ir" ::: "memory")
- #elif defined(__mips__)
--#define udma_from_device_barrier() asm volatile("sync 0" ::: "memory")
-+#define udma_from_device_barrier() asm volatile("sync" ::: "memory")
- #else
- #error No architecture specific memory barrier defines found!
- #endif
-@@ -212,7 +212,7 @@
- #include "s390_mmio_insn.h"
- #define mmio_flush_writes() s390_pciwb()
- #elif defined(__mips__)
--#define mmio_flush_writes() asm volatile("sync 0" ::: "memory")
-+#define mmio_flush_writes() asm volatile("sync" ::: "memory")
- #else
- #error No architecture specific memory barrier defines found!
- #endif
diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index fc1d319123d..27fe7e208d8 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ea2c2678d48be0b179871e9ae8c58ceab11a0c5b69315a332ff51dd607180b7  rdma-core-49.0.tar.gz
+sha256  ecb866caaec7ce13f40074c769860f9c36c3a37a70913c5218217e3293d7cb11  rdma-core-50.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 5f8989b3bd4..7818b396a46 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 49.0
+RDMA_CORE_VERSION = 50.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
