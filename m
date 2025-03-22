Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0879BC35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 07:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9194617A2;
	Sat, 22 Mar 2025 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dy5tKkuzYWV4; Sat, 22 Mar 2025 07:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0539F61782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0539F61782;
	Sat, 22 Mar 2025 07:39:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1D5F94A
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A32FB608CE
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4HkaW9npXAj for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 07:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1DA608C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED1DA608C5
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 07:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A01881AD; Sat, 22 Mar 2025 07:39:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 08:37:37 +0100
Subject: [git commit branch/2024.02.x] package/llvm-project/compiler-rt: remove duplicate parameter
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 03b06f7f5f368f6c3486e949ceacfaf2f361d32f
X-Git-Newrev: a8f8e3e6580e8cd600cd5b49824ce75879d872c0
X-Patchwork-Hint: ignore
Message-Id: <20250322073945.E9A01881AD@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8f8e3e6580e8cd600cd5b49824ce75879d872c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The COMPILER_RT_STANDALONE_BUILD parameter was passed twice.  One time as
FALSE and immediately after as TRUE which overrides previous value, so drop
the first one.

Signed-off-by: Yevhen Babiichuk (DustDFG) <dfgdust@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit acc7ce7262447a8f55986245b8bd41d0aaf13674)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 5d9c3d8fa8..34303cb6f4 100644
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
