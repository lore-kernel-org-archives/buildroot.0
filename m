Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B84C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 18:53:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8384260725
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 18:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8384260725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4818B40001;
	Tue,  3 Aug 2021 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kd2gmkSvXzlk; Tue,  3 Aug 2021 18:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC60E40209;
	Tue,  3 Aug 2021 18:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B24A71BF847
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E151608DD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 18:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mX_XuXcK2Q8S for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 18:52:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E41A60658
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 18:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CAF01814B9; Tue,  3 Aug 2021 20:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1628016775; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=MDO+OH9VjKTOK0URfu8AUfw4vCzaqaAl70pGKtqJ2pU=;
 b=Th3Q6k22z8CN6eGTHTQIAYR00za+ZWl5FrLpwUpXMIyE/EeChiIaQ7KQlJiMig4MfMQW26
 d/G6A8clPCDpEVgftuDd+T8MlzMx8hucHAlTeNj9p7AJJ0bgOCrhexI9gWvAMMOXA/6JFV
 7WPA5CcBoI/L9pd9cYJOU1kBigcr55o=
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 20:52:41 +0200
Message-Id: <20210803185244.71607-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/grpc: bump version to 1.38.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 * drop CMakeLists.txt patch applied upstream.
 * Update patch for wrap_memcpy.cc to match changed target file.
 * update patch numbering.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...ix-cross-compilation-with-gRPC_BUILD.patch | 43 -------------------
 ...he-availability-of-pthread_setname_.patch} |  0
 ...y.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch} |  8 ++--
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          |  2 +-
 5 files changed, 6 insertions(+), 49 deletions(-)
 delete mode 100644 package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
 rename package/grpc/{0002-Properly-detect-the-availability-of-pthread_setname_.patch => 0001-Properly-detect-the-availability-of-pthread_setname_.patch} (100%)
 rename package/grpc/{0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch => 0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch} (85%)

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
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
