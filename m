Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0294DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4FFE40523;
	Mon,  5 Dec 2022 11:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4FFE40523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWMofZ0OX5PC; Mon,  5 Dec 2022 11:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F30DA4051B;
	Mon,  5 Dec 2022 11:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F30DA4051B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DEF01BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CFC84167E
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CFC84167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcKHTzuBHnHT for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CAE34167B
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CAE34167B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E2985BA2; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:19:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0954c013bc24888f22625716b1d4783373b3e8f3
X-Git-Newrev: ad26215165564259c5ddc3f0cae349f736523f8c
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.99E2985BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kv260_defconfig: use
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad26215165564259c5ddc3f0cae349f736523f8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynqmp_kria_kv260_defconfig.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 1 -
 configs/zynqmp_kria_kv260_defconfig    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index 874eb470ac..33c074ab8d 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 25bab4cbb4..522dc79e6c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/kv260/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
