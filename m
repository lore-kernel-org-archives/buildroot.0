Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19BDC56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D45408D5;
	Thu,  6 Aug 2026 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgyWa6ec904H; Thu,  6 Aug 2026 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43FA408DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053740;
	bh=g5dHVPav0424rPHOCljRVlXf9PFG/Bt5Anq/8z5PGos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ncfaiwbLQal3SEQAiTC8JF4gSy7XEjVZOmSR2DEo4eyG47geUZWxKnllsD5dfFGTg
	 MN5NEyAZGiFXIyDOUQd6fgjyt2jHWiZBCI5n2V+rA2sVYPDYRSZytb4f076ftKEA/w
	 i59ayw12vnGu5Leyj8bgsteiH+dlemClWgF/gVqqQ5u7B3+jEzuCSutdcl2CokKBsw
	 6FBGyHpoM00su9jtRuRgZdtDFR3yNRcvqxhAhzMBbIbX1p2FZB5kaqqssL4hU8OFIq
	 bc5rIQ7SxNMTuQyanBLRHJjfQoPOvB1Ve6NcwrsHoeQsqSViwtbfC24tOCZ6fck/Hc
	 nwjV/E5Y/ruxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C43FA408DF;
	Thu,  6 Aug 2026 22:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDED4392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC35606C2
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqXw8xJukt14 for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0121E605ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0121E605ED
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B28758C9A2; Thu,  6 Aug 2026 22:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Aug 2026 23:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dab2b762346b17cf0671599604dfbd0847ba1122
X-Git-Newrev: c784c1fadb54f16f0f8655362694456fe89f9f5f
X-Patchwork-Hint: ignore
Message-Id: <20260806220129.B28758C9A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "configs/stm32f769_disco_sd: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c784c1fadb54f16f0f8655362694456fe89f9f5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit dd67de1bd3374a75ab1845ef29e3ad3c3bed2aac.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config | 2 --
 configs/stm32f769_disco_sd_defconfig                            | 1 -
 2 files changed, 3 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
deleted file mode 100644
index fb8fa9ee01..0000000000
--- a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# MALLOC is not set
-MALLOC_SIMPLE=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 602d3e8018..a025bd7802 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
