From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2011 21:08:17 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <4ECA8C28.1020306@neotion.com>
References: <4ECA36CB.5010803@neotion.com> <1321879312.2085.18.camel@sven>
 <20111121134405.02151918@skate> <4ECA8C28.1020306@neotion.com>
Message-ID: <20111121210817.5eddecc0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 21 Nov 2011 18:36:40 +0100,
Emmanuel BOUAZIZ <ebouaziz@neotion.com> a ?crit :

> I enabled mdev with loading firmware support and added a S30mdev file
> in init.d with mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
>         echo /sbin/mdev > /proc/sys/kernel/hotplug
>         mdev -s

All these steps are done automatically by Buildroot, if you select
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV.

> The "irq 7: nobody cared" error is still there though. It was not
> related after all. Any idea about that ?

Buggy driver or hardware. Find out which device corresponds to IRQ 7,
and then if a driver is supposed to manage this device or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
