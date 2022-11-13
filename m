Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BFC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1E04098E;
	Mon, 20 Feb 2023 21:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1E04098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3RcwVBzLF94; Mon, 20 Feb 2023 21:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F6742CD5;
	Mon, 20 Feb 2023 21:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F6742CD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0341BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59939610BB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59939610BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCO5mGMTct5G for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1481461098
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1481461098
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F308828C8; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 14:31:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf14df13358ddd1b06709924a84f87dfa711cceb
X-Git-Newrev: 4e63809d8d7ed873f320c61fc0eb7e0f64250acf
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.0F308828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/kontron_bl_imx8mm_defconfig: bump U-boot to 2022.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e63809d8d7ed873f320c61fc0eb7e0f64250acf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 223516b51e1a (configs/kontron_bl_imx8mm: U-Boot needs util-linux)
added the needed dependency against host-util-linux, but missed an
earlier comment about u-boot still failing [0]

The U-Boot makefile for the host tools does not handle the
compiler/linker options properly. There are some patches [1][2] that fixes
that issue already applied in the newer U-Boot version 2022.10. So we have to
bump U-Boot to fix an autobuilder failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833

[0] https://lore.kernel.org/buildroot/CAEyMn7Y3UgT-8dYY5rbnzcPfbGmqRVXG=joWx1fSSCC=WiFzbg@mail.gmail.com/
[1] U-Boot: a638bd349ea43825 (kbuild: add KBUILD_HOSTLDFLAGS to cmd_host-csingle)
[2] U-Boot: 31a7688cbe0ed5ed (tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls)

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr:
  - update commit log with reference to [0]
  - slightly tweak commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/kontron_bl_imx8mm_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index 13ed1a2078..240cb52245 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
