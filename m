From: inblueswithu <inblueswithu@hotmail.com>
Date: Sat, 28 Jan 2012 13:55:19 +0530
Subject: [Buildroot] Image created is not booting, waiting for infinite time
Message-ID: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build a custom ARM linux kernel which must be very small 
in size. I'm new to these things.

NOTE: As I was getting errors with u-boot, I omitted bootloaders (i 've 
not selected any of it).
After compilation, I 've got zImage and rootfs.ext2 images.
When I try to run the image

    $ qemu-system-arm -M versatilepb -m 128 -kernel
    ./output/images/zImage --nographic
    oss: Could not initialize DAC
    oss: Failed to open `/dev/dsp'
    oss: Reason: No such file or directory
    oss: Could not initialize DAC
    oss: Failed to open `/dev/dsp'
    oss: Reason: No such file or directory
    audio: Failed to create voice `lm4549.out'
    Uncompressing Linux... done, booting the kernel.

It waits here for infinite time. I also tried like this as shown in 
/board/qemu/arm-versatile/readme.txt/

    $ qemu-system-arm -M versatilepb -kernel ./output/images/zImage
    -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio
    oss: Could not initialize DAC
    oss: Failed to open `/dev/dsp'
    oss: Reason: No such file or directory
    oss: Could not initialize DAC
    oss: Failed to open `/dev/dsp'
    oss: Reason: No such file or directory
    audio: Failed to create voice `lm4549.out'
    Uncompressing Linux... done, booting the kernel.

Here also it waits for infinite time. I dont know if my configuration is 
wrong or the way I'm trying to boot is wrong.
I'm attaching my configuration file also.
This is not the first time it is happening like this. I tried using 
Cross-LFS(clfs) for doing this (custom ARM linux OS).
Even then It has same effect, it waits for infinite time after that last 
line!!
Can someone plz help me.

Thanks & Regards
/inblueswithu/

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120128/9a043e3a/attachment-0001.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120128/9a043e3a/attachment-0001.ksh>
