From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 22:30:22 -0300
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <CAJ4jsaffJ_P=3kwyr37vasqnQRj489f09WUgUv8TzzE8aw07PA@mail.gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
 <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
 <20191013154223.60ede697@windsurf>
 <406efb70-4eba-09f6-9c09-939f8f768c02@gmail.com>
 <740C8925-BCBC-4A77-AF69-68E7AE607B92@gmail.com>
 <721fdd74aa2924a78ba869d8be54dfb03487c7e5.camel@gmail.com>
 <CAJ4jsaffJ_P=3kwyr37vasqnQRj489f09WUgUv8TzzE8aw07PA@mail.gmail.com>
Message-ID: <CAJ4jsaefGOwwu-bWD=A1Ym41r_W8Wr6J9pCCt1vdxFYP_JMxJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 15, 2019 at 10:07 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Tue, Oct 15, 2019 at 6:31 PM Lothar Felten <lothar.felten@gmail.com> wrote:
> >
> > On Sun, 2019-10-13 at 11:57 -0300, Carlos Santos wrote:
> > > I have a beaglebone black and can make some experiments this week.
> >
> > Hello Carlos,
> >
> > I have four patches, they allow you to build a new kernel, kernel
> > module and userspace tools including libgbm for the beaglebone with the
> > current toolchain.
> > You can run the GLES(1) demos, I had no success with the GLES2 demos.
> > The last patch is for qt5base, but it is incomplete, it won't compile
> > the qpa backend yet.
> > I'll post the four patches with RFC prefix to the list.
> >
> > Best regards,
> > Lothar
>
> Thanks. I will test them as time permits.

Lothar,

I'm attempting to test your last patches on my Beaglebone Black but
had no success. I event attempted the plain beaglebone_defconfig to
simplify the build but it still hangs on boot:

U-Boot 2013.10-dirty (Nov 14 2013 - 12:59:11)

I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  0
mmc0 is current device
SD/MMC found on device 0
reading uEnv.txt
376 bytes read in 3 ms (122.1 KiB/s)
Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
reading /zImage
6076272 bytes read in 568 ms (10.2 MiB/s)
reading /am335x-boneblack.dtb
36717 bytes read in 8 ms (4.4 MiB/s)
bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
Kernel image @ 0x80200000 [ 0x000000 - 0x5cb770 ]
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   Using Device Tree in place at 80f80000, end 80f8bf6c

Starting kernel ...

[hangs here]

This is with the master branch as of commit
3db8622f311f46cea9dcc2f9dbed48ca543b2e24 plus the reversion of commit
1e55b66e975d234f5bff992785762e8f7ee5f5b9.

-- 
Carlos Santos <unixmania@gmail.com>
