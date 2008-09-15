From: Hai Zaar <haizaar@haizaar.com>
Date: Mon, 15 Sep 2008 19:00:33 +0300
Subject: [Buildroot] 2.6.26 crashes on at91sam9260ek
Message-ID: <76d9e2a30809150900r5749d886r40425c5b8809b508@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day, list!
I've had at91sam9260ek board running find with 2.6.24.7. The binaries
were built using buildroot r22989 (snapshot from end of the Jul).
Several day ago I've updated to recent buildroot and switched to
kernel 2.6.26.3 (latest one advertised by buildroot menuconfig).

Does anyone have at91sam9260* board running with 2.6.26? Because my
2.6.26 kernel crashes on boot with the following messages:
====================================
Linux...................................................................................................
done, booting the kernel.
Linux version 2.6.26.3 (haizaar at homeless) (gcc version 4.3.1 (GCC) )
#1 Wed Sep 10 18:13:42 IDT 2008
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8128
Kernel command line: mem=32M console=ttyS0,115200
initrd=0x20410000,3145728 root=/dev/ram0 rw
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x30
console [ttyS0] enabled
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB = 32MB total
Memory: 26184KB available (2836K code, 221K data, 120K init)
Security Framework initialized
Capability LSM initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 192 bytes
NET: Registered protocol family 16
SCSI subsystem initialized
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.26.3 #1)
PC is at __rcu_process_callbacks+0x1bc/0x264
LR is at free_task+0x38/0x40
pc : [<c005c6b0>]    lr : [<c0035724>]    psr: 80000013
sp : c1c1ff38  ip : c1c1fef8  fp : c1c1ff54
r10: 00000000  r9 : c030feb0  r8 : 00000001
r7 : c030d6c0  r6 : 00000005  r5 : 00000000  r4 : c030fe74
r3 : 00000000  r2 : 00000033  r1 : 00000032  r0 : c1c07560
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 20004000  DAC: 00000017
Process ksoftirqd/0 (pid: 3, stack limit = 0xc1c1e268)
Stack: (0xc1c1ff38 to 0xc1c20000)
ff20:                                                       c1c2201c c030d73c
ff40: 00000001 00000006 c1c1ff64 c1c1ff58 c005c770 c005c504 c1c1ff94 c1c1ff68
ff60: c003c01c c005c768 c1c1ffac 60000013 00000000 c030d6c0 00000000 00000001
ff80: 00000000 00000000 c1c1ffac c1c1ff98 c003c11c c003bfc4 00000000 c1c1e000
ffa0: c1c1ffd4 c1c1ffb0 c003c198 c003c0e0 00000000 c1c1e000 00000000 c003c138
ffc0: 00000000 00000000 c1c1fff4 c1c1ffd8 c004a720 c003c148 00000000 00000000
ffe0: 00000000 00000000 00000000 c1c1fff8 c003a324 c004a6d4 cc33cc33 cc33cc33
Backtrace:
[<c005c4f4>] (__rcu_process_callbacks+0x0/0x264) from [<c005c770>]
(rcu_process_callbacks+0x18/0x38)
 r6:00000006 r5:00000001 r4:c030d73c
[<c005c758>] (rcu_process_callbacks+0x0/0x38) from [<c003c01c>]
(__do_softirq+0x68/0xd0)
[<c003bfb4>] (__do_softirq+0x0/0xd0) from [<c003c11c>] (do_softirq+0x4c/0x68)
[<c003c0d0>] (do_softirq+0x0/0x68) from [<c003c198>] (ksoftirqd+0x60/0xdc)
 r4:c1c1e000
[<c003c138>] (ksoftirqd+0x0/0xdc) from [<c004a720>] (kthread+0x5c/0x94)
 r8:00000000 r7:00000000 r6:c003c138 r5:00000000 r4:c1c1e000
[<c004a6c4>] (kthread+0x0/0x94) from [<c003a324>] (do_exit+0x0/0x614)
 r6:00000000 r5:00000000 r4:00000000
Code: e5943024 e3530000 099da870 e3a06000 (e5935000)
Kernel panic - not syncing: Fatal exception in interrupt
====================================

-- 
Zaar
