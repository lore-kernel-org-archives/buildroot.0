From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 2 Apr 2008 16:16:12 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
Message-ID: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone care to comment on that:

$ make ARCH=ppc linux26-menuconfig
[ -f
/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/.config ] |
| cp local/genepy/linux-2.6.24.config
/home/guinevere/buildroot/project_build_pp
c/genepy/linux-2.6.24/.config
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=powerpc
[...]

Why does ARCH change ?!?

[...]
.config:132:warning: trying to assign nonexistent symbol XILINX_ML405
[...]

$ find -name Kconfig -exec grep -H XILINX_ML405 {} \;
./toolchain_build_powerpc/linux-2.6.24/arch/ppc/platforms/4xx/Kconfig:config
XILINX_ML405
./project_build_ppc/genepy/linux-2.6.24/arch/ppc/platforms/4xx/Kconfig:config
XILINX_ML405
./toolchain_build_ppc/linux-2.6.24/arch/ppc/platforms/4xx/Kconfig:config
XILINX_ML405

Well, it's no surprise that it won't find them if it looks in the powerpc
branch...
The question is why ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
