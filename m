From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Mar 2008 11:34:30 +0100
Subject: [Buildroot] Differences in kernel configuration
In-Reply-To: <01b801c88b3c$b94aba00$ad289e86@LPSC0173W>
References: <01b801c88b3c$b94aba00$ad289e86@LPSC0173W>
Message-ID: <20080321103430.GA10140@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 21, 2008 at 11:17:02AM +0100, Guillaume Dargaud wrote:
>Hello all,
>
>How come I don't get the same options if I do this from the buildroot 
>directory:
>make ARCH=ppc menuconfig
>(with the [Kernel][Run make ARCH=$(ARCH) xconfig before build] activated)
>
>And this:
>cd ./project_build_ppc/genepy/linux-2.6.24; make ARCH=ppc xconfig
>
>In particular, in the 2nd case I have an option for [Processor][IBM 4xx 
>options][Machine type]  available for Xilinx-ML403 which is missing in the 
>first case
>
>linux-2.6.24 $ grep XIL .config
># CONFIG_XILINX_ML300 is not set
>CONFIG_XILINX_ML403=y
>CONFIG_XILINX_VIRTEX_4_FX=y
>CONFIG_XILINX_VIRTEX=y
># CONFIG_XILINX_SYSACE is not set
>
>buildroot $ grep XIL project_build_ppc/genepy/linux-2.6.24/.config
>CONFIG_XILINX_VIRTEX_GENERIC_BOARD=y
>CONFIG_XILINX_VIRTEX=y
>CONFIG_XILINX_VIRTEX_II_PRO=y
>CONFIG_XILINX_VIRTEX_4_FX=y
># CONFIG_XILINX_SYSACE is not set
>
>
>I've also heard that there can be discrepancies between using xconfig and 
>menuconfig, so is it possible to tell the main 'make' to use the kernel's 

xconfig and menuconfig should result in the same .config, IIRC.

Apart from that you want to read
docs/README
for the reliable way to configure your kernel.

HTH,
