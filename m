Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E239C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C923942406;
	Mon, 19 May 2025 10:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BelrqbuGJtKA; Mon, 19 May 2025 10:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCE042392
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FCE042392;
	Mon, 19 May 2025 10:40:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DA5193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AA40410B4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlSWqAUy1U3d for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4310641038
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4310641038
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40F4B873D1; Mon, 19 May 2025 10:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Mar 2025 22:54:00 +0100
Subject: [git commit branch/next] package/llvm-project/compiler-rt: remove duplicate parameter
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6979ee5db031caecec362d908cca17952c0b1e4a
X-Git-Newrev: acc7ce7262447a8f55986245b8bd41d0aaf13674
X-Patchwork-Hint: ignore
Message-Id: <20250519103942.40F4B873D1@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=acc7ce7262447a8f55986245b8bd41d0aaf13674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The COMPILER_RT_STANDALONE_BUILD parameter was passed twice.  One time as
FALSE and immediately after as TRUE which overrides previous value, so drop
the first one.

Signed-off-by: Yevhen Babiichuk (DustDFG) <dfgdust@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index d4bc4d305b..cbd2e6cb8b 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -16,7 +16,7 @@ COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
 
-COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
+COMPILER_RT_CONF_OPTS = \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
 	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
