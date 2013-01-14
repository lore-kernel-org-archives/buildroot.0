From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 14 Jan 2013 14:45:23 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <004501cdf24a$009f6440$01de2cc0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate> <004501cdf24a$009f6440$01de2cc0$@co.uk>
Message-ID: <50F40BF3.5080106@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.01.2013 12:26, schrieb Ted Wood:
> OK. I'll rephrase my original question...
>
>
> I have an  XXX CPU Board. I have fitted a YYY I/O board to it, which is
> supplied with open source Linux drivers.
> How do I incorporate the YYY drivers into my Linux kernel build?
Hello Ted,

I assume you are searching for help with a (possibly proprietary) driver
that is meant to be built outside the kernel tree. I dealt with such
things before I started to use buildroot.

Assuming that this driver comes with a Makefile I suggest to make a new
buildroot package on top of the driver's makefile. There is good
documentation for this in the buildroot manual.

If the driver is GPL another option might be to integrate it into your
kernel source and make a kernel patch out of it. But beware: Doing such
with a proprietary driver will brake the kernel license.

Hope this helps

Stephan
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
