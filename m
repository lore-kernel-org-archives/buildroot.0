From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon, 20 May 2019 15:48:42 +0530
Subject: [Buildroot] [PATCH] board: friendlyarm: Add initial support for
 NanoPc T4
In-Reply-To: <20190516152621.57ece57b@windsurf>
References: <20190516075010.14219-1-shyam.saini@amarulasolutions.com>
 <20190516152621.57ece57b@windsurf>
Message-ID: <CA+drQ_PyaOUiOKT8A1EAb16+LfHYhq_JDXjbWuCJp0BPwGHKBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,

Hi Thomas,

>
> On Thu, 16 May 2019 13:20:10 +0530
> Shyam Saini <shyam.saini@amarulasolutions.com> wrote:
>
> > This initial support includes:
> >       Linux 5.1-rc1
>
> Why not use the final 5.1 release ?

will update this
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index e4a089e6f5..ec1dde20e7 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2048,6 +2048,8 @@ F:     board/orangepi/orangepi-rk3399/
> >  F:     configs/orangepi_rk3399_defconfig
> >  F:   board/olimex/a33_olinuxino/
> >  F:   configs/olimex_a33_olinuxino_defconfig
> > +F:   board/friendlyarm/nanopc-t4/
> > +F:   configs/nanopc_t4_defconfig
>
> Alphabetic ordering is preferred.

should i resend all the patches again for this ?
or I should take care of this thing from this patch onward ?

>
> > +Files created in output directory
> > +=================================
> > +output/images/
>
> One empty line to separate the section title from the section contents
> would be nice.
>
> > +??? bl31.bin
> > +??? bl31.elf
> > +??? Image
> > +??? rk3399-nanopc-t4.dtb
> > +??? rootfs.ext2
> > +??? rootfs.ext4 -> rootfs.ext2
> > +??? rootfs.tar
> > +??? sdcard.img
> > +??? u-boot.bin
> > +??? u-boot.itb
> > +??? u-boot-spl-dtb.bin
> > +??? u-boot-spl-dtb.img
> > +
> > +Creating bootable SD card:
> > +=========================
> > +
> > +Simply invoke (as root)
> > +
> > +  # dd if=output/images/sdcard.img of=/dev/sdX && sync
> > +
> > +Where X is your SD card device
> > +
> > +Serial console
> > +--------------
>
> Ditto.
>
> > diff --git a/configs/nanopc_t4_defconfig b/configs/nanopc_t4_defconfig
> > new file mode 100644
> > index 0000000000..a55b754d0f
> > --- /dev/null
> > +++ b/configs/nanopc_t4_defconfig
> > @@ -0,0 +1,55 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_cortex_a72_a53=y
> > +
> > +# Linux headers same as kernel, a 5.0 series
> > +BR2_KERNEL_HEADERS_5_0=y
>
> So 5_1 preferably.
>
> > +#Firmware
>
> Space before firmware, for consistency.

I'll fix all these things in next version

Thanks for the review.
