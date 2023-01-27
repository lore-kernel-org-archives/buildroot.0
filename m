Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5010C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 10:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D9B61259;
	Fri, 27 Jan 2023 10:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D9B61259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dd-NJhJb3m0f; Fri, 27 Jan 2023 10:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26BF6122A;
	Fri, 27 Jan 2023 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26BF6122A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2629C1BF976
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D89F82862
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D89F82862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgL_vTFrVk4t for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 10:39:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F7B826C7
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 10:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F7B826C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24B987E4B; Fri, 27 Jan 2023 10:39:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 11:38:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1005feccf52ce260aa794f4bf3fe84aa780b84cc
X-Git-Newrev: 0939cecb401fa3a4227649b36bc4298790544928
X-Patchwork-Hint: ignore
Message-Id: <20230127103914.D24B987E4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu106_defconfig: use
 Xilinx github for pmufw.elf
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

commit: https://git.buildroot.net/buildroot/commit/?id=0939cecb401fa3a4227649b36bc4298790544928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate zcu106_pmufw.elf location from nealfrager github to Xilinx github.
The image is identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 699e528f32..88295571af 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
