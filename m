Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F59D26D9A
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A4C83C93;
	Fri,  9 Jan 2026 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3LWoMAV-5xH; Fri,  9 Jan 2026 19:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF17083C94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767988474;
	bh=o88QMhYDfDQBdL8jEmWRd+mO20h7SyNsnTNPNLYa4iI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bZhJGS2Q2i/7RkKIJEjY8aFI/Xskplrwj8YjobasMOn58lppaN3dBRIayh2QuraQT
	 uaRI/f3pXiGgK52VXq0GhOVb9LwJ1Sm/B2GCYzurT6K0Yx4XxTDcDBFBNNcP8NPe94
	 U6NyHh+oKyWX41kxn05tNcFNszQoBoTWEDfhI0rVDeY9GbSy9w9BUU6ghdgaq7Vw96
	 G+ZteP5w6mpi7I+yg8a5HfLH6KXpJ6ZPLHqUxj19Rw5Mkymqn7IKQM11hsSPBmfjl8
	 6/hI6OmzLIGZtG7EslRTyvagDi/70RKeK0OYw42JRhjAxbVwE6VzVqzhbZM5mPmmZ2
	 iiXdO3XiKY6VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF17083C94;
	Fri,  9 Jan 2026 19:54:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E799112E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF8940ADD
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9NL_kEZbUBY for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 19:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FBE840284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBE840284
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:54:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 089E6883C8; Fri,  9 Jan 2026 19:54:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 19:40:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09baeb465339eb3ca9786ff5c4afeed03a8fc900
X-Git-Newrev: 393fae1a1d191962d5650275e35a9eff3271ce9d
X-Patchwork-Hint: ignore
Message-Id: <20260109195431.089E6883C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f746_disco_sd: bump Linux to
 5.15.197 and U-Boot to 2026.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=393fae1a1d191962d5650275e35a9eff3271ce9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 5.15.197 and U-Boot to
version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f746_disco_sd_defconfig                              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 27549bda93..50c6664f95 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 98a5c53aaf..b6a925ea4e 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index cd2123b992..027ecc0f4b 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.194"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
