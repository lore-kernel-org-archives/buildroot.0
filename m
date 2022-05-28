Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202D6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B836A84CDC;
	Sat, 28 May 2022 09:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSMMttwP6DxO; Sat, 28 May 2022 09:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF7984CD7;
	Sat, 28 May 2022 09:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94D531BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A59261093
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQpYE-BZJvjb for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C90060B62
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2169A84245; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:09:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d54e65686a783624b7707d1e6fc703e37eb26b83
X-Git-Newrev: 2aafb4974d833fceab31b5e2a7133427718515d9
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.2169A84245@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 configs/zynqmp_zcu106_defconfig: uboot dp pll patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=2aafb4974d833fceab31b5e2a7133427718515d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This patch fixes the DP audio and video PLL configurations for the
zynqmp-zcu106-revA evaluation board.

The Linux DP driver expects the DP to be using the following PLL config:
  - DP video PLL should use the VPLL (0x0)
  - DP audio PLL should use the RPLL (0x3)

Register 0xFD1A0070 configures the DP video PLL.
Register 0xFD1A0074 configures the DP audio PLL.

This patch was build and run tested on a zynqmp-zcu106-revA target board.

Upstream-Status: submitted (https://lore.kernel.org/all/62538b4a04dee28a6fc8ac5b85f8c845a5a76aa4.1651740988.git.michal.simek@amd.com/)
This patch will be removed from buildroot in a future release when no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 81253000885b3eaa2f521a998463c119a1c989ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 ++++++++++++++++++++++
 configs/zynqmp_zcu106_defconfig                    |  1 +
 2 files changed, 41 insertions(+)

diff --git a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
new file mode 100644
index 0000000000..4281880da0
--- /dev/null
+++ b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
@@ -0,0 +1,40 @@
+From aaaa10b613165b7790fe1c084de007240b5bd77a Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Thu, 5 May 2022 13:34:43 +0100
+Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-zcu102-revA: Fix DP PLL
+ configuration
+
+This patch fixes the DP audio and video PLL configurations
+for the zynqmp-zcu106-revA evaluation board
+
+The Linux DP driver expects the DP to be using the following PLL config:
+  - DP video PLL should use the VPLL (0x0)
+  - DP audio PLL should use the RPLL (0x3)
+
+Register 0xFD1A0070 configures the DP video PLL.
+Register 0xFD1A0074 configures the DP audio PLL.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+---
+ board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+index 15f0be1a43..cbc436289f 100644
+--- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+@@ -81,8 +81,8 @@ static unsigned long psu_clock_init_data(void)
+ 	psu_mask_write(0xFF5E0104, 0x00000007U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000F00U);
+ 	psu_mask_write(0xFD1A00A0, 0x01003F07U, 0x01000200U);
+-	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010203U);
+-	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C00U);
++	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
++	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
+ 	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01011303U);
+ 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
+ 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
+-- 
+2.17.1
+
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 27967fc0bd..e1ea27a496 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/zcu106/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
