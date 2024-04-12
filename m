Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 23:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECCA407D2;
	Fri, 12 Apr 2024 23:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJHmtp4w_wHA; Fri, 12 Apr 2024 23:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950D4407D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950D4407D6;
	Fri, 12 Apr 2024 23:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 742EB1BF2FA
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 23:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60408608E9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 23:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBn8RK2DTw9E for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 23:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B939B608E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B939B608E8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B939B608E8
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 23:12:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5231EB0037C;
 Sat, 13 Apr 2024 01:12:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 01:12:15 +0200
Message-ID: <20240412231215.2547252-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712963542;
 bh=2xp9Uejqb3qoPgiyZCQ+VO+RpV0I7T+ecJiNoUkAkp0=;
 h=From:To:Cc:Subject:Date:From;
 b=mwfCvbMWAEKChO+xjmadR9ejUQrJ4/CSLXHiCldtzeNsopAbvDP6gtjoV0+f48Rzr
 amD0CycBYUFwAmotpxYx4Hg2DGXlSLMRkEGbE34ULrTxeHc9HyX+G03stK0PoU1Jly
 AlAdO+ZJyNd1kAwUPRaLlu/kIurhpo4Gzz8L/4XWLlW2rgfKgs9ceE13lbf9RTPtL7
 1JJGkAQ5A8aWdLhZB9hLmYPHtGxHUmTDDTd/8An7M+NvnR7eXzlNBtvHZGUwPO/Whp
 CsZVuvVduZO9PzuV/6QrOMv4X6UtRN2Fn8SuufJieTEUG7+lWrcLgXZ/2/R1SUFjdE
 2aXeaduhweNtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mwfCvbMW
Subject: [Buildroot] [PATCH 1/1] configs/spike_riscv64: bump opensbi and
 kernel versions
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

Bump OpenSBI to v1.4 and Kernel to v6.6.26.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/spike_riscv64_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 73ea566084f..b4b3d6e3d5a 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -2,15 +2,15 @@ BR2_riscv=y
 BR2_RISCV_64=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/spike/riscv64/linux.fragment"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
