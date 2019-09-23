From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:12:40 +0200
Subject: [Buildroot] [PATCH 0/5 v3] openrc: further itegration (branch
 yem/openrc)
In-Reply-To: <cover.1564920849.git.yann.morin.1998@free.fr>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
Message-ID: <20190923231240.3690e2c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Aug 2019 14:14:15 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Micha? ?yszczek (5):
>       package/skeleton-init-openrc: add support for starting sysv scripts
>       package/skeleton-init-openrc: add support to remount rootfs as rw
>       package/openrc: add support for spawning getty
>       package/netifrc: new package
>       package/netifrc: add support for BR2_SYSTEM_DHCP

Thanks a lot, I've applied the series. There was an issue on PATCH 4/5
though, so I'll reply to that.

When I test this series, with Busybox, there are a few errors at boot
time related to loadkeys, dumpkeys and kbd_mode being missing:
http://code.bulix.org/39k5v9-881711?raw. Can we do something about
this? This was on a machine with no screen/keyboard, i.e console over
serial port.

Also, would it be possible to add a test case for OpenRC in
support/testing/tests/init/ ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
