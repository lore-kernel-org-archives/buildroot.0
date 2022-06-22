Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ACFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D35AC409E9;
	Wed, 22 Jun 2022 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D35AC409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1mtuJf-K8k8; Wed, 22 Jun 2022 20:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8DFF40C96;
	Wed, 22 Jun 2022 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8DFF40C96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB1EB1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95D3260BFD
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D3260BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzXyEbRBNDJR for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B804D607DE
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B804D607DE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2A83F87523; Wed, 22 Jun 2022 20:13:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:24:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4de196a1cecbf74fd64a5660898abe7f49cb3fc9
X-Git-Newrev: f67720baa397698520fe5fd0903bb063eec680cb
X-Patchwork-Hint: ignore
Message-Id: <20220622201354.2A83F87523@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kv260_defconfig: fix
 to u-boot.itb generation
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

commit: https://git.buildroot.net/buildroot/commit/?id=f67720baa397698520fe5fd0903bb063eec680cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is a temporary fix for the kv260 u-boot.itb generation
until a proper fix has been implemented within u-boot.

The problem is u-boot can only be configured to use the kria k26
som dts configuration at build time, and the kv260 carrier board
overlay is missing from the build.  Without this, all of the carrier
board drivers are missing.

This patch will be removed from buildroot once u-boot can build a
correct u-boot.itb for the kria kv260 starter kit including the
carrier board overlay and corresponding drivers:

    https://lore.kernel.org/all/20920b0df6b067aca4040459a9677d7d1d6d766a.1615354376.git.viresh.kumar@linaro.org/

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[yann.morin.1998@free.fr: add URL provided by Luca]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/zynqmp/kria/kv260/kv260.sh    | 12 ++++++++++++
 configs/zynqmp_kria_kv260_defconfig |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
new file mode 100755
index 0000000000..e3467f3068
--- /dev/null
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# This is a temporary work around for generating kv260 u-boot.itb.
+# The problem is there is no way to currently configure u-boot to apply 
+# the carrier board dtb overlay during build, so all kv260 carrier board 
+# drivers are missing.
+# This will be removed when u-boot can build the kv260 u-boot.itb natively.
+
+UBOOT_DIR=$4
+
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index c1366b705c..d98ac89c63 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,8 +1,8 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
