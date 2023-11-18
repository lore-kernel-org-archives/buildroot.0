Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA1C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B3441824;
	Mon,  4 Dec 2023 20:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B3441824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kut30DnjYE75; Mon,  4 Dec 2023 20:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DB641821;
	Mon,  4 Dec 2023 20:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DB641821
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0DCA1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B465600C7
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B465600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mspVlRnGTETr for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFD3460B01
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD3460B01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09AB879B7; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 19:23:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b41d4494a64b538ca0df2b3f18d19ae0a2e8a46a
X-Git-Newrev: a743087593a5fd5b33e2650591cada09929c27a6
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.D09AB879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memtest86: bump to version 6.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a743087593a5fd5b33e2650591cada09929c27a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bumped package version to 6.20
- as 6.20 prebuilt version is not available on same download site but
  source code is released at https://github.com/memtest86plus/memtest86plus/releases
  so updated mk file to download source from git release
- prebuilt binary not found in 6.20 package and also README.md
  does not mention any toolchain limitation for compilation
  so added source build command depending on 32-bit or 64-bit x86 target.
- corrected License file name
- installed memtest binaries to image folder like other bootable
  images(grub , kernel) are copied.
- updated config help as per package README.md

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Abhishek Anand <abhishek.anand@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - fix check-package errors
  - fix hash file
  - better install commands
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/memtest86/Config.in      | 35 +++++++++++++++++++++++++++--------
 package/memtest86/memtest86.hash |  4 ++--
 package/memtest86/memtest86.mk   | 29 ++++++++++++++++++++++-------
 3 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
index 79c0161020..c9a8cf749f 100644
--- a/package/memtest86/Config.in
+++ b/package/memtest86/Config.in
@@ -14,14 +14,33 @@ config BR2_PACKAGE_MEMTEST86
 	  back again and verifies whether the result of the read is the
 	  same as what was written to memory.
 
-	  Memtest86+ will only work on 32-bit or 64-bit x86 targets.
-	  It boots as an i486 program and autodetects hardware. It can
-	  be added to the grub2 boot menu by adding the following
-	  lines to the bottom of /boot/grub/grub.cfg - note the use of
-	  linux16.
-
-	  menuentry "Memtest86+" {
-	    linux16 /boot/memtest86+.bin
+	  Memtest86+ will only work on 32-bit or 64-bit x86 targets. It
+	  boots and autodetects hardware. Refer README.md for boot
+	  options.
+
+	  It can be loaded and run either directly by a PC BIOS (legacy
+	  or UEFI) or via an intermediate bootloader that supports the
+	  Linux 16-bit, 32-bit, 64-bit, or EFI handover boot protocol.
+
+	  It can be added to the grub2 boot menu by adding the following
+	  lines to the bottom of grub.cfg
+
+	  Example for legacy BIOS using the Linux 16-bit boot protocol,
+	  with built-in support for USB keyboards or running on a serial
+	  line:
+
+	  menuentry "Start Memtest86+ (USB keyboards)" {
+	      linux16 /boot/memtest.bin keyboard=both
+	  }
+	  menuentry "Start Memtest86+ (serial line)" {
+	      linux16 /boot/memtest.bin console=ttyS0,115200
+	  }
+
+	  Or for UEFI BIOS using the Linux 32-bit or 64-bit boot
+	  protocols, using USB keyboard:
+
+	  menuentry "Start Memtest86+ (USB keyboards)" {
+	      linux /EFI/BOOT/memtest.efi keyboard=both
 	  }
 
 	  Other boot loaders will have similar requirements.
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 559ae0ac6c..695e6a234b 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039  memtest86+-5.01.tar.gz
-sha256  2e15e2174b86640d7fbfcb62b51d9182062d9db71d66a46e5b01d736c68150ea  README
+sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86-6.20.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index eb071cc29d..c0f85755fe 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,15 +4,30 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 5.01
-MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
-MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
+MEMTEST86_VERSION = 6.20
+MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
-MEMTEST86_LICENSE_FILES = README
+MEMTEST86_LICENSE_FILES = LICENSE
+MEMTEST86_INSTALL_IMAGES = YES
+MEMTEST86_INSTALL_TARGET = NO
 
-# memtest86+ is sensitive to toolchain changes, use the shipped binary version
-define MEMTEST86_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/precomp.bin $(TARGET_DIR)/boot/memtest86+.bin
+ifeq ($(BR2_i386),y)
+MEMTEST86_BUILD_DIR = build32
+else
+ifeq ($(BR2_x86_64),y)
+MEMTEST86_BUILD_DIR = build64
+endif
+endif
+
+define MEMTEST86_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
+endef
+
+define MEMTEST86_INSTALL_IMAGES_CMDS
+	$(foreach ext, bin efi, \
+		$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.$(ext) \
+			$(BINARIES_DIR)/memtest.$(ext)
+	)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
