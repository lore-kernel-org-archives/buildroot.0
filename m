Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57167CF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C42413DC;
	Wed,  2 Oct 2024 20:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wos9rE4xBjUC; Wed,  2 Oct 2024 20:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E553941402
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E553941402;
	Wed,  2 Oct 2024 20:59:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7641BF232
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 783EB41107
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBrkCtoh2ZlA for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35AA1410F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35AA1410F7
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:59:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20F9284773; Wed,  2 Oct 2024 20:59:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:59:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a38fcbf1d96d630cecb743e188fce1e3daabc14c
X-Git-Newrev: e003ff76975798096024046bd5f6a3ef15c9e6e2
X-Patchwork-Hint: ignore
Message-Id: <20241002205930.20F9284773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump version to
 38e5043a215f696d126a2d707c9db9aeb93cfb2d
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e003ff76975798096024046bd5f6a3ef15c9e6e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 174bf40fb520893a5ef69ef02c22aa232b56bd67 introduced the usage of
`flock -w` to prevent errors during concurrent access of the environment
(IE: When a process is editing an env and another is trying to restore it.)

As such, mender-grubenv now requires util-linux and the basic binaries
set, as the busybox flock does not provide the -w argument.

Other changes:
  - The boot directory is now expected to be /boot instead of /boot/grub
  - License hash changed for 2023 -> 2024 year date (see commit f54ecfb)

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mender-grubenv/Config.in           | 2 ++
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index f27eb09e34..8505458793 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	depends on BR2_PACKAGE_MENDER # runtime
 	depends on BR2_TARGET_GRUB2
 	depends on !(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT && BR2_TARGET_GRUB2_HAS_EFI_BOOT)
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # flock -w
 	help
 	  Contains the boot scripts and tools used by Mender to
 	  integrate with the GRUB bootloader.
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 193bff073b..d7f784493c 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  0bac59698165a8dafdd282610246addd7bebf41612efa88c77b779f8ffb5ed9d  mender-grubenv-38e5043a215f696d126a2d707c9db9aeb93cfb2d.tar.gz
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 8679ad9236..cdda26bfbb 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
+MENDER_GRUBENV_VERSION = 38e5043a215f696d126a2d707c9db9aeb93cfb2d
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
 # Grub2 must be built first so this package can overwrite the config files
 # provided by grub.
-MENDER_GRUBENV_DEPENDENCIES = grub2
+MENDER_GRUBENV_DEPENDENCIES = grub2 util-linux
 MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 MENDER_GRUBENV_MAKE_ENV = \
@@ -30,14 +30,14 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
 	cp -dpfr $(@D)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
