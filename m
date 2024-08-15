Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE9CE6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8092684510;
	Fri,  6 Sep 2024 20:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujlzXc88kQwv; Fri,  6 Sep 2024 20:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691E08444A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691E08444A;
	Fri,  6 Sep 2024 20:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100E21BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C80C610FE
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-iKECD17tGK for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB1F60779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB1F60779
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08B5F86EE3; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:47:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e09154dc70ba7973d9acb247cd6a37651f315213
X-Git-Newrev: fcfdfb276d1711577e8aca61a3f80d7439e2ae86
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.08B5F86EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.28
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcfdfb276d1711577e8aca61a3f80d7439e2ae86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.27, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.28

This commit also removes the package patch 0002 since it is now included
in this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tests-should-not-be-run-in-cross-compiles.patch | 33 ----------------------
 package/openblas/openblas.hash                     |  6 ++--
 package/openblas/openblas.mk                       |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
