Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1015DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C99F960F5D
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C99F960F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4FA81D46;
	Sat,  4 Sep 2021 18:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ihAXPGFMoKK; Sat,  4 Sep 2021 18:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C675182A3B;
	Sat,  4 Sep 2021 18:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC271BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E53404A5
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ubk26QrAwTlp for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FA8E404A6
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC9668834C; Sat,  4 Sep 2021 18:23:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:01:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d292d139cd5e44d0d70eb89fae3f5ff1d74b336a
X-Git-Newrev: 4185f6dae92c36f6c6bb783f632a7bed2285986c
X-Patchwork-Hint: ignore
Message-Id: <20210904182352.EC9668834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump version to 1.39.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4185f6dae92c36f6c6bb783f632a7bed2285986c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 * drop CMakeLists.txt patch applied upstream.
 * Update patch for wrap_memcpy.cc to match changed target file.
 * update patch numbering.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-fix-cross-compilation-with-gRPC_BUILD.patch | 43 ----------------------
 ...ect-the-availability-of-pthread_setname_.patch} |  0
 ...memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch} |  8 ++--
 package/grpc/grpc.hash                             |  2 +-
 package/grpc/grpc.mk                               |  2 +-
 5 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch b/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
deleted file mode 100644
index 553be8cb99..0000000000
--- a/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 268815d74ea34856c686dce9e9c23106b51f2782 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Tue, 2 Feb 2021 21:46:29 +0100
-Subject: [PATCH] CMakeLists.txt: fix cross-compilation with
- gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
-
-When cross-compiling gRPC, a native version of 'grpc_cpp_plugin' is searched
-in the environment. For most use cases, a cross version of this file is not
-needed.
-
-However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF, there
-are some build errors, for example:
-
-make[3]: *** No rule to make target 'grpc_cpp_plugin', needed by 'gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc'.  Stop.
-
-This is because there is still a hard dependency on 'grpc_cpp_plugin' for
-these targets, not taking into account the cross-compilation case.
-
-Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly for
-either cross or native case.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6bdae22083..08aea609f7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -317,7 +317,7 @@ function(protobuf_generate_grpc_cpp)
-            --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
-            ${_protobuf_include_path}
-            ${REL_FIL}
--      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
-+      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
-       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
-       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
-       VERBATIM)
--- 
-2.26.2
-
diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
similarity index 100%
rename from package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
rename to package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
diff --git a/package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch b/package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
similarity index 85%
rename from package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
rename to package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
index ad64804470..aac92bab13 100644
--- a/package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
+++ b/package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
@@ -20,12 +20,12 @@ diff --git a/src/core/lib/gpr/wrap_memcpy.cc b/src/core/lib/gpr/wrap_memcpy.cc
 index 9b8608e056..38b76acf95 100644
 --- a/src/core/lib/gpr/wrap_memcpy.cc
 +++ b/src/core/lib/gpr/wrap_memcpy.cc
-@@ -28,7 +28,7 @@
- 
+@@ -29,7 +29,7 @@
  extern "C" {
  #ifdef __linux__
--#if defined(__x86_64__) && !defined(GPR_MUSL_LIBC_COMPAT)
-+#if defined(__x86_64__) && !defined(GPR_MUSL_LIBC_COMPAT) && !defined(GPR_DISABLE_WRAPPED_MEMCPY)
+ #if defined(__x86_64__) && !defined(GPR_MUSL_LIBC_COMPAT) && \
+-    !defined(__ANDROID__)
++    !defined(__ANDROID__) && !defined(GPR_DISABLE_WRAPPED_MEMCPY)
  __asm__(".symver memcpy,memcpy@GLIBC_2.2.5");
  void* __wrap_memcpy(void* destination, const void* source, size_t num) {
    return memcpy(destination, source, num);
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 01dc9ca240..f1153469e7 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f60e5b112913bf776a22c16a3053cc02cf55e60bf27a959fd54d7aaf8e2da6e8  grpc-1.38.1.tar.gz
+sha256  b16992aa1c949c10d5d5ce2a62f9d99fa7de77da2943e643fb66dcaf075826d6  grpc-1.39.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index f3975316ae..1426158d82 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.38.1
+GRPC_VERSION = 1.39.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
