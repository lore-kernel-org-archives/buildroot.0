Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD49EC71131
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEF3405F0;
	Mon,  9 Jun 2025 14:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRCgB5GZrbg9; Mon,  9 Jun 2025 14:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A91B240577
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91B240577;
	Mon,  9 Jun 2025 14:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A80DFC8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EBF38150F
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQSCZTjhl_XB for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F65813FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F65813FE
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D781687AD2; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 16:24:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0720d398f1fc4f53ea20b90c7fd68a9d009d5837
X-Git-Newrev: e8cfd40ce72f5c004087d3a6e3d964f67e77161e
X-Patchwork-Hint: ignore
Message-Id: <20250609142501.D781687AD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: propagate
 llvm depends on wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8cfd40ce72f5c004087d3a6e3d964f67e77161e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target package spirv-llvm-translator was introduced in Buildroot
commit [1] without propagating the llvm dependency on toolchains with
wchar support.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LLVM
      Depends on [n]: BR2_PACKAGE_LLVM_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n] && !BR2_STATIC_LIBS [=n] && BR2_USE_WCHAR [=n] && BR2_HOST_GCC_AT_LEAST_7 [=y]
      Selected by [y]:
      - BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR [=y] && BR2_PACKAGE_LLVM_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_HOST_GCC_AT_LEAST_7 [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/58f9c7b83c86b06e1a086dbe884e216799410118

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spirv-llvm-translator/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/spirv-llvm-translator/Config.in b/package/spirv-llvm-translator/Config.in
index 73ca787d8a..91bd7f5ba3 100644
--- a/package/spirv-llvm-translator/Config.in
+++ b/package/spirv-llvm-translator/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # llvm
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM
 	select BR2_PACKAGE_SPIRV_HEADERS
@@ -15,8 +16,9 @@ config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 
 	  https://github.com/khronosGroup/SPIRV-LLVM-Translator
 
-comment "spirv-translator needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
+comment "spirv-translator needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_HOST_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
