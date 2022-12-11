Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECD2C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC734EC42;
	Mon, 20 Feb 2023 22:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC734EC42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIXCvsYR-Y_G; Mon, 20 Feb 2023 22:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1C24EF92;
	Mon, 20 Feb 2023 22:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1C24EF92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD7F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE7B5416C9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE7B5416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mr44MxHojZdp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C49BA416C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C49BA416C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C218D86494; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:55:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f8592b686e4aa1085ace7c7f25c7c777a3fd2ec
X-Git-Newrev: ca9b63a1e0bfa474a75522e62d671ed8b080f19f
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.C218D86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/zynqmp/zcu106/patches:
 fix build by dropping U-Boot patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca9b63a1e0bfa474a75522e62d671ed8b080f19f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit
3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig:
bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
which already carries the psu_init_gpl.c, causing the build to fail as
our patch doesn't apply.

Fix this by dropping the no longer needed patch.

Fixes: 3c997c457a4ee33d81e6b93e4f6f147bb9e861e9 ("configs/zynqmp_zcu106_defconfig: bump to Xilinx 2022.2")
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
