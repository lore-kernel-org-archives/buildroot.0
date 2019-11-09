From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 9 Nov 2019 13:42:31 -0300
Subject: [Buildroot] [PATCH 1/2] board/beaglebone: fix boot on
 BeagleBone Black
In-Reply-To: <CAJ4jsadkh6aa76yffGmxZptT2jb3ZL+JnBrdOYwQCaGHijhefw@mail.gmail.com>
References: <20191102223839.16262-1-unixmania@gmail.com>
 <20191102223839.16262-2-unixmania@gmail.com>
 <20191108220944.326df425@windsurf>
 <CAJ4jsadkh6aa76yffGmxZptT2jb3ZL+JnBrdOYwQCaGHijhefw@mail.gmail.com>
Message-ID: <CAJ4jsae916sSq82t6PeCUy0XYX1ryqS0xhShRY0hvaj7erKw3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 8, 2019 at 8:05 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Fri, Nov 8, 2019 at 6:09 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Carlos,
> >
> > On Sat,  2 Nov 2019 19:38:38 -0300
> > unixmania at gmail.com wrote:
> >
> > > From: Carlos Santos <unixmania@gmail.com>
> > >
> > > Commit 68b5b79b2f has set the getty port to the default console but left
> > > "ttyO0" in bootargs, in the U-Boot environment. Use "ttyS0", instead.
> > >
> > > Also set loadaddr to 0x82000000 and fdtaddr to 0x88000000, replacing the
> > > ancient U-Boot 2013.10-dirty default values that cause system hangs.
> >
> > Where are we using U-Boot 2013.10-dirty on BeagleBone ?
> >
> > $ grep UBOOT_CUSTOM_VERSION_VALUE configs/beaglebone*
> > configs/beagleboneai_defconfig:BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
> > configs/beaglebone_defconfig:BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
> > configs/beaglebone_qt5_defconfig:BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
> >
> > And these are upstream, unpatched, versions.
> >
> > Could you clarify this? Otherwise the patch looks good, of course.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> That's the SPL in old Beaglebone cards. I will rephrase the commit
> message to clarify it.
>
> --
> Carlos Santos <unixmania@gmail.com>

Done: https://patchwork.ozlabs.org/patch/1192449/

-- 
Carlos Santos <unixmania@gmail.com>
