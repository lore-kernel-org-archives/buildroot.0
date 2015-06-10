From: Michal Gonda <gonda.miso@gmail.com>
Date: Wed, 10 Jun 2015 09:20:43 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <87pp54jzw1.fsf@dell.be.48ers.dk>
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 <87pp54jzw1.fsf@dell.be.48ers.dk>
Message-ID: <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Yegor for link.

Hi Peter,

Yes I ment 1MB, sorry for the typo :)
To specify little bit more the setup. Altera SoC cyclon 5 arm 9.
1GB sdRam but unfortunatelly just around ~6MB qspi flash for kernel +
rootfs image.
Peripherals: Ethernet, spi, i2c, some GPIO's, usb, but no display,
bluetooth, wifi, etc.
As software package tools mainly just very basic busybox tools and ssh.
Later I would like to add openVPN support.

But what you described is exactly what I need to accomplish.
A static uClibc based build with busybox +
dropbear as smallest possible image is perfect.
As you said I can drop probably more later on but few kB here and there if
kernel is ~1MB is perfect.
Even better ~450kB as you did.
If you have a time could you briefly point out the steps and parts I should
focused on ?
As a question aside, Is it enough just
"make manuconfig" and "make" rebuild the kernel and rootfs or do i need to
clean specific files for example output/images folder?

Thanks a lot! You gave me a hope that it is possible! :)

On Wednesday, June 10, 2015, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Michal" == Michal Gonda <gonda.miso@gmail.com <javascript:;>>
> writes:
>
>  > Hi guys,
>  > I am trying to build *minimal kernel under 1 Mb with Buildroot*. It is
>  > intended for small board with *qspi memory* and *basic functionality,
>  > ethernet, usb, spi,* and *some GPIO's*. Basic terminal access via *ssh*
> and
>  > *UART*. My first thoughts are if it is even possible to modify kernel
>  > *.config* via *linux-menuconfig* to reach this size.
>
>  > Also if it is possible to *identify the redundant parts* without deep
>  > knowledge about kernel architecture and exclude them from compilation.
>
>  > If someone can direct me to good direction how to solve this problem or
>  > even specify some tools and ways how to do it would be very helpful.
>
> This is more of a kernel question than something specific to
> Buildroot. You didn't specify your exact hardware setup, and if your 1MB
> (I guess you mean MB=megabyte and not Mb=megabit) is flash size or
> runtime memory use, but a modern Linux kernel with the above features is
> unlikely to fit within that space with just tweaking configuration
> options.
>
> For buildroot itself, for a static uClibc based build with busybox +
> dropbear (ARMv7, thumb2) our .xz compressed rootfs is ~450KB, but our
> default busybox config is quite bloated, so it can easily be trimmed to
> something significantly smaller (I did a quick test and ended up ~250KB
> still with a shell and the basic coreutils and networking commands).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150610/3a07060f/attachment.html>
