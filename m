From: Jason Jiang <Jason.Jiang@intusurg.com>
Date: Mon, 24 Feb 2014 18:57:40 +0000
Subject: [Buildroot] Link error when building latest rootfs for i.MX6
Message-ID: <44C2037B3E0E704C9BB751CAFFB640483C55A413@SV950-MBX1.corp.intusurg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I had a problem building the latest rootfs for my i.MX6 board. I got the latest one from http://www.buildroot.org/download.html. I tried to build it in the following way:

$ make menuconfig...

#  Target ARM (Little-Endian)

#  Target Cortex A-9

#  Under toolchain:

#      External

#      Sourcery Codebench ARM 2013.05

#      Downloaded and installed

#  Under System Configuration, chose ttymxc0 as the Port to run a getty (login prompt) on,

#  Under Target Packages->Filesystem and Flash utilities: enable dosfstools and e2fsprogs

#  Under Filesystem Images, selected Output cpio - gzipped; tar the root filesystem

$ make busybox-menuconfig...

#  Do nothing, just exit (this step probably isn't necessary).

$ make V=1 2>&1 | tee make.out

But at the end, I got link error: "/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory". I googled around for the whole day and just couldn't figure out the solution. Could you help please?

Thank you,
Jason
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140224/4fa2455b/attachment.html>
