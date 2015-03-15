From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 22:45:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-13
In-Reply-To: <20150315213644.GC28815@waldemar-brodkorb.de>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
 <20150215173009.GK32479@waldemar-brodkorb.de>
 <20150315142822.2e018813@free-electrons.com>
 <20150315213644.GC28815@waldemar-brodkorb.de>
Message-ID: <20150315224511.3406c1d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 15 Mar 2015 22:36:45 +0100, Waldemar Brodkorb wrote:

> If you want to create a sh4 toolchain, which is usable to compile a
> Linux Kernel you need to enable multilib support so that the
> toolchain can be used to compile fpu/non-fpu code.
> If you use make qemu_sh4_r2d_defconfig, then following option is
> enabled:
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
> This works fine and the result boots up fine in Qemu.

Yes, and it's not great that we have to pass such a custom gcc option
to get a toolchain that is capable of building the Linux kernel.

> Your defconfig does not generate a multilib toolchain.
> The compiler still generates
> br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib/!m4/libgcc_s.so
> which is not matched by your globbing in
> package/gcc/gcc-final/gcc-final.mk ->
> $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s*
> 
> The sh4 stuff was already discussed last year by you:
> http://lists.busybox.net/pipermail/buildroot/2014-March/091385.html
> 
> The patch will work fine.

But does this patch works when yuo have
--with-multilib-list=m4,m4-nofpu? Then I guess you have two libgcc in
two different directories, so with this patch, we're going to pick one
of them, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
