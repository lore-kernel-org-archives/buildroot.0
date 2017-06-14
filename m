From: MD I. Islam <tamim@csebuet.org>
Date: Wed, 14 Jun 2017 16:42:55 -0400
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <20170612173345.kqjxqzsoznsgjhkh@tarshish>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
 <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
 <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
 <CAM7NYTjHa0waAPpauLhFL1j60pnmskGcZRUVR9G7iNYnWyCHQg@mail.gmail.com>
 <20170612173345.kqjxqzsoznsgjhkh@tarshish>
Message-ID: <CAM7NYThRL6ouhnxzg5rEosu4q54qkefdZke+Kz9qvvGg6jYEJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm using *arm_foundationv8_defconfig. *I didn't make any change in config.
The last 100 lines of build output is as following:

 -fno-common -Wall -Werror=sequence-point -Wextra -Wmissing-declarations
-Wmissing-parameter-type -Wmissing-prototypes
-Wno-missing-field-initializers -Wredundant-decls -Wsign-compare
-Wtype-limits -Wuninitialized -Wunused-but-set-parameter
-Wunused-but-set-variable -Wunused-parameter -Wunused-result
-Wunused-variable -Wnested-externs -Wpointer-arith -Wstrict-prototypes
-Wformat-security -Wimplicit-function-declaration

Type 'make' or 'make <utilname>' to compile.

>>> host-util-linux 2.29.2 Building
PATH="/home/tamim/buildroot/output/host/bin:/home/tamim/buildroot/output/host/sbin:/home/tamim/buildroot/output/host/usr/bin:/home/tamim/buildroot/output/host/usr/sbin:/home/tamim/bin:/home/tamim/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/tamim/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/tamim/buildroot/output/host/usr/lib/pkgconfig:/home/tamim/buildroot/output/host/usr/share/pkgconfig"
 /usr/bin/make -j5  -C
/home/tamim/buildroot/output/build/host-util-linux-2.29.2/
/usr/bin/make  all-recursive
Making all in po
make[4]: Nothing to be done for 'all'.
  CC       lib/libmount_la-monotonic.lo
  CC       lib/dmesg-monotonic.o
  CC       sys-utils/fstrim-fstrim.o
  CC       sys-utils/fsfreeze.o
  CC       sys-utils/ctrlaltdel.o
  CC       sys-utils/blkdiscard.o
  CC       lib/monotonic.o
  CC       sys-utils/losetup-losetup.o
  CC       sys-utils/zramctl-zramctl.o
  CC       sys-utils/swapon-swapon.o
  CC       sys-utils/swapon-swapon-common.o
  CC       lib/swapon-swapprober.o
  CC       sys-utils/swapoff-swapoff.o
  CC       lib/swapoff-swapprober.o
  CC       sys-utils/swapoff-swapon-common.o
  CC       sys-utils/pivot_root.o
  CC       sys-utils/chcpu.o
  CC       sys-utils/switch_root.o
  CC       sys-utils/hwclock.o
  CC       sys-utils/hwclock-cmos.o
  CC       sys-utils/hwclock-rtc.o
  CC       misc-utils/blkid-blkid.o
  CC       misc-utils/findfs-findfs.o
  CC       misc-utils/wipefs-wipefs.o
  CC       lib/swaplabel-swapprober.o
  CC       lib/fsck-monotonic.o
  CC       disk-utils/raw.o
  CC       disk-utils/fsck.cramfs.o
  CC       disk-utils/cramfs_common.o
  CC       disk-utils/mkfs.cramfs.o
  CC       disk-utils/blockdev.o
  CC       disk-utils/fdisk-fdisk.o
  CC       disk-utils/fdisk-fdisk-menu.o
  CC       disk-utils/fdisk-fdisk-list.o
  CC       disk-utils/sfdisk-sfdisk.o
  CC       disk-utils/sfdisk-fdisk-list.o
  CC       lib/script-monotonic.o
  CC       term-utils/script-script.o
  CC       term-utils/scriptreplay.o
  CC       term-utils/mesg.o
  CC       term-utils/wall-wall.o
  CC       term-utils/wall-ttymsg.o
  CC       login-utils/last.o
  CC       login-utils/utmpdump.o
  CC       login-utils/lslogins-lslogins.o
  CC       login-utils/lslogins-logindefs.o
  CC       sys-utils/flock.o
  CC       lib/timer.o
  CC       sys-utils/ipcmk.o
  CC       sys-utils/ipcrm.o
  CC       sys-utils/ipcs.o
  CC       sys-utils/ipcutils.o
  CC       sys-utils/lsipc-lsipc.o
  CC       sys-utils/lsipc-ipcutils.o
  CC       sys-utils/renice.o
  CC       sys-utils/setarch.o
  CC       sys-utils/setsid.o
  CC       sys-utils/eject-eject.o
  CC       lib/eject-monotonic.o
sys-utils/eject.c:41:23: fatal error: scsi/scsi.h: No such file or
directory



Tamim
PhD Student/Graduate Assistant
CS Department, Kent State University
Kent, OH 44240
http://web.cs.kent.edu/~mislam4/ <https://web.cs.kent.edu/~mislam4/>

On Mon, Jun 12, 2017 at 1:33 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Tamim,
>
> On Mon, Jun 12, 2017 at 12:43:24PM -0400, MD I. Islam wrote:
> > I'm using the main source tree. I get the same error on other configs as
> > well ( such as *beaglebone_defconfig)*. Does it mean that the problem is
> to
> > do with my host machine?
>
> Did you change anything in the build configuration other than applying
> these
> defconfigs? If so, please post your .config.
>
> Also, please post the last ~100 lines of your build output.
>
> baruch
>
> > On Mon, Jun 12, 2017 at 11:48 AM, Yann E. MORIN <yann.morin.1998@free.fr
> >
> > wrote:
> >
> > > On 12 June 2017 17:23:32 CEST, Baruch Siach <baruch@tkos.co.il> wrote:
> > > >On Mon, Jun 12, 2017 at 11:09:41AM -0400, MD I. Islam wrote:
> > > >> I'm new to Buildroot. I'm using *arm_foundationv8_defconfig* as my
> > > >config.
> > > >> But I'm getting the error *scsi/scsi.h: No such file or directory*.
> I
> > > >> cleaned and  rebuild the code, but getting the error every time.
> > > >Could
> > > >> anyone suggest what is wrong?
> > > >
> > > >There is no arm_foundationv8_defconfig in mainline Buildroot.
> > >
> > > Unless I missed something, yes there is...
> > >
> > > Regards,
> > > Yann E. MORIN.
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170614/0b9d1224/attachment.html>
