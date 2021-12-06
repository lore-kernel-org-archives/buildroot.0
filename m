Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4924AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCFD8316F;
	Mon,  6 Dec 2021 21:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sr6kxZaZ3Pzd; Mon,  6 Dec 2021 21:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F3F8308D;
	Mon,  6 Dec 2021 21:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4F81BF995
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8887D404BD
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lekISlCDCy-O for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37AA5404B1
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 733CA81422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 21:51:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e72a25c33e2f1607499a43e6ccdb2f184c224871
X-Git-Newrev: 13add49b2aa94db3c2c94576de670b6423f42a9a
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.733CA81422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi_defconfig: bump kernel
 version
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
Content-Type: multipart/mixed; boundary="===============6011528453811095430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6011528453811095430==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13add49b2aa94db3c2c94576de670b6423f42a9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux kernel version to 5.15.4.

We enlarge the boot partition to follow the kernel image size increase and
update the documentation.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Reviewed-by: Dick Olsson <hi@senzilla.io>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/aarch64-efi/genimage-efi.cfg | 2 +-
 board/aarch64-efi/readme.txt       | 2 +-
 configs/aarch64_efi_defconfig      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 8ec1f10fd8..13d69e5e42 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -8,7 +8,7 @@ image efi-part.vfat {
 		}
 	}
 
-	size = 32M
+	size = 64M
 }
 
 image disk.img {
diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
index 164993eea4..0e7ea0b5dd 100644
--- a/board/aarch64-efi/readme.txt
+++ b/board/aarch64-efi/readme.txt
@@ -45,7 +45,7 @@ the instructions in [3], with qemu_arm64_defconfig.
 
 This should give you a nor_flash.bin, which you can use with qemu as an
 alternative to QEMU_EFI.fd. You will also need to change the machine
-specification to "-M virt,secure" on qemu command line, to enable TrustZone
+specification to "-M virt,secure=on" on qemu command line, to enable TrustZone
 support, and you will need to increase the memory with "-m 1024".
 
 [1]: https://github.com/ARM-software/ebbr
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 6cb8d1fac2..1bd06c51f3 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 
-# Linux headers same as kernel, a 5.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============6011528453811095430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6011528453811095430==--
