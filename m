From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Sep 2010 16:07:52 +0200
Subject: [Buildroot] mdev handling
Message-ID: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AFAIK mdev activation leads only to adding this binary to the rootfs
tree. What about starting script? Would it make sense to create
/etc/init.d/S1mdev with the following content:

#!/bin/sh
#
# Start the mdev....
#

case "$1" in
  start)
        echo "Starting mdev..."
        echo /sbin/mdev > /proc/sys/kernel/hotplug
        /sbin/mdev -s
        ;;
  stop)
.......

echo /sbin/mdev > /proc/sys/kernel/hotplug - only if such an option
selected. fstab should be also changed to have

tmpfs           /dev           tmpfs    size=1M          0      0

added. (The size should be much smaller, this is only for testing)

What do you think about this?

Regards,
Yegor
