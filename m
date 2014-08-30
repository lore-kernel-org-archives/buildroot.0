From: lee choon gay <choongay@yahoo.com>
Date: Fri, 29 Aug 2014 23:35:59 -0700
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <1408871597.42022.YahooMailNeo@web141705.mail.bf1.yahoo.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>	<20140820141013.24de59df@free-electrons.com>	<1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
 <20140821150337.3bc770ae@free-electrons.com>
 <1408871597.42022.YahooMailNeo@web141705.mail.bf1.yahoo.com>
Message-ID: <1409380559.92739.YahooMailNeo@web141703.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
Below is the teraterm log for noinitrd.
I use single partition for this, sda1.
Seems like the device driver is not ready yet to detect sda1.
You have any workaround for this?
Else I just stick to my method in previous email.

Thanks.

[  144.700494] reboot: Restarting system
[  144.704199] reboot: machine restart
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.14.4 (leecgy at ubuntu) (gcc version 4.7.2 (Sourcery CodeBench Lite 2012.09-62) ) #1 SMP Sun Aug 24 14:29:08 MYT 2014
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000020200000-0x0000000040003fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040004000-0x0000000040004fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000040005000-0x00000000d21a4fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d21a5000-0x00000000d21e7fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000d21e8000-0x00000000d6f09fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d6f0a000-0x00000000d6ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000d7000000-0x00000000d774dfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d774e000-0x00000000d77fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000d7800000-0x00000000d7fb3fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d7fb4000-0x00000000d7ffffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000d8000000-0x00000000d970dfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d970e000-0x00000000d97fffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000d9800000-0x00000000dae01fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dae02000-0x00000000df9fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed03fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000011e5fffff] usable
[    0.000000] Notice: NX (Execute Disable) protection cannot be enabled: non-PAE kernel!
[    0.000000] SMBIOS 2.7 present.
[    0.000000] e820: last_pfn = 0xdae02 max_arch_pfn = 0x100000
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] found SMP MP-table at [mem 0x000fd910-0x000fd91f] mapped at [c00fd910]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000] init_memory_mapping: [mem 0x37000000-0x373fffff]
[    0.000000] init_memory_mapping: [mem 0x30000000-0x36ffffff]
[    0.000000] init_memory_mapping: [mem 0x00100000-0x1fffffff]
[    0.000000] init_memory_mapping: [mem 0x20200000-0x2fffffff]
[    0.000000] init_memory_mapping: [mem 0x37400000-0x377fdfff]
[    0.000000] ACPI: RSDP 000f0490 000024 (v02 DELL  )
[    0.000000] ACPI: XSDT d7ff4080 00007C (v01 DELL    CBX3    01072009 AMI  00010013)
[    0.000000] ACPI: FACP d7ffdbb0 00010C (v05 DELL    CBX3    01072009 AMI  00010013)
[    0.000000] ACPI: DSDT d7ff4188 009A27 (v02 DELL    CBX3    00000022 INTL 20091112)
[    0.000000] ACPI: FACS d97fe080 000040
[    0.000000] ACPI: APIC d7ffdcc0 000072 (v03 DELL    CBX3    01072009 AMI  00010013)
[    0.000000] ACPI: FPDT d7ffdd38 000044 (v01 DELL    CBX3    01072009 AMI  00010013)
[    0.000000] ACPI: MCFG d7ffdd80 00003C (v01 DELL    CBX3    01072009 MSFT 00000097)
[    0.000000] ACPI: HPET d7ffddc0 000038 (v01 DELL    CBX3    01072009 AMI. 00000005)
[    0.000000] ACPI: SSDT d7ffddf8 000415 (v01 SataRe SataTabl 00001000 INTL 20091112)
[    0.000000] ACPI: SSDT d7ffe210 0009B9 (v01  PmRef  Cpu0Ist 00003000 INTL 20051117)
[    0.000000] ACPI: SSDT d7ffebd0 000B22 (v01  PmRef    CpuPm 00003000 INTL 20051117)
[    0.000000] ACPI: DMAR d7fff6f8 0000B8 (v01 INTEL      SNB  00000001 INTL 00000001)
[    0.000000] ACPI: ASF! d7fff7b0 0000A5 (v32 INTEL       HCG 00000001 TFSM 000F4240)
[    0.000000] ACPI: SLIC d7fff858 000176 (v03 DELL    CBX3    01072009 MSFT 00010013)
[    0.000000] 2614MB HIGHMEM available.
[    0.000000] 887MB LOWMEM available.
[    0.000000]   mapped low ram: 0 - 377fe000
[    0.000000]   low ram: 0 - 377fe000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   Normal   [mem 0x01000000-0x377fdfff]
[    0.000000]   HighMem  [mem 0x377fe000-0xdae01fff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0x1fffffff]
[    0.000000]   node   0: [mem 0x20200000-0x40003fff]
[    0.000000]   node   0: [mem 0x40005000-0xd21a4fff]
[    0.000000]   node   0: [mem 0xd21e8000-0xd6f09fff]
[    0.000000]   node   0: [mem 0xd7000000-0xd774dfff]
[    0.000000]   node   0: [mem 0xd7800000-0xd7fb3fff]
[    0.000000]   node   0: [mem 0xd8000000-0xd970dfff]
[    0.000000]   node   0: [mem 0xd9800000-0xdae01fff]
[    0.000000] Using APIC driver default
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff]
[    0.000000] e820: [mem 0xdfa00000-0xf7ffffff] available for PCI devices
[    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:4 nr_node_ids:1
[    0.000000] PERCPU: Embedded 13 pages/cpu @f5c58000 s31872 r0 d21376 u53248
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 893316
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/bzImage root=/dev/sda1 noinitrd console=ttyS0,115200n8
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
[    0.000000] Initializing HighMem for node 0 (000377fe:000dae02)
[    0.000000] Initializing Movable for node 0 (00000000:00000000)
[    0.000000] Memory: 3539528K/3580368K available (7422K kernel code, 458K rwdata, 2356K rodata, 620K init, 712K bss, 40840K reserved, 2673512K highmem)
[    0.000000] virtual kernel memory layout:
[    0.000000]     fixmap  : 0xfff15000 - 0xfffff000   ( 936 kB)
[    0.000000]     pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
[    0.000000]     vmalloc : 0xf7ffe000 - 0xff7fe000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf77fe000   ( 887 MB)
[    0.000000]       .init : 0xc1a01000 - 0xc1a9c000   ( 620 kB)
[    0.000000]       .data : 0xc173fb77 - 0xc1a008c0   (2819 kB)
[    0.000000]       .text : 0xc1000000 - 0xc173fb77   (7422 kB)
[    0.000000] Checking if this processor honours the WP bit even in supervisor mode...Ok.
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS:2304 nr_irqs:712 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [ttyS0] enabled
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3192.667 MHz processor
[    0.000001] Calibrating delay loop (skipped), value calculated using timer frequency.. 6385.33 BogoMIPS (lpj=3192667)
[    0.010703] pid_max: default: 32768 minimum: 301
[    0.015360] ACPI: Core revision 20131218
[    0.022638] ACPI: All ACPI Tables successfully acquired
[    0.028086] Security Framework initialized
[    0.032221] SELinux:  Initializing.
[    0.035745] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.042413] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.049621] Initializing cgroup subsys freezer
[    0.054117] CPU: Physical Processor ID: 0
[    0.058157] CPU: Processor Core ID: 0
[    0.061848] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.061848] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.075528] mce: CPU supports 9 MCE banks
[    0.079577] CPU0: Thermal monitoring enabled (TM1)
[    0.084416] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
[    0.084416] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
[    0.084416] tlb_flushall_shift: 2
[    0.099705] Freeing SMP alternatives memory: 28K (c1a9c000 - c1aa3000)
[    0.106318] Enabling APIC mode:  Flat.  Using 1 I/O APICs
[    0.112190] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.128243] smpboot: CPU0: Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz (fam: 06, model: 3a, stepping: 09)
[    0.137565] Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge events, full-width counters, Intel PMU driver.
[    0.147963] ... version:                3
[    0.151997] ... bit width:              48
[    0.156118] ... generic registers:      8
[    0.160152] ... value mask:             0000ffffffffffff
[    0.165495] ... max period:             0000ffffffffffff
[    0.170839] ... fixed-purpose events:   3
[    0.174874] ... event mask:             00000007000000ff
[    0.180374] x86: Booting SMP configuration:
[    0.184588] .... node  #0, CPUs:      #1
[    0.198875] Initializing CPU#1
[    0.204885]  #2
[    0.216785] Initializing CPU#2
[    0.222768]  #3
[    0.234672] Initializing CPU#3
[    0.240612] x86: Booted up 1 node, 4 CPUs
[    0.244648] smpboot: Total of 4 processors activated (25541.33 BogoMIPS)
[    0.253609] devtmpfs: initialized
[    0.257139] PM: Registering ACPI NVS region [mem 0xd21a5000-0xd21e7fff] (274432 bytes)
[    0.265114] PM: Registering ACPI NVS region [mem 0xd970e000-0xd97fffff] (991232 bytes)
[    0.273151] kworker/u8:0 (26) used greatest stack depth: 6980 bytes left
[    0.273283] RTC time: 14:24:00, date: 08/30/14
[    0.273308] NET: Registered protocol family 16
[    0.288950] cpuidle: using governor ladder
[    0.293077] cpuidle: using governor menu
[    0.297078] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.304699] ACPI: bus type PCI registered
[    0.308786] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.318157] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.324992] PCI: Using MMCONFIG for extended config space
[    0.330425] PCI: Using configuration type 1 for base access
[    0.336038] dmi type 0xB1 record - unknown flag
[    0.340988] kworker/u8:0 (61) used greatest stack depth: 6976 bytes left
[    0.350989] bio: create slab <bio-0> at 0
[    0.355138] ACPI: Added _OSI(Module Device)
[    0.359367] ACPI: Added _OSI(Processor Device)
[    0.363850] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.368588] ACPI: Added _OSI(Processor Aggregator Device)
[    0.376076] ACPI: Executed 1 blocks of module-level executable AML code
[    0.386883] ACPI: SSDT dafa7018 00083B (v01  PmRef  Cpu0Cst 00003001 INTL 20051117)
[    0.394869] ACPI: Dynamic OEM Table Load:
[    0.398932] ACPI: SSDT   (null) 00083B (v01  PmRef  Cpu0Cst 00003001 INTL 20051117)
[    0.409654] ACPI: SSDT dafa8a98 000303 (v01  PmRef    ApIst 00003000 INTL 20051117)
[    0.417653] ACPI: Dynamic OEM Table Load:
[    0.421720] ACPI: SSDT   (null) 000303 (v01  PmRef    ApIst 00003000 INTL 20051117)
[    0.432353] ACPI: SSDT dafaec18 000119 (v01  PmRef    ApCst 00003000 INTL 20051117)
[    0.440331] ACPI: Dynamic OEM Table Load:
[    0.444394] ACPI: SSDT   (null) 000119 (v01  PmRef    ApCst 00003000 INTL 20051117)
[    0.455309] ACPI: Interpreter enabled
[    0.459006] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S1_] (20131218/hwxface-580)
[    0.468313] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20131218/hwxface-580)
[    0.477629] ACPI: (supports S0 S3 S4 S5)
[    0.481578] ACPI: Using IOAPIC for interrupt routing
[    0.486608] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.495899] ACPI: No dock devices found.
[    0.532250] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
[    0.538474] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.546854] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug PME]
[    0.554205] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
[    0.561166] PCI host bridge to bus 0000:00
[    0.565290] pci_bus 0000:00: root bus resource [bus 00-3e]
[    0.570810] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
[    0.577029] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.583249] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
[    0.590168] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff]
[    0.597086] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff]
[    0.604005] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff]
[    0.610925] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff]
[    0.617841] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff]
[    0.624762] pci_bus 0000:00: root bus resource [mem 0xdfa00000-0xfeafffff]
[    0.631993] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.638177] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.644052] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.649907] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.655786] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.661947] acpi PNP0A08:00: Disabling ASPM (FADT indicates it is unsupported)
[    0.669376] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.676461] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
[    0.684706] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.691796] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.698888] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 *5 6 10 11 12 14 15)
[    0.705976] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
[    0.714233] ACPI: PCI Interrupt Link [LNKG] (IRQs *3 4 5 6 10 11 12 14 15)
[    0.721323] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.728430] ACPI: Enabled 4 GPEs in block 00 to 3F
[    0.733373] vgaarb: device added: PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
[    0.741522] vgaarb: loaded
[    0.744248] vgaarb: bridge control possible 0000:00:02.0
[    0.749683] SCSI subsystem initialized
[    0.753583] ACPI: bus type USB registered
[    0.757654] usbcore: registered new interface driver usbfs
[    0.763193] usbcore: registered new interface driver hub
[    0.768564] usbcore: registered new device driver usb
[    0.773705] pps_core: LinuxPPS API ver. 1 registered
[    0.778705] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.787908] PTP clock support registered
[    0.791936] Advanced Linux Sound Architecture Driver Initialized.
[    0.798071] PCI: Using ACPI for IRQ routing
[    0.803945] cfg80211: Calling CRDA to update world regulatory domain
[    0.810364] NetLabel: Initializing
[    0.813792] NetLabel:  domain hash size = 128
[    0.818176] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.823180] NetLabel:  unlabeled traffic allowed by default
[    0.828899] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.835231] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.843123] Switched to clocksource hpet
[    0.850387] pnp: PnP ACPI init
[    0.853468] ACPI: bus type PNP registered
[    0.857569] system 00:00: [mem 0xfed40000-0xfed44fff] has been reserved
[    0.864441] system 00:04: [io  0x0680-0x069f] has been reserved
[    0.870402] system 00:04: [io  0x1000-0x100f] has been reserved
[    0.876363] system 00:04: [io  0xffff] has been reserved
[    0.881711] system 00:04: [io  0xffff] has been reserved
[    0.887060] system 00:04: [io  0x0400-0x0453] could not be reserved
[    0.893369] system 00:04: [io  0x0458-0x047f] has been reserved
[    0.899329] system 00:04: [io  0x0500-0x057f] has been reserved
[    0.905289] system 00:04: [io  0x164e-0x164f] has been reserved
[    0.911348] system 00:06: [io  0x0454-0x0457] has been reserved
[    0.917392] system 00:07: [io  0x0a40-0x0a4f] has been reserved
[    0.923353] system 00:07: [io  0x0a00-0x0a3f] has been reserved
[    0.929365] system 00:08: [io  0x04d0-0x04d1] has been reserved
[    0.936097] system 00:0b: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.942757] system 00:0b: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.949418] system 00:0b: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.956079] system 00:0b: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.962740] system 00:0b: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.969397] system 00:0b: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.976057] system 00:0b: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.982716] system 00:0b: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.989375] system 00:0b: [mem 0xff000000-0xffffffff] has been reserved
[    0.996032] system 00:0b: [mem 0xfee00000-0xfeefffff] could not be reserved
[    1.003041] system 00:0b: [mem 0xdfa00000-0xdfa00fff] has been reserved
[    1.009835] system 00:0c: [mem 0x20000000-0x201fffff] has been reserved
[    1.016496] system 00:0c: [mem 0x40004000-0x40004fff] has been reserved
[    1.023164] pnp: PnP ACPI: found 13 devices
[    1.027380] ACPI: bus type PNP unregistered
[    1.069328] NET: Registered protocol family 2
[    1.073802] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    1.080911] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    1.087406] TCP: Hash tables configured (established 8192 bind 8192)
[    1.093814] TCP: reno registered
[    1.097066] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    1.103027] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    1.109453] NET: Registered protocol family 1
[    1.113888] RPC: Registered named UNIX socket transport module.
[    1.119848] RPC: Registered udp transport module.
[    1.124584] RPC: Registered tcp transport module.
[    1.129319] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.137207] pci 0000:00:14.0: CONFIG_USB_XHCI_HCD is turned off, defaulting to EHCI.
[    1.145002] pci 0000:00:14.0: USB 3.0 devices will work at USB 2.0 speeds.
[    1.319828] RAPL PMU detected, hw unit 2^-16 Joules, API unit is 2^-32 Joules, 3 fixed counters 163840 ms ovfl timer
[    1.330470] microcode: CPU0 sig=0x306a9, pf=0x2, revision=0x19
[    1.336345] microcode: CPU1 sig=0x306a9, pf=0x2, revision=0x19
[    1.342219] microcode: CPU2 sig=0x306a9, pf=0x2, revision=0x19
[    1.348091] microcode: CPU3 sig=0x306a9, pf=0x2, revision=0x19
[    1.354011] microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
[    1.363247] Scanning for low memory corruption every 60 seconds
[    1.369614] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    1.375859] audit: initializing netlink subsys (disabled)
[    1.381303] audit: type=2000 audit(1409408640.207:1): initialized
[    1.406593] bounce pool size: 64 pages
[    1.410374] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    1.419270] VFS: Disk quotas dquot_6.5.2
[    1.423274] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.430492] NFS: Registering the id_resolver key type
[    1.435588] Key type id_resolver registered
[    1.439801] Key type id_legacy registered
[    1.443887] msgmni has been set to 1691
[    1.448153] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    1.455600] io scheduler noop registered
[    1.459551] io scheduler deadline registered
[    1.463931] io scheduler cfq registered (default)
[    1.468770] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    1.474579] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
[    1.482814] ACPI: Power Button [PWRB]
[    1.486548] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    1.493996] ACPI: Power Button [PWRF]
[    1.498589] ACPI: Invalid active0 threshold
[    1.503086] thermal LNXTHERM:00: registered as thermal_zone0
[    1.508790] ACPI: Thermal Zone [TZ00] (28 C)
[    1.513309] thermal LNXTHERM:01: registered as thermal_zone1
[    1.519011] ACPI: Thermal Zone [TZ01] (30 C)
[    1.523514] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
?[    1.550750] 00:0a: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    1.579245] 0000:00:16.3: ttyS1 at I/O 0xf0e0 (irq = 19, base_baud = 115200) is a 16550A
[    1.587949] Non-volatile memory driver v1.3
[    1.592176] Linux agpgart interface v0.103
[    1.596541] [drm] Initialized drm 1.1.0 20060810
[    1.602213] [drm] Memory usable by graphics device = 2048M
[    1.613854] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.620519] [drm] Driver supports precise vblank timestamp query.
[    1.626716] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.676496] fbcon: inteldrmfb (fb0) is primary device
[    1.834939] Console: switching to colour frame buffer device 240x67
[    1.850515] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    1.856740] i915 0000:00:02.0: registered panic notifier
[    1.867209] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    1.874587] acpi device:49: registered as cooling_device4
[    1.880436] acpi device:4a: registered as cooling_device5
[    1.886237] acpi device:4b: registered as cooling_device6
[    1.892008] acpi device:4c: registered as cooling_device7
[    1.897758] acpi device:4d: registered as cooling_device8
[    1.903450] acpi device:4e: registered as cooling_device9
[    1.909124] acpi device:4f: registered as cooling_device10
[    1.914902] acpi device:50: registered as cooling_device11
[    1.920544] input: Video Bus as /devices/LNXSYSTM:00/device:00/PNP0A08:00/LNXVIDEO:00/input/input2
[    1.929655] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor 0
[    1.938702] loop: module loaded
[    1.942280] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x2 impl SATA mode
[    1.950431] ahci 0000:00:1f.2: flags: 64bit ncq pm led clo pio slum part ems apst 
[    1.959099] scsi0 : ahci
[    1.961838] scsi1 : ahci
[    1.964633] scsi2 : ahci
[    1.967506] scsi3 : ahci
[    1.970473] scsi4 : ahci
[    1.973263] scsi5 : ahci
[    1.976005] ata1: DUMMY
[    1.978479] ata2: SATA max UDMA/133 abar m2048 at 0xf7c36000 port 0xf7c36180 irq 41
[    1.985925] ata3: DUMMY
[    1.988390] ata4: DUMMY
[    1.990855] ata5: DUMMY
[    1.993320] ata6: DUMMY
[    1.996682] e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
[    2.002819] e100: Copyright(c) 1999-2006 Intel Corporation
[    2.008468] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    2.015565] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    2.021487] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    2.027360] e1000e: Copyright(c) 1999 - 2013 Intel Corporation.
[    2.033429] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[    2.246263] e1000e 0000:00:19.0 eth0: registered PHC clock
[    2.251795] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 90:b1:1c:6a:5b:02
[    2.259764] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
[    2.266732] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: 1011FF-0FF
[    2.273742] sky2: driver version 1.30
[    2.278178] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.284758] ehci-pci: EHCI PCI platform driver
[    2.289322] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    2.294724] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
[    2.301405] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    2.308410] ehci-pci 0000:00:1a.0: debug port 2
[    2.308430] ata2.00: ACPI cmd f5/00:00:00:00:00:00 (SECURITY FREEZE LOCK) filtered out
[    2.308432] ata2.00: ACPI cmd b1/c1:00:00:00:00:00 (DEVICE CONFIGURATION OVERLAY) filtered out
[    2.329617] tsc: Refined TSC clocksource calibration: 3192.754 MHz
[    2.329640] ata2.00: ATAPI: HL-DT-ST DVD+-RW GT80N, A103, max UDMA/100
[    2.339321] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7c38000
[    2.344426] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    2.344470] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.344471] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.344472] usb usb1: Product: EHCI Host Controller
[    2.344473] usb usb1: Manufacturer: Linux 3.14.4 ehci_hcd
[    2.344474] usb usb1: SerialNumber: 0000:00:1a.0
[    2.344875] hub 1-0:1.0: USB hub found
[    2.344912] hub 1-0:1.0: 3 ports detected
[    2.345228] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    2.345362] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
[    2.345379] ehci-pci 0000:00:1d.0: debug port 2
[    2.349307] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7c37000
[    2.354445] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    2.354468] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    2.354469] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.354470] usb usb2: Product: EHCI Host Controller
[    2.354470] usb usb2: Manufacturer: Linux 3.14.4 ehci_hcd
[    2.354471] usb usb2: SerialNumber: 0000:00:1d.0
[    2.354829] hub 2-0:1.0: USB hub found
[    2.354836] hub 2-0:1.0: 3 ports detected
[    2.355032] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.355035] ohci-pci: OHCI PCI platform driver
[    2.355115] uhci_hcd: USB Universal Host Controller Interface driver
[    2.355207] usbcore: registered new interface driver usblp
[    2.355252] usbcore: registered new interface driver usb-storage
[    2.355404] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    2.358230] serio: i8042 KBD port at 0x60,0x64 irq 1
[    2.358233] serio: i8042 AUX port at 0x60,0x64 irq 12
[    2.358368] mousedev: PS/2 mouse device common for all mice
[    2.358728] rtc_cmos 00:05: RTC can wake from S4
[    2.358962] rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
[    2.359005] rtc_cmos 00:05: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    2.359111] ACPI Warning: SystemIO range 0x0000f040-0x0000f05f conflicts with OpRegion 0x0000f040-0x0000f04f (\_SB_.PCI0.SBUS.SMBI) (20131218/utaddress-258)
[    2.359112] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    2.359304] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised: dm-devel at redhat.com
[    2.359375] hidraw: raw HID events driver (C) Jiri Kosina
[    2.360093] usbcore: registered new interface driver usbhid
[    2.360093] usbhid: USB HID core driver
[    2.360581] Netfilter messages via NETLINK v0.30.
[    2.360587] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[    2.360720] ctnetlink v0.93: registering with nfnetlink.
[    2.360782] ip_tables: (C) 2000-2006 Netfilter Core Team
[    2.360797] TCP: cubic registered
[    2.360797] Initializing XFRM netlink socket
[    2.360988] NET: Registered protocol family 10
[    2.361142] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    2.361163] sit: IPv6 over IPv4 tunneling driver
[    2.361328] NET: Registered protocol family 17
[    2.361338] Key type dns_resolver registered
[    2.361669] Using IPI No-Shortcut mode
[    2.361827] registered taskstats version 1
[    2.362061]   Magic number: 10:127:436
[    2.368691] hda-codec: No codec parser is available
[    2.368692] hda-codec: No codec parser is available
[    2.646724] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    2.654295] console [netcon0] enabled
[    2.654306] hpet1: lost 17 rtc interrupts
[    2.657195] ata2.00: ACPI cmd f5/00:00:00:00:00:00 (SECURITY FREEZE LOCK) filtered out
[    2.657196] ata2.00: ACPI cmd b1/c1:00:00:00:00:00 (DEVICE CONFIGURATION OVERLAY) filtered out
[    2.659066] ata2.00: configured for UDMA/100
[    2.682964] netconsole: network logging started
[    2.687990] ALSA device list:
[    2.690986]   #0: HDA Intel PCH at 0xf7c30000 irq 43
[    2.691016] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVD+-RW GT80N    A103 PQ: 0 ANSI: 5
[    2.717417] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[    2.724974] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.730940] sr 1:0:0:0: Attached scsi generic sg0 type 5
[    2.736587] md: Waiting for all devices to be available before autodetect
[    2.743428] md: If you don't use raid, use raid=noautodetect
[    2.749505] md: Autodetecting RAID arrays.
[    2.753637] md: Scanned 0 and added 0 devices.
[    2.758115] md: autorun ...
[    2.760930] md: ... autorun DONE.
[    2.764290] VFS: Cannot open root device "sda1" or unknown-block(0,0): error -6
[    2.771650] Please append a correct "root=" boot option; here are the available partitions:
[    2.780064] 0b00         1048575 sr0  driver: sr
[    2.784740] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    2.784767] usb 1-1: New USB device found, idVendor=8087, idProduct=0024
[    2.784768] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.806981] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 3.14.4 #1
[    2.812937] Hardware name: Dell Inc. OptiPlex 7010/0GXM1W, BIOS A18 04/30/2014
[    2.820204]  00000000 00000000 f546beb4 c1730200 f546befc f546bed4 c172d33c c18c04f4
[    2.828088]  c1ab38e0 00000000 f546befc 00008001 f4fa3000 f546bf28 c1a01ea2 c18b37ac
[    2.835969]  f546befc f546befc fffffffa 00000000 fffffffa f633d460 c18b3f44 6e6b6e75
[    2.843858] Call Trace:
[    2.846320]  [<c1730200>] dump_stack+0x41/0x52
[    2.850794]  [<c172d33c>] panic+0x7d/0x168
[    2.854914]  [<c1a01ea2>] mount_block_root+0x148/0x1cb
[    2.860087]  [<c112ee38>] ? SyS_mknod+0x28/0x30
[    2.864645]  [<c1a02021>] mount_root+0xfc/0x104
[    2.869202]  [<c112ef80>] ? SyS_unlink+0x10/0x20
[    2.873850]  [<c1a02241>] ? initrd_load+0x43/0x47
[    2.878584]  [<c1a02148>] prepare_namespace+0x11f/0x163
[    2.883843]  [<c1a01c0f>] kernel_init_freeable+0x1b5/0x1c2
[    2.889364]  [<c1a014cb>] ? do_early_param+0x7a/0x7a
[    2.894357]  [<c1729e9b>] kernel_init+0xb/0xe0
[    2.898829]  [<c173e877>] ret_from_kernel_thread+0x1b/0x28
[    2.904348]  [<c1729e90>] ? rest_init+0x60/0x60
[    2.908926] Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc0000000-0xf7ffdfff)
[    2.917068] drm_kms_helper: panic occurred, switching back to text console
[    2.923993] ------------[ cut here ]------------
[    2.928637] WARNING: CPU: 1 PID: 10 at arch/x86/kernel/smp.c:124 native_smp_send_reschedule+0x46/0x50()
[    2.938089] Modules linked in:
[    2.941172] CPU: 1 PID: 10 Comm: migration/1 Not tainted 3.14.4 #1
[    2.947392] Hardware name: Dell Inc. OptiPlex 7010/0GXM1W, BIOS A18 04/30/2014
[    2.954660]  00000000 00000000 f54b3d00 c1730200 00000000 f54b3d30 c104001f c18c0560
[    2.962542]  00000001 0000000a c18b6fdc 0000007c c102b106 c102b106 00000000 f5c5f500
[    2.970423]  00000001 f54b3d40 c104005d 00000009 00000000 f54b3d48 c102b106 f54b3d64
[    2.978312] Call Trace:
[    2.980773]  [<c1730200>] dump_stack+0x41/0x52
[    2.985246]  [<c104001f>] warn_slowpath_common+0x7f/0xa0
[    2.990590]  [<c102b106>] ? native_smp_send_reschedule+0x46/0x50
[    2.996631]  [<c102b106>] ? native_smp_send_reschedule+0x46/0x50
[    3.002673]  [<c104005d>] warn_slowpath_null+0x1d/0x20
[    3.007841]  [<c102b106>] native_smp_send_reschedule+0x46/0x50
[    3.013710]  [<c1073587>] trigger_load_balance+0x117/0x170
[    3.019230]  [<c1067c66>] scheduler_tick+0x86/0xb0
[    3.024053]  [<c104bbed>] update_process_times+0x4d/0x70
[    3.029399]  [<c1097f3e>] tick_sched_handle.isra.11+0x2e/0x40
[    3.035182]  [<c10980eb>] tick_sched_timer+0x3b/0x70
[    3.040180]  [<c105e5a2>] ? __remove_hrtimer+0x42/0xa0
[    3.045347]  [<c105e840>] __run_hrtimer+0x70/0x190
[    3.050168]  [<c10980b0>] ? tick_sched_do_timer+0x30/0x30
[    3.055601]  [<c105f397>] hrtimer_interrupt+0xf7/0x290
[    3.060771]  [<c102d05a>] local_apic_timer_interrupt+0x2a/0x50
[    3.066642]  [<c102d59e>] smp_apic_timer_interrupt+0x2e/0x50
[    3.072337]  [<c1737e5d>] apic_timer_interrupt+0x2d/0x34
[    3.077683]  [<c10639f2>] ? finish_task_switch+0x42/0xb0
[    3.083029]  [<c1734c99>] __schedule+0x309/0x6e0
[    3.087675]  [<c1734c99>] ? __schedule+0x309/0x6e0
[    3.092499]  [<c106980b>] ? default_wake_function+0xb/0x10
[    3.098019]  [<c107783d>] ? __wake_up_common+0x3d/0x70
[    3.103188]  [<c17350ce>] schedule+0x1e/0x60
[    3.107484]  [<c1062708>] smpboot_thread_fn+0x98/0x140
[    3.112654]  [<c1062670>] ? SyS_setgroups+0x110/0x110
[    3.117736]  [<c105c076>] kthread+0x96/0xb0
[    3.121948]  [<c173e877>] ret_from_kernel_thread+0x1b/0x28
[    3.127467]  [<c105bfe0>] ? flush_kthread_worker+0x70/0x70
[    3.132985] ---[ end trace 831e72b7ce477b55 ]---
[    3.137646] ------------[ cut here ]------------
[    3.142291] WARNING: CPU: 1 PID: 10 at arch/x86/kernel/smp.c:124 native_smp_send_reschedule+0x46/0x50()
[    3.151743] Modules linked in:
[    3.154827] CPU: 1 PID: 10 Comm: migration/1 Tainted: G        W    3.14.4 #1
[    3.162006] Hardware name: Dell Inc. OptiPlex 7010/0GXM1W, BIOS A18 04/30/2014
[    3.169275]  00000000 00000000 f54b3dc8 c1730200 00000000 f54b3df8 c104001f c18c0560
[    3.177160]  00000001 0000000a c18b6fdc 0000007c c102b106 c102b106 c1749340 f5c79500
[    3.185041]  c17492c0 f54b3e08 c104005d 00000009 00000000 f54b3e10 c102b106 f54b3e18
[    3.192929] Call Trace:
[    3.195390]  [<c1730200>] dump_stack+0x41/0x52
[    3.199860]  [<c104001f>] warn_slowpath_common+0x7f/0xa0
[    3.205202]  [<c102b106>] ? native_smp_send_reschedule+0x46/0x50
[    3.211247]  [<c102b106>] ? native_smp_send_reschedule+0x46/0x50
[    3.217290]  [<c104005d>] warn_slowpath_null+0x1d/0x20
[    3.222458]  [<c102b106>] native_smp_send_reschedule+0x46/0x50
[    3.228329]  [<c1066573>] resched_task+0x43/0x60
[    3.232976]  [<c1066a4d>] check_preempt_curr+0x5d/0x80
[    3.238147]  [<c106ce87>] move_task+0x37/0x40
[    3.242529]  [<c106d6a0>] active_load_balance_cpu_stop+0x150/0x1c0
[    3.248748]  [<c106d550>] ? can_migrate_task+0x180/0x180
[    3.254092]  [<c10ad642>] cpu_stopper_thread+0x52/0xf0
[    3.259264]  [<c10639f2>] ? finish_task_switch+0x42/0xb0
[    3.264610]  [<c1734c99>] ? __schedule+0x309/0x6e0
[    3.269431]  [<c1734c99>] ? __schedule+0x309/0x6e0
[    3.274251]  [<c106980b>] ? default_wake_function+0xb/0x10
[    3.279770]  [<c107783d>] ? __wake_up_common+0x3d/0x70
[    3.284940]  [<c106273a>] smpboot_thread_fn+0xca/0x140
[    3.290112]  [<c1062670>] ? SyS_setgroups+0x110/0x110
[    3.295192]  [<c105c076>] kthread+0x96/0xb0
[    3.299401]  [<c173e877>] ret_from_kernel_thread+0x1b/0x28
[    3.304918]  [<c105bfe0>] ? flush_kthread_worker+0x70/0x70
[    3.310436] ---[ end trace 831e72b7ce477b56 ]---
[    3.315412] [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
 


On Sunday, August 24, 2014 5:13 PM, lee choon gay <choongay@yahoo.com> wrote:
  


Hi, friend.

I took a look at the /boot/grub/grub.cfg from my PC, it also need initrd to boot up.
I also saw some article from internet saying initrd is a must and the kernel init process is the one that responsible to switch from ram file system to real file system.

Anyway, if I can get a USB to RS232 cable next week I can try to capture the log and see.

Currently I have a workaround to change root to real file system during kernel init.
Below is the code I use.
I put the code in /etc/init.d as startup.sh and create S99startup by refering to other scripts in /etc/init.d to call out my startup.sh .

#!/bin/busybox sh

# Wait for sda detected
sleep 5

# Mount the root filesystem.
mkdir /mnt/root
mount -t ext4 /dev/sda1 /mnt/root
mount -o bind /dev /mnt/root/dev
mount -o bind /proc /mnt/root/proc

# Boot the real thing.
chroot /mnt/root /linuxrc


Thanks.
 


On Thursday, August 21, 2014 9:03 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
  


Dear lee choon gay,

On Wed, 20 Aug 2014 19:31:49 -0700, lee choon gay wrote:

> I build the code with settings below.
> menuconfig -> Filesystem images -> ext4.
> menuconfig -> Filesystem images -> tar the root filesystem.
> menuconfig -> System configuration -> Init system with Busybox (default).
> menuconfig -> Toolchain -> Buildroot toolchain (default).
> menuconfig -> Toolchain -> C library uClibc (default).
> 
> Steps to build the partitions.
> 1) I use sudo dd if=/dev/zero bs=1M count=1 of=/dev/sdb to wipe out the original partition in my pendrive.
> 2) sudo fdisk -l will shows /dev/sdb doesn't contain
>  a valid partition table.
> 3) To recreate the partition, I use sudo fdisk /dev/sdb.
> 4) I enter n for new partition, p for primary, label partition as 1, default minimum for first sector, 5000000 for last sector.
> 5) Then enter n again to create second partition, p for primary, label partition as 2, 5000001 for first sector, default maximum for last sector.
> 6) Then enter w to write the partition table.
> 7) Power cycle
 the pendrive.
