From: Ashish_Kumar_Mishra <dgashu55@gmail.com>
Date: Wed, 4 Jan 2017 05:31:25 -0800 (PST)
Subject: [Buildroot] Kernel Panic with BB Black + buildroot-2016.11.1
Message-ID: <1483536685380-153942.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All , 

I updated my build root  setup from buildroot-2016.05 to buildroot-2016.11.1
. 
I was having an working build with buildroot-2016.05. 
Could team members provide some pointers as to how could i debug & figure
the cause of this panic. 
*The defconfig is :*-
~/my_virtual_project/release_branch_v2 :: cat defconfig 
BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-boneblack"
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"


*The kernel panic log is :-*
   1.566617] Initializing XFRM netlink socket
[    1.571450] NET: Registered protocol family 10
[    1.583204] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.591864] NET: Registered protocol family 17
[    1.596769] NET: Registered protocol family 15
[    1.601786] Key type dns_resolver registered
[    1.606505] omap_voltage_late_init: Voltage driver support not added
[    1.613212] sr_dev_init: No voltage domain specified for smartreflex0.
Cannot initialize
[    1.621671] sr_dev_init: No voltage domain specified for smartreflex1.
Cannot initialize
[    1.630866] ThumbEE CPU extension supported.
[    1.635453] Registering SWP/SWPB emulation handler
[    1.640457] SmartReflex Class3 initialized
[    1.685305] mmc0: host does not support reading read-only switch,
assuming write-enable
[    1.698976] random: fast init done
[    1.703692] mmc0: new high speed SDHC card at address aaaa
[    1.715542] mmc1: new high speed MMC card at address 0001
[    1.723510] mmcblk0: mmc0:aaaa SS08G 7.40 GiB 
[    1.732286] mmcblk1: mmc1:0001 MMC02G 1.79 GiB 
[    1.743154] mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB
[    1.750241]  mmcblk0: p1 p2
[    1.763843] mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB
[    1.772490] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[    1.779223] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
[    1.795263] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz
[    1.802850] hctosys: unable to open rtc device (rtc0)
[    1.808139] sr_init: No PMIC hook to init smartreflex
[    1.813726] sr_init: platform driver register failed for SR
[    1.849014] List of all partitions:
[    1.853024] 0100           16384 ram0  (driver?)
[    1.857873] 0101           16384 ram1  (driver?)
[    1.862797] 0102           16384 ram2  (driver?)
[    1.867631] 0103           16384 ram3  (driver?)
[    1.872472] 0104           16384 ram4  (driver?)
[    1.877353] 0105           16384 ram5  (driver?)
[    1.882190] 0106           16384 ram6  (driver?)
[    1.887065] 0107           16384 ram7  (driver?)
[    1.891898] 0108           16384 ram8  (driver?)
[    1.896779] 0109           16384 ram9  (driver?)
[    1.901616] 010a           16384 ram10  (driver?)
[    1.906576] 010b           16384 ram11  (driver?)
[    1.911503] 010c           16384 ram12  (driver?)
[    1.916457] 010d           16384 ram13  (driver?)
[    1.921383] 010e           16384 ram14  (driver?)
[    1.926339] 010f           16384 ram15  (driver?)
[    1.931281] b300         7761920 mmcblk0  driver: mmcblk
[    1.936875]   b301           72261 mmcblk0p1 4448733f-01
[    1.942432]   b302         7688635 mmcblk0p2 4448733f-02
[    1.948014] b308         1875968 mmcblk1  driver: mmcblk
[    1.953607] b318            1024 mmcblk1boot1  (driver?)
[    1.959168] b310            1024 mmcblk1boot0  (driver?)
[    1.964747] No filesystem could mount root, tried:  ext4
[    1.970308] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(179,1)
[    1.979256] ---[ end Kernel panic - not syncing: VFS: Unable to mount
root fs on unknown-block(179,1)
[  131.712714] random: crng init done




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Kernel-Panic-with-BB-Black-buildroot-2016-11-1-tp153942.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
