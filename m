Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13312C5AC7A
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC37C80F67;
	Thu,  6 Aug 2026 22:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOAz11PeOZ5n; Thu,  6 Aug 2026 22:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A3BF80F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053744;
	bh=kowkGemTg9IawG+JUTtA21txQhgXHFzd6kUTIQatdJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s72+aMg4rMppmdbOD6Q9E57YMR3rGS6Z3LZP5sNqcBQNwkoNN3/DLcuSu9wJD8vSr
	 1OAKbaSPZZlDVLy9ImHfQogoSHNKcJKSiOgAFqC7HGrhgsGd9J0mIvcWoGEkZeSIUv
	 NqRmvVqyE9lATxLG6z/nO74GKadymvPmq6LcxUDH/VNPgiFUov7Ghqcd4mEeU+rltB
	 hS1EsyCRE2ifnCEM5MBzfqMLTBPuRyiMUq69hdxf5TCFzXQxOl/3LYz3+AHGldy/Cf
	 Ll+6mt1FDan1iT5/ZJfnHDmPEun2xC6R1kUPZ/mj/3Szs1eII4xkmb690VJC7hA1vG
	 Dj22f7MPdS34A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A3BF80F62;
	Thu,  6 Aug 2026 22:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78779392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DDA640118
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dWMkm4BxG6y for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CC14024A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CC14024A
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:02:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC96C8CA1F; Thu,  6 Aug 2026 22:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Aug 2026 23:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c784c1fadb54f16f0f8655362694456fe89f9f5f
X-Git-Newrev: 8f103c70deb23faa4df537fee1cab0ae1e0c1bdb
X-Patchwork-Hint: ignore
Message-Id: <20260806220129.BC96C8CA1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "configs/stm32f469_disco_{sd,
 xip}: fix boot failure after uClibc bump"
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f103c70deb23faa4df537fee1cab0ae1e0c1bdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit 832ff692ab26e7ab10d86625f13ac9beda7461a2.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 configs/stm32f469_disco_sd_defconfig  | 1 -
 configs/stm32f469_disco_xip_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c9c385e071..70a214a108 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 1d113da08c..578cecadbe 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
