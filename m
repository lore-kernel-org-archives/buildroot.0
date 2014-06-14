From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 14 Jun 2014 17:31:29 +0200
Subject: [Buildroot] rpcbind needs a startup script in init.d ?
Message-ID: <1324BF99F42C4A3180F1DE91CA8FE9D3@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi all

Since rpcbind usage seems to be favored above portmap a tried to use it:

Here is a bootlog(booting rootfs over nfs) :

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Linux version 3.14.6-apex (root at debian605) (gcc version 4.8.3 (Buildroot 2014.08-git-00979-ge291b3f) ) #1 PREEMPT Sat Jun 14
14:05:17 CEST 2014
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine model: Ka-Ro electronics TX28 module
Memory policy: Data cache writeback
Kernel command line: init=/linuxrc console=ttyAMA0,115200 rw root=/dev/nfs nfsroot=192.168.1.110:/home/johan/srcmain
mtdparts=gpmi-nand:1m at 0x20000(u-boot),0x60000(env),4m(linux),128k(dtb),-(rootfs) ip=dhcp
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc052a6c4   (5258 kB)
      .init : 0xc052b000 - 0xc054ed10   ( 144 kB)
      .data : 0xc0550000 - 0xc0588de0   ( 228 kB)
       .bss : 0xc0588dec - 0xc05c43d8   ( 238 kB)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
NR_IRQS:16 nr_irqs:16 16
of_irq_init: children remain, but no parents
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns
Console: colour dummy device 80x30
Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x403b0c20 - 0x403b0c78
devtmpfs: initialized
pinctrl core: initialized pinctrl subsystem
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
Serial: AMBA PL011 UART driver
80074000.serial: ttyAMA0 at MMIO 0x80074000 (irq = 223, base_baud = 0) is a PL011 rev2
console [ttyAMA0] enabled
bio: create slab <bio-0> at 0
mxs-dma 80004000.dma-apbh: initialized
mxs-dma 80024000.dma-apbx: initialized
usb1_vbus: 5000 mV 
2P5V: 2500 mV 
3P3V: 3300 mV 
CAN XCVR: 3300 mV 
LCD POWER: 3300 mV 
LCD RESET: 3300 mV 
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
Switched to clocksource mxs_timer
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NetWinder Floating Point Emulator V0.97 (double precision)
futex hash table entries: 256 (order: -1, 3072 bytes)
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
jffs2: version 2.2. (NAND) (SUMMARY)  ?? 2001-2006 Red Hat, Inc.
msgmni has been set to 242
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
of_dma_request_slave_channel: dma-names property of node '/apb at 80000000/apbx at 80040000/serial at 80074000' missing or empty
uart-pl011 80074000.serial: no DMA platform data
8006c000.serial: ttyAPP1 at MMIO 0x8006c000 (irq = 221, base_baud = 1500000) is a 8006c000.serial
mxs-auart 8006c000.serial: Found APPUART 3.1.0
80070000.serial: ttyAPP3 at MMIO 0x80070000 (irq = 222, base_baud = 1500000) is a 80070000.serial
mxs-auart 80070000.serial: Found APPUART 3.1.0
brd: module loaded
loop: module loaded
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xf1
nand: Samsung NAND 128MiB 3,3V 8-bit
nand: 128MiB, SLC, page size: 2048, OOB size: 64
Bad block table found at page 65472, version 0x01
Bad block table found at page 65408, version 0x01
nand_read_bbt: bad block at 0x000002860000
nand_read_bbt: bad block at 0x000002980000
nand_read_bbt: bad block at 0x000006d60000
5 cmdlinepart partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000020000-0x000000120000 : "u-boot"
0x000000120000-0x000000180000 : "env"
0x000000180000-0x000000580000 : "linux"
0x000000580000-0x0000005a0000 : "dtb"
0x0000005a0000-0x000008000000 : "rootfs"
gpmi-nand 8000c000.gpmi-nand: driver registered.
800f0000.ethernet supply phy not found, using dummy regulator
libphy: fec_enet_mii_bus: probed
rtc-ds1307 0-0068: rtc core: registered ds1339 as rtc0
stmp3xxx-rtc 80056000.rtc: rtc core: registered 80056000.rtc as rtc1
stmp3xxx_rtc_wdt stmp3xxx_rtc_wdt: initialized watchdog with heartbeat 19s
80010000.ssp supply vmmc not found, using dummy regulator
mxs-mmc 80010000.ssp: initialized
TCP: cubic registered
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
Key type dns_resolver registered
LCD POWER: disabling
CAN XCVR: disabling
usb1_vbus: disabling
regulator-dummy: disabling
rtc-ds1307 0-0068: setting system clock to 2014-06-14 16:44:21 UTC (1402764261)
fec 800f0000.ethernet eth0: Freescale FEC PHY driver [SMSC LAN8710/LAN8720] (mii_bus:phy_addr=800f0000.etherne:00, irq=-1)
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
libphy: 800f0000.etherne:00 - Link is Up - 100/Full
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending DHCP requests ., OK
IP-Config: Complete:
     device=eth0, hwaddr=00:0c:c6:7b:54:c3, ipaddr=192.168.1.103, mask=255.255.255.0, gw=192.168.1.1
     host=192.168.1.103, domain=home, nis-domain=(none)
     bootserver=0.0.0.0, rootserver=192.168.1.110, rootpath=
     nameserver0=192.168.1.1VFS: Mounted root (nfs filesystem) on device 0:13.
