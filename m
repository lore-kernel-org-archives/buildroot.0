From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 12 Jan 2015 17:30:22 -0600
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
In-Reply-To: <trinity-9944ca55-371d-46d5-a1df-b254e2282bf5-1421103410794@3capp-gmx-bs54>
References: <trinity-9944ca55-371d-46d5-a1df-b254e2282bf5-1421103410794@3capp-gmx-bs54>
Message-ID: <CAFGceHH3-oEeZXx0QYXvHiHGqcNF12YYTOJQxc3Xfe1fSFs0eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did another make with TOUCHSCREEN_ADS7846 option as m this time, and now
I have the ads7846_device.ko file. I also applied the patch and we'll see
how it goes. I hope Thomas P. didn't get you down on that day.

On Mon, Jan 12, 2015 at 4:56 PM, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Lou,
>
> On Mon, Jan 12, 2015 at 01:48:02AM -0600, Lou Crittenden wrote:
> > Oh, I forgot to enable the TOUCHSCREEN_ADS7846 option. Is this [y] or
> [m]?
> > I chose [y].
>
> I would chose [m]...but use my patch from [1], it will enable all
> kernel-configs automatically...
>
> You need the ads7846_device.ko module in addition, see [2] or take
> a closer look at the patch...
>
> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2015-January/116799.html
> [2] https://github.com/notro/fbtft_tools/wiki/ads7846_device
> >
> > On Mon, Jan 12, 2015 at 1:39 AM, Lou Crittenden <
> loucrittenden63 at gmail.com>
> > wrote:
> >
> > > Here's my latest buildroot config for your consideration. At least we
> know
> > > it works.
> > >
> > > On Mon, Jan 12, 2015 at 1:29 AM, Peter Seiderer <ps.report@gmx.net>
> wrote:
> > >
> > >> Hello Lou,
> > >>
> > >> > Gesendet: Montag, 12. Januar 2015 um 05:55 Uhr
> > >> > Von: "Lou Crittenden" <loucrittenden63@gmail.com>
> > >> > An: "Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
> > >> > Betreff: Re: Fwd: Fwd: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add
> > >> fbtft kernel extension
> > >> >
> > >> > Good news! The screen works, however the orientation is portrait
> > >> instead of landscape and I'd
> > >> > like it to be landscape. Also, how do I make this driver load on
> boot
> > >> so I do not have to
> > >> > keep loading "insmod
> > >> /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> > >> name=waveshare32b"
> > >> > every time, so I can have this screen be the default? I also want to
> > >> load the ads7846
> > >> > touchscreen driver as well for touchscreen.
> > >>
> > >> The rotation part is the easy one, try
> > >>
> > >> $ insmod
> /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> > >> name=waveshare32b rotation=90
> > >>
> > >> The automatic loading should work with the
> /etc/modules-load.d/fbtft.conf
> > >> and /etc/modprobe.d/00-fbtft.conf
> > >> entries (do not forget to add rotation=90 to 00-fbtft-conf), but I
> have
> > >> to take a closer look at your
> > >> buildroot config whats missing or is different from my one, needs some
> > >> time ;-)
> > >>
> > >> For the touchscreen try [1]...
> > >>
> > >> > Again, thanks a bunch.
> > >>
> > >> Your welcome,
> > >> Peter
> > >>
> > >> [1]
> http://lists.busybox.net/pipermail/buildroot/2015-January/116799.html
> > >>
> > >
> > >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150112/cd46e4d3/attachment-0001.html>
