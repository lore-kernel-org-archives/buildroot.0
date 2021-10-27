Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457BEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A300960D43
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A300960D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCCF60661;
	Wed, 27 Oct 2021 13:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tdTCvayTbyK; Wed, 27 Oct 2021 13:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C79607F0;
	Wed, 27 Oct 2021 13:51:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF0DA1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A898D4019F
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pe9tEanKOhqG for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:51:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 442364018A
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:51:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5BD2A2000B;
 Wed, 27 Oct 2021 13:51:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfjLE-000165-4n; Wed, 27 Oct 2021 15:51:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
Date: Wed, 27 Oct 2021 15:51:44 +0200
In-Reply-To: <20211026071728.954356-6-damien.lemoal@wdc.com> (Damien Le Moal's
 message of "Tue, 26 Oct 2021 16:17:23 +0900")
Message-ID: <87cznqpocv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Damien" == Damien Le Moal <damien.lemoal@wdc.com> writes:

 > Add two configuration files to support the dual-core RV64 Canaan K210
 > SoC based Sipeed MAIX-bit board.

 > The first configuration file, sipeed_maix_bit_defconfig, enables
 > building a bootable kernel 5.13 image with the root file system
 > initramfs linked with the kernel. This configuration modifies the
 > default busybox configuration busybox-minimal.config using the fragment
 > file board/canaan/k210-common/busybox-tiny.config. This reduces the
 > size of the busybox executable to save memory when executing shell
 > commands.

 > The second configuration file (sipeed_maix_bit_sdcard_defconfig) builds
 > a bootable kernel 5.13 image that uses the board SD card for the root
 > file system. This configuration uses the default busybox minimal
 > configuration.

 > Both configurations share the same device tree which is provided by and
 > built-in the kernel. This configuration is set with the kernel
 > configuration snippet provided by the configuration file
 > board/sipeed/maix-bit/linux-dtb.config.

 > Both configurations also share the same init script provided using the
 > rootfs_overlay root file system overlay. This provides the /sbin/init
 > script which replaces the default init process as it causes failures
 > due to excessive memory usage.

 > busybox-tiny.config and the rootfs overlay will be reused for all
 > Canaan K210 SoC based boards. These 2 files are thus placed in the
 > directory board/canaan/k210-common while the Sipeed MAIX-bit board
 > specific kernel config snippet is added under the directory
 > board/sipeed/maix-bit.

 > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
 > ---
 >  board/canaan/k210-common/busybox-tiny.config  | 241 ++++++++++++++++++
 >  board/canaan/k210-common/rootfs_overlay/init  |   1 +
 >  .../k210-common/rootfs_overlay/sbin/init      |  27 ++
 >  board/sipeed/maix-bit/linux-dtb.config        |   2 +
 >  configs/sipeed_maix_bit_defconfig             |  14 +
 >  configs/sipeed_maix_bit_sdcard_defconfig      |  13 +
 >  6 files changed, 298 insertions(+)
 >  create mode 100644 board/canaan/k210-common/busybox-tiny.config
 >  create mode 120000 board/canaan/k210-common/rootfs_overlay/init
 >  create mode 100755 board/canaan/k210-common/rootfs_overlay/sbin/init
 >  create mode 100644 board/sipeed/maix-bit/linux-dtb.config
 >  create mode 100644 configs/sipeed_maix_bit_defconfig
 >  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig

 > diff --git a/board/canaan/k210-common/busybox-tiny.config b/board/canaan/k210-common/busybox-tiny.config
 > new file mode 100644
 > index 0000000000..7adcaf1db9
 > --- /dev/null
 > +++ b/board/canaan/k210-common/busybox-tiny.config
 > @@ -0,0 +1,241 @@
 > +#
 > +# Additional config changes for busybox-minimal.config
 > +# to reduce the size of the busybox executable.
 > +#
 > +
 > +#
 > +# Settings
 > +#
 > +# CONFIG_INCLUDE_SUSv2 is not set
 > +# CONFIG_LONG_OPTS is not set
 > +# CONFIG_LFS is not set
 > +# CONFIG_FEATURE_DEVPTS is not set
 > +# CONFIG_FEATURE_SYSLOG_INFO is not set
 > +# CONFIG_FEATURE_SYSLOG is not set
 > +
 > +#
 > +# Build Options
 > +#
 > +CONFIG_NOMMU=y

