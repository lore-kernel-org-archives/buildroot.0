From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Nov 2020 19:11:08 +0100
Subject: [Buildroot] U-boot fails to find defconfig file that is there
In-Reply-To: <ac5a4ad9-16e4-dffb-8128-34a329842232@holosynth.com>
References: <ac5a4ad9-16e4-dffb-8128-34a329842232@holosynth.com>
Message-ID: <20201129191108.1c1b2779@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Trond,

On Sun, 29 Nov 2020 18:10:53 +0100, Trond Melen <trond.melen@holosynth.com> wrote:

> Dear All,
> 
> I have succesfully build kernels and rootfs for both Netgear ReadyNAS 
> RN102 (my real target) and RaspberryPi 3B (to practice), but building 
> U-boot fails for both targets as shown below. What am I missing?
> 
> Regards,
> Trond Melen
> 
> ===========================================================
> tme at laptop:~/buildroot$ make
> ***
> *** Can't find default configuration 
> "arch/../configs/raspberrypi3_defconfig"!
> ***
> make[3]: *** [scripts/kconfig/Makefile:110: raspberrypi3_defconfig] Error 1
> make[2]: *** [Makefile:565: raspberrypi3_defconfig] Error 2
> make[1]: *** [boot/uboot/uboot.mk:497: 
> /home/tme/buildroot/output/build/uboot-2020.10/.stamp_dotconfig] Error 2
> make: *** [Makefile:84: _all] Error 2

U-boot uses a different naming schema than buildroot, use e.g.
(without _defconfig tail):

	BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_3"

> 
> tme at tlaptop:~/buildroot$ ls -alF arch/../configs/raspberrypi3_defconfig
> -rw-rw-r-- 1 tme tme 1139 Nov.? 29 10:05 
> arch/../configs/raspberrypi3_defconfig
> 
> tme at tlaptop:~/buildroot$ find . -name raspberrypi3_defconfig
> ./configs/raspberrypi3_defconfig
> ./boot/uboot/2020.07/configs/raspberrypi3_defconfig
> ===========================================================

	$ ls build/uboot-2020.10/configs
	[...]
	rpi_0_w_defconfig
	rpi_2_defconfig
	rpi_3_32b_defconfig
	rpi_3_b_plus_defconfig
	rpi_3_defconfig
	rpi_4_32b_defconfig
	rpi_4_defconfig
	rpi_arm64_defconfig
	rpi_defconfig
	[...]

Regards,
Peter

> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
