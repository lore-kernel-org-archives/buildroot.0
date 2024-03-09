Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B2C54791
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC3A640012;
	Sat,  9 Mar 2024 21:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqA28y4xlE8I; Sat,  9 Mar 2024 21:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE8CB400DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE8CB400DC;
	Sat,  9 Mar 2024 21:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF63B1BF2FD
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC965400DC
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 21:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FGR0hz7amHW for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 21:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D04240012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D04240012
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D04240012
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 21:24:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6FC6AB00563;
 Sat,  9 Mar 2024 22:24:01 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  9 Mar 2024 22:23:46 +0100
Message-ID: <20240309212346.1642309-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710019445;
 bh=FiGxVwWtSyTXJiasgJFF/cRnCziS/yypXpr5iFGjH/w=;
 h=From:To:Cc:Subject:Date:From;
 b=kDInO4DDz8ky+QuonZaLuXvDtiQsWl1LG089yMHyb8sXrE8YY6fDC6IqjAYf9O4P6
 WS6ycb73gyJiSm/eHQqo4CkWEj1/a2UC0pM2x520RVV0WzCNPAlPf34+/A0MZBUbpk
 r3wlSHy/ZNenlQ+0BmVcF2ALjhDXCdvrpMBp2GX+NA0Xk1lvAocsQp0M6ZPIkJZwVD
 DXhl9Ti5zEiguhRprILENH9rSqKRc6q+OgP42+2XW/tCdybGjwXxdNMsBRfkyrdImB
 is9o31WUbsE57TOZiJzQM9zlG6yKDAqPzeRTPF429iIyjBnwQp8HRLjyzNf7LusnrE
 dns3uDuLn+Sew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kDInO4DD
Subject: [Buildroot] [PATCH 1/1] configs/imx23evk: bump Linux and U-Boot
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The imx23evk_defconfig fail to build the Kernel with message:

    arch/arm/mm/proc-arm926.S: Assembler messages:
    arch/arm/mm/proc-arm926.S:477: Error: junk at end of line, first unrecognized character is '#'

The upstream fix is [1] introduced in Kernel v5.5.

This commit fixes this issue by updating the Kernel. While at it,
U-Boot is also updated. The Kernel DTS name is also updated, to follow
the reorganization in [2], first included in v6.5.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6338079204

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=790756c7e0229dedc83bf058ac69633045b1000e
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/imx23evk_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index 94d159cf9e5..b54af418eb1 100644
--- a/configs/imx23evk_defconfig
+++ b/configs/imx23evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -11,16 +11,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/mxs/imx23-evk"
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx23evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
