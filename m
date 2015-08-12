From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 12 Aug 2015 19:06:09 +0100
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD9365@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
 <CA+BsyQ5DRnaPbH6dDiPEGcxqckwHMUo3ckyoRkyp0iuWGc-OjA@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD9365@svr-wa-exch1.atg.lc>
Message-ID: <CA+BsyQ7K9FZ1Z2Q-hfkpeY8jvKzAc3ek_n3VRgs=U=AXd5GUEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cc list]

> The attached are the files you like to see. I used BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE because Marvell's CA9 defconfig files do not exist in the buildroot-2015.05/configs folder. Altogether Marvell gave me four defconfig files shows as below:
>
> tclee at Latitude-E6400:~/Downloads/aug10mon15/buildroot-2015.05$ ls -lrt ../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9*defconfig
> -rw-r--r-- 1 tclee tclee   659 Feb 27 17:52 ../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9_armv7_le_uclibc_sfp_reduced_defconfig
> -rwxr-xr-x 1 tclee tclee 30708 Feb 27 17:52 ../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9_armv7_le_uclibc_sfp_defconfig
> -rwxr-xr-x 1 tclee tclee 30488 Feb 27 17:52 ../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9_armv7_le_hfp_defconfig
> -rwxr-xr-x 1 tclee tclee 30055 Feb 27 17:52 ../../ARMADA/ARMADAsoftware/buildroot/configs/marvell_ca9_armv7_be_hfp_defconfig

Tommy,

These are buildroot configurations. You're passing them to the kernel
build, which will definitely not work.

I'd suggest using the mvebu_v7_defconfig which is part of the kernel
tree (in recent kernel versions). In Buildroot, under Linux kernel,
set the "in-tree defconfig file" option, and set "defconfig name" to
mvebu_v7.

Marvell appear to have their own toolchain, which they expect to find
in /opt. It's probably nothing special, though.

Brendan
