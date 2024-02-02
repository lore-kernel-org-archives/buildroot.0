Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522D1C48291
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF1F6FA6B;
	Fri,  2 Feb 2024 09:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF1F6FA6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSnK23s9LiTK; Fri,  2 Feb 2024 09:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BCD6FA5D;
	Fri,  2 Feb 2024 09:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BCD6FA5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEDEB1BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B124384D1A
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B124384D1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PZWQaXj619K for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:38 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37CD084D1C
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CD084D1C
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso1115622f8f.2
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866596; x=1707471396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKzdlqVDf75vPo1rx6MnlM5I8631d4KHHR3wB3TbauE=;
 b=t4E9AMAcmV+QWkhf9C16mHfzJdnnQmK8eC0P4/cMeqAGNz+Zfd1noCEplQ46x8lpez
 gVZ7js0Ob2MGJjLP3GRiajSY3j6HVQlGA1MwZJ/sPhVV4S28LNZEj20ZqeiaKsfBh7Wc
 tTlLMnyWnYdRZUhiGXnFx4936Nn+EySIkMEL4YUShVrDjk1iqe/2igbT3DaWOSt+EKJ1
 Qa0un2RCQZXAflvs2qra2ZGVmpQ9m1wY+ER1w6iGyvlm7C/rAG0CMLs/qFKCTfgAJ9ra
 qEDJmDvAk0Tr5cG6VOlQStFadsr6bNZHO2BgD9dPs4KHG7cP8q4k/CUUflLI11XcJyPx
 NDLA==
X-Gm-Message-State: AOJu0YyZFGgyh54KQXkrbDPNr50aDysNPyHUqRgB4N0dDvq/FqFDEquk
 lgc6Y/qHDSapjf1MXgmPVprhl4qptbTbC5KmT8TnqQrXhyv/SZvbOpQUyg1cR38OWQ2M7fsr67a
 3QP4F9w==
X-Google-Smtp-Source: AGHT+IFUs1pC0tfsqtMZzmIclXJZZc7CWkcMH2ggq8QnKv52FlTK3mOSN8Cxs7wMvsEfWecXpSwM6Q==
X-Received: by 2002:a5d:5088:0:b0:33a:eb59:accb with SMTP id
 a8-20020a5d5088000000b0033aeb59accbmr1018266wrt.8.1706866596073; 
 Fri, 02 Feb 2024 01:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUyp47L3IG240jWUf+48aq+rwPltK6D/mrHbNExdRT66dPlbxtStmRbmAeB0a2uQXuLEpkRd6WcKPrh0nWY9iXSspwrEhhDwp3vkAweSHHOFwxOLpJ29Npb3p7YrX+C5+vXFxMWyfJu3ijdDmqj52JPEjsssdnErzVs
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:35 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:24 +0100
Message-Id: <20240202093625.1409559-7-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202093625.1409559-1-antoine.coutant@smile.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706866596; x=1707471396;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKzdlqVDf75vPo1rx6MnlM5I8631d4KHHR3wB3TbauE=;
 b=VFPWSjd61GvR9XMBKXhURtNFVRkr+AzdBMwEOfg8JQyf9PIwl4Jy1XwdNyRD/kzcwM
 bcG5PfDioEVxaQ7ilbQFcbIhtkGHqiJK3pMJ6Is1paHTUWqzGL0ykODF5c8Zly/jIbF0
 pC4r41yY+h2F4FHsJ/2Tnc4QRp2mzIeM5MckdOD60h59rSGtxiuP053bOsE+LqXh4ZQP
 YlnvHxs16VOZCUEsn4TFWYXZQpY5Ut6dTAYLj+PG0HYAOLflEJN0/7NqVUuwzSFk07wq
 gRjMfq0I0mys9tsePQlXfbwJORdDxs6MOf4qUZ2ocEPv6b3NV+wzLcIr07RUjSc8j1Es
 kN7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VFPWSjd6
Subject: [Buildroot] [PATCH v4 6/7] package/llvm-project: add
 opencl-c-base.h on target
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
Cc: sebastian.weyer@smile.fr, Antoine Coutant <antoine.coutant@smile.fr>,
 bernd@kuhls.net, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rusticl depends on the mesa clc_compile_to_llvm_module function.
This function requires opencl-c-base.h when LLVM version >= 15.

The header is deleted automatically by CLANG_FILES_TO_REMOVE
post install target hook in llvm-project/clang package.
When rusticl is enabled, after the whole clang directory has
been removed, the header is copied back to
/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/

