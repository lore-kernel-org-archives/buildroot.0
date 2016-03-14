From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Mon, 14 Mar 2016 16:51:52 +0100
Subject: [Buildroot] device tree + raspberry pi 2 + buildroot-2016.02
Message-ID: <CALtfCQZz9tJj=TOodYwYT9i-+-Wjr89AdWg4rC8rfLwOgTdJMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use device tree with a raspberry pi 2 + buildroot-2016.02 and
It doesn't work fine.

This is my config.txt:

# Please note that this is only a sample, we recommend you to change it to
fit
# your needs.
# You should override this file using a post-build script.
# See http://buildroot.org/manual.html#rootfs-custom
# and http://elinux.org/RPiconfig for a description of config.txt syntax

kernel=zImage

# To use an external initramfs file
#initramfs rootfs.cpio.gz

# Disable overscan assuming the display supports displaying the full
resolution
# If the text shown on the screen disappears off the edge, comment this out
disable_overscan=1

# How much memory in MB to assign to the GPU on Pi models having
# 256, 512 or 1024 MB total memory
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100

#device tree
dtdebug=on
device_tree=bcm2709-rpi-2-b.dtb
dtparam=i2c_arm=on,i2c_arm_baudrate=200000
dtparam=watchdog=on

I'm sure that I'm using the zImage marked because I'm using the zImage from
the kernel-marked directory

In the log kernel I can see:
[    0.000000] Machine model: Raspberry Pi 2 Model B Rev 1.1

and the file /proc/device-tree file exists so I understand I'm using well
the device tree configuration.

But the driver dosen't load I can't see this message in the kernel log:
[    4.538823] bcm2708_i2c 3f804000.i2c: BSC1 Controller at 0x3f804000 (irq
79) (baudrate 100000)

And the watchdog driver doesn't load. The file /dev/watchdog doesn't exist.

I'll try this after the SO has started everything works fine:
modprobe i2c_bcm2708
modprobe i2c_dev

modprobe_bcm2708_wdog

If I use the config.txt in a raspbian OS everything works fine.

Could anyone help me to solve this problem?

Best regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160314/a428dc7a/attachment.html>
