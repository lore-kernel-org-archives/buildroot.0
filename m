From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Aug 2019 20:55:46 +0000
Subject: [Buildroot] [Bug 11746] stm32f469 didn't work correctly......
In-Reply-To: <bug-11746-163@https.bugs.busybox.net/>
References: <bug-11746-163@https.bugs.busybox.net/>
Message-ID: <bug-11746-163-Bk1A9yoVK8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11746

--- Comment #2 from Daniel Lezcano <daniel.lezcano@linaro.org> ---
Working version:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.11.0 (dlezcano at mai) (gcc version 7.3.0
(Buildroot 2018.11.4-g1e8dd19-dirty) ) #2 PREEMPT Sat Aug 17 19:49:09 CEST 2019
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F469i-DISCO
board
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.  Total
pages: 4064
[    0.000000] Kernel command line: root=/dev/ram
[    0.000000] PID hash table entries: 64 (order: -4, 256 bytes)
[    0.000000] Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Memory: 15944K/16384K available (1062K kernel code, 99K rwdata,
352K rodata, 59K init, 106K bss, 440K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x00000000 - 0x00001000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
[    0.000000]     lowmem  : 0x00000000 - 0x01000000   (  16 MB)
[    0.000000]       .text : 0x08008000 - 0x08169ad8   (1415 kB)
[    0.000000]       .init : 0x0000a000 - 0x0000d000   (  12 kB)
[    0.000000]       .data : 0x00008000 - 0x00023f20   ( 112 kB)
[    0.000000]        .bss : 0x00023f20 - 0x0003e848   ( 107 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 32.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] /soc/interrupt-controller at 40013c00: 23 External IRQs detected
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles:
0xffffff, max_idle_ns: 331816030 ns
[    0.000000] ARM System timer initialized as clocksource
[    0.000000] /soc/timer at 40000c00: STM32 clockevent driver initialized (32
bits)
[    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps
every 21474836475000000ns
[    0.010000] Calibrating delay loop... 118.68 BogoMIPS (lpj=593408)
[    0.100000] pid_max: default: 4096 minimum: 301
[    0.100000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.100000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.110000] devtmpfs: initialized
[    0.140000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
[    0.140000] pinctrl core: initialized pinctrl subsystem
[    0.210000] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    0.220000] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    0.220000] clocksource: Switched to clocksource arm_system_timer
[    0.660000] workingset: timestamp_bits=30 max_order=12 bucket_order=0
[    0.700000] io scheduler noop registered (default)
[    0.700000] io scheduler mq-deadline registered
[    0.710000] stm32f429-pinctrl soc:pin-controller: GPIOA bank added
[    0.710000] stm32f429-pinctrl soc:pin-controller: GPIOB bank added
[    0.710000] stm32f429-pinctrl soc:pin-controller: GPIOC bank added
[    0.710000] stm32f429-pinctrl soc:pin-controller: GPIOD bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOE bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOF bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOG bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOH bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOI bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOJ bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: GPIOK bank added
[    0.720000] stm32f429-pinctrl soc:pin-controller: Pinctrl STM32 initialized
[    0.730000] STM32 USART driver initialized
[    0.730000] 40004800.serial: ttyS0 at MMIO 0x40004800 (irq = 32, base_baud =
2812500) is a stm32-usart
[    1.090000] console [ttyS0] enabled
[    1.110000] stm32_rtc 40002800.rtc: rtc core: registered 40002800.rtc as
rtc0
[    1.110000] stm32_rtc 40002800.rtc: Date/Time must be initialized
[    1.140000] stm32_rtc 40002800.rtc: setting system clock to 2000-01-01
08:11:27 UTC (946714287)
[    1.150000] Freeing unused kernel memory: 12K
[    1.160000] This architecture does not have kernel memory protection.
can't run '/sbin/swapon': No such file or directory
[    1.560000] random: fast init done
Initializing random number generator... done.

Welcome to Buildroot
buildroot login:

-- 
You are receiving this mail because:
You are on the CC list for the bug.
