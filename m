From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jun 2015 00:11:26 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 (Michal Gonda's message of "Tue, 9 Jun 2015 15:17:40 +0200")
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
Message-ID: <87pp54jzw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michal" == Michal Gonda <gonda.miso@gmail.com> writes:

 > Hi guys,
 > I am trying to build *minimal kernel under 1 Mb with Buildroot*. It is
 > intended for small board with *qspi memory* and *basic functionality,
 > ethernet, usb, spi,* and *some GPIO's*. Basic terminal access via *ssh* and
 > *UART*. My first thoughts are if it is even possible to modify kernel
 > *.config* via *linux-menuconfig* to reach this size.

 > Also if it is possible to *identify the redundant parts* without deep
 > knowledge about kernel architecture and exclude them from compilation.

 > If someone can direct me to good direction how to solve this problem or
 > even specify some tools and ways how to do it would be very helpful.

This is more of a kernel question than something specific to
Buildroot. You didn't specify your exact hardware setup, and if your 1MB
(I guess you mean MB=megabyte and not Mb=megabit) is flash size or
runtime memory use, but a modern Linux kernel with the above features is
unlikely to fit within that space with just tweaking configuration
options.

For buildroot itself, for a static uClibc based build with busybox +
dropbear (ARMv7, thumb2) our .xz compressed rootfs is ~450KB, but our
default busybox config is quite bloated, so it can easily be trimmed to
something significantly smaller (I did a quick test and ended up ~250KB
still with a shell and the basic coreutils and networking commands).

-- 
Bye, Peter Korsgaard
