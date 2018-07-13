From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Jul 2018 20:18:36 +0200
Subject: [Buildroot] Orange Pi Prime does not boot
In-Reply-To: <CAMty3ZC3rc7rZRtBZMnaQxP=kLJ9AnGWuoCsiV_bHa9UPQ=33g@mail.gmail.com>
References: <20695741531212798@myt3-12f13c3c6b95.qloud-c.yandex.net>
 <CAMty3ZC3rc7rZRtBZMnaQxP=kLJ9AnGWuoCsiV_bHa9UPQ=33g@mail.gmail.com>
Message-ID: <20180713201836.03884858@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Jul 2018 20:43:49 +0530, Jagan Teki <jagan@amarulasolutions.com> wrote:

> On Tue, Jul 10, 2018 at 2:23 PM,  <aai@tut.by> wrote:
> > Hello,
> >
> > orangepi_prime_defconfig does not work for me (try buildroot 2018.02.3 and 2018.05)
> >
> > I do:
> > make orangepi_prime_defconfig
> > make
> >
> > boot log:
> > --------------------------------------------------------------
> > Terminal ready
> >
> > U-Boot SPL 2017.11 (Jul 09 2018 - 10:12:15)
> > DRAM: 2048 MiB
> > Trying to boot from MMC1
> >
> >
> > U-Boot 2017.11 (Jul 09 2018 - 10:12:15 +0300) Allwinner Technology
> >
> > CPU:   Allwinner H5 (SUN50I)
> > Model: OrangePi Prime
> > DRAM:  2 GiB
> > MMC:   SUNXI SD/MMC: 0
> > *** Warning - bad CRC, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   No ethernet found.
> > starting USB...
> > USB0:   USB EHCI 1.00
> > USB1:   USB OHCI 1.0
> > scanning bus 0 for devices... 1 USB Device(s) found
> >        scanning usb for storage devices... 0 Storage Device(s) found
> > Hit any key to stop autoboot:  0
> > switch to partitions #0, OK
> > mmc0 is current device
> > Scanning mmc 0:1...
> > Found U-Boot script /boot.scr
> > reading /boot.scr
> > 277 bytes read in 14 ms (18.6 KiB/s)
> > ## Executing script at 4fc00000
> > reading Image
> > 17365504 bytes read in 870 ms (19 MiB/s)
> > reading sun50i-h5-orangepi-prime.dtb
> > 13714 bytes read in 25 ms (535.2 KiB/s)
> > ## Flattened Device Tree blob at 4fa00000
> >    Booting using the fdt blob at 0x4fa00000
> >    Loading Device Tree to 0000000049ff9000, end 0000000049fff591 ... OK

From Jagans boot log:

reading /boot.scr
277 bytes read in 15 ms (17.6 KiB/s)
## Executing script at 4fc00000
reading Image
16310784 bytes read in 820 ms (19 MiB/s)
reading sun50i-h5-orangepi-prime.dtb
13714 bytes read in 26 ms (514.6 KiB/s)
## Flattened Device Tree blob at 4fa00000
   Booting using the fdt blob at 0x4fa00000
   Loading Device Tree to 0000000049ff9000, end 0000000049fff591 ... OK

Jagan Image size: 16310784
aai Image size:   17365504

The only visible difference (besides not booting)...

Regards,
Peter


> >
> > Starting kernel ...
> > --------------------------------------------------------------  
> 
> It's booting fine with my side, here is full boot log[1]
> 
> [1] https://paste.ubuntu.com/p/mQsRxMrKnh/
> 
> Jagan.
> 
