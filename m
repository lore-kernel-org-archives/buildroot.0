From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Mon, 25 Apr 2016 16:16:10 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
 with symlink
In-Reply-To: <81b71ac5323b1793405c3192b6ac5264@eja.it>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk>
 <81b71ac5323b1793405c3192b6ac5264@eja.it>
Message-ID: <20160425161610.4e5cbe87@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Apr 2016 15:06:54 +0100
Ubaldo Porcheddu <ubaldo@eja.it> wrote:

> Hi Peter,
> 
> Il 2016-04-25 13:07 Peter Korsgaard ha scritto:
> >>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
> > 
> >  > Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
> > 
> > Committed after expanding the commit message, thanks.
> > 
> > I've also committed a change to sync the kernel version with what is
> > used for rpi1/2 (E.G. the rpi-4.4.y branch). Care to verify that
> > everything works correctly after that?
> 
> I just tested the new kernel version but it doesn't give me the login 
> prompt, the kernel seems to be booting fine as it can recognize my 
> keyboard but it doesn't accept any input.
> 

I had something similar, removed the 'console=ttyAMA0...' from the
cmdline.txt file, and it booted through. Mine was not able to recognize
my keyboard, but with dropbear and an extra user I was able to login.

> 
> > What about the serial console? The rpi3 afaik uses ttyS0 instead of
> > ttyAMA0 for the (default) serial console. Do we need to adjust
> > cmdline.txt for the rpi?
> > 
> > I see notes about newer rpi-firmware versions fixing up ttyAMA0 -> 
> > ttyS0
> > when running on a rpi3, so perhaps it isn't needed?
> > 
> > https://github.com/RPi-Distro/repo/issues/22
> 
> I don't have a serial console cable to test with at the moment, but I 
> can see from the kernel log on screen a message like:
> 
> console [ttyS0] enabled

I see:

    3f215040.uart: ttyS0 at MMIO 0x3f215040 (irq = 59, base_baud =
    50000000) is a 16550

Please note that there is a line about tyAMA0 in the kernel boot logs as
well:

    3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0)
    is a PL011 rev2

Regards,
Ben.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160425/9fdc2a59/attachment.asc>