devtmpfs: mounted
Freeing unused kernel memory: 140K (c052b000 - c054e000)
Starting logging: OK
Populating /dev using udev: udevd[58]: starting version 1.7
random: udevd urandom read with 35 bits of entropy available
done
at25 spi32766.1: 8 KByte spi eeprom, pagesize 8192
CAN device driver interface
80032000.can supply xceiver not found, using dummy regulator
flexcan 80032000.can: device registered (reg_base=c89d4000, irq=212)
80034000.can supply xceiver not found, using dummy regulator
flexcan 80034000.can: device registered (reg_base=c89d8000, irq=213)
Loaded module digitalio Verion 1.0.2 iMX287   
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
input: gpio-keys.12 as /devices/soc0/gpio-keys.12/input/input0
ci_hdrc ci_hdrc.0: doesn't support gadget
ci_hdrc ci_hdrc.0: no supported roles
ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
Starting network...
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 3.14.6-apex ehci_hcd
usb usb1: SerialNumber: ci_hdrc.1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
ip: RTNETLINK answers: File exists
Getting initial time via ntp -> Setting initial time in hardware clock.
Starting network time protocol daemon: ntpd.
Starting dropbear sshd: OK
Starting inetd : OK
Starting network management services:.
Enabling CPU structure alignment fix
crond Started !
Sat Jun 14 16:44:29 CEST 2014
svc: failed to register lockdv1 RPC service (errno 111).
lockd_up: makesock failed, error=-111
Unable to handle kernel NULL pointer dereference at virtual address 00000030
pgd = c6d50000
[00000030] *pgd=46d71831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in: evdev ledtrig_oneshot ci_hdrc_imx usbmisc_imx ci_hdrc gpio_keys ehci_hcd digitalio(O) phy_mxs_usb flexcan can_dev
spidev spi_mxs
CPU: 0 PID: 112 Comm: mount Tainted: G           O 3.14.6-apex #1
task: c6c0a700 ti: c6d5c000 task.ti: c6d5c000
PC is at call_start+0x14/0x34
LR is at __rpc_execute+0x74/0x2c8
pc : [<c0387e6c>]    lr : [<c038fb10>]    psr: a0000013
sp : c6d5dc50  ip : 00000290  fp : 00000003
r10: c04b2275  r9 : 00000000  r8 : 000186b5
r7 : 00000001  r6 : 00000000  r5 : 00000000  r4 : c7b72e80
r3 : c0580ce0  r2 : 00000000  r1 : 00000007  r0 : c7b72e80
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 46d50000  DAC: 00000015
Process mount (pid: 112, stack limit = 0xc6d5c1c0)
Stack: (0xc6d5dc50 to 0xc6d5e000)
dc40:                                     c7b72e80 c7b72eb8 00000001 c7b72e80
dc60: c6d5dc84 00000000 00000001 c0389d28 c03e7308 00000400 c6d5dcc4 c0389db4
dc80: c6d5c000 00000000 00000000 c6d5dcc4 c03e7308 00000000 00000000 00000400
dca0: 00000000 c7978120 c057b8e0 c03972dc c7978120 00000000 c6d5dcc4 c0397994
dcc0: 00000000 c0580ce0 c6d5dcd4 c6d5dcb4 00000000 00000000 000186b5 00000001
dce0: 00000000 00000000 00000000 00000000 00000000 00000000 c048d159 00000001
dd00: c056255c c6d5c018 00000000 c057b8e0 000186b5 c0392958 00000000 c057b8e0
dd20: c057b8e0 ffffff91 c05b7a68 c057b8e0 c79cc060 c7bc7600 c7bc7910 c0392a30
dd40: c6c96e80 c01552fc c057b8e0 c057b8e0 00000003 c6d5dd94 c7bc8400 00000004
dd60: c6d5dec4 c0561650 c7bc7600 c0151e90 c6d5dd94 c057b8e0 00000003 00000006
dd80: c7bc7600 c7bc8400 c7bc6900 c012577c c6d5ddc4 c6cf62a0 c7bc7614 00000010
dda0: 00000006 00000003 00000000 c057b8e0 000800c0 c7bc8400 c7bc7800 c0126610
ddc0: c7457898 000002bc 00000af0 000002bc 00000003 c00aba00 00000000 c6cf6340
dde0: c7bc7910 00000010 c0561650 00000006 00000000 c057b8e0 c0561650 c0561650
de00: c6d5dec4 c7bc7800 00000010 000800c0 c7bc7910 c01395b8 c01395b0 c012eae8
de20: 00000000 00000000 c6cfa010 c6cf6400 00008000 c6c03380 c6d5de40 c0015254
de40: 00000000 a0000013 c78208d0 c744b3b8 c7457af0 00000017 c055b558 00000001
de60: c6d5de98 c6d5dec0 ffffff9c c6cf6400 00008000 00000000 00000000 00000000
de80: c6c7f06a c012fc94 c6c7f05c c6c7f05c 0000000e 000000d0 00000010 c0561650
dea0: c7bc7800 c6c03380 00008000 00000010 000800c0 c7bc7910 00000003 c01300e8
dec0: c6c03380 c012d810 c012d4e8 c7bc7800 00000000 c7bc6e40 c6c032c0 c7b87d20
dee0: c6c03380 c05610ac c6c7f000 c05610ac 00008000 c6c03380 00000003 c009b5e8
df00: c05610ac 00008000 c7b87d20 c6c03380 00008000 c00b2d28 c05610ac 00000020
df20: c055c91c 00008000 c6cf6400 c00b56b4 c6c7f000 00000000 c78208d0 c744b3b8
df40: 00000000 00000003 00000000 c6d5df60 c006aa74 00000000 c6cfa000 00008000
df60: bee2df5b c000e3c8 c6d5c000 00000000 00000003 c00b5a50 c6c7f000 c058aa9c
df80: 00000006 c6cf6400 c6c03380 c6c7f000 004d7008 bee2d958 bee2dc08 b6f074a0
dfa0: 00000015 c000e240 bee2d958 bee2dc08 bee2df5b bee2df7d bee2df57 00008000
dfc0: bee2d958 bee2dc08 b6f074a0 00000015 00000000 bee2d8ac 000af8f8 00000003
dfe0: b6e9915c bee2d804 0004a420 b6e9916c a0000010 bee2df5b 00000000 00000000
[<c0387e6c>] (call_start) from [<c038fb10>] (__rpc_execute+0x74/0x2c8)
[<c038fb10>] (__rpc_execute) from [<c0389d28>] (rpc_run_task+0xa4/0xb0)
[<c0389d28>] (rpc_run_task) from [<c0389db4>] (rpc_call_sync+0x80/0xb4)
[<c0389db4>] (rpc_call_sync) from [<c03972dc>] (rpcb_register_call+0x40/0x60)
[<c03972dc>] (rpcb_register_call) from [<c0397994>] (rpcb_register+0xc0/0xd4)
[<c0397994>] (rpcb_register) from [<c0392958>] (svc_unregister.isra.22+0xa8/0x118)
[<c0392958>] (svc_unregister.isra.22) from [<c0392a30>] (svc_rpcb_cleanup+0xc/0x18)
[<c0392a30>] (svc_rpcb_cleanup) from [<c01552fc>] (lockd_up+0x174/0x2c4)
[<c01552fc>] (lockd_up) from [<c0151e90>] (nlmclnt_init+0x20/0x90)
[<c0151e90>] (nlmclnt_init) from [<c012577c>] (nfs_start_lockd+0x88/0xac)
[<c012577c>] (nfs_start_lockd) from [<c0126610>] (nfs_create_server+0x1dc/0x398)
[<c0126610>] (nfs_create_server) from [<c01395b8>] (nfs3_create_server+0x8/0x2c)
[<c01395b8>] (nfs3_create_server) from [<c012eae8>] (nfs_try_mount+0x15c/0x190)
[<c012eae8>] (nfs_try_mount) from [<c01300e8>] (nfs_fs_mount+0x70c/0x798)
[<c01300e8>] (nfs_fs_mount) from [<c009b5e8>] (mount_fs+0x10/0xc0)
[<c009b5e8>] (mount_fs) from [<c00b2d28>] (vfs_kern_mount+0x48/0x10c)
[<c00b2d28>] (vfs_kern_mount) from [<c00b56b4>] (do_mount+0x7dc/0x940)
[<c00b56b4>] (do_mount) from [<c00b5a50>] (SyS_mount+0x84/0xb8)
[<c00b5a50>] (SyS_mount) from [<c000e240>] (ret_fast_syscall+0x0/0x2c)
Code: e590200c e5931014 e2811001 e5831014 (e5923030) 
---[ end trace 9fa102321834ecb3 ]---
Kernel panic - not syncing: Fatal exception


