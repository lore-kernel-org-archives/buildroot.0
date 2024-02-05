Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687E9C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9198404AF;
	Mon,  5 Feb 2024 18:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9198404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlw9lSz8CVdi; Mon,  5 Feb 2024 18:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA87D40556;
	Mon,  5 Feb 2024 18:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA87D40556
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9C51BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B291340556
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B291340556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0Uoht9inV2t for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:48:16 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 403D4404AF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403D4404AF
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D59813F8AD;
 Mon,  5 Feb 2024 19:48:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 19:47:57 +0100
Message-ID: <20240205184757.3404601-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707158893;
 bh=TQK7fOWmAjzz/7rcO7K1f6FZsP+iRIbzsyePS7Y5gUk=;
 h=From:To:Cc:Subject:Date:From;
 b=ZrxV504waRv4P+f6XzWDYdTddIC1iyj1wcA7hG032aY+LT7uefwIoVaxPO5W6IaCv
 LymDnM5vmCw/Lod7D/su3j61viesuf2cbUmq9A9o6eh2FDDH6V5NTJm1A3rzSmv21E
 EWzR2vDK2PYwDpqv9bICEsfMUUuNst2K/YKqGq1nE5N/jETo8u/3xwJblbE+mxxJ2d
 pkg5Dp1QDYaZmQSqn+RI9vstkpLJKZreR6XuJLiTLOkCW0Gr6So6n4tESaVFkM/G2B
 CcKi+HAAiL/8960qIS6dhNHTVMSsJW3yDeOKojCPvJYpQ6FhygUG+PUD2g6WuhWdwI
 7jdl2PWYFpFjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZrxV504w
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v50.0
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
 ...-util-udma_barrier.h-fix-mips4-build.patch | 56 -------------------
 package/rdma-core/rdma-core.hash              |  2 +-
 package/rdma-core/rdma-core.mk                |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch

diff --git a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
deleted file mode 100644
index 6dfb476faa..0000000000
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
index fc1d319123..27fe7e208d 100644
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
index 5f8989b3bd..7818b396a4 100644
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
