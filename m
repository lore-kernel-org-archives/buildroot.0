From: Jesse Cobra <jessecobra@gmail.com>
Date: Mon, 14 Oct 2013 15:52:54 -0400
Subject: [Buildroot] [PATCHv3] beaglebone: add BeagleBone Black support
In-Reply-To: <CA+T6QPmjdeg1b-2EsoJBMWBEsPrar8wZs1GXh09uZAo0hxSvSA@mail.gmail.com>
References: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
 <CACG401qNSaRhMFhhmz3w55So+YT_7e-APcaw-Nwm82sP0muBKA@mail.gmail.com>
 <20131014193312.6b20bda3@skate>
 <CA+T6QPmjdeg1b-2EsoJBMWBEsPrar8wZs1GXh09uZAo0hxSvSA@mail.gmail.com>
Message-ID: <CACG401q3c_CfRwcDOh6w=LeZwQkHwnC5jT02t8tFToa=iDDBCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems to be working over here for both my BealgeBone white and black.

Beaglebone white boot log:
reading /am335x-bone.dtb
24465 bytes read in 15 ms (1.6 MiB/s)
Booting from ramdisk ...
...
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   Loading Kernel Image ... OK
   Loading Ramdisk to 8f2f8000, end 8fa3615a ... OK
   Using Device Tree in place at 80f80000, end 80f88f90
Starting kernel ...
...
Welcome to Buildroot
beaglebone login:

Beaglebone black boot log:
reading /am335x-boneblack.dtb
24884 bytes read in 12 ms (2 MiB/s)
Booting from ramdisk ...
...
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   Loading Kernel Image ... OK
   Loading Ramdisk to 9f2f8000, end 9fa3615a ... OK
   Using Device Tree in place at 80f80000, end 80f89133
Starting kernel ...
...
Welcome to Buildroot
beaglebone login:

Same uSD used. Eager to get this committed.
-Jesse


On Mon, Oct 14, 2013 at 3:23 PM, Jason Kridner <jkridner@beagleboard.org>wrote:

> On Mon, Oct 14, 2013 at 1:33 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Jesse Cobra,
> >
> > On Mon, 14 Oct 2013 13:29:41 -0400, Jesse Cobra wrote:
> >
> >> One quick question as the device tree stuff is new to me. Do I need to
> >> manually put the correct dtb file for BBB and BB_white respectively on
> >> /uSD/boot/*.dtb or does the system have a way to pick the correct dtb
> file
> >> for each platform during boot time?
> >>
> >> To restate, I cant just put both am335x-bone.dtb & am335x-boneblack.dtb
> on
> >> /boot can I?
> >
> > All this logic is done by the U-Boot scripts integrated in the U-Boot
> > environment, so you'll have to look at these scripts to see which DTB
> > they load at boot time. You can of course adjust these scripts to
> > ensure they load the right DTB.
> >
> > Best regards,
> >
> > Thomas
>
> Jesse,
>
> You'll notice in my commit notes the 'uenvcmd' with 'run findfdt'.
> That has the magic to pick out which .dtb to load. If you try it out,
> I hope you'll give me a "Tested-by" and help me get this finally
> committed. Not sure what else is needed to get this into buildroot.
>
> Regards,
> Jason
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131014/42e6f642/attachment-0001.html>
