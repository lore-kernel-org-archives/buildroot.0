From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 13:07:29 +0200
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpciaccess: Rename package to
	libpciaccess
References: <1413557257-25254-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019121141.5098a140@free-electrons.com>
Message-ID: <XnsA3CB85833B5BBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141019121141.5098a140 at free-electrons.com:

> Dear Bernd Kuhls,
> 
> I know it's not a change you've made, but why do we need libpciaccess
> whenever the X.org modular server is enabled? I can imagine using the
> X.org modular server on ARM platforms that don't have any PCI hardware.

Hi,

ARM and PCI do not exclude each other, I found this after a short search: 
http://www.embeddedarm.com/products/arm-sbc.php#ts-7800-500mhz-series

The X.org modular server can be build without libpciaccess in certain 
configurations, but it is a hard dependency in other cases, see until line 
1911: http://cgit.freedesktop.org/xorg/xserver/tree/configure.ac#n1906

Since libpciaccess seems not to have any hardware-related dependencies I 
would to keep its dependency in xserver_xorg-server for simplicity.

Btw, how often do the autobuilder build the X.org modular server since
BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE is the default value for
BR2_PACKAGE_XSERVER_XORG_SERVER?

Regards, Bernd
