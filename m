Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6169BCD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4E860E8B;
	Tue,  9 Apr 2024 20:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYCDuQhpA_d3; Tue,  9 Apr 2024 20:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E5360EC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E5360EC0;
	Tue,  9 Apr 2024 20:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCA4E1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A006181770
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9uhP6MpzW9X for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BEA381773
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BEA381773
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9448585E31; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 22:36:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5d8cd5173f5a703ab1a34cd13b66a9fada8408e
X-Git-Newrev: 700ba1df1e4320bd02fcd99b47c2e2c71b1b4b9c
X-Patchwork-Hint: ignore
Message-Id: <20240409205030.9448585E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-k3: switch ti_am6{2,
 4}x_sk_defconfig to HS-FS by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=700ba1df1e4320bd02fcd99b47c2e2c71b1b4b9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From Andreas Dannenberg (TI K3 architect) [1]:

  "HS-FS should be the default for all TI AM6x devices. This is our
  "production silicon" and what's used for (almost) all projects,
  especially new projects. This being said having support for GP device
  variants still is desirable for existing boards/projects, such as the
  current BeaglePlay boards (amongst earlier version of TI starter kit
  EVMs for AM6x)."

See further details on e2e Forum [2]:

  "Unfortunately with this transition any existing GP device based AM62x
  (and AM64x) boards will no longer boot with MMC/SD card images generated"

For such existing GP device based AM62x (and AM64x) boards, users have
to provide the tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.

[1] http://lists.busybox.net/pipermail/buildroot/2024-February/685821.html
[2] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto

Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am62x-sk/readme.txt  | 16 ++++++++++++++++
 board/ti/am64x-sk/readme.txt  | 16 ++++++++++++++++
 configs/ti_am62x_sk_defconfig |  1 -
 configs/ti_am64x_sk_defconfig |  1 -
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/board/ti/am62x-sk/readme.txt b/board/ti/am62x-sk/readme.txt
index 5af1c59c2d..a8d0c08dc0 100644
--- a/board/ti/am62x-sk/readme.txt
+++ b/board/ti/am62x-sk/readme.txt
@@ -17,6 +17,22 @@ Optional: modify the configuration:
 
 $ make menuconfig
 
+IMPORTANT: make sure to use the tiboot3 firmware that match with the TI
+K3 SoC boot ROM (tiboot3-am62x-{gp/hs-fs/hs}-*.bin) used on the board.
+
+HS-FS should be the default for all TI AM6x devices but earlier version
+of TI starter kit EVMs for AM6x was produced with a GP device.
+
+See further details on e2e Forum [1] :
+
+   "Unfortunately with this transition any existing GP device based AM62x
+   (and AM64x) boards will no longer boot with MMC/SD card images generated"
+
+For such existing GP device based AM62x boards, users have to provide the
+tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.
+
+[1]: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
+
 Build:
 
 $ make
diff --git a/board/ti/am64x-sk/readme.txt b/board/ti/am64x-sk/readme.txt
index 5ddbb836ed..73215cb591 100644
--- a/board/ti/am64x-sk/readme.txt
+++ b/board/ti/am64x-sk/readme.txt
@@ -17,6 +17,22 @@ Optional: modify the configuration:
 
 $ make menuconfig
 
+IMPORTANT: make sure to use the tiboot3 firmware that match with the TI
+K3 SoC boot ROM (tiboot3-am64x-{gp/hs-fs/hs}-*.bin) used on the board.
+
+HS-FS should be the default for all TI AM6x devices but earlier version
+of TI starter kit EVMs for AM6x was produced with a GP device.
+
+See further details on e2e Forum [1] :
+
+   "Unfortunately with this transition any existing GP device based AM62x
+   (and AM64x) boards will no longer boot with MMC/SD card images generated"
+
+For such existing GP device based AM64x boards, users have to provide the
+tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.
+
+[1]: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
+
 Build:
 
 $ make
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index fa2c008d4c..5c7b97b3b0 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
-BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index f7c6d16b35..28e97f94e2 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
-BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
