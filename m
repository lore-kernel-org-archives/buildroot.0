From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 4 Dec 2016 15:21:13 +0100
Subject: [Buildroot] [PATCH v1 0/6] Raspberry PI update
In-Reply-To: <35324051-2281-6578-68fb-28ddf3e744bd@cox.net>
References: <FbC91u0112zVPbg01bCA0v>
 <35324051-2281-6578-68fb-28ddf3e744bd@cox.net>
Message-ID: <20161204152113.2795fadc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

please keep the buildroot mailing list on CC...

On Sat, 3 Dec 2016 16:34:45 -0700, Chris Sparks <mr_ada@cox.net> wrote:

> Peter,
> 
> Looks like you have had success getting an RPI3 to work with BuildRoot.  
> I haven't.
> So how do I get these fixes?  Do I need to clone and rebase?

This patches are only updates, the last fix was 'raspberrypi3: fix serial console
(load pi3-miniuart-bt overlay)' (see [1]), so it should at least in buildroot-2016-08
and buildroot-2016-11 and Rpi3 should work out of the box with the raspberrypi3_defconfig
(maybe only one defect regarding the hdmi console in case you change to systemd, see [2[])...

If it does not work for you don't mind to ask again on the mailinglist (or open a bugreport),
giving your exact buldroot version, commands executed, setup etc. ...

Regards,
Peter


[1] https://git.buildroot.net/buildroot/commit/?id=1e03cc2290f98fc7434254d2abd9afd504de8360
[2] https://bugs.busybox.net/show_bug.cgi?id=9196


> 
> Chris
> > Update rpi-firmware/rpi-userland and all raspberrypiX_defconfigs to
> > kernel version 4.4.36.
> >
> > Tested on Raspberry Pi 3 Model B v1.2 hardware:
> > - raspberrypi3_defconfig
> > - raspberrypi3_defconfig updated to glibc, systemd, gcc-6.x and
> >    qt5 (linuxfb, eglfs)
> >
> > Peter Seiderer (6):
> >    raspberrypi0_defconfig: bump kernel version to 4.4.36
> >    raspberrypi_defconfig: bump kernel version to 4.4.36
> >    raspberrypi2_defconfig: bump kernel version to 4.4.36
> >    raspberrypi3_defconfig: bump kernel version to 4.4.36
> >    rpi-firmware: bump version
> >    rpi-userland: bump version
> >
> >   configs/raspberrypi0_defconfig         | 2 +-
> >   configs/raspberrypi2_defconfig         | 2 +-
> >   configs/raspberrypi3_defconfig         | 2 +-
> >   configs/raspberrypi_defconfig          | 2 +-
> >   package/rpi-firmware/rpi-firmware.hash | 2 +-
> >   package/rpi-firmware/rpi-firmware.mk   | 2 +-
> >   package/rpi-userland/rpi-userland.hash | 2 +-
> >   package/rpi-userland/rpi-userland.mk   | 2 +-
> >   8 files changed, 8 insertions(+), 8 deletions(-)
> >
> 
> 
> ---
> This email has been checked for viruses by Avast antivirus software.
> https://www.avast.com/antivirus
> 
