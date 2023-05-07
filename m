Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300C2C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92FF40629;
	Sun,  7 May 2023 21:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92FF40629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQ3odC3BHtAT; Sun,  7 May 2023 21:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 125AC408CF;
	Sun,  7 May 2023 21:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 125AC408CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47C0F1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F44C60F93
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F44C60F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNCqlmED_vTS for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 451C86101E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451C86101E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 321FF860AF; Sun,  7 May 2023 21:32:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:31:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5e672d912f55dd02d62ccb80cb5d70ad3e4847c
X-Git-Newrev: cf39b596e7a8256700eb0957d5ba22661b492243
X-Patchwork-Hint: ignore
Message-Id: <20230507213224.321FF860AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-benchmark: remove deprecated
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf39b596e7a8256700eb0957d5ba22661b492243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removes package optee-benchmark that is no more maintained as
pointed by discussion thread [1].

Link: [1] https://github.com/OP-TEE/optee_os/issues/5909
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                            |  1 -
 package/optee-benchmark/Config.in            | 20 --------------------
 package/optee-benchmark/optee-benchmark.hash |  4 ----
 package/optee-benchmark/optee-benchmark.mk   | 14 --------------
 4 files changed, 39 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eaac32a01a..53c2d3b077 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2565,7 +2565,6 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
-	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
deleted file mode 100644
index 2070582fbb..0000000000
--- a/package/optee-benchmark/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_OPTEE_BENCHMARK
-	bool "optee-benchmark"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
-	depends on !BR2_STATIC_LIBS # optee-client
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
-	select BR2_PACKAGE_OPTEE_CLIENT
-	select BR2_PACKAGE_LIBYAML
-	help
-	  Enable the OP-TEE benchmark package that brings facilities
-	  for profiling traversal and execution timings when
-	  invoking OP-TEE. OP-TEE benchmark is a component delivered
-	  by the OP-TEE project.
-
-	  http://github.com/linaro-swg/optee_benchmark
-
-comment "optee-benchmark needs a toolchain w/ threads, dynamic library, headers >= 4.3"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
deleted file mode 100644
index d74a24c8ab..0000000000
--- a/package/optee-benchmark/optee-benchmark.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
-sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
-# Locally computed
-sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
deleted file mode 100644
index 338a51ada4..0000000000
--- a/package/optee-benchmark/optee-benchmark.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# optee-benchmark
-#
-################################################################################
-
-OPTEE_BENCHMARK_VERSION = 3.19.0
-OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
-OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
-OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-
-OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
