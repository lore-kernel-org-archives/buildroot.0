From: Martin Bures <needemesleepe@gmail.com>
Date: Wed, 12 Dec 2007 10:43:40 -0500
Subject: [Buildroot] general build/configuration problem
Message-ID: <5970ab460712120743w6f8f78a3h8313ffb705ebb1e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am new to buildroot.  I read the documentation and thought "that doesn't
look too bad."  However I ran into a problem.

Here is my setup:
I am compiling for an ARM 920t architecture - EP93xx, for an EPD9307A
development board.

I did a make menuconfig and set everything up as per the instructions and
did a make.  The toolchain builds but when the kernel compile begins, I get
this error:

make[1]: Leaving directory
`/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2'
touch -c
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/usr/bin/install -D
/home/martin/buildroot/toolchain_build_arm_nofpu/module-init-tools-3.2.2/depmod
/home/martin/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26
cp -dpf
/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config
cp: missing destination file operand after
`/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: ***
[/home/martin/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.configured]
Error 1

I received the following guidance:

It's because you failed to set BR2_PACKAGE_LINUX_KCONFIG to the location of
your kernel configuration file.

Ok - so I went through make menuconfig again and don't see anywhere to set
an environmental variable for something like this.  I looked in the .config
file and found the BR2_PACKAGE_LINUX_KCONFIG - and yes, it is not set.  So
what do I set this to?  Am I missing a step somewhere?

Thanks.
martin.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071212/314658ca/attachment.htm 
