Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE69C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 13:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F09281406;
	Sun, 13 Nov 2022 13:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F09281406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTYRdsmcencB; Sun, 13 Nov 2022 13:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DD17813D7;
	Sun, 13 Nov 2022 13:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD17813D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60C751BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B5C4042B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 13:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49B5C4042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1X0cL5xzCsmF for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 13:34:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9241A40165
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 13:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9241A40165
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C89B83530; Sun, 13 Nov 2022 13:34:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 14:31:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf14df13358ddd1b06709924a84f87dfa711cceb
X-Git-Newrev: 4e63809d8d7ed873f320c61fc0eb7e0f64250acf
X-Patchwork-Hint: ignore
Message-Id: <20221113133422.7C89B83530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_bl_imx8mm_defconfig: bump
 U-boot to 2022.10
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
