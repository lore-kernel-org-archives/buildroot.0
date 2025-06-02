Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56439C5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 19:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF1B40B1B;
	Mon,  2 Jun 2025 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0TauaGdbxRo; Mon,  2 Jun 2025 19:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1C740AE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1C740AE6;
	Mon,  2 Jun 2025 19:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B1D51F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B0182136
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E1b7q4d25_i for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 19:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79A3882128
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79A3882128
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:38:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D5DB87936; Mon,  2 Jun 2025 19:38:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 2 Jun 2025 21:31:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccfa9f40b8db0416165c07ca850ceb7b43a97cff
X-Git-Newrev: 64203d87ace0389bfebfca08338bb619748cf518
X-Patchwork-Hint: ignore
Message-Id: <20250602193812.6D5DB87936@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llvm-project/clang:
 remove merge artifacts
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

commit: https://git.buildroot.net/buildroot/commit/?id=64203d87ace0389bfebfca08338bb619748cf518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
    e29dae10 ("package/llvm-project: bump to version 20.1.5")

Signed-off-by: Daniel Lang <dalang@gmx.at>
Reviewed-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/clang/clang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 25d5688a80..a5c8b990aa 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -67,8 +67,8 @@ CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
 HOST_CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 
-+HOST_CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
-+CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
+HOST_CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
+CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
 
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
