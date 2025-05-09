Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE62C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 12:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11BC60B7B;
	Fri,  9 May 2025 12:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGVT6F4k8tFg; Fri,  9 May 2025 12:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE26460783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE26460783;
	Fri,  9 May 2025 12:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A58A51A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 12:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96DD060783
 for <buildroot@buildroot.org>; Fri,  9 May 2025 12:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NxaZdmWlsst for <buildroot@buildroot.org>;
 Fri,  9 May 2025 12:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 965C660AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 965C660AED
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 965C660AED
 for <buildroot@buildroot.org>; Fri,  9 May 2025 12:17:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D698BB0055E;
 Fri,  9 May 2025 14:17:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  9 May 2025 14:17:18 +0200
Message-ID: <20250509121718.761131-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746793043;
 bh=AAnPo+cKzAlXPvNjaV9n0KZG3L7sMv4ICB7/IHNYBFU=;
 h=From:To:Cc:Subject:Date:From;
 b=cW6yYkX61L+XfwsIAsAce8LrJfyQwQ/gzxzedesNIjaR9reRbHIcHpTwQYk6quJY8
 a/1xmt8thE/SYXy062+UY2EnIrCHbOXyVu/8axqeaWcMuGkERe9rIFE1ED461gle9x
 5nvCZcILxpoLt+d5r2d8lKuAhJNT3w/K473xEooc3MpgjBatOHHZPtXtHYmD4tyVnC
 ln2ILhs4alokFnF0bpvsoqPNXFXCdr2ZqGQ9x2LlT7KM6G35tpbpoaKM5oE1YANzT/
 ZqfORRyXPwE0ie6rLJDEWZ43Wq86eyDXTBncRB787UQKqLHL00mUPenufK2NaJCzbv
 XUU5Mmzcz+4HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cW6yYkX6
Subject: [Buildroot] [PATCH 1/1] configs/freescale_t1040d4rdb: bump linux
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
the freescale_t1040d4rdb_defconfig fails to build the Linux
kernel, with the error:

    arch/powerpc/boot/util.S: Assembler messages:
    arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
    arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
    arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'

This commit fixes the issue by updating the Linux kernel to the lastest
LTS version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089767

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9984902177
---
 configs/freescale_t1040d4rdb_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
index ad231e7f1e..851e011983 100644
--- a/configs/freescale_t1040d4rdb_defconfig
+++ b/configs/freescale_t1040d4rdb_defconfig
@@ -1,10 +1,10 @@
 BR2_powerpc64=y
 BR2_powerpc_e5500=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t1040d4rdb"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
