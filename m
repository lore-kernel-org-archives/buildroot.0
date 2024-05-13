Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F9EC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 16:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20FD741578;
	Mon, 13 May 2024 16:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id marfLDXkPOZN; Mon, 13 May 2024 16:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 922E341532
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 922E341532;
	Mon, 13 May 2024 16:00:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 925CE1BF39F
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 16:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E0D941E5D
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 16:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLa4ZMpj1UHZ for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 16:00:10 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=208.72.58.67;
 helo=sinclair-ext5.swishmail.com; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B242341E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B242341E60
Received: from sinclair-ext5.swishmail.com (sinclair-ext5.swishmail.com
 [208.72.58.67])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B242341E60
 for <buildroot@buildroot.org>; Mon, 13 May 2024 16:00:08 +0000 (UTC)
Received: from ivanova.swishmail.com (ivanova.swishmail.com [208.72.58.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by sinclair-ext5.swishmail.com (Postfix) with ESMTPS id E36C0659D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 12:00:05 -0400 (EDT)
Received: (qmail 63699 invoked by uid 89); 13 May 2024 12:00:05 -0400
Received: from unknown (HELO localhost.localdomain.com)
 (noreply@techsource.com)
 by ivanova.swishmail.com with ESMTPA; 13 May 2024 12:00:05 -0400
From: Nick Whitlock <nick.whitlock@eizo.com>
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 11:59:05 -0400
Message-ID: <20240513155907.104270-1-nick.whitlock@eizo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: sinclair-ext5.swishmail.com;
 dkim=none;
 spf=temperror (sinclair-ext5.swishmail.com: error in processing during lookup
 of nick.whitlock@eizo.com: DNS error) smtp.mailfrom=nick.whitlock@eizo.com; 
 dmarc=temperror reason="SPF/DKIM temp error" header.from=eizo.com
 (policy=temperror)
Subject: [Buildroot] [PATCH] package/nvidia-driver: bump version to 550.78
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Nick Whitlock <nick.whitlock@eizo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NVIDIA drivers now have 64-bit and 32-bit versions bundled
into one .run file.

A configuration value was also added to check if the user wants
to install GTK integration for the NVIDIA driver.

The legacy version of libGL.so was removed in favor of the
vendor neutral version.

This has been confirmed to work on kernel 6.1.4.

Signed-off-by: Nick Whitlock <nick.whitlock@eizo.com>
---
 package/nvidia-driver/Config.in          |  3 ++
 package/nvidia-driver/nvidia-driver.hash |  7 ++-
 package/nvidia-driver/nvidia-driver.mk   | 69 +++++++++++++-----------
 3 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index a8617a939b..0fcce93e28 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -90,4 +90,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
 	  provides Unified Memory access to the GPU and CPU memories for
 	  CUDA programs.
 
+config BR2_PACKAGE_NVIDIA_DRIVER_GTK
+	bool "nvidia GTK acceleration"
+
 endif # BR2_PACKAGE_NVIDIA_DRIVER
diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 620112e6c8..06e3314d53 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,3 @@
-# Locally computed
-sha256  94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  NVIDIA-Linux-x86-390.151.run
-sha256  6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
-sha256  bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
+# Locally computed:
+sha256  34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf73  NVIDIA-Linux-x86_64-550.78.run
+sha256  5ac626496a6388d37cdd53e0300525267a4b8c89fb5980da060783afd561faf7  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index f1217b00aa..9ea97a2a9f 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.151
-NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
-NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
-NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
+NVIDIA_DRIVER_VERSION = 550.78
+NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86_64/$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86_64-$(NVIDIA_DRIVER_VERSION).run
 NVIDIA_DRIVER_LICENSE = NVIDIA Software License
 NVIDIA_DRIVER_LICENSE_FILES = LICENSE
 NVIDIA_DRIVER_REDISTRIBUTE = NO
@@ -23,30 +22,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
 NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext
 NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
 
-# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
-# has been replaced with libGL.so.1.0.0. Installing both is technically
-# possible, but great care must be taken to ensure they do not conflict,
-# so that EGL still works. The legacy library exposes an NVidia-specific
-# API, so it should not be needed, except for legacy, binary-only
-# applications (in other words: we don't care).
-#
-# libGL.so.1.0.0 is the new vendor-neutral library, aimed at replacing
-# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The latter contains
-# NVidia extensions (which is deemed bad now), while the former follows
-# the newly-introduced vendor-neutral "dispatching" API/ABI:
-#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
-# However, this is not very useful to us, as we don't support multiple
-# GL providers at the same time on the system, which this proposal is
-# aimed at supporting.
-#
-# So we only install the legacy library for now.
 NVIDIA_DRIVER_LIBS_GL = \
 	libGLX.so.0 \
-	libGL.so.$(NVIDIA_DRIVER_VERSION) \
+	libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libGL.so.1.7.0 \
 	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_EGL = \
 	libEGL.so.1.1.0 \
+	libEGL.so.$(NVIDIA_DRIVER_VERSION) \
 	libGLdispatch.so.0 \
 	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
@@ -57,13 +41,18 @@ NVIDIA_DRIVER_LIBS_GLES = \
 	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_MISC = \
+	libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-api.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-egl-wayland.so.1.0.2 \
+	libnvidia-egl-gbm.so.1.1.1 \
+	libnvidia-egl-wayland.so.1.1.13 \
+	libnvidia-wayland-client.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
-	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
-	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
-	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
+	libnvidia-glvkspirv.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-rtcore.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS += \
 	$(NVIDIA_DRIVER_LIBS_GL) \
@@ -87,13 +76,26 @@ endef
 # wants to run a third-party program developed under such an agreement).
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
 NVIDIA_DRIVER_LIBS += \
+	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
+	libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvoptix.so.$(NVIDIA_DRIVER_VERSION)
+endif
+
+# Include GTK libraries (if required)
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_GTK),y)
+NVIDIA_DRIVER_LIBS += \
+	libnvidia-gtk2.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-gtk3.so.$(NVIDIA_DRIVER_VERSION)
 endif
 
 # We refer to the destination path; the origin file has no directory component
 NVIDIA_DRIVER_LIBS += \
 	nvidia_drv.so:xorg/modules/drivers/ \
+	libnvidia-pkcs11.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-pkcs11-openssl3.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
 	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
 # libglx needs a symlink according to the driver README. It has no SONAME
@@ -107,11 +109,13 @@ endif # X drivers
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
 NVIDIA_DRIVER_LIBS += \
 	libcuda.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
+	libcudadebugger.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-gpucomp.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-nvvm.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
+	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
 NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server
 endif
@@ -152,8 +156,9 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
 # virtually everywhere, and it is fine enough to provide useful options.
 # Except it can't extract into an existing (even empty) directory.
 define NVIDIA_DRIVER_EXTRACT_CMDS
-	$(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target \
-		$(@D)/tmp-extract
+	$(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only \
+		$(if $(BR2_x86_64),--no-install-compat32-libs) \
+		--target $(@D)/tmp-extract
 	chmod u+w -R $(@D)
 	mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
 	rm -rf $(@D)/tmp-extract
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
