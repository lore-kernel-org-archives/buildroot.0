From: =?iso-8859-1?Q?Cl=E9ment_Foucher?= <Clement.FOUCHER@unice.fr>
Date: Thu, 21 Jan 2010 16:49:10 +0100
Subject: [Buildroot] Buildroot for powerpc, no prompt + OpenSSH login
In-Reply-To: <20100121144349.GZ8970@buzzloop.caiaq.de>
References: <79757207E1944D98BC351422003B9ECF@gentiane>
	<20100121144349.GZ8970@buzzloop.caiaq.de>
Message-ID: <8798648820214450AE9B59CC54232F14@gentiane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops...
My bad ! I checked "generic serial port config", but forgot to select 
"ttyUL0" ;-P...
Thank you for your help.

Anyway, my second problem still doesn't work, can you help me with that?
I re-explain here:

When I try the to connect to the OpenSSH of my card, it does ask me for a 
password.
But root user doesn't have a password, I can login without it.

How to do? Should I connect with a different user? Is there a default 
password for SSH?

Thank you.


--------------------------------------------------
From: "Daniel Mack" <daniel@caiaq.de>
Sent: Thursday, January 21, 2010 3:43 PM
To: "Cl?mentFoucher" <Clement.FOUCHER@unice.fr>
Cc: <buildroot@busybox.net>
Subject: Re: [Buildroot] Buildroot for powerpc, no prompt + OpenSSH login

