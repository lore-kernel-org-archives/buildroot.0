Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B79C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0325340024;
	Mon,  1 Jul 2024 20:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm8yiA1o94xi; Mon,  1 Jul 2024 20:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2651400F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2651400F5;
	Mon,  1 Jul 2024 20:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACB01BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08167400F5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4BAksUcGfYz for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3896440024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3896440024
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F6B18386C; Mon,  1 Jul 2024 20:49:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Jul 2024 22:46:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55c8c2328e73725e9ab41c8dc566b09f49f2aad5
X-Git-Newrev: 8e58b22a5e323341bd74ade39fdd6642fa497f67
X-Patchwork-Hint: ignore
Message-Id: <20240701204922.8F6B18386C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/clang: update patch
 to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e58b22a5e323341bd74ade39fdd6642fa497f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, host-clang fails to build with output:

Applying 0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch using patch:
patching file lib/Driver/ToolChains/Gnu.cpp
Hunk #1 FAILED at 1725.
Hunk #2 succeeded at 2011 (offset 277 lines).
1 out of 2 hunks FAILED -- saving rejects to file lib/Driver/ToolChains/Gnu.cpp.rej

Rebase the patch to fix the problem.

Fixes:
http://autobuild.buildroot.net/results/75b/75baa62275d64c699d9757f7c756fc03ea717877/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
index 08371154d5..ffdd5d187f 100644
--- a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
+++ b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
@@ -44,7 +44,7 @@ index 2ad45097dc..90d6b5b748 100644
 +++ b/lib/Driver/ToolChains/Gnu.cpp
 @@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
  
-     Prefixes.push_back(GCCToolchainDir);
+     Prefixes.push_back(std::string(GCCToolchainDir));
    } else {
 +    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
 +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
