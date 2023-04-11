Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F078C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 12:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB52F41BF4;
	Tue, 11 Apr 2023 12:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB52F41BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTJf_iQo1YzK; Tue, 11 Apr 2023 12:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C384041C0B;
	Tue, 11 Apr 2023 12:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C384041C0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 611D51C3BF7
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3969441C0B
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3969441C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeU7KHQxRWqH for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D51541BF0
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D51541BF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D8D583F99; Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 14:16:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8c84c53a15b738acc69c0518a1b21b4ff717fbfc
X-Git-Newrev: 644110a921da65c539fe1c9277f94afaa1e30d83
X-Patchwork-Hint: ignore
Message-Id: <20230411122149.4D8D583F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/stm32f469_disco_sd_defconfig: explicitly set U-Boot version
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

commit: https://git.buildroot.net/buildroot/commit/?id=644110a921da65c539fe1c9277f94afaa1e30d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The version of U-Boot must be explicitly set because if you keep the
default setting, the bootloader is continuously updated in buildroot with
the risk of building a non-working image.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 924b163b1e4e1f82ea758a7e69a73f9e6b888e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_sd_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index ea1361efc0..dc00a47e1d 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -18,6 +18,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
