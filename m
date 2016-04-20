From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 22:02:28 +0200
Subject: [Buildroot] [PATCH] uboot build and deploy added to juno board
In-Reply-To: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
References: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
Message-ID: <20160420220228.59d5e54f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 18:47:04 +0100, Joao Pinto wrote:
> This patch has the goal to add to the juno board defconfig the u-boot build 
> configurations. The juno board readme file was also updated with the
> necessary steps to build the ARM Trusted Firmware (with u-boot in it) and
> how to deploy it.

Thanks!

> +Building bootloader files bl1.bin and fip.bin
> +=============================================
> +First clone ARM Trusted Firmware repository
> +
> +   $ git clone https://github.com/ARM-software/arm-trusted-firmware.git
> +
> +After clonning, please configure the following environment variables:
> +
> +  CROSS_COMPILE=<buidlroot_path>/output/host/usr/bin/aarch64-buildroot-linux-gnu-
> +  BL33=<buidlroot_path>/output/images/u-boot.bin
> +  SCP_BL2=<path_to_scp_firmware>
> +
> +Finaly execute:
> +  make PLAT=juno all fip

The whole point of Buildroot is to automate the build process, so this
should be done by a Buildroot package, rather than manually by the
user. So a package for ATF should probably be created.

I also work on an ARM64 platform that uses ATF+U-Boot, so I'll be able
to compare and tell you whether what you're proposing is only
applicable to Juno, or can be used for other platforms as well.

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y

Using the legacy build system with a modern U-Boot such as 2016.03
doesn't make much sense. Please use the kconfig based build system,
unless there is a real reason not to.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
