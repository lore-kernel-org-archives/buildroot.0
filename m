From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Apr 2008 16:45:57 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Wed\, 2 Apr 2008 16\:16\:12 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
Message-ID: <8763v071sq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 Guillaume> Anyone care to comment on that:
 Guillaume> $ make ARCH=ppc linux26-menuconfig
 Guillaume> [ -f
 Guillaume> /home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/.config ] |
 Guillaume> | cp local/genepy/linux-2.6.24.config
 Guillaume> /home/guinevere/buildroot/project_build_pp
 Guillaume> c/genepy/linux-2.6.24/.config
 Guillaume> /usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=powerpc
 Guillaume> [...]

 Guillaume> Why does ARCH change ?!?

Because target/linux/Makefile.in uses KERNEL_ARCH for ARCH setting,
and not what you have set ARCH to on the cmdline.

KERNEL_ARCH is calculated in
toolchain/kernel-headers/kernel-headers.mk - Notice that arch/ppc is
deprecated, you should use arch/powerpc nowadays.

-- 
Bye, Peter Korsgaard
