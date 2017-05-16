From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:04:44 +0200
Subject: [Buildroot] dts: compiling aarch64 vendored dts files?
In-Reply-To: <CA+h8R2pXBkv6juGSt3wdZtEjuVP=Q6ixTi51-6+tJDVNgw5acA@mail.gmail.com>
 (Christian Stewart's message of "Mon, 15 May 2017 22:15:38 -0400")
References: <CA+h8R2pXBkv6juGSt3wdZtEjuVP=Q6ixTi51-6+tJDVNgw5acA@mail.gmail.com>
Message-ID: <87ziec7btf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Thomas, All,
 > I can't figure out a correct way of configuring Buildroot to compile a
 > DTS under a vendor directory in the kernel:

 > /arch/arm64/boot/dts/nexell/s5p6818-artik710-raptor-rev03.dts
 >                                        ^

 > The source I'm trying to build is here:

 > https://github.com/SamsungARTIK/linux-artik/tree/A710/v4.4/arch/arm64/boot/dts/nexell

 > The issue is that unlike most arches, arm64 has the dts files under
 > subdirectories - in this case, nexell. I've tried:

 >  - BR2_LINUX_KERNEL_INTREE_DTS_NAME="s5p6818-artik710-raptor-rev03"
 >  - BR2_LINUX_KERNEL_INTREE_DTS_NAME="nexell-s5p6818-artik710-raptor-rev03"
 >  - BR2_LINUX_KERNEL_INTREE_DTS_NAME="nexell/s5p6818-artik710-raptor-rev03"

 > The developers recommend using "make dtbs" in the kernel, which
 > probably finds these automatically. AFAIK there is no mechanism in
 > Buildroot to allow running something like this.

What error are you getting exactly? We have a number of aarch64
defconfigs using this feature without problems:

git grep 'INTREE_DTS_NAME=.*/' configs
configs/arm_foundationv8_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
configs/arm_juno_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
configs/nexbox_a95x_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-nexbox-a95x"
configs/raspberrypi3_64_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"

-- 
Bye, Peter Korsgaard
