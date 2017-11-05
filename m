From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 5 Nov 2017 18:39:43 +0300
Subject: [Buildroot] [PATCH 1/5] xr819-firmware: new package
In-Reply-To: <87a8012b78.fsf@dell.be.48ers.dk>
References: <20171104194049.24550-1-geomatsi@gmail.com>
 <20171104194049.24550-2-geomatsi@gmail.com>
 <87a8012b78.fsf@dell.be.48ers.dk>
Message-ID: <20171105153943.migmwtwspqsdpk65@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

>  > Add firmware for XR819 SDIO WiFi chip.
> 
> Thanks. I had a quick look at doing so myself some time ago, but never
> got around to finishing it.
> 
> > +++ b/package/xr819-firmware/xr819-firmware.mk
>  > @@ -0,0 +1,25 @@
>  > +################################################################################
>  > +#
>  > +# xr819-firmware
>  > +#
>  > +################################################################################
>  > +
>  > +XR819_FIRMWARE_VERSION = v2017.07
>  > +XR819_FIRMWARE_SITE =  https://github.com/armbian/build/raw/$(XR819_FIRMWARE_VERSION)/packages/extras/firmware/xr819
>  > +XR819_FIRMWARE_SOURCE = fw_xr819.bin
>  > +XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin
>  > +XR819_FIRMWARE_LICENSE = PROPRIETARY
> 
> These firmware blobs are quite icky. If I understand correctly, the
> firmware comes from some kind of (android?) disk image. Given that, I'm
> not sure we are really allowed to redistribute them so we should set
> XR819_FIRMWARE_REDISTRIBUTE = NO
> 
> The fact that the filenames are not versioned is also a pain, as we
> cannot really handle any future version bumps without breaking older
> releases.
> 
> I agree that cloning the huge armbian build repo for these small files
> isn't really nice, but I had a look at the armbian github and I see they
> have recently moved the firmware blobs to a separate repo:
> 
> https://github.com/armbian/firmware
> 
> Which is only around ~9MB, so I suggest we download that with git
> similar to linux-firmware, then at least we have a git revision.
> 
> Care to rework the package to be such an "armbian-firmware" package
> instead? For now it is fine to just have a single sub option to install
> the xr819 files.

Thanks for review ! I didn't notice they moved all the blobs into a
separate git repository. I assume you mean the same approach as in
the package linux-firmware.mk: adding separate Kconfig options
for each group of firmware files.

I will rework xr819 firmware packaging approach and then resubmit
the whole patchset. For the time being I plan to add xr819 and ap6212
sub-options to handle orange-pi-zero and upcoming orange-pi-zero-plus2 boards.

Regards,
Sergey
