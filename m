From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 10:56:27 -0400
Subject: [Buildroot] Example .configs?
In-Reply-To: <1209041724.6819.3.camel@rhodan.rho>
References: <1209041724.6819.3.camel@rhodan.rho>
Message-ID: <46a136670804240756y200cf080vacf8d18372177e9a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mdev is a part of busybox, therefore an option to the busybox config. Your
architecture determines where the busybox .config file is kept in the
buildroot tree. It will either use the default in package/busybox or
somewhere in target/device/your-arch

There may also be defconfigs for your architecture in
target/device/your-arch, look in target/device/Atmel/atngw100 for an
example. atngw100_defconfig is the buildroot .config, then there are the
Linux kernel .configs, and the busybox .configs. Atmel keeps the uClibc
.config for that arch in target/device/Atmel/uClibc.config.avr32

I wrote a wiki about using buildroot on Ubuntu that you might want to have a
look at too:
http://code.google.com/p/buildroot/wiki/BuildingonUbuntu

John

On Thu, Apr 24, 2008 at 8:55 AM, p <pmeloy@shaw.ca> wrote:

> I'm new to buildroot and fairly new to linux. I'm wondering if there are
> any example .configs or something resembling the kernel defconfigs for
> buildroot?
>
> I'm having trouble compiling in that I always seem to miss a dependency
> someplace. CHoose packages then find out near the end of a long compile
> that some package or other isn't present and it all aborts.
>
> I'm also wondering where mdev is in the configs? One selection said to
> make sure I added mdev but even a search of the .config doesn't show any
> mention of mdev, set or not.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/fcf0aa74/attachment.htm 
