From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 20:26:29 +0200
Subject: [Buildroot] Troubles with initramfs
In-Reply-To: <CAE9DZUQ+QfGcX+K_Byf1p_E2bvkP48-7CQ9Kn3jC6Vs1FepuAg@mail.gmail.com>
References: <CAE9DZUQ+QfGcX+K_Byf1p_E2bvkP48-7CQ9Kn3jC6Vs1FepuAg@mail.gmail.com>
Message-ID: <20120731202629.0b748b41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 31 Jul 2012 10:59:39 -0500,
Dallas Clement <dallas.a.clement@gmail.com> a ?crit :

> [dallasc /development/dallasc/buildroot-2011.05-sdk6.0] ls -l output/images/
> total 76116
> -rw-r--r-- 1 dallasc dallasc   514194 Jul 31 15:30 rootfs.initramfs
> -rw-r--r-- 1 dallasc dallasc 77424640 Jul 31 15:16 rootfs.tar

How can you get a rootfs.initramfs file? I don't think it's possible to
get such an image with the default Buildroot.

With the default Buildroot, when you enable the initramfs file format,
it's the entire root filesystem that gets included as an initramfs into
the kernel.

If you decided to follow Avery's suggestion (creating a separate
initramfs that includes selected parts of the real root filesystem),
then you should probably not use Buildroot initramfs capabilities, and
simply configure your kernel to point CONFIG_INITRAMFS_SOURCE to your
special initramfs.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
