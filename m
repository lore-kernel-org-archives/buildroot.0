Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598BC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B146841AC;
	Mon, 19 May 2025 10:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpTwUaq_ZFay; Mon, 19 May 2025 10:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F4080E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F4080E4F;
	Mon, 19 May 2025 10:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E3B1E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5490141190
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoO-r3scI5z8 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A520541946
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A520541946
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A243D872E7; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 21:56:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a8f53a907ba314addd1bc05ffd49346ab1bc85af
X-Git-Newrev: b74e19a039871cd444621ef96447d97b70ae7318
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.A243D872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/freescale_t2080_qds_rdb: bump linux kernel to 6.12.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=b74e19a039871cd444621ef96447d97b70ae7318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit [1] "package/binutils: make 2.43 the default version",
the freescale_t2080_qds_rdb_defconfig fails to build the Linux
kernel, with the error:

    arch/powerpc/boot/util.S: Assembler messages:
    arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
    arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
    arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'

This commit fixes the issue by updating the Linux kernel to the latest
LTS version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089770

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
