Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C9FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E377360BDA;
	Sun, 11 Dec 2022 16:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E377360BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GH7zL-w__sgP; Sun, 11 Dec 2022 16:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0585160BD4;
	Sun, 11 Dec 2022 16:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0585160BD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3951BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45DF181493
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45DF181493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11X58I51oi08 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2458148B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2458148B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56264864B0; Sun, 11 Dec 2022 16:58:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:56:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca9b63a1e0bfa474a75522e62d671ed8b080f19f
X-Git-Newrev: 607665e3cecd967759344d6c702babe82ffa604c
X-Patchwork-Hint: ignore
Message-Id: <20221211165800.56264864B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria/patches: fix build by
 dropping U-Boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=607665e3cecd967759344d6c702babe82ffa604c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
5bbc20154e2291b967b7fc66ca4f85a2b47dcfd1 ("configs/zynqmp_kria_kv260_defconfig:
bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
which already carries the psu_init_gpl.c, causing the build to fail as
our patch doesn't apply.

Fix this by dropping the no longer needed patch.

Fixes: 5bbc20154e2291b967b7fc66ca4f85a2b47dcfd1 ("configs/zynqmp_kria_kv260_defconfig: bump to Xilinx 2022.2")
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...p-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch | 39 ----------------------
 configs/zynqmp_kria_kv260_defconfig                |  1 -
 2 files changed, 40 deletions(-)

diff --git a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
deleted file mode 100644
index 99dc056115..0000000000
--- a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c6677ee92c05e3f0f22cc08e3b309a996292562f Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Fri, 13 May 2022 14:02:07 +0100
-Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-sm-k26-revA: Fix DP PLL
- configuration
-
-This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
-
-The Linux DP driver expects the DP to be using the following PLL config:
-  - DP video PLL should use the VPLL (0x0)
-  - DP audio PLL should use the RPLL (0x3)
-  - DP system time clock PLL should use RPLL (0x3)
-
-Register 0xFD1A0070 configures the DP video PLL.
-Register 0xFD1A0074 configures the DP audio PLL.
-Register 0xFD1A007C configures the DP system time clock PLL.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-index ed025790bc..e5598807e8 100644
---- a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-@@ -74,6 +74,9 @@ static unsigned long psu_clock_init_data(void)
- 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000A00U);
- 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
- 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
-+	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
-+	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
-+	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01013803U);
- 	psu_mask_write(0xFD1A0080, 0x00003F07U, 0x00000200U);
- 	psu_mask_write(0xFD1A0084, 0x07003F07U, 0x07000100U);
- 	psu_mask_write(0xFD1A00B8, 0x01003F07U, 0x01000203U);
--- 
-2.17.1
-
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 3214d45fa9..5c53122b46 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,4 +38,3 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
