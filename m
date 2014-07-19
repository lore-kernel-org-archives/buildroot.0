From: Sylvain LG <forum@sylvainlegourr.com>
Date: Sat, 19 Jul 2014 16:42:55 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <20140719160709.2b2bcfae@free-electrons.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
 <20140719160709.2b2bcfae@free-electrons.com>
Message-ID: <CAK9TtU06LT6oep-7sYZTVjpVqRbc-DN0pCMrK28f230dTirupA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed, your are right.

I've just edited cmdline.txt: now I can see all kernel messages in a screen
session.

But there is still no console (I mean I can't log in).

1 - What should I add to my conf?

2 - I edited directly cmdline.txt on the sdcard since I didn't manage to
make Buildroot rebuild the system with the new cmdline.txt. How can I do
that?

Thank you,

Sylvain








2014-07-19 16:07 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sylvain LG,
>
> On Sat, 19 Jul 2014 14:30:34 +0200, Sylvain LG wrote:
>
> > I try to use a  Usb to TTL Serial Cable with a Raspberry Pi running the
> > default system built by Buildroot.
> > This cable fully works with a Raspbian system, but on the Buidroot one,
> it
> > only displays The first line and nothing else:
> >
> > Uncompressing Linux... done, booting the kernel.
> >
> > Kernel is configured with thoses options:
> >
> > >  --- USB Serial Converter support
> > > [*]   USB Serial Console device support
> > > [*]   USB Generic Serial Driver
> >
> > What is still missing?
>
> Using a USB to TTL serial cable has *nothing* to do with USB support on
> the RasberryPi side. Look at your cable:
>
>  *) On the PC side, it's connected over USB. So for sure your PC should
>     have the appropriate USB drivers, but that's usually built into any
>     normal Linux distribution.
>
>  *) On the RasberryPi side, it's connected directly to an UART. There
>     is no USB involved at all.
>
> If you can see the bootloader and "Uncompressing Linux... done, booting
> the kernel" then it means that your cable is working.
>
> As Vincent suggested, it might be that you didn't pass the appropriate
> console= value.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140719/8d722663/attachment.html>
