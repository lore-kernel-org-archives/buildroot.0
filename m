From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 29 Apr 2021 16:55:40 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <20210429162631.22bb7084@windsurf>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
 <20210429150143.276e4aec@windsurf>
 <CAK4VdL0qsvVUYsJr1S9OsnPG-Lc_Whn6zRzpWCsLaTfJzxsH0A@mail.gmail.com>
 <20210429154834.5b70c1a1@windsurf>
 <CAK4VdL1_uAau=+hziWjipgMvWkLA5gfYaFBnA77eHTxPx7rq=g@mail.gmail.com>
 <20210429162631.22bb7084@windsurf>
Message-ID: <CAK4VdL3Kuv7fU+m8WkQjZ2bX+mZrmrQDnyiDuLcCT0AaUp5EqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 4:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 29 Apr 2021 15:52:14 +0200
> Erico Nunes <nunes.erico@gmail.com> wrote:
>
> > > > Ok, thanks, I will give it a try anyway.
> > > > I noticed that the manual build instructions in
> > > > https://wiki.seeedstudio.com/BeagleV-Make-File-System-Compile-uboot-Kernal/#compile-u-boot
> > > > suggest a CONFIG_SYS_TEXT_BASE=0x80020000 change and as far as I see
> > > > this is not in the build here, so maybe that could be related too.
> > >
> > > The kernel is relocated to 80020000 by U-Boot before booting, in the
> > > configuration I'm providing. See the boot log in the cover letter:
> > >
> > > """
> > > Moving Image from 0x84000000 to 0x80200000, end=80f1b000
> > > """
> >
> > This is 0x80200000, not 0x80020000.
>
> Ah, you're right (of course). The U-Boot configuration I'm using from
> the U-Boot defconfig provided by Starfive indeed has
> CONFIG_SYS_TEXT_BASE=0x80200000 and not the 0x80020000 you're
> mentioning. I'll give it a try.
>
> But I just checked, and the image that was already flashed on my
> Beagle-V was using 0x80200000 to load the kernel.

With the original u-boot and Fedora image I also got "Moving Image
from 0x84000000 to 0x80200000, end=81aff000", but that address shows
in "Domain0 Next Address : 0x0000000080020000" which is different than
with the Buildroot u-boot which currently shows "Domain0 Next Address
: 0x0000000080200000".
Anyway I don't know where this will make a difference, I just
mentioned it because the only manual change explicitly mentioned in
the wiki page is change 0x80200000 -> 0x80020000.

For the original question, this bootloader from Buildroot with your
patch also boots the reference Fedora image.
The Buildroot image also works well for me.
So either way, thanks for this work and for getting it here so quickly.

Erico
