Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D077CF9C5B
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 07:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3C5B4059D;
	Mon, 23 Sep 2024 07:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLN4XrHfNH1y; Mon, 23 Sep 2024 07:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCB540546
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCB540546;
	Mon, 23 Sep 2024 07:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96EAD1BF398
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 07:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA39811DC
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 07:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5Tu7O76DRet for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 07:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1E04811CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E04811CF
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E04811CF
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 07:07:59 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Mon, 23 Sep 2024 15:07:49 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 23 Sep 2024 15:07:49 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Bernd Kuhls" <bernd@kuhls.net>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240922193751.862053-5-bernd@kuhls.net>
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
X-NTES-SC: AL_Qu2ZBfycukot7yKfY+lS+zN027ZZGIPiw4tinfIOfuALgRno+Sw7QGRAAUPr2/slWGcc44TjnR4fyluuvfdU
MIME-Version: 1.0
Message-ID: <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgD3X+DGE_FmnD8BAA--.13846W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwJjXmbxEpkkdQACsD
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=/WQ92VpQX5+Ah2K5X/VJNKaQ2pIIZqAvqy4sNMm0Mpo=; b=J
 CpViT4mbY27JdE2/KXVNR0AOHkwXI7xvWsVLyJ/I+T1fgks3CmWzTiY/OpyEUlD1
 xGLvugid2vPVonQSZG7BGe3Rt74uEw8WSMxFuGaYxhGpLEbWve3xZsu1iIMmmF0J
 cwsrOflSlhB7MwP1Va33liFTj1aG4NJNxelPn20mk0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=JCpViT4m
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Bernd,

At 2024-09-23 03:37:50, "Bernd Kuhls" <bernd@kuhls.net> wrote:
>Release notes:
>https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
>------------------------------------------------------------------------
>Changes needed for the bump to 24.1.x:
>
>Added dependency to llvm & Co. for iris driver due to upstream commit:
>https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6
>
>Added host version of mesa tool intel_clc needed for target build of the
>iris driver.
>
>Added dependency to host-python-pycparser for etnaviv driver due to
>upstream commit:
>https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268
>
>Added dependency to host-python-ply for intel vulkan driver due to
>upstream commit:
>https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101
>
>Although this dependency exists since mesa3d 22.3 it is only needed when
>intel-clc is enabled, this dependency is added with this patch so no need
>to backport this dependency to older buildroot trees.
>
>Update configure parameter of glvnd option due to upstream commit:
>https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
>------------------------------------------------------------------------
>Changes needed for the bump to 24.2.x:
>
>Added dependency to host-python-pyyaml to host and target build, needed
>due to upstream commit
>https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446
>
>Rebased patch 0002 due to upstream commit:
>https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a
>
>Signed-off-by: Bernd Kuhls <bernd@kuhls.net>



 Tested-by: Andy Yan <andyshrk@163.com>

Thanks

