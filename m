From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:40:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump version to 1.2.1
In-Reply-To: <20170617143808.30559-1-bernd.kuhls@t-online.de>
References: <20170617143808.30559-1-bernd.kuhls@t-online.de>
Message-ID: <20170618164035.78d1b88b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 16:38:08 +0200, Bernd Kuhls wrote:
> Backported patch from master branch which implements --disable-tests
> configure option, removed original patch 0001, added _CONF_OPTS.
> 
> Removed patch 0003, applied upstream:
> https://github.com/libunwind/libunwind/commit/f1684379dfaf8018d5d4c1945e292a56d0fab245
> 
> Added upstream patch to fix musl build.
> 
> Tested using this defconfig
> 
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_LTRACE=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_WESTON=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_LIBJPEG=y
> BR2_PACKAGE_LIBUNWIND=y
> 
> with test-pkg
> 
>                 armv5-ctng-linux-gnueabi [ 1/49]: OK
>               armv7-ctng-linux-gnueabihf [ 2/49]: OK
>                         br-aarch64-glibc [ 3/49]: SKIPPED
>                            br-arcle-hs38 [ 4/49]: SKIPPED
>                             br-arm-basic [ 5/49]: SKIPPED
>                   br-arm-cortex-a9-glibc [ 6/49]: OK
>                    br-arm-cortex-a9-musl [ 7/49]: SKIPPED
>                    br-arm-cortex-m4-full [ 8/49]: SKIPPED
>                              br-arm-full [ 9/49]: OK
>                     br-arm-full-nothread [10/49]: SKIPPED
>                       br-arm-full-static [11/49]: SKIPPED
>                             br-bfin-full [12/49]: SKIPPED
>                    br-i386-pentium4-full [13/49]: SKIPPED
>                 br-i386-pentium-mmx-musl [14/49]: SKIPPED
>                        br-m68k-5208-full [15/49]: SKIPPED
>                       br-m68k-68040-full [16/49]: SKIPPED
>                     br-microblazeel-full [17/49]: SKIPPED
>                  br-mips32r6-el-hf-glibc [18/49]: OK
>                       br-mips64-n64-full [19/49]: SKIPPED
>                  br-mips64r6-el-hf-glibc [20/49]: SKIPPED
>                       br-mipsel-o32-full [21/49]: OK
>                           br-nios2-glibc [22/49]: SKIPPED
>                       br-openrisc-uclibc [23/49]: SKIPPED
>                br-powerpc-603e-basic-cpp [24/49]: SKIPPED
>              br-powerpc64le-power8-glibc [25/49]: SKIPPED
>                br-powerpc64-power7-glibc [26/49]: SKIPPED
>                   br-powerpc-e500mc-full [27/49]: SKIPPED
>                              br-sh4-full [28/49]: SKIPPED
>                         br-sparc64-glibc [29/49]: SKIPPED
>                          br-sparc-uclibc [30/49]: SKIPPED
>                     br-x86-64-core2-full [31/49]: OK
>                           br-x86-64-musl [32/49]: SKIPPED
>                           br-xtensa-full [33/49]: SKIPPED
>                      i686-ctng-linux-gnu [34/49]: OK
>                           linaro-aarch64 [35/49]: SKIPPED
>                               linaro-arm [36/49]: OK
>              mips64el-ctng_n32-linux-gnu [37/49]: SKIPPED
>              mips64el-ctng_n64-linux-gnu [38/49]: SKIPPED
>         powerpc-ctng_e500v2-linux-gnuspe [39/49]: OK
>                      sourcery-arm-armv4t [40/49]: OK
>                             sourcery-arm [41/49]: OK
>                      sourcery-arm-thumb2 [42/49]: OK
>                          sourcery-mips64 [43/49]: SKIPPED
>                            sourcery-mips [44/49]: OK
>                           sourcery-nios2 [45/49]: SKIPPED
>                              sourcery-sh [46/49]: SKIPPED
>                          sourcery-x86-64 [47/49]: OK
>                             sourcery-x86 [48/49]: OK
>            x86_64-ctng_locales-linux-gnu [49/49]: OK
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../libunwind/0001-add-disable-tests-option.patch  | 68 +++++++++++++++++
>  package/libunwind/0001-disable-tests.patch         | 32 --------
>  ...lation-of-tests-on-alpine-linux-musl-libc.patch | 88 ++++++++++++++++++++++
>  ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 41 ----------
>  package/libunwind/libunwind.hash                   |  2 +-
>  package/libunwind/libunwind.mk                     |  4 +-
>  6 files changed, 160 insertions(+), 75 deletions(-)
>  create mode 100644 package/libunwind/0001-add-disable-tests-option.patch
>  delete mode 100644 package/libunwind/0001-disable-tests.patch
>  create mode 100644 package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
>  delete mode 100644 package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
