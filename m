Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67840CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B10A40182;
	Wed, 10 Apr 2024 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeO4IzksKsaJ; Wed, 10 Apr 2024 19:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DECA64036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DECA64036E;
	Wed, 10 Apr 2024 19:37:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA5DF1BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55DD820E9
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nci4OTeLvSsL for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01CEE820CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01CEE820CB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01CEE820CB
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:37:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 654F5B0037C;
 Wed, 10 Apr 2024 21:37:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 21:37:12 +0200
Message-ID: <20240410193712.31108-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712777842;
 bh=jEvzu4kMxGKdvkt0DaZsRUeEgo7lxo00dGi/Pd2JW1s=;
 h=From:To:Cc:Subject:Date:From;
 b=IP59nnQoSfKbdqcUCmDcq1kSd6IRTJO1jsEKWhlkdYmOAXL9VMhFZ0+d57SnZBHax
 K7gt1y/ihKZOgzXdGTTr1Ei/kI24uJc1V/Qr+ri6Wm5Ae+c13QKlZJn1Wkqlmd7NnP
 PDln0rY2f1NoH7AcNilG1YPN9/mlFDTBIl+oWy2cg3PozkrT7iKorIicBa9r6FgzA8
 xCxEcpubPVzdcGt3YJ2rrFnhnM2V21wuWyPIng1tsDNGFqwXiIiw9sw9grGnodBIST
 O0WHvSEhauRm9crYvznCy2fUjBSHNw66u1cZano0AOvHR+KYawgUCpwgovJtMbpRzm
 MG0oRB08QNgng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IP59nnQo
Subject: [Buildroot] [PATCH v3 1/1] package/rdma-core: bump to version v51.0
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

For change log since v49.0, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v50.0
https://github.com/linux-rdma/rdma-core/releases/tag/v51.0

This commit drops the package patch, which is included v50.0.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v2 -> v3:
- Squashed patches into a single one,
  reworded the commit log accordingly.
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
index fc1d319123d..f8b01e882dc 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ea2c2678d48be0b179871e9ae8c58ceab11a0c5b69315a332ff51dd607180b7  rdma-core-49.0.tar.gz
+sha256  a4065b0454249839dc75b61c6ee428e917d9cddf964ff7a33d479f00d1264ba0  rdma-core-51.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 5f8989b3bd4..834d9ea3efe 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 49.0
+RDMA_CORE_VERSION = 51.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
