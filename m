From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 06:42:52 +0000
Subject: [Buildroot] [PATCH v3] board: Add PowerPC mac99
In-Reply-To: <87wofwx4ni.fsf@dell.be.48ers.dk>
References: <20190625012652.21853-1-joel@jms.id.au>
 <87wofwx4ni.fsf@dell.be.48ers.dk>
Message-ID: <CACPK8XfC=f5t+=KwmzTHDR-KedP0nLkgf8YHcRv+NpVVZ5ikDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Aug 2019 at 15:54, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:
>
>  > PowerPC kernel developers were after a userspace for testing 32-bit
>  > powerpc kernels. This machine both suits that requirement and has
>  > support in qemu. It's also a fairly common piece of 32-bit ppc hardware.
>
>  > Signed-off-by: Joel Stanley <joel@jms.id.au>
>  > Tested-by: Daniel Axtens <dja@axtens.net>
>  > ---
>  > v3: Add ROOTFS_CPIO output as well as ext
>  > v2: Use default output directory for qemu command line in readme
>
>  > +++ b/configs/qemu_ppc_mac99_defconfig
>  > @@ -0,0 +1,11 @@
>  > +BR2_powerpc=y
>  > +BR2_powerpc_7400=y
>  > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  > +BR2_SYSTEM_DHCP="eth0"
>  > +BR2_LINUX_KERNEL=y
>  > +BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>  > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>  > +BR2_LINUX_KERNEL_VMLINUX=y
>
> You forgot to specify the version of the Linux kernel /
> kernel-headers. Committed with those set to 5.2.4, thanks.

I didn't forget, I omitted them so the config would use the latest default.

Is there a reason we specify a fixed version?

> With that said, we now have 4 32bit ppc qemu defconfigs which sounds
> like a lot to me. Are they all still interesting / useful?

I am not familiar with them. Michael?

They all target different CPUs which means there is no overlap at least:

$ grep -r BR2_powerpc_ configs/qemu_ppc_*
configs/qemu_ppc_g3beige_defconfig:BR2_powerpc_750=y
configs/qemu_ppc_mac99_defconfig:BR2_powerpc_7400=y
configs/qemu_ppc_mpc8544ds_defconfig:BR2_powerpc_8548=y
configs/qemu_ppc_virtex_ml507_defconfig:BR2_powerpc_440=y

Cheers,

Joel
