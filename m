Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CE2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2356741559;
	Mon,  7 Nov 2022 22:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2356741559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 553So1wnucjW; Mon,  7 Nov 2022 22:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5DD414CE;
	Mon,  7 Nov 2022 22:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5DD414CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3DEC1BF954
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD63819F6
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD63819F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7taQ1oCq10no for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:19:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A100581A6F
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A100581A6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EE76881AD; Mon,  7 Nov 2022 22:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:18:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7c0def2452fc919b1eb4f790669f240392cde84f
X-Git-Newrev: 0954c013bc24888f22625716b1d4783373b3e8f3
X-Patchwork-Hint: ignore
Message-Id: <20221107221915.8EE76881AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/zynq_xxx_defconfig:
 use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=0954c013bc24888f22625716b1d4783373b3e8f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynq_zc706, zynq_zed and zynq_microzed defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynq/microzed/uboot.fragment | 1 -
 board/zynq/zc706/uboot.fragment    | 1 -
 board/zynq/zed/uboot.fragment      | 1 -
 configs/zynq_microzed_defconfig    | 2 +-
 configs/zynq_zc706_defconfig       | 2 +-
 configs/zynq_zed_defconfig         | 2 +-
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
deleted file mode 100644
index bc4dffaffa..0000000000
--- a/board/zynq/microzed/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
deleted file mode 100644
index ad5efa6204..0000000000
--- a/board/zynq/zc706/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
deleted file mode 100644
index d58fcd5439..0000000000
--- a/board/zynq/zed/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 10a4f4095f..5f3fc5e6ab 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 82c47be7a5..0daaeca872 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 34e1b67184..74c2e8c4d3 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
