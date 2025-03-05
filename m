Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4854C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CA642444;
	Mon, 19 May 2025 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuKRRckUnxsb; Mon, 19 May 2025 10:40:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1959E4125C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1959E4125C;
	Mon, 19 May 2025 10:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 275DB193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3843640C40
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCG71JInbW7e for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6438740734
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6438740734
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 562E38725C; Mon, 19 May 2025 10:39:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 20:07:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 290f6bb45a247e3b5d1718d29dc5ec4e9ea774f4
X-Git-Newrev: 8a8b6a3a2f9774bae073aefdbd35e3127ea15f51
X-Patchwork-Hint: ignore
Message-Id: <20250519103941.562E38725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/acmesystems_acqua_a5_*: switch to BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a8b6a3a2f9774bae073aefdbd35e3127ea15f51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Before updating the kernel to 6.12 version, use the newly introduced
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR option to provide the Out-of-tree
Device Tree Source file with its vendor subdirectory that is needed
since kernel 6.12 [1].

Revert the sama5d31.dtsi include path update added by the previous
kernel version bump 6.6.12 [2].

As noticed by Michael Walle, newer OOT device trees should use the
same #include directives as the in-tree device trees to ease
sharing the files between u-boot, linux and OOT external trees [3].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
[3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/

Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig                          | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
similarity index 99%
rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 411d1942f5..60be8a67cd 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -9,7 +9,7 @@
  * Licensed under GPLv2 or later.
  */
 /dts-v1/;
-#include "microchip/sama5d31.dtsi"
+#include "sama5d31.dtsi"
 
 / {
 	model = "Acme Systems Acqua SOM";
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index b102dde0ba..d21ff97216 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index da54eaf620..d83a058537 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