=============================================================================================
So I created a script in /etc/init.d that starts rpcbind.
The system boots properly (over nfs) when I started rpcbind.
So I guess rpcbind will need some post-hook install that creates this startup script in /etc/init.d.

PS :
When using portmap instead of the rpcbind package :

# mount -t nfs 192.168.1.110:/home/johan/srcmain /mnt/nfs
svc: failed to register lockdv1 RPC service (errno 97).

Strange,since the mount actually worked (I can access the files)

When using rpcbind instead of portmap there is no failed message.


Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Linux version 3.14.6-apex (root at debian605) (gcc version 4.8.3 (Buildroot 2014.08-git-00979-ge291b3f) ) #1 PREEMPT Sat Jun 14
14:05:17 CEST 2014
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine model: Ka-Ro electronics TX28 module
Memory policy: Data cache writeback
Kernel command line: init=/linuxrc console=ttyAMA0,115200 rw root=/dev/nfs nfsroot=192.168.1.110:/home/johan/srcmain
mtdparts=gpmi-nand:1m at 0x20000(u-boot),0x60000(env),4m(linux),128k(dtb),-(rootfs) ip=dhcp
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc052a6c4   (5258 kB)
      .init : 0xc052b000 - 0xc054ed10   ( 144 kB)
      .data : 0xc0550000 - 0xc0588de0   ( 228 kB)
       .bss : 0xc0588dec - 0xc05c43d8   ( 238 kB)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
