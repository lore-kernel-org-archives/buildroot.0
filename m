From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Apr 2016 21:19:36 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
 with symlink
In-Reply-To: <81b71ac5323b1793405c3192b6ac5264@eja.it>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk>
 <81b71ac5323b1793405c3192b6ac5264@eja.it>
Message-ID: <20160425211936.73f44f62@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ubaldo,

(and sorry from dropping you from CC, your e-mail address seems not to
be reachable from gmx.net)

On Mon, 25 Apr 2016 15:06:54 +0100, Ubaldo Porcheddu <ubaldo@eja.it> wrote:

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
 
Same here on RPi3, but with the suggested fix from Oscar Gomez Fuente [1],
adding 'dtoverlay=pi3-disable-bt' to config.txt I get working boot
messages and login on HDMI and serial console...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159295.html

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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
