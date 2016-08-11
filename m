From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Aug 2016 00:02:18 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
 pi3-miniuart-bt overlay)
In-Reply-To: <20160609224613.20512846@free-electrons.com>
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
 <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
 <871t5jr7e6.fsf@dell.be.48ers.dk>
 <CAFGQKxeRKWNCOH2YV0FYA17tdfyeemv3Xau2Bkrzmrxh5Rm-4g@mail.gmail.com>
 <20160503210200.12d685a7@gmx.net>
 <20160609224613.20512846@free-electrons.com>
Message-ID: <20160812000218.46f5aa52@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 9 Jun 2016 22:46:13 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 3 May 2016 21:02:00 +0200, Peter Seiderer wrote:
> 
> > This works too, not sure whats the better solution, explicit via device tree overlay
> > or some firmware magic....
> > 
> > - pi3-miniuart-bt 'dmesg | grep tty':
> > [    0.000000] Kernel command line: 8250.nr_uarts=1 dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2709.boardrev=0xa02082 bcm2709.serial=0xa60340 smsc95xx.macaddr=B8:27:EB:A6:03:40 bcm2708_fb.fbswap=1 bcm2709.uart_clock=48000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> > [    0.001320] console [tty1] enabled
> > [    0.318181] 3f215040.uart: ttyS0 at MMIO 0x3f215040 (irq = 59, base_baud = 50000000) is a 16550
> > [    2.008162] 3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0) is a PL011 rev2
> > [    3.296233] console [ttyAMA0] enabled
> > 
> > - enable-uart=1, serial0 dmesg | grep tty':
> > [    0.000000] Kernel command line: 8250.nr_uarts=1 dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2709.boardrev=0xa02082 bcm2709.serial=0xa60340 smsc95xx.macaddr=B8:27:EB:A6:03:40 bcm2708_fb.fbswap=1 bcm2709.uart_clock=48000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyS0,115200
> > [    0.001318] console [tty1] enabled
> > [    0.318270] console [ttyS0] disabled
> > [    0.318389] 3f215040.uart: ttyS0 at MMIO 0x3f215040 (irq = 59, base_baud = 31250000) is a 16550
> > [    1.042714] console [ttyS0] enabled
> > [    3.020277] 3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0) is a PL011 rev2
> 
> For the Buildroot defconfig, I believe passing enable-uart=1 in
> config.txt would be the easiest solution. Could you send a patch that
> does this instead of messing with the overlays ?

Sorry for the delay, I tried the 'enable-uart=1' solution some time ago and it did not work (I think
I messed something up), retried today and it worked, patch will follow...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
