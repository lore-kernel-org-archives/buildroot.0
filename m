Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F0C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AE884100;
	Sat, 10 Aug 2024 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ty-T7SFqxNh1; Sat, 10 Aug 2024 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F3084106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F3084106;
	Sat, 10 Aug 2024 11:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51CF81BF834
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 11:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4011E606B1
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbXEkIIls8iJ for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 11:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFFE9606AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFE9606AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFFE9606AF
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 11:11:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 99CE3B0054E;
 Sat, 10 Aug 2024 13:11:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 13:11:24 +0200
Message-ID: <20240810111124.421286-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723288292;
 bh=4XJOS3J9MW+SCnNA4ixcoPsbqoPpjwMup82+Z0bmfjo=;
 h=From:To:Cc:Subject:Date:From;
 b=UdWf4NCk1sk+7g57c27aDbbbYpcQvQGrpQqP84ULrVNkKlzm6NpUgqcgxhehug436
 xHzHUlq+C4bVWInr6TH98V3o1IJxU3R7e/Ac03T5tml6XaSvJi4aZ2azuFUcbaFxUl
 CFUoMSgH/VsFnVte6vD6ThTelnubgPImIXFClRGp5b/qOH+vPLa7Ze2Rm7wJpdbAL9
 2SRlW81FJcgyOUvS5kkRn24zbuyJ+jNeklOCN4H3qrrGDNn/C32nDBczzCBMogtF2n
 RgArsOTn9OzqZNZXl2iZHG/x17yzTllWQ2ysMNHf6Sc+27nui/cFkIPjGU4sPrGsFk
 5T7knhaI7HNow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UdWf4NCk
Subject: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.28
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

For change log since v0.3.27, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.28

This commit also removes the package patch 0002 since it is now included
in this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7550620374
---
 ...-should-not-be-run-in-cross-compiles.patch | 33 -------------------
 package/openblas/openblas.hash                |  6 ++--
 package/openblas/openblas.mk                  |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch

diff --git a/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
deleted file mode 100644
index 44883b2c26..0000000000
--- a/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 48e017de095018c60d83355804a3075658b4970c Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Fri, 5 Apr 2024 22:54:34 +0200
-Subject: [PATCH] fix position of endif - gemm3m tests should not be run in
- cross-compiles
-
-Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/48e017de095018c60d83355804a3075658b4970c
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ctest/Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/ctest/Makefile b/ctest/Makefile
-index bbaf96f8ed..6c7cc1ed56 100644
---- a/ctest/Makefile
-+++ b/ctest/Makefile
-@@ -203,7 +203,6 @@ ifeq ($(BUILD_COMPLEX16),1)
- 	OPENBLAS_NUM_THREADS=2 ./xzcblat3 < zin3
- endif
- endif
--endif
- 
- ifeq ($(SUPPORT_GEMM3M),1)
- ifeq ($(USE_OPENMP), 1)
-@@ -222,7 +221,7 @@ ifeq ($(BUILD_COMPLEX16),1)
- endif
- endif
- endif
--
-+endif
- 
- 
- 
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index cd59496908..4439896b14 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27
-md5  ef71c66ffeb1ab0f306a37de07d2667f  openblas-0.3.27.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.28
+md5  0f54185b6ef804173c01b9a40520a0e8  openblas-0.3.28.tar.gz
 # Locally calculated
-sha256  aa2d68b1564fe2b13bc292672608e9cdeeeb6dc34995512e65c3b10f4599e897  openblas-0.3.27.tar.gz
+sha256  f1003466ad074e9b0c8d421a204121100b0751c96fc6fcf3d1456bd12f8a00a1  openblas-0.3.28.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index a3c7a194cf..a1f631e6b3 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.27
+OPENBLAS_VERSION = 0.3.28
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
