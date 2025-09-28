Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86669CAC5BD
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 11:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F13140679;
	Sun, 28 Sep 2025 11:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4GQwNXFVyac; Sun, 28 Sep 2025 11:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36A9B4065E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A9B4065E;
	Sun, 28 Sep 2025 11:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D32111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4120140662
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOU7OzQc3YOm for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 11:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B26E4065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B26E4065E
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:29:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65C69865D7; Sun, 28 Sep 2025 11:29:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 13:26:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56e4b433017280a6456aad9f3ca4179d541e9761
X-Git-Newrev: 0ad6f18547f01d306e69e7bbc29cae9f5b07823e
X-Patchwork-Hint: ignore
Message-Id: <20250928112947.65C69865D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbtft: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ad6f18547f01d306e69e7bbc29cae9f5b07823e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fbtft linux extension was only needed for very old kernels (<4.0)
that are no longer available in Buildroot.

Let's therefore remove it.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  7 +++++++
 .../adding-packages-linux-kernel-spec-infra.adoc   |  3 +--
 linux/Config.ext.in                                | 21 ---------------------
 linux/linux-ext-fbtft.mk                           | 22 ----------------------
 package/Config.in                                  |  1 -
 package/fbtft/Config.in                            | 13 -------------
 package/fbtft/fbtft.hash                           |  3 ---
 package/fbtft/fbtft.mk                             | 12 ------------
 utils/checksymbolslib/test_makefile.py             |  3 ---
 9 files changed, 8 insertions(+), 77 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2035b34a2f..4c76ba4205 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_LINUX_KERNEL_EXT_FBTFT
+	bool "FB TFT drivers are deprecated"
+	select BR2_LEGACY
+	help
+	  FB TFT drivers were only needed for linux kernels until v3.19,
+	  since v4.0 the drivers are included in the staging area.
+
 config BR2_PACKAGE_DMENU_WAYLAND
 	bool "dmenu-wayland has been removed"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
index 9fd3b566a5..22ffc5496f 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
@@ -99,8 +99,7 @@ tree. The Buildroot's Linux kernel extensions infrastructure provides
 a simple solution to automatically do this, just after the kernel
 sources are extracted and before the kernel patches are
 applied. Examples of extensions packaged using this mechanism are the
-real-time extensions Xenomai and RTAI, as well as the set of
-out-of-tree LCD screens drivers +fbtft+.
+real-time extensions Xenomai and RTAI.
 
 Let's look at an example on how to add a new Linux extension +foo+.
 
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index e1d99426ff..3b72d3cf60 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -55,27 +55,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
-#-------------------------------------------------------------------------------
-# fbtft
-config BR2_LINUX_KERNEL_EXT_FBTFT
-	bool "FB TFT drivers"
-	select BR2_PACKAGE_FBTFT
-	help
-	  Linux Framebuffer drivers for small TFT LCD display modules,
-	  e.g. Adafruit PiTFT displays for Raspberry Pi (this extra
-	  package is only needed for linux kernels until v3.19, since
-	  v4.0 the drivers are included in the staging area).
-
-	  To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
-	  following kernel configurations:
-	  - CONFIG_SPI
-	  - CONFIG_GPIOLIB
-	  - CONFIG_FB
-	  - CONFIG_FB_TFT
-	  - CONFIG_FB_TFT_ILI9341
-
-	  https://github.com/notro/fbtft
-
 # kernel extensions from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.linux"
 
diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
deleted file mode 100644
index cbc9c58ed3..0000000000
--- a/linux/linux-ext-fbtft.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with fbtft extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += fbtft
-
-# for linux >= 3.15 install to drivers/video/fbdev/fbtft
-# for linux < 3.15 install to drivers/video/fbtft
-define FBTFT_PREPARE_KERNEL
-	if [ -e $(LINUX_DIR)/drivers/video/fbdev ]; then \
-		dest=drivers/video/fbdev ; \
-	else \
-		dest=drivers/video ; \
-	fi ; \
-	mkdir -p $(LINUX_DIR)/$${dest}/fbtft; \
-	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/ ; \
-	echo "source \"$${dest}/fbtft/Kconfig\"" \
-		>> $(LINUX_DIR)/$${dest}/Kconfig ; \
-	echo 'obj-y += fbtft/' >> $(LINUX_DIR)/$${dest}/Makefile
-endef
diff --git a/package/Config.in b/package/Config.in
index 48ed7cc101..f12cfeb394 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,7 +505,6 @@ endmenu
 	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
-	source "package/fbtft/Config.in"
 	source "package/flashrom/Config.in"
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
diff --git a/package/fbtft/Config.in b/package/fbtft/Config.in
deleted file mode 100644
index 0a4de19091..0000000000
--- a/package/fbtft/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-# Prompt-less option, because this package is not doing anything
-# except downloading the FB TFT sources. The real work is done by a
-# Linux extension.
-config BR2_PACKAGE_FBTFT
-	bool
-	depends on BR2_LINUX_KERNEL
-	help
-	  Linux Framebuffer drivers for small TFT LCD display modules,
-	  e.g. Adafruit PiTFT displays for Raspberry Pi.
-
-	  This is only the download helper for the kernel patch.
-
-	  https://github.com/notro/fbtft
diff --git a/package/fbtft/fbtft.hash b/package/fbtft/fbtft.hash
deleted file mode 100644
index 5d08d0ef85..0000000000
--- a/package/fbtft/fbtft.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  0e81de89fdd7ab810716fc0549e767527f342e829309dee5c2cca1e9d1728770  fbtft-274035404701245e7491c0c6471c5b72ade4d491.tar.gz
-sha256  a9ca80d65a5ef10fe614a6c1e8c8d4d3b96637e8855a96c7cf0fa438526097a7  fbtft-core.c
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
deleted file mode 100644
index cc11d867fc..0000000000
--- a/package/fbtft/fbtft.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# fbtft
-#
-################################################################################
-
-FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
-FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
-FBTFT_LICENSE = GPL-2.0
-FBTFT_LICENSE_FILES = fbtft-core.c
-
-$(eval $(generic-package))
diff --git a/utils/checksymbolslib/test_makefile.py b/utils/checksymbolslib/test_makefile.py
index 1dc6564b2f..9d24484124 100644
--- a/utils/checksymbolslib/test_makefile.py
+++ b/utils/checksymbolslib/test_makefile.py
@@ -250,9 +250,6 @@ check_filename = [
     ('fs/cramfs/cramfs.mk',
      'fs/cramfs/cramfs.mk',
      True),
-    ('linux/linux-ext-fbtft.mk',
-     'linux/linux-ext-fbtft.mk',
-     True),
     ('package/ace/ace.mk',
      'package/ace/ace.mk',
      True),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
