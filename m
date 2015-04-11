From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 21:56:24 +0200
Subject: [Buildroot] [PATCH 06/11 v7] package/eudev: split udev/libudev
References: <cover.1423317174.git.yann.morin.1998@free.fr>
 <1173e1bc3a763340a6e65f43d2ba8b8e71da23b4.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <XnsA479DF2FDF820berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:1173e1bc3a763340a6e65f43d2ba8b8e71da23b4.1423317174.git.yann.morin.1998
@free.fr:

> +EUDEV_DEPENDENCIES = host-pkgconf
> +EUDEV_PROVIDES = libudev
> +
> +ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
> +
> +EUDEV_DEPENDENCIES += host-gperf util-linux kmod
> +EUDEV_PROVIDES += udev

Hi Yann,

eudev always depends on host-gperf, not only with enabled udev daemon, 
otherwise:

checking for i586-buildroot-linux-uclibc-gperf... no
checking for gperf... no
configure: error: *** gperf not found

Regards, Bernd
