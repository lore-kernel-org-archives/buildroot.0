Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 15:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70072404A3;
	Thu,  3 Nov 2022 15:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70072404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCRADrbNNTcE; Thu,  3 Nov 2022 15:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97A2A404B0;
	Thu,  3 Nov 2022 15:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97A2A404B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D44161BF3BF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF5E581256
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5E581256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKpSGTIOdn5i for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B4480FA8
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3B4480FA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF6CB87BA5; Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 16:43:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0394cc454460ebc99202faa4c10365998e72925
X-Git-Newrev: 75eb50dcf6bfcef5b3bf2c58b795e6852ba3eab5
X-Patchwork-Hint: ignore
Message-Id: <20221103154513.BF6CB87BA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu10x_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=75eb50dcf6bfcef5b3bf2c58b795e6852ba3eab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynqmp_zcu102 and zynqmp_zcu106 defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/zcu102/uboot.fragment | 1 -
 board/zynqmp/zcu106/uboot.fragment | 1 -
 configs/zynqmp_zcu102_defconfig    | 2 +-
 configs/zynqmp_zcu106_defconfig    | 2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/board/zynqmp/zcu102/uboot.fragment b/board/zynqmp/zcu102/uboot.fragment
deleted file mode 100644
index 52d6d9dff8..0000000000
--- a/board/zynqmp/zcu102/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
diff --git a/board/zynqmp/zcu106/uboot.fragment b/board/zynqmp/zcu106/uboot.fragment
deleted file mode 100644
index cd571171ac..0000000000
--- a/board/zynqmp/zcu106/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 66c24c4b64..e27dfdb6c9 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 896fea0ab2..4113a9025a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
