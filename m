Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D496EC5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A545783E7D;
	Sat, 31 May 2025 17:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkt-slluHW9F; Sat, 31 May 2025 17:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C475683BA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C475683BA7;
	Sat, 31 May 2025 17:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2283F117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FEFF606C0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avnMPtn8wWYZ for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E5960793
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E5960793
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63BD787807; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 18:43:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff7ae5911320c5c85e6823fc586c7d8ccd8a7411
X-Git-Newrev: 95fd005d09ebc1f1108fc87f5e585ebe25cf21f2
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.63BD787807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/freescale_t1040d4rdb: bump linux kernel to 6.12.27
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95fd005d09ebc1f1108fc87f5e585ebe25cf21f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since commit [1] "package/binutils: make 2.43 the default version",
the freescale_t1040d4rdb_defconfig fails to build the Linux
kernel, with the error:

    arch/powerpc/boot/util.S: Assembler messages:
    arch/powerpc/boot/util.S:49: Error: junk at end of line, first unrecognized character is `0'
    arch/powerpc/boot/util.S:54: Error: syntax error; found `b', expected `,'
    arch/powerpc/boot/util.S:54: Error: junk at end of line: `b'

This commit fixes the issue by updating the Linux kernel to the latest
LTS version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9967089767

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6ad80909205f43aabe3a6ec7ebf875f1f01d23ad)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
