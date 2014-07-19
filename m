From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 16:07:09 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
Message-ID: <20140719160709.2b2bcfae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain LG,

On Sat, 19 Jul 2014 14:30:34 +0200, Sylvain LG wrote:

> I try to use a  Usb to TTL Serial Cable with a Raspberry Pi running the
> default system built by Buildroot.
> This cable fully works with a Raspbian system, but on the Buidroot one, it
> only displays The first line and nothing else:
> 
> Uncompressing Linux... done, booting the kernel.
> 
> Kernel is configured with thoses options:
> 
> >  --- USB Serial Converter support
> > [*]   USB Serial Console device support
> > [*]   USB Generic Serial Driver
> 
> What is still missing?

Using a USB to TTL serial cable has *nothing* to do with USB support on
the RasberryPi side. Look at your cable:

 *) On the PC side, it's connected over USB. So for sure your PC should
    have the appropriate USB drivers, but that's usually built into any
    normal Linux distribution.

 *) On the RasberryPi side, it's connected directly to an UART. There
    is no USB involved at all.

If you can see the bootloader and "Uncompressing Linux... done, booting
the kernel" then it means that your cable is working.

As Vincent suggested, it might be that you didn't pass the appropriate
console= value.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