NR_IRQS:16 nr_irqs:16 16
of_irq_init: children remain, but no parents
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns
Console: colour dummy device 80x30
Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x403b0c20 - 0x403b0c78
devtmpfs: initialized
pinctrl core: initialized pinctrl subsystem
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
Serial: AMBA PL011 UART driver
80074000.serial: ttyAMA0 at MMIO 0x80074000 (irq = 223, base_baud = 0) is a PL011 rev2
console [ttyAMA0] enabled
bio: create slab <bio-0> at 0
mxs-dma 80004000.dma-apbh: initialized
mxs-dma 80024000.dma-apbx: initialized
usb1_vbus: 5000 mV 
2P5V: 2500 mV 
3P3V: 3300 mV 
CAN XCVR: 3300 mV 
LCD POWER: 3300 mV 
LCD RESET: 3300 mV 
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
Switched to clocksource mxs_timer
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NetWinder Floating Point Emulator V0.97 (double precision)
futex hash table entries: 256 (order: -1, 3072 bytes)
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
jffs2: version 2.2. (NAND) (SUMMARY)  ?? 2001-2006 Red Hat, Inc.
msgmni has been set to 242
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
of_dma_request_slave_channel: dma-names property of node '/apb at 80000000/apbx at 80040000/serial at 80074000' missing or empty
uart-pl011 80074000.serial: no DMA platform data
8006c000.serial: ttyAPP1 at MMIO 0x8006c000 (irq = 221, base_baud = 1500000) is a 8006c000.serial
mxs-auart 8006c000.serial: Found APPUART 3.1.0
80070000.serial: ttyAPP3 at MMIO 0x80070000 (irq = 222, base_baud = 1500000) is a 80070000.serial
mxs-auart 80070000.serial: Found APPUART 3.1.0
brd: module loaded
loop: module loaded
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xf1
nand: Samsung NAND 128MiB 3,3V 8-bit
nand: 128MiB, SLC, page size: 2048, OOB size: 64
Bad block table found at page 65472, version 0x01
Bad block table found at page 65408, version 0x01
nand_read_bbt: bad block at 0x000002860000
nand_read_bbt: bad block at 0x000002980000
nand_read_bbt: bad block at 0x000006d60000
5 cmdlinepart partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000020000-0x000000120000 : "u-boot"
0x000000120000-0x000000180000 : "env"
0x000000180000-0x000000580000 : "linux"
0x000000580000-0x0000005a0000 : "dtb"
0x0000005a0000-0x000008000000 : "rootfs"
gpmi-nand 8000c000.gpmi-nand: driver registered.
800f0000.ethernet supply phy not found, using dummy regulator
libphy: fec_enet_mii_bus: probed
rtc-ds1307 0-0068: rtc core: registered ds1339 as rtc0
stmp3xxx-rtc 80056000.rtc: rtc core: registered 80056000.rtc as rtc1
stmp3xxx_rtc_wdt stmp3xxx_rtc_wdt: initialized watchdog with heartbeat 19s
80010000.ssp supply vmmc not found, using dummy regulator
mxs-mmc 80010000.ssp: initialized
TCP: cubic registered
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
Key type dns_resolver registered
LCD POWER: disabling
CAN XCVR: disabling
usb1_vbus: disabling
regulator-dummy: disabling
rtc-ds1307 0-0068: setting system clock to 2014-06-14 16:45:36 UTC (1402764336)
fec 800f0000.ethernet eth0: Freescale FEC PHY driver [SMSC LAN8710/LAN8720] (mii_bus:phy_addr=800f0000.etherne:00, irq=-1)
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
libphy: 800f0000.etherne:00 - Link is Up - 100/Full
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending DHCP requests ., OK
IP-Config: Complete:
     device=eth0, hwaddr=00:0c:c6:7b:54:c3, ipaddr=192.168.1.103, mask=255.255.255.0, gw=192.168.1.1
     host=192.168.1.103, domain=home, nis-domain=(none)
     bootserver=0.0.0.0, rootserver=192.168.1.110, rootpath=
     nameserver0=192.168.1.1VFS: Mounted root (nfs filesystem) on device 0:13.
