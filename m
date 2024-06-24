Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A1CC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 18:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B3C81EB6;
	Mon, 24 Jun 2024 18:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHm3OiVpzylN; Mon, 24 Jun 2024 18:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E71E81EBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E71E81EBC;
	Mon, 24 Jun 2024 18:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 070471BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 18:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8BB481EBC
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 18:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GKVtwKPNyIB for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 18:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82CCC81EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CCC81EB6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82CCC81EB6
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 18:05:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0F13BB00583;
 Mon, 24 Jun 2024 20:05:28 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 20:05:19 +0200
Message-ID: <20240624180519.434061-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719252330;
 bh=O2syquvRXJ0XcPvaF6czYkrAfdW2p+100TnYkgbpB8s=;
 h=From:To:Cc:Subject:Date:From;
 b=a53LW1M875/88Gy7l3lN8d6S4MFgT+6JGAJTOGH/TnghtoPzRjO0efudVIyRwierl
 fcnMFNW181PXYNtTVY8z19GXZv8YhHYibElfxUpHE4qF+fxeSQFlGrfXoe1LMMW9sk
 rx8NomNyF9ZTNDOlln9bDtSXNbJjmwkWwG5/ctT+JkNveQV8OongYzrPVN058LgJlb
 1D7hJ6e0BsnCNc4ldZDPmWbvqsuy7EmYycxki/fM79M5tEoxa8h+YU/DR/Jc52lV7G
 yAFs5vYAfhyKhNY96zQ5bVEZ+HPStktOjvnBxvOpJlOLZIqTn83UG4J9PESYOvHDnx
 s59MzAbQtLGyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a53LW1M8
Subject: [Buildroot] [PATCH 1/1] configs/spike_riscv64: remove the no longer
 needed kernel fragment
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] updated riscv-isa-sim (Spike), which now includes
a NS16550 uart emulation. The Kernel config fragment was introduced to
work with older HTIF interface from Spike.

For more information about the HTIF/NS16550 in Spike, see the commit
log [2].

This commit removes this Kernel config fragment, since it is no longer
needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/38c581b05cd8e7967783410b36c14b9b561acd12

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 3f464c2 with commands:

    utils/docker-run make check-package
    ...
    OK

    make spike_riscv64_defconfig
    make
    board/spike/riscv64/start.sh
    ...
    Welcome to Buildroot
    buildroot login:
---
 board/spike/riscv64/linux.fragment | 3 ---
 configs/spike_riscv64_defconfig    | 1 -
 2 files changed, 4 deletions(-)
 delete mode 100644 board/spike/riscv64/linux.fragment

diff --git a/board/spike/riscv64/linux.fragment b/board/spike/riscv64/linux.fragment
deleted file mode 100644
index b443b0ab364..00000000000
--- a/board/spike/riscv64/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_RISCV_SBI_V01=y
-CONFIG_HVC_RISCV_SBI=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index b4b3d6e3d5a..fa8cba42755 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -4,7 +4,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/spike/riscv64/linux.fragment"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
