Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EAFC8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E2680CAE;
	Wed,  2 Jul 2025 21:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx7YgR3zMdMf; Wed,  2 Jul 2025 21:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872CE80621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872CE80621;
	Wed,  2 Jul 2025 21:42:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD932128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9330A41C2D
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X71NsD_qDotY for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 21:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35CF41C42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F35CF41C42
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:42:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB54185BBE; Wed,  2 Jul 2025 21:42:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 23:41:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3138c577f438f36cb310dc75d8f1a4bc63b9ae7c
X-Git-Newrev: 4db67464dd046d4ce9ea5d0e57f40bd5c702531d
X-Patchwork-Hint: ignore
Message-Id: <20250702214231.DB54185BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: drop unused TERMINFO
 config flags
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7071571868282761350=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7071571868282761350==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4db67464dd046d4ce9ea5d0e57f40bd5c702531d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build complains about these being unused so drop them.

LLVM_ENABLE_TERMINFO option is removed since llvm 19.1.0 [1]

[1] https://github.com/llvm/llvm-project/commit/852aaf54071ad072335dcac57f544d4da34c875a

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[Romain: add upstream commit link]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/llvm/llvm.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 7552e3590c..b06b3bd5fa 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -131,10 +131,6 @@ LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
 LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
 
-# Disable terminfo database (needs ncurses libtinfo.so)
-HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
-LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
-
 # Enable thread support
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
 LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON

--===============7071571868282761350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7071571868282761350==--
