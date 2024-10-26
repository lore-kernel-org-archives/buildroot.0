Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01333D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A96E540361;
	Sat, 26 Oct 2024 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQZXkumawjV6; Sat, 26 Oct 2024 14:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5E34038A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5E34038A;
	Sat, 26 Oct 2024 14:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4858F2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3637B40198
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtgOdvW96k3C for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 146AD40175
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 146AD40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F240983CD0; Sat, 26 Oct 2024 14:48:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:44:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c7d79eba2bc0b0ffc1c9b02abcc0d28c6afebc
X-Git-Newrev: 4693fd4f72b1c4b29003a08a1dd9ed6fb60f4d8b
X-Patchwork-Hint: ignore
Message-Id: <20241026144834.F240983CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1046a-frwy: add hashes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4693fd4f72b1c4b29003a08a1dd9ed6fb60f4d8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                    | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash             | 2 ++
 board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash  | 1 +
 board/freescale/ls1046a-frwy/patches/linux/linux.hash                  | 2 ++
 board/freescale/ls1046a-frwy/patches/uboot/uboot.hash                  | 2 ++
 configs/ls1046a-frwy_defconfig                                         | 3 ++-
 6 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1cfb2939d8..9e81400f89 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -172,7 +172,6 @@ configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
-configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..17c409530d
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash b/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
new file mode 100644
index 0000000000..bd5e29d026
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..d0cc110fdd
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 077e2f2dfa..560630fde7 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -1,7 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches board/freescale/common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1046afrwy"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
