From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2011 20:57:45 +0100
Subject: [Buildroot] [PATCH] Add Armadeus systems APF9328 support.
In-Reply-To: <1321525301-13110-1-git-send-email-julien.boibessot@free.fr>
References: <1321525301-13110-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20111117205745.00cfdac6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Good to see Armadeus stuff coming into mainline Buildroot!

Le Thu, 17 Nov 2011 11:21:41 +0100,
julien.boibessot at free.fr a ?crit :

> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> The APF9328 is an i.MXL+FPGA based SOM (System On Module). Here only minimal support is added: booting Linux kernel (UART, Ethernet and NOR), Buildroot toolchain and JFFS2 rootfs.

This should be wrapped at ~80 chars.

> +BR2_DL_DIR="$(BASE_DIR)/../downloads"
> +BR2_SOURCEFORGE_MIRROR="switch"
> +BR2_JLEVEL=1
> +BR2_CCACHE=y

Those four options (or at least the first three) are very
user-specific. I don't think they should be part of a default board
configuration file.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_PATCH="board/armadeus/apf9328"
> +BR2_LINUX_KERNEL_DEFCONFIG="mx1"

Since two kernel patches are needed, you should have a defconfig that
explicitly tells which kernel version it wants:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"

see configs/qemu_* for examples.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
