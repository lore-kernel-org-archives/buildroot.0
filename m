From: Liunx <liunx1987@gmail.com>
Date: Wed, 28 Dec 2011 14:42:19 +0800
Subject: [Buildroot] problem with qemu_x86_defconfig in buildroot-2011.11
Message-ID: <4EFABA4B.5090205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have built the qemu_x86_defconfig with buildroot-2011.11, the
qemu-system-i386 version is
1.0.50 and I use the external cross toolchain of Sourcery CodeBench
x86/x86_64 2010.09,
but I encountered the following problem:

Linux version 3.0.4 (liunx at liunx-desktop) (gcc version 4.5.1 (Sourcery
G++ Lite 2010.09-44) ) #2 Wed Dec 28 12:33:03 CST 2011
BIOS-provided physical RAM map:
BIOS-e820: 0000000000000000 - 000000000009f400 (usable)
BIOS-e820: 000000000009f400 - 00000000000a0000 (reserved)
BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
BIOS-e820: 0000000000100000 - 000000000fffd000 (usable)
BIOS-e820: 000000000fffd000 - 0000000010000000 (reserved)
BIOS-e820: 00000000fffc0000 - 0000000100000000 (reserved)
Notice: NX (Execute Disable) protection missing in CPU!
DMI 2.4 present.
last_pfn = 0xfffd max_arch_pfn = 0x100000
init_memory_mapping: 0000000000000000-000000000fffd000
ACPI: RSDP 000fd910 00014 (v00 BOCHS )
ACPI: RSDT 0fffd7b0 00034 (v01 BOCHS BXPCRSDT 00000001 BXPC 00000001)
ACPI: FACP 0fffff80 00074 (v01 BOCHS BXPCFACP 00000001 BXPC 00000001)
ACPI: DSDT 0fffd9b0 02589 (v01 BXPC BXDSDT 00000001 INTL 20100528)
ACPI: FACS 0fffff40 00040
ACPI: SSDT 0fffd910 0009E (v01 BOCHS BXPCSSDT 00000001 BXPC 00000001)
ACPI: APIC 0fffd830 00072 (v01 BOCHS BXPCAPIC 00000001 BXPC 00000001)
ACPI: HPET 0fffd7f0 00038 (v01 BOCHS BXPCHPET 00000001 BXPC 00000001)
0MB HIGHMEM available.
255MB LOWMEM available.
mapped low ram: 0 - 0fffd000
low ram: 0 - 0fffd000
Zone PFN ranges:
DMA 0x00000010 -> 0x00001000
Normal 0x00001000 -> 0x0000fffd
HighMem empty
Movable zone start PFN for each node
early_node_map[2] active PFN ranges
0: 0x00000010 -> 0x0000009f
0: 0x00000100 -> 0x0000fffd
ACPI: PM-Timer IO Port: 0xb008
Allocating PCI resources starting at 10000000 (gap: 10000000:effc0000)
Built 1 zonelists in Zone order, mobility grouping on. Total pages: 64908
Kernel command line: root=/dev/sda rw console=ttyS0,115200
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Initializing CPU#0
Initializing HighMem for node 0 (00000000:00000000)
Memory: 255264k/262132k available (2539k kernel code, 6416k reserved,
1025k data, 268k init, 0k highmem)
virtual kernel memory layout:
fixmap : 0xfffe4000 - 0xfffff000 ( 108 kB)
pkmap : 0xff800000 - 0xffc00000 (4096 kB)
vmalloc : 0xd07fd000 - 0xff7fe000 ( 752 MB)
lowmem : 0xc0000000 - 0xcfffd000 ( 255 MB)
.init : 0xc137c000 - 0xc13bf000 ( 268 kB)
.data : 0xc127ae73 - 0xc137b540 (1025 kB)
.text : 0xc1000000 - 0xc127ae73 (2539 kB)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
SLUB: Genslabs=15, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS:16
Console: colour VGA+ 80x25
console [ttyS0] enabled
Fast TSC calibration failed
TSC: Unable to calibrate against PIT
TSC: using PMTIMER reference calibration
Detected 3013.653 MHz processor.
Calibrating delay loop (skipped), value calculated using timer
frequency.. 6027.30 BogoMIPS (lpj=12054612)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Intel QEMU Virtual CPU version 1.0.50 stepping 03
ACPI: Core revision 20110413
ACPI: setting ELCR to 0200 (from 0c00)
Performance Events: Broken PMU hardware detected, using software events
only.
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: PCI BIOS revision 2.10 entry at 0xffe77, last bus=0
PCI: Using configuration type 1 for base access
bio: create slab <bio-0> at 0
ACPI: Interpreter enabled
ACPI: (supports S0 S3 S5)
ACPI: Using PIC for interrupt routing
PCI: Ignoring host bridge windows from ACPI; if necessary, use
"pci=use_crs" and report a bug
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
pci 0000:00:01.3: quirk: [io 0xb000-0xb03f] claimed by PIIX4 ACPI
pci 0000:00:01.3: quirk: [io 0xb100-0xb10f] claimed by PIIX4 SMB
pci0000:00: Unable to request _OSC control (_OSC support mask: 0x08)
ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
ACPI: PCI Interrupt Link [LNKS] (IRQs 9) *0
vgaarb: device added: PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
vgaarb: bridge control possible 0000:00:02.0
SCSI subsystem initialized
Advanced Linux Sound Architecture Driver Version 1.0.24.
PCI: Using ACPI for IRQ routing
Switching to clocksource pit
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 8 devices
ACPI: ACPI bus type pnp unregistered
Switching to clocksource acpi_pm
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
pci 0000:00:01.0: PIIX3: Enabling Passive Release
pci 0000:00:01.0: Activating ISA DMA hang workarounds
io scheduler noop registered (default)
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: Power Button [PWRF]
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
00:06: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
scsi0 : ata_piix
scsi1 : ata_piix
ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc080 irq 14
ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc088 irq 15
i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
cpuidle: using governor ladder
ALSA device list:
No soundcards found.
TCP cubic registered
NET: Registered protocol family 17
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input1
ata2.00: ATAPI: QEMU DVD-ROM, 1.0.50, max UDMA/100
ata1.00: ATA-7: QEMU HARDDISK, 1.0.50, max UDMA/100
ata1.00: 10648 sectors, multi 16: LBA48
ata1.00: configured for MWDMA2
ata2.00: configured for MWDMA2
scsi 0:0:0:0: Direct-Access ATA QEMU HARDDISK 1.0. PQ: 0 ANSI: 5
scsi 1:0:0:0: CD-ROM QEMU QEMU DVD-ROM 1.0. PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 10648 512-byte logical blocks: (5.45 MB/5.19 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
support DPO or FUA
sda: unknown partition table
sd 0:0:0:0: [sda] Attached SCSI disk
EXT2-fs (sda): warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 8:0.
Freeing unused kernel memory: 268k freed
Kernel panic - not syncing: No init found. Try passing init= option to
kernel. See Linux Documentation/init.txt for guidance.
Pid: 1, comm: swapper Not tainted 3.0.4 #2
Call Trace:
[<c1278026>] ? panic+0x57/0x12d
[<c137c71c>] ? do_one_initcall+0x12e/0x12e
[<c100117c>] ? init_post+0x6c/0xb0
[<c137c813>] ? kernel_init+0xf7/0xfe
[<c127a3b6>] ? kernel_thread_helper+0x6/0xd
QEMU: Terminated

Here is my qemu boot script:

qemu-system-i386 \
-m 256M \
-kernel images/bzImage \
-append "root=/dev/sda rw console=ttyS0,115200" \
-hda images/rootfs.ext2 \
-boot c \
-localtime \
-net nic,vlan=0,macaddr="12:34:56:78:9a:bc" \
-net nic,vlan=0,macaddr="12:34:56:78:bc:de" \
-net tap,vlan=0,ifname=tap0,script=./qemu-ifup \
-nographic

I also tried the qemu_arm_versatile_defconfig with the same qemu boot
script, and it works very well, so I really can not understand what's
wrong, and any tips?

regards
