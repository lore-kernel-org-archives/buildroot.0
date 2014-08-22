From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 22 Aug 2014 20:20:00 +0200
Subject: [Buildroot] [PATCH 05/14 v4] package/eudev: split udev/libudev
References: <cover.1406765723.git.yann.morin.1998@free.fr>
 <e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <XnsA391CED782357berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

for eudev-1.10 one additional command is necessary to build libudev due to
https://github.com/gentoo/eudev/commit/b1ac60946d1625e14029ea9b7fa3aa4c06e079
5f:

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998
@free.fr:

> +define EUDEV_BUILD_CMDS

$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/shared

> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
> +endef

Regards, Bernd
