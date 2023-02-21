Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B318C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EFB82883;
	Tue, 21 Feb 2023 08:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EFB82883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY2z3_pHOQna; Tue, 21 Feb 2023 08:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2082A828F7;
	Tue, 21 Feb 2023 08:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2082A828F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4467E1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BB01828F7
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB01828F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yt58e9kNDgUf for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9DA82883
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9DA82883
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EF99865B9; Tue, 21 Feb 2023 08:39:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:38:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 07634619d9738154e46e9b309d0697d223639167
X-Git-Newrev: a86bbb4ae4a6f5580e4cbfad8ecf8ebf81b6e053
X-Patchwork-Hint: ignore
Message-Id: <20230221083905.3EF99865B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_arm_ebbr: bump
 linux to 6.1.12 and u-boot to 2023.01
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
Content-Type: multipart/mixed; boundary="===============3031572067561494713=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3031572067561494713==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a86bbb4ae4a6f5580e4cbfad8ecf8ebf81b6e053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump Linux kernel version to 6.1.12.
- Bump U-Boot version to 2023.01 and follow CONFIG_SYS_TEXT_BASE renaming.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/arm-ebbr/u-boot.fragment | 2 +-
 configs/qemu_arm_ebbr_defconfig     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/arm-ebbr/u-boot.fragment b/board/qemu/arm-ebbr/u-boot.fragment
index bfc382cde9..66fe910f16 100644
--- a/board/qemu/arm-ebbr/u-boot.fragment
+++ b/board/qemu/arm-ebbr/u-boot.fragment
@@ -31,5 +31,5 @@ CONFIG_PARTITION_TYPE_GUID=y
 CONFIG_RNG_OPTEE=y
 CONFIG_RTC_EMULATION=y
 CONFIG_SCMI_FIRMWARE=y
-CONFIG_SYS_TEXT_BASE=0x60000000
 CONFIG_TEE=y
+CONFIG_TEXT_BASE=0x60000000
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index f3e2d42a54..8fbb3069bc 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============3031572067561494713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3031572067561494713==--
