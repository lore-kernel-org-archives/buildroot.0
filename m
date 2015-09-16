From: Kevin Golding <kevin@kgolding.co.uk>
Date: Wed, 16 Sep 2015 15:45:33 +0100
Subject: [Buildroot] Olimex A20 Micro - freezing during boot up
Message-ID: <55F9808D.1020809@kgolding.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've created a system based on the olimex_a20_olinuxino_micro_defconfig 
and I'm seeing it freeze at around 1.2 seconds during the boot up.

I'm a little worried about some of the errors during the boot such as 
"Failed to set core voltage! Can't set CPU frequency" & "*** Warning - 
bad CRC, using default environment" but as a complete newbie I'm not 
sure how important they are!

I've copied the serial capture below, and I would love to get my hands 
of someone's working equivalent to compare against, or any 
suggestions/advice?

Thanks,

Kevin

--------------------------- Serial capture below 
-------------------------------

U-Boot SPL 2015.04 (Sep 16 2015 - 09:57:21)
DRAM: 1024 MiB
Failed to set core voltage! Can't set CPU frequency


U-Boot 2015.04 (Sep 16 2015 - 09:57:21) Allwinner Technology

CPU:   Allwinner A20 (SUN7I)
I2C:   ready
DRAM:  1 GiB
MMC:   SUNXI SD/MMC: 0, SUNXI SD/MMC: 1
*** Warning - bad CRC, using default environment

Setting up a 1024x768 vga console
In:    serial
Out:   vga
Err:   vga
SCSI:  SUNXI SCSI INIT
SATA link 0 timeout.
AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl SATA mode
flags: ncq stag pm led clo only pmp pio slum part ccc apst
Net:   dwmac.1c50000
starting USB...
USB0:   USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
USB1:   USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
        scanning usb for storage devices... 0 Storage Device(s) found
