Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D086DC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747BC41744;
	Wed,  2 Nov 2022 22:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747BC41744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr6q2V5437un; Wed,  2 Nov 2022 22:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AEB41735;
	Wed,  2 Nov 2022 22:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AEB41735
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDDE21BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A98FC40A92
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98FC40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAAIyXwxphcP for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5E940A90
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC5E940A90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB3887B37; Wed,  2 Nov 2022 22:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:55:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a60b6b0b9d91e2c2b14f5867e71e856b2d0e95fc
X-Git-Newrev: 2c03d4ea2a1c2be88b6ad4bc932a13bac0ed1223
X-Patchwork-Hint: ignore
Message-Id: <20221102225920.DCB3887B37@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 configs/zynqmp_zcu106_defconfig: fix pmufw sw reset
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c03d4ea2a1c2be88b6ad4bc932a13bac0ed1223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This patch will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash for the zcu106.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 894753ee47596200104d4ba57cf29eed45aef2c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index e1ea27a496..8ed6e1f2cf 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
