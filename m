Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A796CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 540A440FF7;
	Thu,  6 Oct 2022 19:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 540A440FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZUayWt9QrDW; Thu,  6 Oct 2022 19:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E4B840A9C;
	Thu,  6 Oct 2022 19:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E4B840A9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACEE11BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92AD583ECF
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92AD583ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VenNeMPkv_nP for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:45:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9848283EA6
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9848283EA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 858A986A63; Thu,  6 Oct 2022 19:45:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 21:45:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b31acdccef583a3da1d538abc347a5c8467c2598
X-Git-Newrev: 9e698c552bab51703014788ac1d61893868ee316
X-Patchwork-Hint: ignore
Message-Id: <20221006194555.858A986A63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump version to
 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e698c552bab51703014788ac1d61893868ee316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mender-grubenv no longer uses the mender_grubenv* directories, instead opting
to put the mender_grubenv directories in a grub-mender-grubenv top-level
directory. While there is a legacy install mode which keeps the two separate
directories, it is better to move forward and rip the bandaid off before it
becomes too painful to update in the future if the legacy option is removed
entirely.

- Update the license file sha256 sum due to a year change.

- mender-grubenv no longer installs grub.cfg, so mender_grub.cfg must be copied
  manually to grub.cfg.

- BOOT_DIR replaces ENV_DIR in the Makefile.

- The sleep grub2 module is now a requirement.

- /etc/mender_grubenv.config file must be present on the system for the
  grub-mender-grubenv-{print,set} scripts to work properly.

In addition to the above changes, update the mender example board file to work
with the updated mender-grubenv version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/genimage-efi.cfg       |  3 +++
 configs/mender_x86_64_efi_defconfig        |  2 +-
 package/mender-grubenv/mender-grubenv.hash |  4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 22 +++++++++++++++-------
 4 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
index 10cefe2380..9c2723d8fb 100644
--- a/board/mender/x86_64/genimage-efi.cfg
+++ b/board/mender/x86_64/genimage-efi.cfg
@@ -3,6 +3,9 @@ image efi-part.vfat {
 		file EFI {
 			image = "efi-part/EFI"
 		}
+		file grub-mender-grubenv {
+			image = "efi-part/grub-mender-grubenv"
+		}
 		file bzImage {
 			image = "bzImage"
 		}
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 2ec6f6f76c..25a463abb3 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_X86_64_EFI=y
 # Add mandatory modules from MENDER_GRUBENV_MANDATORY_MODULES
-BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp"
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp sleep"
 BR2_TARGET_GRUB2_INSTALL_TOOLS=y
 
 # Required tools to create a mender image
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 3be5f51a9e..193bff073b 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca  mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
+sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 9d5be8d8f4..8679ad9236 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 1a7db967495bbe8be53b7a69dcb42822f39d9a74
+MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -30,13 +30,15 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(@D)/mender_grub.cfg \
+		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
+		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(BINARIES_DIR)/boot-part/
 endef
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
@@ -45,13 +47,16 @@ MENDER_GRUBENV_MODULES_MISSING_EFI = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/EFI/BOOT
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/EFI/BOOT
 
 define MENDER_GRUBENV_INSTALL_EFI_CFG
 	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(@D)/mender_grub.cfg \
+		$(TARGET_DIR)/boot/EFI/BOOT/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
-		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mender-grubenv \
+		$(BINARIES_DIR)/efi-part/
 endef
 endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
 
@@ -75,7 +80,10 @@ define MENDER_GRUBENV_BUILD_CMDS
 endef
 
 define MENDER_GRUBENV_INSTALL_TARGET_CMDS
-	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) \
+		install install-boot-env
+	# The grub-mender-grubenv-* utilities use this file to function.
+	echo 'ENV_DIR=/boot/grub-mender-grubenv' > $(TARGET_DIR)/etc/mender_grubenv.config
 endef
 
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
