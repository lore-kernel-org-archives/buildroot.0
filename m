Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE66C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55CC26069A;
	Sat, 13 Jul 2024 09:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtQA69c9KovA; Sat, 13 Jul 2024 09:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A026069E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A026069E;
	Sat, 13 Jul 2024 09:30:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CABAC1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6C1640204
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XO16t3T5-Sp4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CF3C40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF3C40190
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF3C40190
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:30:48 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A390A3536273; Sat, 13 Jul 2024 11:30:46 +0200 (CEST)
Date: Sat, 13 Jul 2024 11:30:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZpJJRjTc24UClMCY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1720863046; bh=64WnKSxrS4oRcg84p6EvpKCNgtNK9X07t1iAmHknwGk=;
 h=Date:From:To:Subject:From;
 b=qK+BkFVWKYKaeygIUGKoMaCV0gbMx3IJO5HD9TaSvzw3YS+R4Qrd+jzCWUhHFADfi
 4ELZ9NGHpWc9jaLor3VP/8j1qxaT8MZcApJ0b05aGPBdDMcquMpnorE0hXghbwGNih
 nsyM8dDCus7X1SiC9i+LErzISHor7rt+M/25fBRI7Z/4GvKD4URaZLN1MjQpp2tXT2
 cFaeTppT/cbFpLkpiXNdCCaiRPDwbNn9YuXBZT2txoteVE+KNRkYWosuih5jFSLtSu
 M2GxpEqx25l5KuHfVr2I/JRceOMb2tQolORiBQcnFFk/p3nLgfSiel3g+4EwWma+Tb
 OfnV/1W2EFpOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=qK+BkFVW
Subject: [Buildroot] [PATCH] configs/qemu_riscv32_nommu_virt: remove
 duplicate entry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37 added accidentally
a duplicate of BR2_DOWNLOAD_FORCE_CHECK_HASHES. Remove that.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../riscv32-virt/patches/linux-headers/linux-headers.hash     | 2 --
 board/qemu/riscv32-virt/patches/linux/linux.hash              | 2 --
 configs/qemu_riscv32_nommu_virt_defconfig                     | 4 ----
 3 files changed, 8 deletions(-)
 delete mode 100644 board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/qemu/riscv32-virt/patches/linux/linux.hash

diff --git a/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash b/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
deleted file mode 100644
index a6c777192c..0000000000
--- a/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/board/qemu/riscv32-virt/patches/linux/linux.hash b/board/qemu/riscv32-virt/patches/linux/linux.hash
deleted file mode 100644
index a6c777192c..0000000000
--- a/board/qemu/riscv32-virt/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
index 38a1cf791f..b958d42d02 100644
--- a/configs/qemu_riscv32_nommu_virt_defconfig
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -7,10 +7,6 @@ BR2_RISCV_32=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Hashes
-BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
