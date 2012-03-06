From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 11:26:02 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <CABMxt4itAFJLs+qQXf9g5sKGUq7+S-uXJuzfHFiZ+_wRSSwo_g@mail.gmail.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
 <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
 <CABMxt4gYMf_JjfYi_2YttUL2NDNYC4974Kq_--++B2yPgf0xUg@mail.gmail.com>
 <CA+M6bXktYKXisQEiS11CNixozV7KtzwajKsXyTPNXSEOjxz3AA@mail.gmail.com>
 <CABMxt4hoihH2pJk5GZ6hpt0K3Vm_Qzg8eL1ej-bFH67DOSNUqA@mail.gmail.com>
 <CABMxt4jZhMcZS=0P9Le3ZHO_NUJJt0Deta_Ybdd-ghdPPuGz2A@mail.gmail.com>
 <CA+M6bXnNxFhzQpDOQhuSM7VKEh41dazMmUeEv=VTdVUuNoQhAw@mail.gmail.com>
 <CABMxt4ixVGvV_LvduJSNmWevxiEvFv0GdRHpomK325bKp4T20A@mail.gmail.com>
 <4F550BC3.80601@ti.com>
 <CABMxt4g9Xm6=QPhH1U2oDKVbXNjnPaxq_y71pUS4WF2LUG1RSw@mail.gmail.com>
 <20120306103333.45e7857d@skate>
 <CABMxt4h6GjQD7tWZtNE=vVbNgC1Kx-_uGWviSt9d14A_jAp3ug@mail.gmail.com>
 <20120306110159.3ef15a95@skate>
 <CABMxt4itAFJLs+qQXf9g5sKGUq7+S-uXJuzfHFiZ+_wRSSwo_g@mail.gmail.com>
Message-ID: <20120306112602.708a7430@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 6 Mar 2012 11:22:33 +0100,
Mohamed HAMZAOUI <requinham@gmail.com> a ?crit :

> I'm sorry for posting u-boot mailing list.

But please keep the Buildroot list in copy.

> After compiling a new compilation with Buildroot and with kernel
> 2.6.39.4 on Craneboard, i have a strange problem in booting the
> kernel "Kernel panic...".

Typically, your kernel panic below has absolutely nothing to do with
Buildroot. It's just the kernel that doesn't work properly on your
hardware platform. So:

 *) If your kernel comes from a vendor, contact the vendor for support

 *) If your kernel is the mainline kernel, then try with the latest
 stable version (2.9.39.4 is getting old), and if you still have the
 problem, contact the maintainers of your board inside the kernel.

For the Buildroot list subscribers, I'm keeping the kernel panic below.

> Registering the dns_resolver key type
> VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev
> 1 Unable to handle kernel NULL pointer dereference at virtual address
> 0000002a pgd = c0004000
> [0000002a] *pgd=00000000
> Internal error: Oops: 5 [#1]
> last sysfs file:
> Modules linked in:
> CPU: 0    Tainted: G        W    (2.6.39.4 #1)
> PC is at twl_i2c_read+0x38/0x11c
> LR is at omap3_twl_set_sr_bit+0x34/0x9c
> pc : [<c01edd94>]    lr : [<c000ff80>]    psr: 00000013
> sp : cf41df50  ip : 22222222  fp : 00000001
> r10: 00000000  r9 : 0000002a  r8 : 00000000
> r7 : 00000000  r6 : 00000001  r5 : c0491b08  r4 : c0482318
> r3 : 00000000  r2 : 00000006  r1 : cf41df8f  r0 : 00000015
> Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> Control: 10c5387d  Table: 80004019  DAC: 00000015
> Process swapper (pid: 1, stack limit = 0xcf41c2e8)
> Stack: (0xcf41df50 to 0xcf41e000)
> df40:                                     cf41df8f 00000006 c0446248
> c0446250
> df60: cf4203c0 c0482318 00000001 c003fbd0 00000000 00000000 00000000
> 00000000
> df80: 00000000 c000ff80 00000001 0000f472 00000000 c0482318 c000f664
> c0010034
> dfa0: c0482318 c000f670 c0028a58 c00343a0 c0032fd8 00003539 00000000
> c0030000
> dfc0: 00000013 c0028a58 c0028a9c c003fbd0 00000013 00000000 00000000
> 00000000
> dfe0: 00000000 c0008550 00000000 c00084c0 c003fbd0 c003fbd0 3b7fcee6
> f6b9b1b9
> [<c01edd94>] (twl_i2c_read+0x38/0x11c) from [<c000ff80>]
> (omap3_twl_set_sr_bit+0x34/0x9c)
> [<c000ff80>] (omap3_twl_set_sr_bit+0x34/0x9c) from [<c0010034>]
> (omap3_twl_init+0x4c/0x88)
> [<c0010034>] (omap3_twl_init+0x4c/0x88) from [<c000f670>]
> (omap2_common_pm_late_init+0xc/0x50)
> [<c000f670>] (omap2_common_pm_late_init+0xc/0x50) from [<c00343a0>]
> (do_one_initcall+0x94/0x164)
> [<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
> (kernel_init+0x90/0x13c)
> [<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
> (kernel_thread_exit+0x0/0x8)
> Code: e1a09080 e5d56008 e5953004 e2366001 (e7d32080)
> ---[ end trace 1b75b31a2719ed23 ]---
> Kernel panic - not syncing: Attempted to kill init!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
