Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B88C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0D7402CC;
	Tue, 18 Mar 2025 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmGVfzCQiwFa; Tue, 18 Mar 2025 20:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FFA402F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FFA402F3;
	Tue, 18 Mar 2025 20:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA01950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46F1340649
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iHv9es7Bq4f for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A4E4029F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A4E4029F
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:56:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F19D188129; Tue, 18 Mar 2025 20:56:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 21:55:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2248c732c621730ff6cf26b2bb06034a7e583f22
X-Git-Newrev: ba8bce8a11063b645a28dacc1fbe26d289bbf51f
X-Patchwork-Hint: ignore
Message-Id: <20250318205648.F19D188129@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: bump to 2.2.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba8bce8a11063b645a28dacc1fbe26d289bbf51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch that is included upstream now.
License hash changed due to copyright year update [1].

Release Notes: https://github.com/zlib-ng/zlib-ng/releases

[1] https://github.com/zlib-ng/zlib-ng/commit/fc634263722f39bfcf52437b783db32ff53f2b36

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h-riscv-riscv-features-c-fix-uclibc-build.patch | 51 ----------------------
 package/zlib-ng/zlib-ng.hash                       |  4 +-
 package/zlib-ng/zlib-ng.mk                         |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
