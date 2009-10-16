From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Fri, 16 Oct 2009 08:49:07 -0400
Subject: [Buildroot] NFS file system problem
Message-ID: <1D6034426110564DA0DEA9EE9793B38357C8B02E91@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
 
I can't seem to get Linux to mount an NFS root file system. It doesn't even attempt 
to try and mount it. It actually is mounting the resident file system which is what 
I'm trying to bypass. I'm pretty sure the bootargs passed from U-Boot are correct. 

Here's my output during bootup. Can anyone spot what is wrong?
 
thanks
/carl h.
 
===============================================================================
>Start AT91Bootstrap...


U-Boot 2009.03 (Apr 17 2009 - 16:16:19)

DRAM:  64 MB
DataFlash:AT45DB642
Nb pages:   8192
Page Size:   1056
Size= 8650752 bytes
Logical address: 0xD0000000
Area 0: D0000000 to D00041FF (RO) Bootstrap
Area 1: D0004200 to D00083FF      Environment
Area 2: D0008400 to D0041FFF (RO) U-Boot
Area 3: D0042000 to D0251FFF      Kernel
Area 4: D0252000 to D083FFFF      FS
In:    serial
Out:   serial
Err:   serial
Net:   macb0
macb0: Starting autonegotiation...
macb0: Autonegotiation complete
macb0: link up, 10Mbps half-duplex (lpa: 0x0021) Hit any key to stop autoboot:  0 ## Booting kernel from Legacy Image at 22000000 ...
   Image Name:   ILSKernel
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2618456 Bytes =  2.5 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux............................................................................................................................. done, booting the kernel.
Linux version 2.6.28 (root at ubuntu8041) (gcc version 4.2.4) #51 Wed Jun 17 16:57:45 EDT 2009
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256 Kernel command line: console=ttyS0,115200 root=/dev/nfs rw nfsroot=10.10.1.16:/home/heyendal/buildroot/buildroot-2009.08/project_build_arm/ILS_CM/root ip=10.10.1.8:10.10.1.16:10.10.1.1:255.255.252.0:cm_carlh::off
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
console [ttyS0] enabled
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes) Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 60864KB available (2384K code, 217K data, 1396K init) Calibrating delay loop... 99.12 BogoMIPS (lpj=495616) Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 288 bytes
NET: Registered protocol family 16
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes) TCP established hash table entries: 2048 (order: 2, 16384 bytes) TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048) TCP reno registered
NET: Registered protocol family 1
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (SUMMARY)  ?? 2001-2006 Red Hat, Inc.
msgmni has been set to 118
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
brd: module loaded
loop: module loaded
ssc ssc.0: Atmel SSC device at 0xc4878000 (irq 14) macb macb: invalid hw address, using random
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (b6:7b:db:9e:e8:55)
eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=ffffffff:00, irq=-1) Driver 'sd' needs updating - please use bus_type methods
usbmon: debugfs is not available
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver at91_ohci at91_ohci: AT91 OHCI at91_ohci at91_ohci: new USB bus registered, assigned bus number 1 at91_ohci at91_ohci: irq 20, io mem 0x00500000 usb usb1: configuration #1 chosen from 1 choice hub 1-0:1.0: USB hub found hub 1-0:1.0: 2 ports detected Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
input: gpio-keys as /class/input/input0
Registered led device: ds5
Registered led device: ds1
TCP cubic registered
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
IP-Config: Complete:
     device=eth0, addr=10.10.1.8, mask=255.255.252.0, gw=10.10.1.1,
     host=cm_carlh, domain=, nis-domain=(none),
     bootserver=10.10.1.16, rootserver=10.10.1.16, rootpath= Freeing init memory: 1396K
----------------------
 Starting init script
----------------------
----------------------
 Populating /dev
----------------------
----------------------
 Waiting for SD card
----------------------
eth0: link up (10/Half)
mount: mounting /dev/nfs on /newroot failed: No such file or directory
----------------------
 Running Embedded FW
----------------------
Starting network...
ip: RTNETLINK answers: File exists
No configuration file, assuming defaults Using Dynamic IP Addressing.
udhcpc (v1.13.4) started
Sending discover...
Sending discover...
Sending select for 10.10.1.8...
Lease of 10.10.1.8 obtained, lease time 2592000 deleting routers
route: SIOCDELRT: No such process
adding dns 10.10.0.2
Retrieving Application (network)  
 
