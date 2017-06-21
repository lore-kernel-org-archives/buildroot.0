From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:24:11 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: new package
In-Reply-To: <20170621222326.3c64e6bf@windsurf>
References: <20170620152443.17014-1-m.niestroj@grinn-global.com>
 <20170621222326.3c64e6bf@windsurf>
Message-ID: <20170621222411.747a5020@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 22:23:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 20 Jun 2017 17:24:43 +0200, Marcin Niestroj wrote:
> > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> > ---
> >  DEVELOPERS                   |  1 +
> >  package/Config.in            |  1 +
> >  package/dt-utils/Config.in   |  8 ++++++++
> >  package/dt-utils/dt-utils.mk | 15 +++++++++++++++
> >  4 files changed, 25 insertions(+)
> >  create mode 100644 package/dt-utils/Config.in
> >  create mode 100644 package/dt-utils/dt-utils.mk  
> 
> This package doesn't build with the following defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DT_UTILS=y
> # BR2_TARGET_ROOTFS_TAR is not set

Sorry, forgot to give the error message:

  CC       src/fdtdump-fdtdump.o
  GEN      src/libdt-utils.pc
In file included from ./src/dt/list.h:4:0,
                 from ./src/dt/dt.h:5,
                 from src/dtblint-imx-pinmux.c:13:
./src/dt/common.h:181:22: error: static declaration of ?strlcpy? follows non-static declaration
 static inline size_t strlcpy(char *dest, const char *src, size_t size)
                      ^
In file included from ./src/dt/common.h:11:0,
                 from ./src/dt/list.h:4,
                 from ./src/dt/dt.h:5,
                 from src/dtblint-imx-pinmux.c:13:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/string.h:424:15: note: previous declaration of ?strlcpy? was here
 extern size_t strlcpy(char *__restrict dst, const char *__restrict src,
               ^

(several times)

Could you fix those issues, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
