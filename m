From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Dec 2017 23:06:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: not
 available on powerpc/powerpc64
Message-ID: <20171201220645.26132-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Powerpc is not supported by upstream:
https://github.com/peak3d/inputstream.adaptive/blob/Krypton/wvdecrypter/cdm/build/build_config.h#L97

Fixes build error

/home/buildroot/br8/output/build/kodi-inputstream-adaptive-9af21218a87572bd4ab8d8d660c11f6295144f97/wvdecrypter/cdm/media/cdm/../../base/../base/../build/build_config.h:137:2: error: #error Please add support for your architecture in build/build_config.h
 #error Please add support for your architecture in build/build_config.h

using this defconfig:

BR2_powerpc64le=y
BR2_powerpc_power8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index d5fe5e61cc..0ad7903bef 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	bool "kodi-inputstream-adaptive"
+	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le
 	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
-- 
2.11.0
