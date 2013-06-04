From: wacha at mit.bme.hu <wacha@mit.bme.hu>
Date: Tue, 04 Jun 2013 10:18:20 +0200
Subject: [Buildroot] Build kernel with devicetree support
Message-ID: <20130604101820.Horde.Y0PAK1HM6z3pTjPtdLCJCA1@www.mit.bme.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear developers,

I am trying to build a root file system and the Linux kernel with buildroot.

Because it is a custom hardware, I've set the device tree source  
option to use a custom device tree file.
My device tree source file path is set to the device tree file name,  
which resides in the buildroot top level directory.

With that configuration the kernel fails to build from source:

(irrelevant parts truncated)
make[1]: Leaving directory  
`/home/wachag/zynq/buildroot/output/build/linux-v3.6-digilent-13.01'
PATH="/home/wachag/zynq/buildroot/output/host/bin:/home/wachag/zynq/buildroot/output/host/usr/bin:/home/wachag/zynq/buildroot/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin" PERLLIB="/home/wachag/zynq/buildroot/output/host/usr/lib/perl" /usr/bin/make -j5 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/wachag/zynq/buildroot/output/target CROSS_COMPILE=" /home/wachag/zynq/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-" DEPMOD=/home/wachag/zynq/buildroot/output/host/usr/sbin/depmod -C /home/wachag/zynq/buildroot/output/build/linux-v3.6-digilent-13.01  
"zedboard-devicetree.dtb
/bin/sh: -c: line 0: unexpected EOF while looking for matching `"'
/bin/sh: -c: line 1: syntax error: unexpected end of file
make: ***  
[/home/wachag/zynq/buildroot/output/build/linux-v3.6-digilent-13.01/.stamp_built] Error  
1

It seems that a quotation mark is missing from the end of the command line.
Since I am new in the buildroot system, I could not find the  
appropriate line in the Makefile.
Could someone confirm this is an error in buildroot and not in my  
configuration?

Regards,

Gabor Wacha
