Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E69C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA15381E46;
	Sat, 13 Jul 2024 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0whOZj-XlFa6; Sat, 13 Jul 2024 20:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDF681F46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBDF681F46;
	Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4D641BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D082760785
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXWupkmk-zGp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C550560753
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C550560753
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFDC686666; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:21:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22af5f2939089b996aeda9ce072ab2f9b3ee6c2d
X-Git-Newrev: 638474478093831d76ab70e0cb3bd2d65d4a4511
X-Patchwork-Hint: ignore
Message-Id: <20240713203104.AFDC686666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/llvm: remove
 overriding the ASM compiler
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=638474478093831d76ab70e0cb3bd2d65d4a4511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was an error in the pkg-cmake infra file regarding the selection
of the ASM compiler. Now that this has been fixed, overwriting the
ASM compiler selection is no longer necessary.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