By default, the mesa3d variable used to retrieve the header
is set to the staging directory on the host machine. A merge
request on mesa's gitlab solved this problem. See:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568

The patches have been backported to mesa 23.3.4.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v3 -> v4:
	- Add patches merged by mesa upstream.
---
Running an app that uses rusticl leads to an error.
Example:

RUSTICL_ENABLE=panfrost clpeak

Platform: rusticl
  Device: Mali-G52 (Panfrost)
    Driver version  : 23.3.4 (Linux ARM64)
    Compute units   : 2
    Clock frequency : 800 MHz
    Build Log: <built-in>:1:10: fatal error: 'opencl-c-base.h' file not found
Error executing LLVM compilation action.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/llvm-project/clang/clang.mk           |  9 ++
 ...ncl-external-clang-headers-option-an.patch | 72 ++++++++++++++++
 ...or-every-user-when-using-shared-LLVM.patch | 40 +++++++++
 ...lc-retrieve-libclang-path-at-runtime.patch | 86 +++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
 create mode 100644 package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
 create mode 100644 package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0bafd6461b..09aac7f0ec 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -90,6 +90,15 @@ define HOST_CLANG_INSTALL_CLANG_TBLGEN
 endef
 HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
 
+# Rusticl needs opencl-c-base.h to be present on the target.
+define CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
+	mkdir -p $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include
+	$(INSTALL) -D -m 0644 $(@D)/lib/Headers/opencl-c-base.h $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/opencl-c-base.h
+endef
+ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
+endif
+
 # This option must be enabled to link libclang dynamically against libLLVM.so
 HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
