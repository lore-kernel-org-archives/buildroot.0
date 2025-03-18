Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C8BC28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 11:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F1A41203;
	Tue, 18 Mar 2025 11:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chq__Px_Kr6F; Tue, 18 Mar 2025 11:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2513841204
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2513841204;
	Tue, 18 Mar 2025 11:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 204E5D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00E4960B68
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgnTjLwnZCnu for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 11:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FD3260590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD3260590
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FD3260590
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 11:36:53 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 638582C83008
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 12:36:51 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 12:36:45 +0100
Message-ID: <20250318113646.2509050-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1742297811; bh=Qx8YphYDOGt70rfQj/wU8kIc8xKubJaQzwgD0+WXafY=;
 h=From:To:Subject:Date;
 b=CW9C5qo8jIg+vVNZ9Gsf2FYJw3Ax1J5QDstGEnKPODOp9P4Wf2yt4fXFfn4HdQAWN
 IhdGd+l4+eOu8kRpA0A6+HX7FaDBiOFEjzrB4Rq7zxlAwArBni0B0R0nEi+8h5ddqs
 rJsDTOFCPtDkkkcQ9YMjjl6G7POFbHT4NMLLcrKCgZ6vNYjRYDYnPrddye3SpZiQfR
 bKxLnNbIff8Oz3W/beaBD42VpLwLG0WHox2xo1kgp1Tvj5WEMKqka9z/w4omzhzbFc
 +PIH0HFREXcXDd0xiLU36dhPlistWmINOr7gwgWRwaSPjZAvXK/pkpqzp0YXVtD3ae
 IKvFKr11U+LHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=CW9C5qo8
Subject: [Buildroot] [PATCH] package/zlib-ng: bump to 2.2.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove patch that is included upstream now.
License hash changed due to copyright year update [1].

Release Notes: https://github.com/zlib-ng/zlib-ng/releases

[1] https://github.com/zlib-ng/zlib-ng/commit/fc634263722f39bfcf52437b783db32ff53f2b36

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...cv-riscv-features-c-fix-uclibc-build.patch | 51 -------------------
 package/zlib-ng/zlib-ng.hash                  |  4 +-
 package/zlib-ng/zlib-ng.mk                    |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch

diff --git a/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch b/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
deleted file mode 100644
index 39cc93f929..0000000000
--- a/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3f35bfccff2d1dacdfe9844712be1e042d028700 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Mar 2024 21:56:53 +0100
-Subject: [PATCH] arch/riscv/riscv_features.c: fix uclibc build
-
-Fix the following uclibc build failure raised since version 2.1.4 and
-https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:
-
-/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
-    4 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/zlib-ng/zlib-ng/commit/3f35bfccff2d1dacdfe9844712be1e042d028700
----
- arch/riscv/riscv_features.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/arch/riscv/riscv_features.c b/arch/riscv/riscv_features.c
-index 506b480c11..1e3f45e0a7 100644
---- a/arch/riscv/riscv_features.c
-+++ b/arch/riscv/riscv_features.c
-@@ -1,9 +1,12 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/auxv.h>
- #include <sys/utsname.h>
- 
-+#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
-+#  include <sys/auxv.h>
-+#endif
-+
- #include "../../zbuild.h"
- #include "riscv_features.h"
- 
-@@ -33,7 +36,11 @@ void Z_INTERNAL riscv_check_features_compile_time(struct riscv_cpu_features *fea
- }
- 
- void Z_INTERNAL riscv_check_features_runtime(struct riscv_cpu_features *features) {
-+#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
-     unsigned long hw_cap = getauxval(AT_HWCAP);
-+#else
-+    unsigned long hw_cap = 0;
-+#endif
-     features->has_rvv = hw_cap & ISA_V_HWCAP;
- }
- 
diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index 908164aa60..d128565469 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2  zlib-ng-2.1.6.tar.gz
-sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
+sha256  a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3  zlib-ng-2.2.4.tar.gz
+sha256  6c9f0d975b41afaa34d22f55bb8986ce69e5cb7ad327cb2b28820cd425edf5ee  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index c9d022da3e..68a3b2d6f3 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.1.6
+ZLIB_NG_VERSION = 2.2.4
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
