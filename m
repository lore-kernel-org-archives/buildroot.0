From: Tobias Sachs <Tobias.Sachs@onlinehome.de>
Date: Fri, 04 May 2012 22:47:11 +0200
Subject: [Buildroot] How to create a Bootable SD-Card for i.MX28 EVK
Message-ID: <4FA4404F.7010109@onlinehome.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I started one week ago with configuring an Kernel/Linux Image for my 
i.MX28 EVK for the first test I keep the original configurations except 
the following.

As target Architecture I choose "ARM (little endian)"
As Target Architecture Variant I use "arm926t"

In my Toolchain I ticked on "large file (files > 2 GB) support" an 
"WCHAR support"
In the System configuration i use "Dynamic using udev" as "/dev management"

As Kernel defconfig I use "mxs"

In Filesystem images I use "ext2 root filesystem"

With these configuration the "make" goes through wihout any errors und 
gave me a "uimage" und a "rootfs.ext2" as output. But how do i create a 
bootable SD-Card with my created uimage and rootfs.ext2?
With LTIB I can use "mk_mx28_sd.sh" and "mk_hdr.sh" but these Scripts 
need a "imx28_linux.sb" In the mail archives I've read about a patch to 
create these .sb files with buildroot but where do I find these patch 
and how do I apply it?

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Another Question when I select U-Boot as Bootloader I have to add a 
"U-Boot board name" but I can't find which names I could use if I try 
"mxs" I get only the error listed below.

libtool: install: warning: remember to run `libtool --finish /usr/lib'
libtool: install: warning: remember to run `libtool --finish /usr/lib'
make: *** No rule to make target `mxs_config'.  Stop.
make[1]: *** [mxs_config] Error 1
make: *** 
[/home/freescale/Documents/imx28/buildroot/output/build/uboot-2012.04.01/.stamp_configured] 
Error 2

Many Thanks
