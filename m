Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C7CDD0C6
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3368080D4D;
	Tue, 22 Oct 2024 19:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6o4-xaZJpjlJ; Tue, 22 Oct 2024 19:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EB7F80D4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB7F80D4F;
	Tue, 22 Oct 2024 19:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF70963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39A7460604
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v730BITGvg-V for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A24C60671
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A24C60671
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:01:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B6B8613F; Tue, 22 Oct 2024 19:01:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 20:58:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 848c86a7cecb2123e7ae3e7379fc6baf4bfd115d
X-Git-Newrev: 7880f89a6ad3216cd3c4dbd8cd30e76a554fa881
X-Patchwork-Hint: ignore
Message-Id: <20241022190151.21B6B8613F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi: bump Linux to 6.10.12
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
Content-Type: multipart/mixed; boundary="===============1851708716852705713=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1851708716852705713==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7880f89a6ad3216cd3c4dbd8cd30e76a554fa881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it:
- Turn on hashes verification and add a hash for the Linux kernel.
- Linux kernel needs host-python3; add it.
- Convert to `make savedefconfig' format.
- Fix shellcheck warnings in our post-image script and update
  .checkpackageignore.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
[Julien: rebased the patch to resolve conflicts with commit
  edc0a6b1a "configs: regenerate all defconfigs"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                        | 2 --
 board/aarch64-efi/patches/linux-headers/linux-headers.hash | 1 +
 board/aarch64-efi/patches/linux/linux.hash                 | 2 ++
 board/aarch64-efi/post-image.sh                            | 4 ++--
 configs/aarch64_efi_defconfig                              | 7 +++++--
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 207d72fd20..f38b900735 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,4 +1,3 @@
-board/aarch64-efi/post-image.sh Shellcheck
 board/amarula/vyasa/post-build.sh Shellcheck
 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream
@@ -104,7 +103,6 @@ boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch lib_patch.Upstream
 boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_patch.Upstream
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
-configs/aarch64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/aarch64-efi/patches/linux-headers/linux-headers.hash b/board/aarch64-efi/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/aarch64-efi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/aarch64-efi/patches/linux/linux.hash b/board/aarch64-efi/patches/linux/linux.hash
new file mode 100644
index 0000000000..20941a269b
--- /dev/null
+++ b/board/aarch64-efi/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  524858852f5869a9ef17de8b1e6e7faf05bcb2c462bc96b3c24dbf82ede373cf  linux-6.10.12.tar.xz
diff --git a/board/aarch64-efi/post-image.sh b/board/aarch64-efi/post-image.sh
index f0214dc866..1aef15ef6f 100755
--- a/board/aarch64-efi/post-image.sh
+++ b/board/aarch64-efi/post-image.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR=$(dirname "$0")
 
-cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index f322f04c66..9f284ff74b 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,13 +1,16 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="200M"

--===============1851708716852705713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1851708716852705713==--
