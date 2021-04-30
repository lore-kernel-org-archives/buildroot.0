From: Andy Bergh <allmyaddmin@gmail.com>
Date: Fri, 30 Apr 2021 15:02:50 +0200
Subject: [Buildroot] eMMC image not booting (uboot related issue)
Message-ID: <CAAmck7XUFQ+Jb=tRKTXPvzQWPfNvF9VXC70J9R-wZgDc6p+BMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have made an image for my Beaglebone Black using buildroot, great
project, thanks. The sdcard.img boots fine, but I can not get it to boot
from power up from the eMMC.

What I have done:
1) Build an image using buildroot (with beaglebone_defconfig).
The sdcard.img boots just fine.
2) Boot from the SDCard and configure the eMMC using fdisk. I followed the
instructions shown here
<https://e2e.ti.com/support/processors/f/processors-forum/344528/u-boot-write-mlo-uboot-uimage-rootfs-on-to-emmc-mnand-of-am335x-evm-j5-echo-based-custom-board/1204926#1204926>
.

Once the eMMC is configured I perform a power cycle at which point the boot
fails. I end up at the uboot prompt (UART port), if I then type "boot" the
OS boots correctly.
What I have noticed is that the variable mmcdev is set to 0 at startup.
After it has failed if I do another printenv mmcdev and then it is set to 1.

I suspect this is the reason it does not boot successfully at power up, but
I may be very wrong!

How can I set the env var mccdev to be 1 as default at startup? Is this
possible, perhaps with uboot-menuconfig? Is that the correct way to solve
this problem?

Any information would be much appreciated.

Thank you
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210430/e2a7b390/attachment.html>
