Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C725CCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44819614DC;
	Wed,  1 Oct 2025 21:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y10s0nqZi-U; Wed,  1 Oct 2025 21:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53736155C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53736155C;
	Wed,  1 Oct 2025 21:00:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA25272
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1775641233
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sw7pFuMGubzy for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D3441241
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D3441241
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33C298285C; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:31:30 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: fe6a87cb86e3f49883560e78c93d57914d1f4e6b
X-Git-Newrev: a29eff08600041451e8c3c38f16236b202e65dbd
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.33C298285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] boot: add
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a29eff08600041451e8c3c38f16236b202e65dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Currently, the xilinx-embeddedsw and xilinx-prebuilt packages are appearing
for any aarch64 processor. As all Xilinx processors that need these packages
are ARM Cortex-A53 or ARM Cortex-A72, this means that these packages are
often appearing as options for non-Xilinx platforms.

To reduce this occurrence, this patch creates a new symbol
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS to limit the appearance of the
xilinx-embeddedsw and xilinx-prebuilt boot packages to only platforms based
on the BR2_cortex_a53 or BR2_cortex_a72 CPU and aarch64 architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5b1a52aea041417e37bccadcc74eb3c3c10927be)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/Config.in                   | 11 +++++++++++
 boot/xilinx-embeddedsw/Config.in |  2 --
 boot/xilinx-prebuilt/Config.in   |  1 -
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/boot/Config.in b/boot/Config.in
index f167346cdf..08a6c8353d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,3 +1,11 @@
+config BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	bool
+	default y
+	# All Xilinx SoCs using this package are aarch64 only
+	depends on BR2_aarch64
+	# only CPUs with corresponding firmwares:
+	depends on BR2_cortex_a53 || BR2_cortex_a72
+
 menu "Bootloaders"
 
 source "boot/afboot-stm32/Config.in"
@@ -19,7 +27,10 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+
+if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
+endif
 
 endmenu
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..5f115726e1 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,11 +1,9 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..a37bdba540 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_TARGET_XILINX_PREBUILT
 	bool "xilinx-prebuilt"
-	depends on BR2_aarch64
 	help
 	  Pre-built firmware files for Xilinx boards.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
