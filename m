From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Date: Wed, 25 Apr 2012 14:44:21 +0800
Subject: [Buildroot] How to build realview-pbx-a9 kernel/rootfs for QEMU by
 using buildroot?
Message-ID: <20120425064421.GA65322@cs.nctu.edu.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

  I am trying to use buildroot to build a kernel/rootfs for realview-pbx-a9, then
use QEMU to emulate realview-pbx-a9. However I have trouble with building a
working image. buildroot povides some default config for QEMU but not for
realview-pbx-a9, so I borrow qemu_arm_versatile_defconfig then made some
modification. Here is my flow,

---
# I download the kernel config on http://www.arm.com/community/software-enablement/linux.php
$ wget 'http://linux-arm.org/git?p=ael.git;a=blob_plain;f=kernel/config/config-ael-2011.06.00-vexpress-a9-smp-thumb;hb=2011.06'
$ make qemu_arm_versatile_defconfig
$ make menuconfig

# 1. Change "Target Architecture Variant" to cortex-A9
#
# 2. Change "Kernel version" to 2.6.38.7 (which is listed on the top of the
#    kernel config I just download)
#
# 3. Change "Kernel configuration" to the kernel config I just download
 
$ make
$ cd output/images/
$ qemu-system-arm -M realview-pbx-a9 -kernel zImage -hda rootfs.ext2 -append \
  "root=/dev/sda1 console=ttyAMA0" -nographic
Uncompressing Linux... done, booting the kernel.
---

  The result is the QEMU hang at the "Uncompressing Linux..." message. Any idea
on which part I might did wrong? I use QEMU git head and QEMU 0.13.

  Thanks in advance. :)


Regards,
chenwj

-- 
Wei-Ren Chen (???)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj
