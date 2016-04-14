From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 14 Apr 2016 00:30:21 -0500
Subject: [Buildroot] bsdiff with buildroot
Message-ID: <CADKZYY+U0DdQn061_F+s7An1fubGbpDijxMGHgunWvNoEROx4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to install bsdiff package and using buildroot to create my
rootfs for AM335x device. I've selected the option of custom toolchain and
using the toolchain provided by TI as part of their SDK 7.0.

I'm having some trouble with bzip2, it's a pre-requisite for bsdiff. When
installing bzip2, cp seemed to fail. I had to replace the cp statement.


Original statement
=================

*cp -f bzip2
/home/sramani/buildroot/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/bunzip2*


Updated statement
=================
*cp --remove-destination -f
~/buildroot/buildroot/output/build/bzip2-1.0.6/bzip2
/home/sramani/buildroot/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/bunzip2*

I had to do the same thing for *bunzip2*, and *bzcat*.

Can someone please help me out? Thank you for your help.
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160414/7e2a0617/attachment.html>
