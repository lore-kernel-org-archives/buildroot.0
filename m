From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 17:33:42 +0100
Subject: [Buildroot] [PATCH 1/5] xr819-firmware: new package
In-Reply-To: <20171105153943.migmwtwspqsdpk65@speedy.hunter>
References: <20171104194049.24550-1-geomatsi@gmail.com>
 <20171104194049.24550-2-geomatsi@gmail.com>
 <87a8012b78.fsf@dell.be.48ers.dk>
 <20171105153943.migmwtwspqsdpk65@speedy.hunter>
Message-ID: <20171105163342.GM2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2017-11-05 18:39 +0300, Sergey Matyukevich spake thusly:
> >  > Add firmware for XR819 SDIO WiFi chip.
> > Thanks. I had a quick look at doing so myself some time ago, but never
> > got around to finishing it.
> > 
> > > +++ b/package/xr819-firmware/xr819-firmware.mk
> >  > @@ -0,0 +1,25 @@
> >  > +################################################################################
> >  > +#
> >  > +# xr819-firmware
> >  > +#
> >  > +################################################################################
> >  > +
> >  > +XR819_FIRMWARE_VERSION = v2017.07
> >  > +XR819_FIRMWARE_SITE =  https://github.com/armbian/build/raw/$(XR819_FIRMWARE_VERSION)/packages/extras/firmware/xr819
> >  > +XR819_FIRMWARE_SOURCE = fw_xr819.bin
> >  > +XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin
> >  > +XR819_FIRMWARE_LICENSE = PROPRIETARY
> > 
> > These firmware blobs are quite icky. If I understand correctly, the
> > firmware comes from some kind of (android?) disk image. Given that, I'm
> > not sure we are really allowed to redistribute them so we should set
> > XR819_FIRMWARE_REDISTRIBUTE = NO
> > 
> > The fact that the filenames are not versioned is also a pain, as we
> > cannot really handle any future version bumps without breaking older
> > releases.
> > 
> > I agree that cloning the huge armbian build repo for these small files
> > isn't really nice, but I had a look at the armbian github and I see they
> > have recently moved the firmware blobs to a separate repo:
> > 
> > https://github.com/armbian/firmware
> > 
> > Which is only around ~9MB, so I suggest we download that with git
> > similar to linux-firmware, then at least we have a git revision.
> > 
> > Care to rework the package to be such an "armbian-firmware" package
> > instead? For now it is fine to just have a single sub option to install
> > the xr819 files.
> 
> Thanks for review ! I didn't notice they moved all the blobs into a
> separate git repository. I assume you mean the same approach as in
> the package linux-firmware.mk: adding separate Kconfig options
> for each group of firmware files.

Basically, yes.

> I will rework xr819 firmware packaging approach and then resubmit
> the whole patchset. For the time being I plan to add xr819 and ap6212
> sub-options to handle orange-pi-zero and upcoming orange-pi-zero-plus2 boards.

Yes, just start with just the options you require. If anyone is later
interested to add more, they can send further patches to add those.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
