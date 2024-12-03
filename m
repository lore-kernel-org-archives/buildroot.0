Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5623D49797
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 09:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 482E1605C3;
	Tue,  3 Dec 2024 09:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jnSg45Yu5xt; Tue,  3 Dec 2024 09:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A46E160604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46E160604;
	Tue,  3 Dec 2024 09:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB52C2365
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 09:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2AF580DBF
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 09:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts0GjcChF2D5 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 09:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8413180E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8413180E0C
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8413180E0C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 09:22:40 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Tue, 3 Dec 2024 17:22:36 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 3 Dec 2024 17:22:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Bernd Kuhls" <bernd@kuhls.net>
Cc: buildroot@buildroot.org, "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, 
 "Daniel Lang" <dalang@gmx.at>, "Romain Naour" <romain.naour@gmail.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>, 
 "Valentin Korenblit" <valentinkorenblit@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241202190647.1211779-6-bernd@kuhls.net>
References: <20241202190647.1211779-1-bernd@kuhls.net>
 <20241202190647.1211779-6-bernd@kuhls.net>
X-NTES-SC: AL_Qu2YAf6auE8u4CebYOlS8zNM9K56MKvt5LljqcQFePgqqTHL3g4cZnlBM0vW6uILou+a76uIaCHNluRjF3h+
MIME-Version: 1.0
Message-ID: <d725e29.9cfd.1938bd42645.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgD3vwrdzU5nyPs1AA--.40588W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRaqXmdOyx1UoQABsA
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=o89zSgoSr2UPF8AQiUKut9BXzpWOjSFVbn7AY/N9gQs=; b=I
 wUClrUx7qcP5+s35acZFHFYkT5fhiaHnhfaWEfvoB35xWc3HuD0c9SZU+XMx4hBY
 DlAmjQTQKT77kQH5dWGz4+d/UWIoivTyej7qq+DLcTT9ckQG492b8ygTdO3K35KL
 bpszEMRLTXW5BsHOninLn1EZRaeUNY3XQGXm2Af0sE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=IwUClrUx
Subject: Re: [Buildroot] [PATCH 6/8] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi,

At 2024-12-03 03:06:45, "Bernd Kuhls" <bernd@kuhls.net> wrote:
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
>https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-November/000784.html
>https://lists.freedesktop.org/archives/mesa-announce/2024-November/000786.html
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
>Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to
>BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE and added new option
>BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to upstream commit
>https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331af5b4b
>"gallium/meson: Deconflate swrast/softpipe/llvmpipe"
>------------------------------------------------------------------------
>Changes needed for the bump to 24.3.x:
>
>Rebased patch 0002 again due to upstream commit:
>https://gitlab.freedesktop.org/mesa/mesa/-/commit/25ba90fd888cef431c2098c8afdb0a2bbd34b303
>
>Removed dri3 configure option:
>https://gitlab.freedesktop.org/mesa/mesa/-/commit/8f6fca89aa1812b03da6d9f7fac3966955abc41e
>
>Removed gallium-omx configure option:
>https://gitlab.freedesktop.org/mesa/mesa/-/commit/9b6c27a320ab4b0fcf1fb16220ae7c3d3f06f7df
>
>Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I have a test on Arm mali valhall gpu with panfrost driver.

Tested-by: Andy Yan <andyshrk@163.com>  