That is already taken care of in package/busybox/busybox.mk

Did you verify if all of these tweaks are needed? This looks pretty
extensive. Perhaps we should update busybox-minimal with some of these
instead?

 > diff --git a/board/canaan/k210-common/rootfs_overlay/init b/board/canaan/k210-common/rootfs_overlay/init
 > new file mode 120000
 > index 0000000000..a0b71977c0
 > --- /dev/null
 > +++ b/board/canaan/k210-common/rootfs_overlay/init
 > @@ -0,0 +1 @@
 > +/sbin/init
 > \ No newline at end of file

Why? Isn't fs/cpio/init suitable?


 > diff --git a/board/canaan/k210-common/rootfs_overlay/sbin/init b/board/canaan/k210-common/rootfs_overlay/sbin/init
 > new file mode 100755
 > index 0000000000..6ec4748c03
 > --- /dev/null
 > +++ b/board/canaan/k210-common/rootfs_overlay/sbin/init
 > @@ -0,0 +1,27 @@
 > +#!/bin/sh
 > +
 > +# Mount sysfs and procfs
 > +/bin/mount -t sysfs sysfs /sys
 > +/bin/mount -t proc proc /proc
 > +
 > +# Use the /dev/console device node from devtmpfs if possible to not
 > +# confuse glibc's ttyname_r().
 > +# This may fail (E.G. booted with console=), and errors from exec will
 > +# terminate the shell, so use a subshell for the test
 > +if (exec 0</dev/console) 2>/dev/null; then
 > +    exec 0</dev/console
 > +    exec 1>/dev/console
 > +    exec 2>/dev/console
 > +fi
 > +
 > +# Print a fun logo :)
 > +echo "          __  _"
 > +echo "         / / (_) ____   _   _ __  __"
 > +echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
 > +echo "       / /___| || | | || |_| | >  < "
 > +echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
 > +echo "    64-bits RISC-V Kendryte K210 NOMMU"
 > +echo ""
 > +
 > +# Start interactive shell
 > +exec /bin/sh

Cute, but why can't we use the normal busybox init / inittab?


 > diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
 > new file mode 100644
 > index 0000000000..bbbe00d44d
 > --- /dev/null
 > +++ b/configs/sipeed_maix_bit_defconfig
 > @@ -0,0 +1,14 @@
 > +BR2_riscv=y
 > +BR2_PACKAGE_HOST_ELF2FLT=y
 > +# BR2_USE_MMU is not set
 > +BR2_INIT_NONE=y
 > +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
 > +BR2_LINUX_KERNEL=y

You don't specify the kernel version, so it will change every time we
bump it, please specify a known good version.

I gave it a try here, and it fails to boot with 5.14.14:

