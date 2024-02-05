Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D74C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972244188F;
	Mon,  5 Feb 2024 15:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972244188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzY0r8dW8k9F; Mon,  5 Feb 2024 15:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB2441846;
	Mon,  5 Feb 2024 15:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB2441846
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5D851BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F72960EEE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F72960EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGJb8z3DXbL6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:14:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADCAF605A6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADCAF605A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C91086D24; Mon,  5 Feb 2024 15:14:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:13:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f50c4cd2b72b8a04600e525e9d848df0ad42e14
X-Git-Newrev: 8fb52098859fa5cf7ecf4db30ff8e0276687832f
X-Patchwork-Hint: ignore
Message-Id: <20240205151436.9C91086D24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fb52098859fa5cf7ecf4db30ff8e0276687832f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the include path for the device tree. Since Linux 6.5-rc1
(724ba67515 "ARM: dts: Move .dts files to vendor sub-directories"),
sama5d31.dtsi lives in the microchip subdirectory.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig      | 4 ++--
 configs/acmesystems_acqua_a5_512mb_defconfig      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
index 39fa4df1b1..a7a4a20352 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
@@ -9,7 +9,7 @@
  * Licensed under GPLv2 or later.
  */
 /dts-v1/;
-#include "sama5d31.dtsi"
+#include "microchip/sama5d31.dtsi"
 
 / {
 	model = "Acme Systems Acqua SOM";
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 5b32234294..ef57734194 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,13 +2,13 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 69294cbec0..a69e2a2251 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,13 +2,13 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