>---
> Config.in.legacy                              |  7 +++
> package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
> ...tion-to-disable-optional-neon-suppor.patch | 18 +++---
> package/mesa3d/Config.in                      | 28 +++++++--
> package/mesa3d/mesa3d.hash                    |  6 +-
> package/mesa3d/mesa3d.mk                      | 58 ++++++++++++++-----
> 6 files changed, 88 insertions(+), 31 deletions(-)
>
>diff --git a/Config.in.legacy b/Config.in.legacy
>index 63360b42b8..a10dde7eda 100644
>--- a/Config.in.legacy
>+++ b/Config.in.legacy
>@@ -146,6 +146,13 @@ endif
> 
> comment "Legacy options removed in 2024.11"
> 
>+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>+	bool "mesa Gallium swrast driver was replaced by softpipe"
>+	select BR2_LEGACY
>+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
>+	help
>+	  The Gallium swrast driver was replaced by softpipe.
>+
> config BR2_PACKAGE_BSDIFF
> 	bool "bsdiff has been removed"
> 	select BR2_LEGACY
>diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
>index 33c60b285f..11201d6c82 100644
>--- a/package/mesa3d-headers/mesa3d-headers.mk
>+++ b/package/mesa3d-headers/mesa3d-headers.mk
>@@ -12,7 +12,7 @@ endif
> 
> # Not possible to directly refer to mesa3d variables, because of
> # first/second expansion trickery...
>-MESA3D_HEADERS_VERSION = 24.0.9
>+MESA3D_HEADERS_VERSION = 24.3.0
> MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
> MESA3D_HEADERS_SITE = https://archive.mesa3d.org
> MESA3D_HEADERS_DL_SUBDIR = mesa3d
>diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>index f3919478a6..3b9bca0693 100644
>--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
>@@ -9,8 +9,8 @@ to force disabling it at compile time.
> 
> Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
>+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.3.0]
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [fix syntax error after previous rebases]
> ---
>@@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
> index 8e0bf2a..1cf0e07 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
>-@@ -124,6 +124,13 @@ option(
>+@@ -117,6 +117,13 @@ option(
>    description : 'enable gallium va frontend.',
>  )
>  
>@@ -41,18 +41,18 @@ diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson
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
> +if host_machine.cpu_family() == 'arm' and not get_option('gallium-vc4-neon').disabled()
>    libvc4_neon = static_library(
>      'vc4_neon',
>-     'vc4_tiling_lt_neon.c',
>-@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
>-     ],
>-     c_args : '-mfpu=neon',
>+     'vc4_tiling_lt.c',
>+@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
>+     c_args : ['-mfpu=neon', '-DV3D_BUILD_NEON'],
>+     dependencies : vc4_deps,
>    )
> -  vc4_c_args += '-DUSE_ARM_ASM'
> +  vc4_c_args += '-DVC4_TILING_LT_NEON'
>diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>index 7761b0a650..b42e593be7 100644
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
>@@ -140,6 +149,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
> 	help
> 	  Mesa driver for ARM Mali Utgard GPUs.
> 
>+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE
>+	bool "Gallium llvmpipe driver"
>+	depends on BR2_PACKAGE_MESA3D_LLVM
>+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>+	help
>+	  This is a llvm opengl implementation using the Gallium3D
>+	  infrastructure.
>+
>+comment "llvmpipe driver needs llvm"
>+	depends on !BR2_PACKAGE_MESA3D_LLVM
>+
> config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
> 	bool "Gallium nouveau driver"
> 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>@@ -212,8 +232,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
> 	help
> 	  This is a virtual GPU driver for VMWare virtual machines.
> 
>-config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>-	bool "Gallium swrast driver"
>+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
>+	bool "Gallium softpipe driver"
> 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> 	help
> 	  This is a software opengl implementation using the Gallium3D
>@@ -285,7 +305,7 @@ comment "Vulkan drivers"
> config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
> 	bool "Vulkan broadcom driver"
> 	depends on BR2_arm || BR2_aarch64
>-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
>+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
> 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> 	help
> 	  Vulkan broadcom driver.
>diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
>index d506d398b8..2e0f99a8de 100644
>--- a/package/mesa3d/mesa3d.hash
>+++ b/package/mesa3d/mesa3d.hash
>@@ -1,5 +1,5 @@
>-# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
>-sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
>-sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
>+# From https://lists.freedesktop.org/archives/mesa-announce/2024-November/000786.html
>+sha256  97813fe65028ef21b4d4e54164563059e8408d8fee3489a2323468d198bf2efc  mesa-24.3.0.tar.xz
>+sha512  20168ae4c278776a60d5febf53b3367cf08bffffb40ef2054821e68d7a8c37a07871d097ab17555f41a4fe716f0de7df95ad7d452b1ed57db6527838eb839ba4  mesa-24.3.0.tar.xz
> # License
> sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
>diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>index ce460c4475..d7459d0f19 100644
>--- a/package/mesa3d/mesa3d.mk
>+++ b/package/mesa3d/mesa3d.mk
>@@ -5,7 +5,7 @@
> ################################################################################
> 
> # When updating the version, please also update mesa3d-headers
>-MESA3D_VERSION = 24.0.9
>+MESA3D_VERSION = 24.3.0
> MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
> MESA3D_SITE = https://archive.mesa3d.org
> MESA3D_LICENSE = MIT, SGI, Khronos
>@@ -21,19 +21,20 @@ MESA3D_DEPENDENCIES = \
> 	host-bison \
> 	host-flex \
> 	host-python-mako \
>+	host-python-pyyaml \
> 	expat \
> 	libdrm \
> 	zlib
> 
> MESA3D_CONF_OPTS = \
>-	-Dgallium-omx=disabled \
>+	-Dgallium-opencl=disabled \
>+	-Dgallium-rusticl=false \
>+	-Dmicrosoft-clc=disabled \
>+	-Dopencl-spirv=false \
> 	-Dpower8=disabled
> 
> ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
>-MESA3D_CONF_OPTS += -Ddri3=enabled
> MESA3D_DEPENDENCIES += xlib_libxshmfence
>-else
>-MESA3D_CONF_OPTS += -Ddri3=disabled
> endif
> 
> ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>@@ -50,14 +51,9 @@ else
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
>@@ -99,13 +95,14 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedre
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
>+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE) += llvmpipe
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
>-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
>+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE) += softpipe
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
>@@ -126,6 +123,19 @@ MESA3D_CONF_OPTS += \
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
>@@ -251,12 +261,32 @@ endif
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
