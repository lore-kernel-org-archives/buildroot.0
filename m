From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 11 Oct 2020 19:34:20 +0200
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump U-Boot version
In-Reply-To: <CAOMZO5B=88j7qCKzMgWf9PEWqqDKASRw4HVa_QJcGrWh2tswSA@mail.gmail.com>
References: <20201011153251.660778-1-francois.perrad@gadz.org>
 <CAOMZO5B=88j7qCKzMgWf9PEWqqDKASRw4HVa_QJcGrWh2tswSA@mail.gmail.com>
Message-ID: <CAB0FRstpJscCj3vtxasqcnKLHKj9KcOLjpZHPBHLk1POK5=Ftw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 11 oct. 2020 ? 17:58, Fabio Estevam <festevam@gmail.com> a ?crit :

> Hi Francois,
>
> On Sun, Oct 11, 2020 at 12:33 PM Francois Perrad <fperrad@gmail.com>
> wrote:
> >
> > since 2020.04 version, the enumeration of MMC has changed,
> > so the boot script must be updated
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Thanks for the fix!
>
> > ---
> >  board/solidrun/mx6cubox/boot.scr.txt | 6 +++---
> >  configs/mx6cubox_defconfig           | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/board/solidrun/mx6cubox/boot.scr.txt
> b/board/solidrun/mx6cubox/boot.scr.txt
> > index 7a8aa4bd5..e4cf81478 100644
> > --- a/board/solidrun/mx6cubox/boot.scr.txt
> > +++ b/board/solidrun/mx6cubox/boot.scr.txt
> > @@ -1,7 +1,7 @@
> > -setenv finduuid "part uuid mmc 0:1 uuid"
> > +setenv finduuid "part uuid mmc 1:1 uuid"
> >  run finduuid
> >  run findfdt
> >  setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait
> rootfstype=ext4"
> > -load mmc 0:1 ${fdt_addr} boot/${fdtfile}
> > -load mmc 0:1 ${loadaddr} boot/zImage
> > +load mmc 1:1 ${fdt_addr} boot/${fdtfile}
> > +load mmc 1:1 ${loadaddr} boot/zImage
> >  bootz ${loadaddr} - ${fdt_addr}
> > diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
> > index dc26758ef..2d711dc56 100644
> > --- a/configs/mx6cubox_defconfig
> > +++ b/configs/mx6cubox_defconfig
> > @@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
> >  BR2_TARGET_UBOOT=y
> >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>
> I suppose 2020.10 also works, right?
>
>
No. At this time, I cannot build uboot 2020.10
It seems there is a new dependency on host-swig.

>>> uboot 2020.10 Configuring
>>> uboot 2020.10 Building
PATH="/home/dev/checkout/BR/build/cubox/host/bin:/home/dev/checkout/BR/build/cubox/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
AR="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-ar"
AS="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-as"
LD="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-ld"
NM="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-nm"
CC="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-gcc"
GCC="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-gcc"
CPP="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-cpp"
CXX="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-g++"
FC="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-gfortran"
F77="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-gfortran"
RANLIB="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-ranlib"
READELF="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-readelf"
STRIP="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-strip"
OBJCOPY="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-objcopy"
OBJDUMP="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/dev/checkout/BR/build/cubox/host/include"
CFLAGS_FOR_BUILD="-O2 -I/home/dev/checkout/BR/build/cubox/host/include"
CXXFLAGS_FOR_BUILD="-O2 -I/home/dev/checkout/BR/build/cubox/host/include"
LDFLAGS_FOR_BUILD="-L/home/dev/checkout/BR/build/cubox/host/lib
-Wl,-rpath,/home/dev/checkout/BR/build/cubox/host/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-as"
DEFAULT_LINKER="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -Os  " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/dev/checkout/BR/build/cubox/host/bin/pkg-config"
STAGING_DIR="/home/dev/checkout/BR/build/cubox/host/arm-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl /usr/bin/make -j5 -C
/home/dev/checkout/BR/build/cubox/build/uboot-2020.10
CROSS_COMPILE="/home/dev/checkout/BR/build/cubox/host/bin/arm-none-linux-gnueabihf-"
ARCH=arm HOSTCC="/usr/bin/gcc -O2 -isystem
/home/dev/checkout/BR/build/cubox/host/include"
HOSTLDFLAGS="-L/home/dev/checkout/BR/build/cubox/host/lib
-Wl,-rpath,/home/dev/checkout/BR/build/cubox/host/lib"  all u-boot.img
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
  UPD     include/config.h
  CFG     u-boot.cfg
  GEN     include/autoconf.mk.dep
  CFG     spl/u-boot.cfg
  GEN     spl/include/autoconf.mk
  GEN     include/autoconf.mk
  UPD     include/generated/dt.h
  UPD     include/generated/timestamp_autogenerated.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  SHIPPED scripts/dtc/pylibfdt/libfdt.i
rm -f scripts/dtc/pylibfdt/_libfdt*.so
  PYMOD   scripts/dtc/pylibfdt/_libfdt.so
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
unable to execute 'swig': No such file or directory
error: command 'swig' failed with exit status 1
make[5]: *** [scripts/dtc/pylibfdt/Makefile:30:
scripts/dtc/pylibfdt/_libfdt.so] Error 1
make[4]: *** [scripts/Makefile.build:419: scripts/dtc/pylibfdt] Error 2
make[4]: *** Waiting for unfinished jobs....
  CFGCHK  u-boot.cfg
make[3]: *** [scripts/Makefile.build:419: scripts/dtc] Error 2
  UPD     include/config/uboot.release
make[2]: *** [Makefile:577: scripts] Error 2
make[1]: *** [package/pkg-generic.mk:250:
/home/dev/checkout/BR/build/cubox/build/uboot-2020.10/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

Fran?ois


> Thanks,
>
> Fabio Estevam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201011/82ab020d/attachment.html>