> 8) I format the partitions using sudo mkfs.ext4 /dev/sdb1 and sudo mkfs.ext4 /dev/sdb2.
> 9) I sudo mount /dev/sdb1 /home/leecgy/temp1 and sudo chmod a+rw /home/leecgy/temp1 to enable writing to partition 1.
> 10) Then sudo mount /dev/sdb2 /home/leecgy/temp2 and sudo chmod a+rw /home/leecgy/temp2 to enable writing to partition 2.
> 11) I right click and create new folder called boot in partition 1, then right click and copy paste the bzImage into boot folder.
> 12) Then right click and create new folder
>  called grub in boot folder, then right click and copy paste the grub.cfg into grub folder.
> 13) I sudo grub-install --boot-directory=/home/leecgy/temp1/boot /dev/sdb to
 install grub.

You may want to follow the instructions available in the help text of
the Grub 2 option, which have been tested.

> 14) I right click and extract the rootfs.tar, then right click and copy paste the contents inside rootfs into partition 2.

Make sure you extract things as root:

    sudo tar -C /home/leecgy/temp2 -xf output/images/rootfs.tar

> When trying to boot up, the code dump a lot of error and stuck. I cannot shift+page up to see the top of the error.

Please give the
 errors that you see. For now, we still have no idea
whether it's a bootloader problem, a kernel problem, or a root
filesystem problem. Without the boot log, there's not much we can do.


Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140829/73030c85/attachment.html>
