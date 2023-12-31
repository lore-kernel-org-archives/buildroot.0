Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB9DC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C264053E;
	Sun, 31 Dec 2023 17:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C264053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdD-P7K4F_Oc; Sun, 31 Dec 2023 17:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECCB6404D5;
	Sun, 31 Dec 2023 17:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCB6404D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34DBF1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0969B404D5
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0969B404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Uia7PG6LOqf for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 315C2404A8
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315C2404A8
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D97B435353C8; Sun, 31 Dec 2023 18:26:23 +0100 (CET)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 18:25:37 +0100
Message-Id: <20231231172538.1279608-6-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231231172538.1279608-1-wbx@openadk.org>
References: <20231231172538.1279608-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704043583; bh=mMsjiWe5ZSrIPTetMsBMAsVNfU9NevLnzKyhZ0JZIcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEpv6fFU46ykdNfzM1qFvULrK0EFUKFked3FlKSyt6LMs/BHAVIYN7VIgmdYE0dge
 7mB2hhlJ150NqlFb+aRSN0cQadOdTa6M+FKnjC49++ELfFykUc6ix3Zb6DoZfg6u1j
 wof5//7UGa2Cd0da0IY7fJWayUlcQilxE7X+DdQ+92BO5keyqnsSTHbrre85LCXsyY
 rfP4vn3UAJWkt3ifnawrbJz3r8UwFXJR0CD8Bd1XRGDnC4eyynoL3r9cpedA3hx5L7
 ysNtgNz9o41HDwY/dPUMO8Q4/XXxmFGQf6t5Ye8xAHYOujyjkEe56DM/wJr9jeQ7Cf
 3m1uBlE4Sv/Xw==
Subject: [Buildroot] [PATCH 5/6] configs/snps_arc700_nsim_defconfig: update
 kernel
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/synopsys/nsim/readme.txt     | 2 +-
 configs/snps_arc700_nsim_defconfig | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/board/synopsys/nsim/readme.txt b/board/synopsys/nsim/readme.txt
index cc89cf87ac..bf47ecaf4d 100644
--- a/board/synopsys/nsim/readme.txt
+++ b/board/synopsys/nsim/readme.txt
@@ -2,7 +2,7 @@ How to build it
 ===============
 
 Configure build for the selected nSIM target. For instance, for
-ARC700 nSIM target use the following defauilt configuration:
+ARC700 nSIM target use the following default configuration:
 $ make snps_arc700_nsim_defconfig
 
 Optionally modify the configuration:
diff --git a/configs/snps_arc700_nsim_defconfig b/configs/snps_arc700_nsim_defconfig
index 3964924bed..e782522d33 100644
--- a/configs/snps_arc700_nsim_defconfig
+++ b/configs/snps_arc700_nsim_defconfig
@@ -1,16 +1,19 @@
 # Architecture
 BR2_arcle=y
 
+# arc700 not supported by glibc
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="arc700"
 
-# Linux headers same as kernel, a 6.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.69"
 BR2_LINUX_KERNEL_DEFCONFIG="nsim_700"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
