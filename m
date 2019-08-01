From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 17:54:25 +0200
Subject: [Buildroot] [PATCH v3] board: Add PowerPC mac99
In-Reply-To: <20190625012652.21853-1-joel@jms.id.au> (Joel Stanley's message
 of "Tue, 25 Jun 2019 10:56:52 +0930")
References: <20190625012652.21853-1-joel@jms.id.au>
Message-ID: <87wofwx4ni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > PowerPC kernel developers were after a userspace for testing 32-bit
 > powerpc kernels. This machine both suits that requirement and has
 > support in qemu. It's also a fairly common piece of 32-bit ppc hardware.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>
 > Tested-by: Daniel Axtens <dja@axtens.net>
 > ---
 > v3: Add ROOTFS_CPIO output as well as ext
 > v2: Use default output directory for qemu command line in readme

 > +++ b/configs/qemu_ppc_mac99_defconfig
 > @@ -0,0 +1,11 @@
 > +BR2_powerpc=y
 > +BR2_powerpc_7400=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 > +BR2_SYSTEM_DHCP="eth0"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 > +BR2_LINUX_KERNEL_VMLINUX=y

You forgot to specify the version of the Linux kernel /
kernel-headers. Committed with those set to 5.2.4, thanks.

With that said, we now have 4 32bit ppc qemu defconfigs which sounds
like a lot to me. Are they all still interesting / useful?

cd configs && ls qemu_ppc_*
qemu_ppc_g3beige_defconfig
qemu_ppc_mac99_defconfig
qemu_ppc_mpc8544ds_defconfig
qemu_ppc_virtex_ml507_defconfig

-- 
Bye, Peter Korsgaard
