Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35381C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB5870BED;
	Mon, 19 May 2025 10:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lloBpHIH97Es; Mon, 19 May 2025 10:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B2F70D0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B2F70D0F;
	Mon, 19 May 2025 10:59:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48843D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 317DD40D81
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLhX231cChWG for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B84D40DA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B84D40DA7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0504C82A2E; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 10:15:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8bfdd3305e8db9ebe37b183b318e8f66478f8cae
X-Git-Newrev: 889d47baef3ecf14c741b478d4846cb38d1ce221
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.0504C82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_p1025twr:
 bump linux kernel to 6.12.27
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=889d47baef3ecf14c741b478d4846cb38d1ce221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit [1] "package/binutils: make 2.43 the default version",
the freescale_p1025twr_defconfig fails to build the Linux
kernel, with the error:

    arch/powerpc/boot/util.S: Assembler messages:
    arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
    arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
    arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'

This commit fixes the issue by updating the Linux kernel to the latest
LTS version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089759

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_p1025twr_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
index 72374ae7a1..568f2060b1 100644
--- a/configs/freescale_p1025twr_defconfig
+++ b/configs/freescale_p1025twr_defconfig
@@ -1,10 +1,10 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/p1025twr"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
