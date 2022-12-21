Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B50C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 16:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3166780DAB;
	Wed, 21 Dec 2022 16:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3166780DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hn9fTx7MlDzz; Wed, 21 Dec 2022 16:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BEE080D96;
	Wed, 21 Dec 2022 16:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEE080D96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55BC61BF23C
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AE5C40547
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE5C40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dH-DgFw-8noK for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F71A40B85
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F71A40B85
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A2E486C09; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 16:53:21 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b8a37f554f70586c776cffab8ddb93eb51a889e0
X-Git-Newrev: 48cc7c655360890d8197493ffacea9c1450cac53
X-Patchwork-Hint: ignore
Message-Id: <20221221160354.3A2E486C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 board/zynqmp/kria/patches: fix build by dropping U-Boot patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=48cc7c655360890d8197493ffacea9c1450cac53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Since commit
5bbc20154e2291b967b7fc66ca4f85a2b47dcfd1 ("configs/zynqmp_kria_kv260_defconfig:
bump to Xilinx 2022.2"), we're using U-Boot version Xilinx 2022.2,
which already carries the psu_init_gpl.c, causing the build to fail as
our patch doesn't apply.

Fix this by dropping the no longer needed patch.

Fixes: 5bbc20154e2291b967b7fc66ca4f85a2b47dcfd1 ("configs/zynqmp_kria_kv260_defconfig: bump to Xilinx 2022.2")
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 607665e3cecd967759344d6c702babe82ffa604c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 7afc7748b0..e5b92fa031 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -37,4 +37,3 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
