Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C0FC3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10798108B;
	Thu,  8 May 2025 22:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEYErFy0pZCh; Thu,  8 May 2025 22:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B5380E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B5380E79;
	Thu,  8 May 2025 22:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41BEA439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24899403CC
 for <buildroot@buildroot.org>; Thu,  8 May 2025 22:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWF301QUUymw for <buildroot@buildroot.org>;
 Thu,  8 May 2025 22:11:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61DDE403AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61DDE403AA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61DDE403AA
 for <buildroot@buildroot.org>; Thu,  8 May 2025 22:11:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 92C97B00548;
 Fri,  9 May 2025 00:11:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  9 May 2025 00:11:37 +0200
Message-ID: <20250508221137.3426501-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746742304;
 bh=E9WiUSLkEG3nki99HmH5dfwioTUdxTKGP2INuTnLTiI=;
 h=From:To:Cc:Subject:Date:From;
 b=dYSPjTyLoRlmPlPJ5j9j9koHz3X7h5XzntLCN8Ko62XmO1Z5KjnSoaJNW3oS+plvI
 IllBeAcPJVBwVr4ChRbh4Vd0+xiRsHT2TYzAfi+cjJxULo8tokorzJWEeswVhClMMb
 NUA6dK/G7FHjhgTe+DFx7cw81GQ02nZxikpG1l+g/WUqfE1tHf5wXW7NkKvaQJ7Yc4
 srUbsvK3aauu6RUI3Eke2H1yWJlfMOBY1VcoVP4GztmzWuFx7eji9dvPQBZ1leaIjD
 KX8oMoFMT2lRiKq0zYSVyuvMkYTzT62en4UX0SytvmkatQozkSgCaHla5xPNRYDQEA
 qFxEVoiRivExg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dYSPjTyL
Subject: [Buildroot] [PATCH 1/1] configs/freescale_t2080_qds_rdb: bump linux
 kernel to 6.12.27
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1] "package/binutils: make 2.43 the default version",
the freescale_t2080_qds_rdb_defconfig fails to build the Linux
kernel, with the error:

    arch/powerpc/boot/util.S: Assembler messages:
    arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
    arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
    arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'

This commit fixes the issue by updating the Linux kernel to the lastest
LTS version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089770

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9978518554
---
 configs/freescale_t2080_qds_rdb_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_t2080_qds_rdb_defconfig b/configs/freescale_t2080_qds_rdb_defconfig
index 0004c87110..a598473562 100644
--- a/configs/freescale_t2080_qds_rdb_defconfig
+++ b/configs/freescale_t2080_qds_rdb_defconfig
@@ -1,10 +1,10 @@
 BR2_powerpc64=y
 BR2_powerpc_e6500=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t2080qds fsl/t2080rdb"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
