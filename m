From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:27:59 +0200
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpciaccess: Rename package to
 libpciaccess
In-Reply-To: <E1XfoKe-0003Xk-Sb@fli4l.lan.fli4l>
References: <1413557257-25254-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019121141.5098a140@free-electrons.com>
 <E1XfoKe-0003Xk-Sb@fli4l.lan.fli4l>
Message-ID: <20141019132759.16485d9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Not sure why you're replying to me with a weird gmane address. I'm
replying with the Buildroot list Cc'ed instead.

On Sun, 19 Oct 2014 13:07:28 +0200, Bernd Kuhls wrote:

> > I know it's not a change you've made, but why do we need libpciaccess
> > whenever the X.org modular server is enabled? I can imagine using the
> > X.org modular server on ARM platforms that don't have any PCI hardware.
> 
> ARM and PCI do not exclude each other, I found this after a short search: 
> http://www.embeddedarm.com/products/arm-sbc.php#ts-7800-500mhz-series

I certainly now that ARM and PCI do not exclude each other, as I've
myself written the PCIe support for one ARM platform, and I'm the
maintainer of it in the Linux kernel:

  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n7003

But while *some* ARM platforms do have PCI, a number of them don't have
access to it.

> The X.org modular server can be build without libpciaccess in certain 
> configurations, but it is a hard dependency in other cases, see until line 
> 1911: http://cgit.freedesktop.org/xorg/xserver/tree/configure.ac#n1906
> 
> Since libpciaccess seems not to have any hardware-related dependencies I 
> would to keep its dependency in xserver_xorg-server for simplicity.

Ok, fair enough, makes sense.

> Btw, how often do the autobuilder build the X.org modular server since
> BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE is the default value for
> BR2_PACKAGE_XSERVER_XORG_SERVER?

Basically: never, because choices are not randomized.

However, with the "preseed" stuff that Yann and Arnout have posted, we
might be able to preseed the random package select with certain
options, and therefore the autobuild-run script could be improved to
sometimes select the modular variant of the X.org server. I've added
Yann and Arnout in Cc so that they can comment on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
