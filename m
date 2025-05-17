Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D262BC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2498487F;
	Mon, 19 May 2025 11:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSAiP42swYZ5; Mon, 19 May 2025 11:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 969B882060
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969B882060;
	Mon, 19 May 2025 11:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE29E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70C7341DD5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PMlfU-UBKEe for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653F641E40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 653F641E40
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 606B983BC0; Mon, 19 May 2025 10:40:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:39:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8b5dd49c5b2eb52e71ba9dff67b1ba54d0e00ac3
X-Git-Newrev: 58f9c7b83c86b06e1a086dbe884e216799410118
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.606B983BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/spirv-llvm-translator:
 add target variant to provide LLVMSPIRVLib
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

commit: https://git.buildroot.net/buildroot/commit/?id=58f9c7b83c86b06e1a086dbe884e216799410118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This target version is needed for Rusticl which is an LLVM based OpenCL
framework[1]. Rusticl allow programs to compile OpenCL C/C++ code
at runtime with Clang. Clang generates LLVM IR which is translated into
SPIR-V by spirv-llvm-translator. Finally, mesa can use its internal
tools to manage SPIR-V.

[1]: https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                  |  1 +
 package/spirv-llvm-translator/Config.in            | 22 ++++++++++++++++++++++
 .../spirv-llvm-translator/spirv-llvm-translator.mk | 10 ++++++++++
 3 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 86e05fb724..33dc03a28a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -332,6 +332,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/spirv-llvm-translator/Config.in"
 	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
diff --git a/package/spirv-llvm-translator/Config.in b/package/spirv-llvm-translator/Config.in
new file mode 100644
index 0000000000..73ca787d8a
--- /dev/null
+++ b/package/spirv-llvm-translator/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	bool "spirv-translator"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_SPIRV_HEADERS
+	select BR2_PACKAGE_ZLIB
+	help
+	  LLVM/SPIR-V Bi-Directional Translator is a library and tool
+	  for translation between LLVM IR and SPIR-V.
+
+	  https://github.com/khronosGroup/SPIRV-LLVM-Translator
+
+comment "spirv-translator needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 523890a986..ffc8a63b89 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -19,4 +19,14 @@ HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
 	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
 	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
 
+SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
+SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm spirv-headers
+SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(STAGING_DIR)/usr \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
