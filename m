Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6682C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 16:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F82D40BD4;
	Wed, 21 Dec 2022 16:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F82D40BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okXN63kqsrm5; Wed, 21 Dec 2022 16:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C9540BD3;
	Wed, 21 Dec 2022 16:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C9540BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56C501BF8C7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3240B81F69
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3240B81F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id px8HFAMR7C71 for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 413A680C27
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 413A680C27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E6D186C08; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 16:52:55 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 2a64642035f862103780f1291f785c71f07f48cb
X-Git-Newrev: b8a37f554f70586c776cffab8ddb93eb51a889e0
X-Patchwork-Hint: ignore
Message-Id: <20221221160354.2E6D186C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 board/zynqmp/zcu106/patches: fix build by dropping U-Boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8a37f554f70586c776cffab8ddb93eb51a889e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Since commit
3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig:
bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
which already carries the psu_init_gpl.c, causing the build to fail as
our patch doesn't apply.

Fix this by dropping the no longer needed patch.

Fixes: 3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig: bump to Xilinx 2022.2")
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ca9b63a1e0bfa474a75522e62d671ed8b080f19f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 ----------------------
 configs/zynqmp_zcu106_defconfig                    |  1 -
 2 files changed, 41 deletions(-)

diff --git a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
deleted file mode 100644
index 4281880da0..0000000000
--- a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From aaaa10b613165b7790fe1c084de007240b5bd77a Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Thu, 5 May 2022 13:34:43 +0100
-Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-zcu102-revA: Fix DP PLL
- configuration
-
-This patch fixes the DP audio and video PLL configurations
-for the zynqmp-zcu106-revA evaluation board
-
-The Linux DP driver expects the DP to be using the following PLL config:
-  - DP video PLL should use the VPLL (0x0)
-  - DP audio PLL should use the RPLL (0x3)
-
-Register 0xFD1A0070 configures the DP video PLL.
-Register 0xFD1A0074 configures the DP audio PLL.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Signed-off-by: Michal Simek <michal.simek@amd.com>
----
- board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-index 15f0be1a43..cbc436289f 100644
---- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-@@ -81,8 +81,8 @@ static unsigned long psu_clock_init_data(void)
- 	psu_mask_write(0xFF5E0104, 0x00000007U, 0x00000000U);
- 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000F00U);
- 	psu_mask_write(0xFD1A00A0, 0x01003F07U, 0x01000200U);
--	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010203U);
--	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C00U);
-+	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
-+	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
- 	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01011303U);
- 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
- 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
--- 
-2.17.1
-
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index dcbc4319e8..699e528f32 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -36,4 +36,3 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/zcu106/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
