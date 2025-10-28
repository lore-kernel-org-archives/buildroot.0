Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C9CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486BA40E91;
	Wed, 29 Oct 2025 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mnih0A5FfYzt; Wed, 29 Oct 2025 20:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5189940E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5189940E83;
	Wed, 29 Oct 2025 20:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37CAE22F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2933240E83
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqRopvaajeFW for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE2F40E7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AE2F40E7E
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:21:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13F838798E; Wed, 29 Oct 2025 20:21:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Oct 2025 19:14:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 154f6694f641de1b9971ecd161644197526295d2
X-Git-Newrev: 03f35bc63ba01ede5e78900cd98e5217b7e8d70b
X-Patchwork-Hint: ignore
Message-Id: <20251029202157.13F838798E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llama-cpp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=03f35bc63ba01ede5e78900cd98e5217b7e8d70b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a package for llama.cpp, a C/C++ LLM inference library, used in
popular projects like Ollama, RamaLama, and more.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Julien:
 - add a Config.in comment justifying the dynamic libraries for uclibc
 - add missing conditions in Config.in toolchain dependencies
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/llama-cpp/Config.in      | 51 +++++++++++++++++++++++++++++
 package/llama-cpp/llama-cpp.hash |  4 +++
 package/llama-cpp/llama-cpp.mk   | 70 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63afce3fac..f5c8b832f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,7 @@ F:	package/at-spi2-core/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
diff --git a/package/Config.in b/package/Config.in
index 161d61728b..851bc35bc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2290,6 +2290,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llama-cpp/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
new file mode 100644
index 0000000000..c3eaa2a4ea
--- /dev/null
+++ b/package/llama-cpp/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_s390x_z13 # ggml requires z14 or higher
+
+config BR2_PACKAGE_LLAMA_CPP
+	bool "llama.cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LLAMA_CPP_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	# llama.cpp needs libexecinfo when built with uclibc,
+	# and libexecinfo needs dynamic libraries.
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC \
+		|| (BR2_TOOLCHAIN_USES_UCLIBC && !BR2_STATIC_LIBS)
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEXECINFO if BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  LLM inference in C/C++
+
+	  https://github.com/ggml-org/llama.cpp
+
+if BR2_PACKAGE_LLAMA_CPP
+
+config BR2_PACKAGE_LLAMA_CPP_TOOLS
+	bool "Enable tools"
+	help
+	  Build CLI tools like llama-cli, llama-bench, etc.
+
+config BR2_PACKAGE_LLAMA_CPP_SERVER
+	bool "Enable server"
+	help
+	  Build OpenAI API-compatible web server, llama-server.
+
+config BR2_PACKAGE_LLAMA_CPP_VULKAN
+	bool "Vulkan support"
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Enable Vulkan backend for GPU acceleration.
+
+endif
+
+comment "llama-cpp needs a toolchain w/ C++, wchar, threads, and gcc >= 9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "llama-cpp needs a uclibc toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && BR2_STATIC_LIBS
diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
new file mode 100644
index 0000000000..81ddf4508f
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  c108fadd61d34da6ff2cfdf085821ff03a45acde2245d9eeeba9358482b305c3  b6865.tar.gz
+# License
+sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
new file mode 100644
index 0000000000..7554d80a1e
--- /dev/null
+++ b/package/llama-cpp/llama-cpp.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# llama.cpp
+#
+################################################################################
+
+LLAMA_CPP_VERSION = b6865
+LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
+LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
+LLAMA_CPP_LICENSE = MIT
+LLAMA_CPP_LICENSE_FILES = LICENSE
+LLAMA_CPP_CPE_ID_VENDOR = ggml
+LLAMA_CPP_CPE_ID_PRODUCT = llama.cpp
+LLAMA_CPP_INSTALL_STAGING = YES
+LLAMA_CPP_CONF_OPTS = \
+	-DLLAMA_BUILD_TESTS=OFF \
+	-DLLAMA_BUILD_EXAMPLES=OFF \
+	-DLLAMA_FATAL_WARNINGS=OFF
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LLAMA_CPP_DEPENDENCIES += libexecinfo
+LLAMA_CPP_LDFLAGS += -lexecinfo
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LLAMA_CPP_LDFLAGS += -latomic
+endif
+
+LLAMA_CPP_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(LLAMA_CPP_LDFLAGS)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LLAMA_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF \
+		       -DCMAKE_POSITION_INDEPENDENT_CODE=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=ON
+LLAMA_CPP_DEPENDENCIES += libcurl
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
+else
+LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
+LLAMA_CPP_DEPENDENCIES += vulkan-loader
+LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=ON
+else
+LLAMA_CPP_CONF_OPTS += -DGGML_VULKAN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+LLAMA_CPP_DEPENDENCIES += openblas
+LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
+else
+LLAMA_CPP_CONF_OPTS += -DGGML_BLAS=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
