Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8D5C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACE04059C;
	Thu, 23 Feb 2023 22:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ACE04059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5o2dLtYc3ua; Thu, 23 Feb 2023 22:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21528405D7;
	Thu, 23 Feb 2023 22:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21528405D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE6CF1BF980
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7FF681E30
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FF681E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSlsecCQPtOZ for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D5681E2A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D5681E2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3E25869E4; Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:43:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3254a2886a4e20111e5c87614f6f374ec626b755
X-Git-Newrev: b793f3a49e1ef8a48671ce19579586a0b018179d
X-Patchwork-Hint: ignore
Message-Id: <20230223224433.E3E25869E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/arm_foundationv8: bump
 to Linux 6.1.13
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
Content-Type: multipart/mixed; boundary="===============8241600019641426599=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8241600019641426599==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b793f3a49e1ef8a48671ce19579586a0b018179d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump Linux kernel to v6.1.13 and increase the rootfs size accordingly.
- Bump the FVP in the readme to version 11.20 build 15 and update the
  command line.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/arm/foundation-v8/readme.txt | 4 ++--
 configs/arm_foundationv8_defconfig | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index b5106f015e..cb0fe08b87 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,14 +3,14 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://silver.arm.com/download/download.tm?pv=4807186
+  https://armkeil.blob.core.windows.net/developer/Files/downloads/ecosystem-models/Foundation_Platform_11.20_15_Linux64.tgz
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
 
 Finally, boot your system with:
 
- ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-6.4/Foundation_Platform \
+ ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-9.3/Foundation_Platform \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
     --network=nat \
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 3c63f5dc76..102fe8fd09 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,15 +1,16 @@
 BR2_aarch64=y
-# Linux headers same as kernel, a 5.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.20"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8-gicv3-psci"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_BOOT_WRAPPER_AARCH64=y
 BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="arm/foundation-v8-gicv3-psci"

--===============8241600019641426599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8241600019641426599==--
