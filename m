From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Nov 2010 18:33:27 +0100
Subject: [Buildroot] Question about kernel defconfig
Message-ID: <20101122183327.1285c439@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

I am currently working on cleaning up how Buildroot handles board
configuration [1]. As part of this clean up, I'd like to move away from
full kernel .config files and instead use minimal kernel configs (only
non-default options are stored, the kernel configuration files are
produced with savedefconfig).

So, for example for the Qemu Versatile platform, I have the kernel
configuration file visible at
http://git.buildroot.net/~tpetazzoni/git/buildroot/tree/board/qemu/arm-versatile/linux-2.6.36.config?h=for-2010.11/boards-cleanup&id=8033fd6cbacfa96a3bcfce74caad8c423bf60cd1.

When Buildroot configures the kernel, it simply copies the given kernel
configuration file to .config into the kernel source tree. See
http://git.buildroot.net/buildroot/tree/linux/linux.mk#n89.

Unfortunately, with those minimal configuration files, the kernel
"Restart config" and then asks interactively for the value of all
options not specificied in the minimal configuration file.

I'd like to have the same behaviour the kernel has when using its own
internal defconfigs files from arch/$(ARCH)/configs. Is this possible ?
Did I miss something totally obvious ?

Thanks,

Thomas

[1]
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=for-2010.11/boards-cleanup
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
