From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:31:38 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: add
 dependencies for supported archs
Message-ID: <20171201222432.C98A281D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd80e92cb89d4ab3f327227ab2f2b0b3130fc426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kodi-inputstream-adaptive is available on a limited list of archs:
https://github.com/peak3d/inputstream.adaptive/blob/Krypton/wvdecrypter/cdm/build/build_config.h#L97

Fixes build error

/home/buildroot/br8/output/build/kodi-inputstream-adaptive-9af21218a87572bd4ab8d8d660c11f6295144f97/wvdecrypter/cdm/media/cdm/../../base/../base/../build/build_config.h:137:2: error: #error Please add support for your architecture in build/build_config.h
 #error Please add support for your architecture in build/build_config.h

for example with this defconfig:

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-inputstream-adaptive/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index d5fe5e6..cb51273 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	bool "kodi-inputstream-adaptive"
+	# wvdecrypter/cdm/build/build_config.h
+	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
+		|| BR2_mips64el || BR2_x86_64
 	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
