Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE80F46C4E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8CC40829;
	Mon,  6 Apr 2026 15:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQbhFNJfYORL; Mon,  6 Apr 2026 15:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B5C4082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775490958;
	bh=aks+iSQ2e7Wuz5eeMtCIdGiswg6ffms9U/vnvRJ+Sp0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I8guHGOd6Mjvg71BZJzlV1PTOguqGbrPBAuHFDLnINj5IcG/TWT4IeQ7y/OFRcd18
	 txipoC4euq2J1uYUdXL83uc4KOEXAJvanzYcUrucLwUn5XoZReGLmwYHQ5GT3Ducuk
	 kSIH9Kt9yI+o9pheWG+v+7hMY1lXtOsVwQxXPFTy/ajVM9Sw2cMZGmFyOo48yrkirE
	 kd0r+WC2p8Fns3khji+kHqSW9WWP0mwmoEfLjJwg7/KKaEy+uFrtiuhB67/tWTykLm
	 B43ZXRfYuA6lj21pIV4kZ4kuqua7mpBLdHI6oR6uCQDvKMnP8xuAElz+iqoO08TjwM
	 CLqN/dItf538g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B5C4082C;
	Mon,  6 Apr 2026 15:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A67D11EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE6480ECE
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3rG3dX4sN5x for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A6E80ECC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A6E80ECC
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:55:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 018ED80462; Mon,  6 Apr 2026 15:55:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 17:23:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4feaf08d762370e7e9e0c5c5d508fa289dad07c6
X-Git-Newrev: c0c5e2bcc9c61752dd6446415e06d5bb7cf54d4d
X-Patchwork-Hint: ignore
Message-Id: <20260406155555.018ED80462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.32
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0c5e2bcc9c61752dd6446415e06d5bb7cf54d4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v0.3.31, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32

This commit removes the package patch, which is included in this
release.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ead-callback-replacement-hook-in-singleth.patch | 53 ----------------------
 package/openblas/openblas.hash                     |  6 +--
 package/openblas/openblas.mk                       |  2 +-
 3 files changed, 4 insertions(+), 57 deletions(-)

diff --git a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
deleted file mode 100644
index 7ea199fb2e..0000000000
--- a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 874243421298866d116e1e8bdbd7e0ed4e31e4f6 Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Sun, 18 Jan 2026 19:55:40 +0100
-Subject: [PATCH] Include thread callback replacement hook in singlethreaded
- builds as well
-
-Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/874243421298866d116e1e8bdbd7e0ed4e31e4f6
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- driver/others/CMakeLists.txt | 2 +-
- driver/others/Makefile       | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/driver/others/CMakeLists.txt b/driver/others/CMakeLists.txt
-index a07a0baf99..72abdc4ee4 100644
---- a/driver/others/CMakeLists.txt
-+++ b/driver/others/CMakeLists.txt
-@@ -27,7 +27,6 @@ if (USE_THREAD)
-     ${BLAS_SERVER}
-     divtable.c # TODO: Makefile has -UDOUBLE
-     blas_l1_thread.c
--    blas_server_callback.c
-   )
- 
-   if (NOT NO_AFFINITY)
-@@ -42,6 +41,7 @@ set(COMMON_SOURCES
-   openblas_env.c
-   openblas_get_num_procs.c
-   openblas_get_num_threads.c
-+  blas_server_callback.c
- )
- 
- # these need to have NAME/CNAME set, so use GenerateNamedObjects, but don't use standard name mangling
-diff --git a/driver/others/Makefile b/driver/others/Makefile
-index 719d617c45..fbd016e6b0 100644
---- a/driver/others/Makefile
-+++ b/driver/others/Makefile
-@@ -1,12 +1,12 @@
- TOPDIR	= ../..
- include ../../Makefile.system
- 
--COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX)
-+COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX) blas_server_callback.$(SUFFIX)
- 
- #COMMONOBJS	+= slamch.$(SUFFIX) slamc3.$(SUFFIX) dlamch.$(SUFFIX)  dlamc3.$(SUFFIX)
- 
- ifdef SMP
--COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX) blas_server_callback.$(SUFFIX)
-+COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX)
- ifneq ($(NO_AFFINITY), 1)
- COMMONOBJS	+= init.$(SUFFIX)
- endif
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index e97e32271a..a1e1cfc851 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31
-md5  05050271d9196f65bc4ac3a89c6a3b05  openblas-0.3.31.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
+md5  021eb76c3fc66290b6ce14fa4c1ff3de  openblas-0.3.32.tar.gz
 # Locally calculated
-sha256  6dd2a63ac9d32643b7cc636eab57bf4e57d0ed1fff926dfbc5d3d97f2d2be3a6  openblas-0.3.31.tar.gz
+sha256  f8a1138e01fddca9e4c29f9684fd570ba39dedc9ca76055e1425d5d4b1a4a766  openblas-0.3.32.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d56934e41a..e8836a9d27 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.31
+OPENBLAS_VERSION = 0.3.32
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
