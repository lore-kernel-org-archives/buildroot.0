From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 27 Apr 2016 13:47:23 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <trinity-865bd3a6-6a65-4e11-a2f0-8214fd30d71b-1461745444837@3capp-gmx-bs18>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net> <87lh3z1r6r.fsf@dell.be.48ers.dk>
 <trinity-865bd3a6-6a65-4e11-a2f0-8214fd30d71b-1461745444837@3capp-gmx-bs18>
Message-ID: <CALtfCQbm47JoN73ZSBx6rMzKvNcBw0yd2qM6BNpWgTPhKEOOiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok,


With the patch, the rpi-firmware works fine. And the sdcard.img for the
rpi3 with the pi3-disable-bt-overlay.dtbo in the overlays folder of the
boot.vfat partiton works fine too.

I've asked to the mailing list of buildroot, If someone knows how to add
folders with genimage. I would like to add overlays dtbos to create a
sdcard.img with them.


Beat regards.

Oscar Gomez Fuente

On 27 April 2016 at 10:24, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Peter,
>
> > Gesendet: Mittwoch, 27. April 2016 um 08:50 Uhr
> > Von: "Peter Korsgaard" <peter@korsgaard.com>
> > An: "Peter Seiderer" <ps.report@gmx.net>
> > Cc: "Oscar Gomez Fuente" <oscargomezf@gmail.com>, buildroot at busybox.net
> > Betreff: Re: [git commit] configs/raspberrypi3: sync kernel version with
> rpi/rpi2
> >
> > >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> >
> > Hi,
> >
> >  >> Just dd the sdcard.img matching your board variant to a sdcard. I've
> >  >> verified the rpi1 version here.
> >
> >  > https://buildroot.org/~jacmet/rpi/rpi1/sdcard.img
> >  > Boots fine on a Raspberry Pi Model B Rev 2 board (console on HDMI and
> serial)
> >
> >  > https://buildroot.org/~jacmet/rpi/rpi3/sdcard.img
> >  > Boots fine on a Raspberry Pi 3 Model B Rev 1.2 (messages on HDMI,
> >  > console on HDMI and serial after adding the
> 'dtoverlay=pi3-disable-bt' fix).
> >
> > Thanks for testing! What is the behaviour without the dtoverlay? Similar
> > to Oscar, E.G. no serial output and unable to login over HDMI?
>
> Same/known behaviour as described already in [1]:
>
>   Without the overlay I get boot messages on HDMI, but no login, last
> messages
>   are from USB keyboard/mouse and I can get more messages removing/adding
>   keyboard/mouse...., no messages on serial console (but 'ttyS0: 29 input
> overrun(s)
>   message on HDMI output)
>
> And I think the same as Oscar described...
>
> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2016-April/159683.html
>
> >
> > --
> > Venlig hilsen,
> > Peter Korsgaard
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160427/059cae1d/attachment.html>