devtmpfs: mounted
Freeing unused kernel memory: 140K (c052b000 - c054e000)
Starting logging: OK
Populating /dev using udev: udevd[58]: starting version 1.7
random: udevd urandom read with 34 bits of entropy available
done
at25 spi32766.1: 8 KByte spi eeprom, pagesize 8192
CAN device driver interface
80032000.can supply xceiver not found, using dummy regulator
flexcan 80032000.can: device registered (reg_base=c89d0000, irq=212)
80034000.can supply xceiver not found, using dummy regulator
flexcan 80034000.can: device registered (reg_base=c89dc000, irq=213)
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Starting portmap: input: gpio-keys.12 as /devices/soc0/gpio-keys.12/input/input0
ci_hdrc ci_hdrc.0: doesn't support gadget
ci_hdrc ci_hdrc.0: no supported roles
ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
done
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 3.14.6-apex ehci_hcd
usb usb1: SerialNumber: ci_hdrc.1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Loaded module digitalio Verion 1.0.2 iMX287   
Starting network...
ip: RTNETLINK answers: File exists
Getting initial time via ntp -> Setting initial time in hardware clock.
Starting network time protocol daemon: ntpd.
Starting dropbear sshd: OK
Starting inetd : OK
Starting network management services:.
Enabling CPU structure alignment fix
crond Started !
Sat Jun 14 16:45:44 CEST 2014
 
=======================================================
Welcome to the Linux environment.
=======================================================




Sagaert Johan
