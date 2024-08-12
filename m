Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC27CC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 11:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E741D4059A;
	Mon, 12 Aug 2024 11:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca60CAG0VeDA; Mon, 12 Aug 2024 11:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F37A405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F37A405B0;
	Mon, 12 Aug 2024 11:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67CE21BF2A5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B247403C0
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lkfe1gCrTsBQ for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59256403C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59256403C2
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4800E84BB7; Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 13:20:26 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 65af7b6ee47a5eb611441e52210a7912c4124dcc
X-Git-Newrev: a70ac746fefb044febdc2bff56a89a3495782b78
X-Patchwork-Hint: ignore
Message-Id: <20240812112738.4800E84BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 package/llvm-project/llvm: remove overriding the ASM compiler
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

commit: https://git.buildroot.net/buildroot/commit/?id=a70ac746fefb044febdc2bff56a89a3495782b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

There was an error in the pkg-cmake infra file regarding the selection
of the ASM compiler. Now that this has been fixed, overwriting the
ASM compiler selection is no longer necessary.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 638474478093831d76ab70e0cb3bd2d65d4a4511)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/llvm/llvm.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 6598d8b6c1..b0515474d8 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -20,10 +20,6 @@ LLVM_DEPENDENCIES = host-llvm
 HOST_LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 
-# Assembly files for x64 in lib/Support/BLAKE3 need to be compiled
-# by a C compiler
-HOST_LLVM_CONF_OPTS += -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)"
-
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
