Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9A8C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BCD40748;
	Tue, 30 Apr 2024 22:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IL0fh1-498Ac; Tue, 30 Apr 2024 22:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB6B4077E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB6B4077E;
	Tue, 30 Apr 2024 22:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED931BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BF1C60782
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktd1geWT8E9j for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7EB60590
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7EB60590
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7570686368; Tue, 30 Apr 2024 22:51:40 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 00:40:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc18b639c93f972246fce345b43dc091d07d35ca
X-Git-Newrev: 39ed602169ecf7677328d1387d30869baeb28cea
X-Patchwork-Hint: ignore
Message-Id: <20240430225140.7570686368@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx23evk: bump Linux and U-Boot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39ed602169ecf7677328d1387d30869baeb28cea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/imx23evk_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index 94d159cf9e..b54af418eb 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
