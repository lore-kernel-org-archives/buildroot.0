From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:17:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Fix compilation of
 kodi-pvr-vbox with gcc6
In-Reply-To: <20160905115634.15627-1-bernd.kuhls@t-online.de>
References: <20160905115634.15627-1-bernd.kuhls@t-online.de>
Message-ID: <20160905221739.009a2a25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 13:56:34 +0200, Bernd Kuhls wrote:
> Fixes a compile error not yet caught by autobuilders:
> 
> In file included from /home/bernd/buildroot/br2/output/build/kodi-pvr-vbox-15e864d160da5a051e18aef06f3a53e49808be02/src/client.cpp:24:0:
> /home/bernd/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/kodi/xbmc_pvr_dll.h:423:63: error: 'SEEK_SET' was not declared in this scope
>    long long SeekLiveStream(long long iPosition, int iWhence = SEEK_SET);
>                                                                ^~~~~~~~
> /home/bernd/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/kodi/xbmc_pvr_dll.h:510:67: error: 'SEEK_SET' was not declared in this scope
>    long long SeekRecordedStream(long long iPosition, int iWhence = SEEK_SET);
>                                                                    ^~~~~~~~
> CMakeFiles/pvr.vbox.dir/build.make:62: recipe for target 'CMakeFiles/pvr.vbox.dir/src/client.cpp.o' failed
> 
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_BINUTILS_VERSION_2_26_X=y
> BR2_GCC_VERSION_6_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_INIT_NONE=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_PVR_VBOX=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_XORG7=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
