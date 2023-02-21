Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCAC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E72D828F7;
	Tue, 21 Feb 2023 08:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E72D828F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUVvHeeBwcu7; Tue, 21 Feb 2023 08:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72E8082980;
	Tue, 21 Feb 2023 08:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E8082980
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1481BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7268742D12
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7268742D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7xsmw1Nd0_a for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEF342C78
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DEF342C78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C18C865BA; Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:38:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a86bbb4ae4a6f5580e4cbfad8ecf8ebf81b6e053
X-Git-Newrev: 2215548546af47f3cfce89a15bfc31f736cd74bc
X-Patchwork-Hint: ignore
Message-Id: <20230221083905.4C18C865BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_aarch64_ebbr:
 bump linux to 6.1.12 and u-boot to 2023.01
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
Content-Type: multipart/mixed; boundary="===============3701594896454523625=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3701594896454523625==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2215548546af47f3cfce89a15bfc31f736cd74bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump Linux kernel version to 6.1.12.
- Bump U-Boot version to 2023.01 and rename config fragment to make it
  clearer that it is not a complete config file.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-ebbr/{u-boot.config => u-boot.fragment} | 0
 configs/qemu_aarch64_ebbr_defconfig                        | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/aarch64-ebbr/u-boot.config b/board/qemu/aarch64-ebbr/u-boot.fragment
similarity index 100%
rename from board/qemu/aarch64-ebbr/u-boot.config
rename to board/qemu/aarch64-ebbr/u-boot.fragment
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index d293ad0e60..e3157089a9 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -39,9 +39,9 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_armv8a"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-ebbr/u-boot.config"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Host tools

--===============3701594896454523625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3701594896454523625==--