[    0.000000] Linux version 5.14.14 (peko@dell) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2021.08-1048-g5e9960e97a) 10.3.0, GNU ld (GNU Binutils) 2.32) #2 SMP Wed Oct 27 15:23:57 CEST 2021
[    0.000000] Machine model: SiPeed MAIX BiT
[    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options '115200n8')
[    0.000000] printk: bootconsole [sifive0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
[    0.000000] percpu: Embedded 12 pages/cpu s19488 r0 d29664 u49152
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
[    0.000000] Kernel command line: earlycon console=ttySIF0
[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 5924K/8192K available (954K kernel code, 130K rwdata, 203K rodata, 612K init, 66K bss, 2268K reserved, 0K cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 2 contexts.
[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
[    0.008190] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
[    0.018252] pid_max: default: 4096 minimum: 301
[    0.022864] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.040317] rcu: Hierarchical SRCU implementation.
[    0.045164] smp: Bringing up secondary CPUs ...
[    0.050277] smp: Brought up 1 node, 2 CPUs
[    0.054394] devtmpfs: initialized
[    0.071455] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.080529] pinctrl core: initialized pinctrl subsystem
[    0.118390] clocksource: Switched to clocksource clint_clocksource
[    0.130717] workingset: timestamp_bits=62 max_order=11 bucket_order=0
[    0.179654] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
[    0.192098] k210-sysctl 50440000.syscon: K210 system controller
[    0.198640] k210-rst 50440000.syscon:reset-controller: K210 reset controller
[    0.205661] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
[    0.214615] printk: console [ttySIF0] enabled
[    0.214615] printk: console [ttySIF0] enabled
[    0.223228] printk: bootconsole [sifive0] disabled
[    0.223228] printk: bootconsole [sifive0] disabled
[    0.234774] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.252477] i2c /dev entries driver
[    0.257111] random: get_random_bytes called from 0x000000008000569a with crng_init=0
[    0.270302] Freeing unused kernel image (initmem) memory: 608K
[    0.275461] This architecture does not have kernel memory protection.
[    0.281864] Run /init as init process
[    0.288105] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
[    0.295040] SMP: stopping secondary CPUs
[    0.298959] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
[    0.000000] Linux version 5.14.14 (peko@dell) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2021.08-1048-g5e9960e97a) 10.3.0, GNU ld (GNU Binutils) 2.32) #2 SMP Wed Oct 27 15:23:57 CEST 2021
[    0.000000] Machine model: SiPeed MAIX BiT
[    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options '115200n8')
[    0.000000] printk: bootconsole [sifive0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
[    0.000000] percpu: Embedded 12 pages/cpu s19488 r0 d29664 u49152
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
[    0.000000] Kernel command line: earlycon console=ttySIF0
[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 5924K/8192K available (954K kernel code, 130K rwdata, 203K rodata, 612K init, 66K bss, 2268K reserved, 0K cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 2 contexts.
[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
[    0.008190] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
[    0.018252] pid_max: default: 4096 minimum: 301
[    0.022864] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.040304] rcu: Hierarchical SRCU implementation.
[    0.045147] smp: Bringing up secondary CPUs ...
[    0.050247] smp: Brought up 1 node, 2 CPUs
[    0.054362] devtmpfs: initialized
[    0.071442] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.080516] pinctrl core: initialized pinctrl subsystem
[    0.118372] clocksource: Switched to clocksource clint_clocksource
[    0.130700] workingset: timestamp_bits=62 max_order=11 bucket_order=0
[    0.180388] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
[    0.192630] k210-sysctl 50440000.syscon: K210 system controller
[    0.199205] k210-rst 50440000.syscon:reset-controller: K210 reset controller
[    0.206469] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
[    0.215380] printk: console [ttySIF0] enabled
[    0.215380] printk: console [ttySIF0] enabled
[    0.224034] printk: bootconsole [sifive0] disabled
[    0.224034] printk: bootconsole [sifive0] disabled
[    0.235632] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.253373] i2c /dev entries driver
[    0.258022] random: get_random_bytes called from 0x000000008000569a with crng_init=0
[    0.271672] Freeing unused kernel image (initmem) memory: 608K
[    0.276809] This architecture does not have kernel memory protection.
[    0.283241] Run /init as init process
[    0.289488] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
[    0.296422] SMP: stopping secondary CPUs
[    0.300340] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---

Any idea why?


 > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
 > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"

I see you are adding documentation at the end of the series, but perhaps
it would make sense to add a host package for python3-kflash to make
this work out of the box?


 > +++ b/configs/sipeed_maix_bit_sdcard_defconfig
 > @@ -0,0 +1,13 @@
 > +BR2_riscv=y
 > +BR2_PACKAGE_HOST_ELF2FLT=y
 > +# BR2_USE_MMU is not set
 > +BR2_INIT_NONE=y
 > +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
 > +BR2_LINUX_KERNEL=y

Same comment about the kernel version.


 > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
 > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 > +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 > +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 > +BR2_TARGET_ROOTFS_EXT2=y

We have genimage in buildroot so it is easy to create a full sd card
image with the right partition as well. I also see that there is some
k210 support in u-boot nowadays, would a setup with u-boot in the SPI
flash and kernel + rootfs on the SD card not be nicer?

Any specific reason to keep the kernel in the SPI flash?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