>---
>v2: bump to 24.2.3, added dependency to host-python-pyyaml for target
>    package (Andy)
>
> package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
> ...tion-to-disable-optional-neon-suppor.patch | 14 ++---
> package/mesa3d/Config.in                      | 11 +++-
> package/mesa3d/mesa3d.hash                    |  6 +--
> package/mesa3d/mesa3d.mk                      | 52 +++++++++++++++----
> 5 files changed, 64 insertions(+), 21 deletions(-)
>
>diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
>index 33c60b285f..2d6824c61c 100644
>--- a/package/mesa3d-headers/mesa3d-headers.mk
>+++ b/package/mesa3d-headers/mesa3d-headers.mk
>@@ -12,7 +12,7 @@ endif
> 
> # Not possible to directly refer to mesa3d variables, because of
> # first/second expansion trickery...
>-MESA3D_HEADERS_VERSION = 24.0.9
>+MESA3D_HEADERS_VERSION = 24.2.3
> MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
> MESA3D_HEADERS_SITE = https://archive.mesa3d.org
> MESA3D_HEADERS_DL_SUBDIR = mesa3d
>diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>index f3919478a6..cda792b9db 100644
>--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>@@ -9,8 +9,8 @@ to force disabling it at compile time.
> 
> Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
>+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.2.1]
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [fix syntax error after previous rebases]
> ---
>@@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
> index 8e0bf2a..1cf0e07 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
>-@@ -124,6 +124,13 @@ option(
>+@@ -148,6 +148,13 @@ option(
>    description : 'enable gallium va frontend.',
>  )
>  
>@@ -41,8 +41,8 @@ diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson
> index 84da951..7f950de 100644
> --- a/src/gallium/drivers/vc4/meson.build
> +++ b/src/gallium/drivers/vc4/meson.build
>-@@ -84,7 +84,7 @@ files_libvc4 = files(
>- vc4_c_args = []
>+@@ -72,7 +72,7 @@ files_libvc4 = files(
>+ ]
>  
>  libvc4_neon = []
> -if host_machine.cpu_family() == 'arm'
>@@ -50,9 +50,9 @@ index 84da951..7f950de 100644
>    libvc4_neon = static_library(
>      'vc4_neon',
>      'vc4_tiling_lt_neon.c',
>-@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
>-     ],
>+@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
>      c_args : '-mfpu=neon',
>+     dependencies : vc4_deps,
>    )
> -  vc4_c_args += '-DUSE_ARM_ASM'
> +  vc4_c_args += '-DVC4_TILING_LT_NEON'
>diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>index 7761b0a650..3586451bc6 100644
>--- a/package/mesa3d/Config.in
>+++ b/package/mesa3d/Config.in
>@@ -50,7 +50,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
> 	bool "OpenCL support"
> 	depends on BR2_PACKAGE_MESA3D_LLVM
> 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
>-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
>+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
> 	select BR2_PACKAGE_LLVM_RTTI
> 	select BR2_PACKAGE_CLANG
> 	select BR2_PACKAGE_LIBCLC
>@@ -129,10 +130,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
> 	bool "Gallium iris driver"
> 	depends on BR2_i386 || BR2_x86_64
>+	depends on BR2_PACKAGE_MESA3D_LLVM
> 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>+	select BR2_PACKAGE_MESA3D_OPENCL
>+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
>+	select BR2_PACKAGE_SPIRV_TOOLS
> 	help
> 	  Mesa driver for iris-based Intel GPUs.
> 
>+comment "iris driver needs llvm"
>+	depends on BR2_i386 || BR2_x86_64
>+	depends on !BR2_PACKAGE_MESA3D_LLVM
>+
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
> 	bool "Gallium lima driver"
> 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
>index d506d398b8..50385460f8 100644
>--- a/package/mesa3d/mesa3d.hash
>+++ b/package/mesa3d/mesa3d.hash
>@@ -1,5 +1,5 @@
>-# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
>-sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
>-sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
>+# From https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
>+sha256  4ea18b1155a4544a09f7361848974768f6f73c19d88f63de2ec650be313b2d0c  mesa-24.2.3.tar.xz
>+sha512  7a1ace23568d1907b778a2859f97c8988a414ba74e02e1fb5af6f95f768e1b1a2dfdaf412b0d655678ed915d28273953fd1236ebcd87553a1880f1a7f3ea4d44  mesa-24.2.3.tar.xz
> # License
> sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
>diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>index ce460c4475..ad530fc214 100644
>--- a/package/mesa3d/mesa3d.mk
>+++ b/package/mesa3d/mesa3d.mk
>@@ -5,7 +5,7 @@
> ################################################################################
> 
> # When updating the version, please also update mesa3d-headers
>-MESA3D_VERSION = 24.0.9
>+MESA3D_VERSION = 24.2.3
> MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
> MESA3D_SITE = https://archive.mesa3d.org
> MESA3D_LICENSE = MIT, SGI, Khronos
>@@ -21,12 +21,17 @@ MESA3D_DEPENDENCIES = \
> 	host-bison \
> 	host-flex \
> 	host-python-mako \
>+	host-python-pyyaml \
> 	expat \
> 	libdrm \
> 	zlib
> 
> MESA3D_CONF_OPTS = \
> 	-Dgallium-omx=disabled \
>+	-Dgallium-opencl=disabled \
>+	-Dgallium-rusticl=false \
>+	-Dmicrosoft-clc=disabled \
>+	-Dopencl-spirv=false \
> 	-Dpower8=disabled
> 
> ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
>@@ -50,14 +55,9 @@ else
> MESA3D_CONF_OPTS += -Dllvm=disabled
> endif
> 
>-# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
>-# libMesaOpenCL and CL headers are installed
> ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
> MESA3D_PROVIDES += libopencl
> MESA3D_DEPENDENCIES += clang libclc
>-MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
>-else
>-MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
> endif
> 
> ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
>@@ -126,6 +126,19 @@ MESA3D_CONF_OPTS += \
> 	-Dgallium-extra-hud=true
> endif
> 
>+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
>+MESA3D_DEPENDENCIES += host-python-pycparser
>+endif
>+
>+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
>+MESA3D_DEPENDENCIES += host-python-ply
>+endif
>+
>+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
>+MESA3D_CONF_OPTS += -Dintel-clc=system
>+MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
>+endif
>+
> ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
> MESA3D_CONF_OPTS += \
> 	-Dvulkan-drivers=
>@@ -251,12 +264,33 @@ endif
> ifeq ($(BR2_PACKAGE_LIBGLVND),y)
> ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
> MESA3D_DEPENDENCIES += libglvnd
>-MESA3D_CONF_OPTS += -Dglvnd=true
>+MESA3D_CONF_OPTS += -Dglvnd=enabled
> else
>-MESA3D_CONF_OPTS += -Dglvnd=false
>+MESA3D_CONF_OPTS += -Dglvnd=disabled
> endif
> else
>-MESA3D_CONF_OPTS += -Dglvnd=false
>+MESA3D_CONF_OPTS += -Dglvnd=disabled
> endif
> 
>+HOST_MESA3D_CONF_OPTS = \
>+	-Dglvnd=disabled \
>+	-Dgallium-drivers=iris \
>+	-Dgallium-vdpau=disabled \
>+	-Dplatforms= \
>+	-Ddri3=disabled \
>+	-Dglx=disabled \
>+	-Dvulkan-drivers=""
>+
>+HOST_MESA3D_DEPENDENCIES = \
>+	host-libclc \
>+	host-libdrm \
>+	host-python-mako \
>+	host-python-pyyaml \
>+	host-spirv-tools
>+
>+define HOST_MESA3D_INSTALL_CMDS
>+	$(INSTALL) -D -m 0755 $(@D)/build/src/intel/compiler/intel_clc $(HOST_DIR)/bin/intel_clc
>+endef
>+
> $(eval $(meson-package))
>+$(eval $(host-meson-package))
>-- 
>2.39.5
>
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