diff --git a/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
new file mode 100644
index 0000000000..ebe3542627
--- /dev/null
+++ b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
@@ -0,0 +1,72 @@
+From b7f2ada31d85dfd2e9906a7343d14a3b0b85cf14 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Tue, 2 Jan 2024 22:58:39 +0100
+Subject: [PATCH 1/3] meson: remove opencl-external-clang-headers option and
+ rely on shared-llvm
+
+Setting opencl-external-clang-headers to enabled while using shared LLVM
+was broken and this option was mostly used for windows to force static
+inclusion of opencl base headers.
+
+Simply relying on the shared-llvm option here is enough to get what we
+want.
+
+Signed-off-by: Karol Herbst <kherbst@redhat.com>
+Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
+[antoine.coutant@smile.fr: backported to mesa-23.3.4]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+---
+ .gitlab-ci/windows/mesa_build.ps1 | 1 -
+ meson_options.txt                 | 7 -------
+ src/compiler/clc/meson.build      | 4 +---
+ 3 files changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/.gitlab-ci/windows/mesa_build.ps1 b/.gitlab-ci/windows/mesa_build.ps1
+index a4f87c4eadb..e79eb6b6587 100644
+--- a/.gitlab-ci/windows/mesa_build.ps1
++++ b/.gitlab-ci/windows/mesa_build.ps1
+@@ -59,7 +59,6 @@ meson setup `
+ -Dopencl-spirv=true `
+ -Dmicrosoft-clc=enabled `
+ -Dstatic-libclc=all `
+--Dopencl-external-clang-headers=disabled `
+ -Dspirv-to-dxil=true `
+ -Dbuild-tests=true `
+ -Dwerror=true `
+diff --git a/meson_options.txt b/meson_options.txt
+index e885ba61a8a..537ba797407 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -191,13 +191,6 @@ option(
+   description : 'Link libclc SPIR-V statically.',
+ )
+ 
+-option(
+-  'opencl-external-clang-headers',
+-  type : 'feature',
+-  description : 'Use system Clang headers at runtime for OpenCL kernel ' +
+-                'compilation.',
+-)
+-
+ option(
+   'd3d-drivers-path',
+   type : 'string',
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 3e4f1a7f441..81345225768 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -30,9 +30,7 @@ _libmesaclc_c_args = []
+ _libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="@0@"'.format(llvm_libdir)]
+ _libmesaclc_sources = []
+ 
+-if get_option('opencl-external-clang-headers') \
+-   .disable_auto_if(host_machine.system() == 'windows') \
+-   .disabled()
++if not _shared_llvm
+   # LLVM 16 moved clang header path from using full version to only major version
+   if dep_llvm.version().version_compare('< 16')
+     # Prior to LLVM 16, this path used a full version
+-- 
+2.25.1
+
diff --git a/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
new file mode 100644
index 0000000000..3560f6805f
--- /dev/null
+++ b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
@@ -0,0 +1,40 @@
+From 56c85c4c7a757a9ba3d8ac08e6c4c4c7f19e6cab Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 11 Jan 2024 14:55:46 +0100
+Subject: [PATCH 2/3] clc: force fPIC for every user when using shared LLVM
+
+As we want to start using `dladdr`, this is needed to prevent `dladdr`
+returning information of the wrong file.
+
+Fixes tag as it's required by the actual fix.
+
+Signed-off-by: Karol Herbst <kherbst@redhat.com>
+Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
+[antoine.coutant@smile.fr: backported to mesa-23.3.4]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+---
+ src/compiler/clc/meson.build | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 81345225768..442a583065b 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -123,7 +123,13 @@ _libmesaclc = static_library(
+                  idep_mesautil, dep_spirv_tools]
+ )
+ 
++_idep_mesaclc_link_args = []
++if _shared_llvm
++  _idep_mesaclc_link_args += cc.get_supported_link_arguments('-fPIC')
++endif
++
+ idep_mesaclc = declare_dependency(
+   link_with : _libmesaclc,
+   include_directories : include_directories('.'),
++  link_args : _idep_mesaclc_link_args,
+ )
+-- 
+2.25.1
+
diff --git a/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
new file mode 100644
index 0000000000..c19ba7d2b7
--- /dev/null
+++ b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
@@ -0,0 +1,86 @@
+From fa2c045e04370beb454951c32bccc087638e04c7 Mon Sep 17 00:00:00 2001
+From: Antoine Coutant <antoine.coutant@smile.fr>
+Date: Thu, 30 Nov 2023 11:10:20 +0100
+Subject: [PATCH 3/3] clc: retrieve libclang path at runtime.
+
+LLVM_LIB_DIR is a variable used for runtime compilations.
+When cross compiling, LLVM_LIB_DIR must be set to the
+libclang path on the target. So, this path should not
+be retrieved during compilation but at runtime.
+
+dladdr uses an address to search for a loaded library.
+If a library is found, it returns information about it.
+The path to the libclang library can therefore be
+retrieved using one of its functions. This is useful
+because we don't know the name of the libclang library
+(libclang.so.X or libclang-cpp.so.X)
+
+v2 (Karol): use clang::CompilerInvocation::CreateFromArgs for dladdr
+v3 (Karol): follow symlinks to fix errors on debian
+
+Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+Reviewed-by: Karol Herbst <kherbst@redhat.com>
+Reviewed-by (v1): Jesse Natalie <jenatali@microsoft.com>
+[antoine.coutant@smile.fr: backported to mesa-23.3.4]
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
+---
+ src/compiler/clc/clc_helpers.cpp | 24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
+index 55287f22683..22eb3495be9 100644
+--- a/src/compiler/clc/clc_helpers.cpp
++++ b/src/compiler/clc/clc_helpers.cpp
+@@ -23,6 +23,7 @@
+ // ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ // OTHER DEALINGS IN THE SOFTWARE.
+ 
++#include <cstdlib>
+ #include <filesystem>
+ #include <sstream>
+ #include <mutex>
+@@ -57,6 +58,10 @@
+ 
+ #include "spirv.h"
+ 
++#if DETECT_OS_UNIX
++#include <dlfcn.h>
++#endif
++
+ #ifdef USE_STATIC_OPENCL_C_H
+ #if LLVM_VERSION_MAJOR < 15
+ #include "opencl-c.h.h"
+@@ -876,12 +881,25 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
+ #endif
+    }
+ #else
++
++   Dl_info info;
++   if (dladdr((void *)clang::CompilerInvocation::CreateFromArgs, &info) == 0) {
++      clc_error(logger, "Couldn't find libclang path.\n");
++      return {};
++   }
++
++   char *clang_path = realpath(info.dli_fname, NULL);
++   if (clang_path == nullptr) {
++      clc_error(logger, "Couldn't find libclang path.\n");
++      return {};
++   }
++
+    // GetResourcePath is a way to retrive the actual libclang resource dir based on a given binary
+-   // or library. The path doesn't even need to exist, we just have to put something in there,
+-   // because we might have linked clang statically.
++   // or library.
+    auto libclang_path = fs::path(LLVM_LIB_DIR) / "libclang.so";
+    auto clang_res_path =
+-      fs::path(Driver::GetResourcesPath(libclang_path.string(), CLANG_RESOURCE_DIR)) / "include";
++      fs::path(Driver::GetResourcesPath(std::string(clang_path), CLANG_RESOURCE_DIR)) / "include";
++   free(clang_path);
+ 
+    c->getHeaderSearchOpts().UseBuiltinIncludes = true;
+    c->getHeaderSearchOpts().UseStandardSystemIncludes = true;
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
