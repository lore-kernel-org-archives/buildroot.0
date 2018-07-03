From: Alessandro Nasorri <alessandronasorri@hotmail.com>
Date: Tue, 3 Jul 2018 14:14:57 +0000
Subject: [Buildroot] Buildroot support for ultrazed board
Message-ID: <HE1P190MB049224570E27C40E8F82C1E5AB420@HE1P190MB0492.EURP190.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I'm working on AVNET UltraZed EG board. BSP was created with Vivado 2017.2

I'm trying to set-up a buildroot enviroment (buildroot version is 2018.2) to compile an image for this board with the hope to set aside petalinux that is too "heavy" for our project.

I've noticed that under the configs folder there is not a zynq_ultrazed_defconfig.

For the Zynq family there are just  zynq_microzed_defconfig, zynq_zc706_defconfig, zynq_zed_defconfig,  zynq_zybo_defconfig.

If a try to compile the enviroment with zynq_zed_defconfig when uboot try to load the kernel an error message appear saying "Unsupported Architecture".

In this case the problem is that UltraZed expect AARCH64 arhitecture while zynq_zed_defconfig refer ARM architecture.

To overcome this problem, starting from zynq_zed_defconfig, i've created a new file named zynq_ultrazed_defconfig (attached) changing from ARM to AARCH64.

Whit this workaround there is an errors on UBOOT compilation

"arch/arm/lib/asm-offsets.c:1:0: error: unknown value ?armv5? for -march"

and i'm not able to go beyond.


What i would like to know is:

  1.  Is there a zynq_ultrazed_defconfig for buildroot? Surfing internet i wasn't able to find it
  2.  If answer for point 1 is NO which the best way to create a correct zynq_ultrazed_defconfig and have a build success?

Thanks in advance
Regards
Alessandro

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180703/3abb3489/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: zynq_ultrazed_defconfig
Type: application/octet-stream
Size: 1167 bytes
Desc: zynq_ultrazed_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180703/3abb3489/attachment.obj>
