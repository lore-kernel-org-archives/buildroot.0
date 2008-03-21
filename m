From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 21 Mar 2008 11:17:02 +0100
Subject: [Buildroot] Differences in kernel configuration
Message-ID: <01b801c88b3c$b94aba00$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

How come I don't get the same options if I do this from the buildroot 
directory:
make ARCH=ppc menuconfig
(with the [Kernel][Run make ARCH=$(ARCH) xconfig before build] activated)

And this:
cd ./project_build_ppc/genepy/linux-2.6.24; make ARCH=ppc xconfig

In particular, in the 2nd case I have an option for [Processor][IBM 4xx 
options][Machine type]  available for Xilinx-ML403 which is missing in the 
first case

linux-2.6.24 $ grep XIL .config
# CONFIG_XILINX_ML300 is not set
CONFIG_XILINX_ML403=y
CONFIG_XILINX_VIRTEX_4_FX=y
CONFIG_XILINX_VIRTEX=y
# CONFIG_XILINX_SYSACE is not set

buildroot $ grep XIL project_build_ppc/genepy/linux-2.6.24/.config
CONFIG_XILINX_VIRTEX_GENERIC_BOARD=y
CONFIG_XILINX_VIRTEX=y
CONFIG_XILINX_VIRTEX_II_PRO=y
CONFIG_XILINX_VIRTEX_4_FX=y
# CONFIG_XILINX_SYSACE is not set


I've also heard that there can be discrepancies between using xconfig and 
menuconfig, so is it possible to tell the main 'make' to use the kernel's 
menuconfig instead of its xconfig. I did search the main makefile without 
success.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
