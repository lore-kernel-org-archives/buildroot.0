From: Christian Stewart <christian@paral.in>
Date: Mon, 15 May 2017 22:15:38 -0400
Subject: [Buildroot] dts: compiling aarch64 vendored dts files?
Message-ID: <CA+h8R2pXBkv6juGSt3wdZtEjuVP=Q6ixTi51-6+tJDVNgw5acA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

I can't figure out a correct way of configuring Buildroot to compile a
DTS under a vendor directory in the kernel:

/arch/arm64/boot/dts/nexell/s5p6818-artik710-raptor-rev03.dts
                                       ^

The source I'm trying to build is here:

https://github.com/SamsungARTIK/linux-artik/tree/A710/v4.4/arch/arm64/boot/dts/nexell

The issue is that unlike most arches, arm64 has the dts files under
subdirectories - in this case, nexell. I've tried:

 - BR2_LINUX_KERNEL_INTREE_DTS_NAME="s5p6818-artik710-raptor-rev03"
 - BR2_LINUX_KERNEL_INTREE_DTS_NAME="nexell-s5p6818-artik710-raptor-rev03"
 - BR2_LINUX_KERNEL_INTREE_DTS_NAME="nexell/s5p6818-artik710-raptor-rev03"

The developers recommend using "make dtbs" in the kernel, which
probably finds these automatically. AFAIK there is no mechanism in
Buildroot to allow running something like this.

Thanks for the help.

~ Christian Stewart