Hit any key to stop autoboot:  2 [08][08][08] 1 [08][08][08] 0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found U-Boot script /boot/boot.scr
294 bytes read in 276 ms (1000 Bytes/s)
## Executing script at 43100000
26206 bytes read in 315 ms (81.1 KiB/s)
2702088 bytes read in 702 ms (3.7 MiB/s)
Kernel image @ 0x46000000 [ 0x000000 - 0x293b08 ]
## Flattened Device Tree blob at 49000000
    Booting using the fdt blob at 0x49000000
    Using Device Tree in place at 49000000, end 4900965d

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.0.5 
(kgolding at HP-Compaq-8200-Elite-SFF-PC) (gcc version 4.9.3 (Buildroot 
2015.11-git-00199-gbb16637) ) #1 SMP Wed Sep 16 09:02:40 BST 2015
[    0.000000] CPU: ARMv7 Processor [410fc074] revision 4 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] Machine model: Olimex A20-Olinuxino Micro
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from DT
[    0.000000] PERCPU: Embedded 8 pages/cpu @eefd0000 s10944 r0 d21824 
u32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  
Total pages: 259856
[    0.000000] Kernel command line: console=ttyS0,115200 
root=/dev/mmcblk0p1 rootwait panic=10
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes)
[    0.000000] Memory: 1030880K/1045504K available (3940K kernel code, 
176K rwdata, 824K rodata, 240K init, 228K bss, 14624K reserved, 0K 
cma-reserved, 267264K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]       .text : 0xc0008000 - 0xc04af604   (4766 kB)
[    0.000000]       .init : 0xc04b0000 - 0xc04ec000   ( 240 kB)
[    0.000000]       .data : 0xc04ec000 - 0xc0518200   ( 177 kB)
[    0.000000]        .bss : 0xc0518200 - 0xc055153c   ( 229 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (phys).
[    0.000016] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps 
every 2863311519744ns
[    0.000042] Switching to timer-based delay loop, resolution 41ns
[    0.000768] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps 
every 178956969942ns
[    0.001431] Console: colour dummy device 80x30
[    0.001477] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.001506] pid_max: default: 32768 minimum: 301
[    0.001733] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001758] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes)
[    0.002754] CPU: Testing write buffer coherency: ok
[    0.003172] /cpus/cpu at 0 missing clock-frequency property
[    0.003207] /cpus/cpu at 1 missing clock-frequency property
[    0.003232] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.003334] Setting up static identity map for 0x403be990 - 0x403be9e8
[    0.005731] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.005877] Brought up 2 CPUs
[    0.005913] SMP: Total of 2 processors activated (96.00 BogoMIPS).
[    0.005927] CPU: All CPU(s) started in HYP mode.
[    0.005939] CPU: Virtualization extensions available.
[    0.006939] devtmpfs: initialized
[    0.008440] VFP support v0.3: implementor 41 architecture 2 part 30 
variant 7 rev 4
[    0.009304] pinctrl core: initialized pinctrl subsystem
[    0.025400] NET: Registered protocol family 16
[    0.025987] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    0.040215] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 
watchpoint registers.
[    0.040240] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.054317] reg-fixed-voltage ahci-5v: could not find pctldev for 
node /soc at 01c00000/pinctrl at 01c20800/ahci_pwr_pin at 0, deferring probe
[    0.054366] platform ahci-5v: Driver reg-fixed-voltage requests probe 
deferral
[    0.054425] reg-fixed-voltage usb1-vbus: could not find pctldev for 
node /soc at 01c00000/pinctrl at 01c20800/usb1_vbus_pin at 0, deferring probe
[    0.054456] platform usb1-vbus: Driver reg-fixed-voltage requests 
probe deferral
[    0.054509] reg-fixed-voltage usb2-vbus: could not find pctldev for 
node /soc at 01c00000/pinctrl at 01c20800/usb2_vbus_pin at 0, deferring probe
[    0.054538] platform usb2-vbus: Driver reg-fixed-voltage requests 
probe deferral
[    0.056717] SCSI subsystem initialized
[    0.057682] usbcore: registered new interface driver usbfs
[    0.057795] usbcore: registered new interface driver hub
[    0.057933] usbcore: registered new device driver usb
[    0.058265] pps_core: LinuxPPS API ver. 1 registered
[    0.058282] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.058347] PTP clock support registered
[    0.060426] Switched to clocksource arch_sys_counter
[    0.081993] NET: Registered protocol family 2
[    0.083250] TCP established hash table entries: 8192 (order: 3, 32768 
bytes)
[    0.083463] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.083763] TCP: Hash tables configured (established 8192 bind 8192)
[    0.083897] TCP: reno registered
[    0.083930] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.084016] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.084422] NET: Registered protocol family 1
[    0.085003] RPC: Registered named UNIX socket transport module.
[    0.085031] RPC: Registered udp transport module.
[    0.085044] RPC: Registered tcp transport module.
[    0.085058] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.085998] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 
counters available
[    0.088339] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.111458] NFS: Registering the id_resolver key type
[    0.111552] Key type id_resolver registered
[    0.111568] Key type id_legacy registered
[    0.111949] bounce: pool size: 64 pages
[    0.112397] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 250)
[    0.112432] io scheduler noop registered
[    0.112456] io scheduler deadline registered
[    0.112872] io scheduler cfq registered (default)
[    0.113854] platform 1c13400.phy: Driver sun4i-usb-phy requests probe 
deferral
[    0.119147] sun7i-a20-pinctrl 1c20800.pinctrl: initialized sunXi PIO 
driver
[    0.245967] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.252358] console [ttyS0] disabled
[    0.272648] 1c28000.serial: ttyS0 at MMIO 0x1c28000 (irq = 43, 
base_baud = 1500000) is a U6_16550A
[    0.873885] console [ttyS0] enabled
[    0.902216] 1c29800.serial: ttyS1 at MMIO 0x1c29800 (irq = 44, 
base_baud = 1500000) is a U6_16550A
[    0.936154] 1c29c00.serial: ttyS2 at MMIO 0x1c29c00 (irq = 45, 
base_baud = 1500000) is a U6_16550A
[    0.948451] platform 1c18000.sata: Driver ahci-sunxi requests probe 
deferral
[    0.959937] stmmaceth 1c50000.ethernet: no regulator found
[    0.965582] stmmaceth 1c50000.ethernet: no reset control found
[    0.971448]  Ring mode enabled
[    0.974511]  No HW DMA feature register supported
[    0.979042]  Normal descriptors
[    0.982390]  TX Checksum insertion supported
[    0.990464] libphy: stmmac: probed
[    0.993887] eth0: PHY ID 00008201 at 1 IRQ POLL (stmmac-0:01) active
[    1.000498] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.007046] ehci-platform: EHCI generic platform driver
[    1.012655] platform 1c14000.usb: Driver ehci-platform requests probe 
deferral
[    1.020064] platform 1c1c000.usb: Driver ehci-platform requests probe 
deferral
[    1.027542] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.033810] ohci-platform: OHCI generic platform driver
[    1.039309] platform 1c14400.usb: Driver ohci-platform requests probe 
deferral
[    1.046750] platform 1c1c400.usb: Driver ohci-platform requests probe 
deferral
[    1.056207] sunxi-rtc 1c20d00.rtc: rtc core: registered rtc-sunxi as rtc0
[    1.063082] sunxi-rtc 1c20d00.rtc: RTC enabled
[    1.067727] i2c /dev entries driver
[    1.073035] axp20x 0-0034: AXP20x variant AXP209 found
[    1.078689] axp20x 0-0034: Failed to set masks in 0x40: -6
[    1.084264] axp20x 0-0034: failed to add irq chip: -6
[    1.092777] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16 
sec, nowayout=0)
[    1.101056] Driver 'mmcblk' needs updating - please use bus_type methods
[    1.108745] sunxi-mmc 1c0f000.mmc: No vqmmc regulator found
[    1.114990] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    1.150750] sunxi-mmc 1c0f000.mmc: base:0xf00b8000 irq:27
[    1.157146] sunxi-mmc 1c12000.mmc: No vqmmc regulator found
[    1.163483] sunxi-mmc 1c12000.mmc: Got CD GPIO
[    1.200758] sunxi-mmc 1c12000.mmc: base:0xf00bc000 irq:28
[    1.208924] usbcore: registered new interface driver usbhid
[    1.214589] usbhid: USB HID core driver
[    1.220243] TCP: cubic registered
[    1.223677] NET: Registered protocol family 17
[    1.228168] mmc0: host does not support reading read-only switch, 
assuming write-e
