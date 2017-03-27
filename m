From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 27 Mar 2017 10:05:05 +0200
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
Message-ID: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to boot from initramfs and then switch_root to UBIFS
partition. Both rootfs were created with the same toolchain. And when
I mount UBIFS from initramfs I can execute its busybox etc. So at
least the architecture it the same.

I'm performing the same actions as described here [1]

mkdir /newroot
mount -t ubifs ubi0:rootfs /newroot

mount --move /sys /newroot/sys
mount --move /proc /newroot/proc
mount --move /dev /newroot/dev

exec switch_root /newroot /sbin/init

As soon as I execute switch_root, the system complains, that it cannot
find /dev/ttyO0.

can't open /dev/ttyO0: No such file or directory

If I omit moving /sys, /proc and /dev, the /sbin/init from initramfs
rootfs will be executed. I.e. in both cases it seems like /sbin/init
from initramfs rootfs will be executed and switch_root produces no
error/warnig messages.

What am I missing?

[1] https://landley.net/writing/rootfs-programming.html

Yegor