> On Thu, Jan 21, 2010 at 03:29:13PM +0100, Cl?ment Foucher wrote:
>> I'm using buildroot to create a filesystem for my Linux embedded on a 
>> Xilinx ml507 board (the processor is a PowerPC 440)
>> Before using buildroot, I used the default filesystem shipped with ELDK, 
>> and it worked, but I hadn't the default applications I needed 
>> (particularly OpenSSH).
>>
>> So I tried to create a filesystem including OpenSSH using buildroot. 
>> Then, when I launched the Linux, I saw all the startup messages, but 
>> never get the prompt that would allow me to enter commands on the 
>> console.
>>
>> I though that it could be a problem in the configuration of OpenSSH, so I 
>> retried with a standard configuration, just setting my architecture 
>> (powerpc/440) in xconfig, not adding any options, but I got the same 
>> problem.
>>
>> As a last test, I activated console information in order to force the 
>> getty to ttyUL0, witch is the port that I use for the console output (the 
>> one where I see the boot messages, that are correct), but it didn't 
>> changed anything.
>>
>> Here are the boot messages I got for the bare installation (without 
>> OpenSSH) :
>
> Your problem doesn't seem to be related to OpenSSH. There is just no
> getty being launched on your serial console. Assuming you're using the
> generic target, select BR2_TARGET_GENERIC_GETTY_TTYUL0 and rebuild, that
> should do the trick.
>
> HTH,
> Daniel
>
>
>
>> zImage starting: loaded at 0x00400000 (sp: 0x00576eb0)
>> Allocating 0x30f521 bytes for kernel ...
>> gunzipping (0x00000000 <- 0x0040d000:0x00575df1)...done 0x2f2028 bytes
>>
>> Linux/PowerPC load: console=ttyUL0 ip=134.59.157.61 root=/dev/xsa2 rw
>> Finalizing device tree... flat tree at 0x583300
>> Using Xilinx Virtex440 machine description
>> Linux version 2.6.31 (foucher at gentiane) (gcc version 4.2.2) #2 PREEMPT 
>> Thu Jan 2
>> 1 10:16:43 CET 2010
>> Zone PFN ranges:
>>   DMA      0x00000000 -> 0x00010000
>>   Normal   0x00010000 -> 0x00010000
>> Movable zone start PFN for each node
>> early_node_map[1] active PFN ranges
>>     0: 0x00000000 -> 0x00010000
>> MMU: Allocated 1088 bytes of context maps for 255 contexts
>> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 
>> 65024
>> Kernel command line: console=ttyUL0 ip=134.59.157.61 root=/dev/xsa2 rw
>> PID hash table entries: 1024 (order: 10, 4096 bytes)
>> Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
>> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
>> Memory: 256384k/262144k available (2868k kernel code, 5424k reserved, 
>> 120k data,
>>  113k bss, 128k init)
>> Kernel virtual memory layout:
>>   * 0xffffe000..0xfffff000  : fixmap
>>   * 0xfde00000..0xfe000000  : consistent mem
>>   * 0xfde00000..0xfde00000  : early ioremap
>>   * 0xd1000000..0xfde00000  : vmalloc & ioremap
>> NR_IRQS:512
>> clocksource: timebase mult[a00000] shift[22] registered
>> Console: colour dummy device 80x25
>> Mount-cache hash table entries: 512
>> NET: Registered protocol family 16
>> bio: create slab <bio-0> at 0
>> NET: Registered protocol family 2
>> IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
>> TCP established hash table entries: 8192 (order: 4, 65536 bytes)
>> TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
>> TCP: Hash tables configured (established 8192 bind 8192)
>> TCP reno registered
>> NET: Registered protocol family 1
>> ROMFS MTD (C) 2007 Red Hat, Inc.
>> msgmni has been set to 501
>> io scheduler noop registered
>> io scheduler anticipatory registered
>> io scheduler deadline registered
>> io scheduler cfq registered (default)
>> Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>> 84000000.serial: ttyUL0 at MMIO 0x84000003 (irq = 16) is a uartlite
>> console [ttyUL0] enabled
>> loop: module loaded
>> xsysace 83600000.sysace: Xilinx SystemACE revision 1.0.12
>> xsysace 83600000.sysace: capacity: 1019088 sectors
>>  xsa: xsa1 xsa2
>> Xilinx SystemACE device driver, major=254
>> Device Tree Probing 'ethernet'
>> xilinx_lltemac 81c00000.ethernet: MAC address is now  0: a:35:92:8f: 0
>> xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
>> XLlTemac: DCR address: 0x80
>> XLlTemac: buffer descriptor size: 32768 (0x8000)
>> XLlTemac: Allocating DMA descriptors with kmalloc
>> XLlTemac: (buffer_descriptor_init) phy: 0xf948000, virt: 0xcf948000, 
>> size: 0x800
>> 0
>> XTemac: PHY detected at address 7.
>> eth0: Dropping NETIF_F_SG since no checksum feature.
>> xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at 0x81C00000 mapped 
>> to 0xD
>> 1028000, irq=18
>> mice: PS/2 mouse device common for all mice
>> TCP cubic registered
>> NET: Registered protocol family 17
>> eth0: XLlTemac: Options: 0x3fa
>> eth0: XLlTemac: allocating interrupt 20 for dma mode tx.
>> eth0: XLlTemac: allocating interrupt 19 for dma mode rx.
>> eth0: XLlTemac: speed set to 1000Mb/s
>> eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
>> eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 254
>> IP-Config: Guessing netmask 255.255.0.0
>> IP-Config: Complete:
>>      device=eth0, addr=134.59.157.61, mask=255.255.0.0, 
>> gw=255.255.255.255,
>>      host=134.59.157.61, domain=, nis-domain=(none),
>>      bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
>> kjournald starting.  Commit interval 5 seconds
>> EXT3-fs warning: maximal mount count reached, running e2fsck is 
>> recommended
>> EXT3 FS on xsa2, internal journal
>> EXT3-fs: recovery complete.
>> EXT3-fs: mounted filesystem with writeback data mode.
>> VFS: Mounted root (ext3 filesystem) on device 254:2.
>> Freeing unused kernel memory:`Initializing random number generator... 
>> done.
>> Starting network...
>> ip: RTNETLINK answers: File exists
>>
>>
>>
>>
>> ... And it stops here.
>>
>> What should I do?
>>
>>
>>
>> As a second problem, when I tried the OpenSSH version, even if I couldn't 
>> have the prompt, I tried to connect to the OpenSSH of my card.
>> It seems to work correctly, but it ask me for a password. I though that 
>> there wasn't any password ?
>> I tried to log in as root and as default, but nothing worked.
>>
>> So is there a default password to log in?
>>
>>
>>
>>
>> Thank you.
>>
>>
>>
>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
