Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5BCC5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04252408D1;
	Thu,  6 Aug 2026 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PGCcY_V7xvT; Thu,  6 Aug 2026 22:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD186408CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053738;
	bh=xFn4/ne9IrOQcES5HdxbxSLxtWw9P6qNphF0RrDJctY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pJjIfopwYlY6x6L5dE+6Z2nRfENf2EYf5Xwytp8tyjy53GFA64/uAqmcEBNCLWGYE
	 lW3jKbzQYwUoqutXPK+UOS9suhHc73kAf8EfdAGAD112YNF4Y2aXAAIjuQ6MPP+tOz
	 O/SAGoa0HjlRT8Nb4qt6rHgxgVXIOtHcCU6l62CmXG6AQ7rCqfZiHOCggIowEtBhUA
	 bOebkEuW0bmGnQzN/ytpFyAyya21EzzjOuG8oFGfl/G0Z9a4sRbAJBMHei50ofnkXE
	 HjujfbiYLw6E9pv4C6E1jSz/lJXTFwW9uxAUnkQ0sCIkSNlhAVuKrrKjWI0YmkK2Xb
	 qCD3uxjVSCcXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD186408CC;
	Thu,  6 Aug 2026 22:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A690C392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9865380DB4
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZo16KhH1ZDn for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F1D80DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F1D80DFD
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5D918CA21; Thu,  6 Aug 2026 22:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Aug 2026 23:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f103c70deb23faa4df537fee1cab0ae1e0c1bdb
X-Git-Newrev: 2f5eb8f8f3d150c018423a27fb17bdf8d0b46311
X-Patchwork-Hint: ignore
Message-Id: <20260806220129.C5D918CA21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "configs/stm32f429_disco_xip: fix
 boot failure after uClibc bump"
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f5eb8f8f3d150c018423a27fb17bdf8d0b46311
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit 72f7aa47e73e9a93dbfa3e4128c0d8e7932edb50.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config | 2 --
 configs/stm32f429_disco_xip_defconfig                            | 1 -
 2 files changed, 3 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
deleted file mode 100644
index fb8fa9ee01..0000000000
--- a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# MALLOC is not set
-MALLOC_SIMPLE=y
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 0c472a328b..40577a21a5 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
