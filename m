From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 15 Jan 2013 22:06:08 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <20130115180130.121b22be@skate>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate>
 <004501cdf24a$009f6440$01de2cc0$@co.uk> <50F40BF3.5080106@relinux.de>
 <004b01cdf26d$ea1d2cb0$be578610$@co.uk> <20130114195101.12914c2d@skate>
 <002d01cdf30f$46f45890$d4dd09b0$@co.uk> <50F5568C.8060007@relinux.de>
 <000e01cdf338$69da6150$3d8f23f0$@co.uk> <20130115171413.5d2b64ab@skate>
 <F3FEF4CEAF2D432EB1B98EB89DC2CBBF@beraninstruments.com.local>
 <20130115180130.121b22be@skate>
Message-ID: <CAGm1_kv+pxpsUB72t0LGpF6K9+CHowZ6W_RRtSVNzrMpA0TefA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I thought Ted Wood has PC104 card like this one
http://www.peak-system.com/PCAN-PC-104.210.0.html?&L=1. The newest
kernel has support for PCAN PCI, PCIe and miniPCI, so I can imagine,
that this card is supported too. see drivers/net/can/sja1000/

Yegor

On Tue, Jan 15, 2013 at 6:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Will Moore,
>
> On Tue, 15 Jan 2013 16:58:11 -0000, Will Moore wrote:
>
>> I think CAN network support is mainline but
>> http://www.linuxdriverproject.org/mediawiki/index.php/Out_Of_Tree_Drivers#Contro
>> ller_Area_Network_.28CAN.2C_ISO_11898.29 suggests that the peak
>> system drivers are out of tree?  Or did I miss something?
>
> I don't know exactly what the mainline driver supports, but:
>
> $ ls drivers/net/can/usb/peak_usb/
> Makefile  pcan_usb.c  pcan_usb_core.c  pcan_usb_core.h  pcan_usb_pro.c  pcan_usb_pro.h
>
> $ cat drivers/net/can/usb/Kconfig
> [...]
> config CAN_PEAK_USB
>         tristate "PEAK PCAN-USB/USB Pro interfaces"
>         ---help---
>           This driver supports the PCAN-USB and PCAN-USB Pro adapters
>           from PEAK-System Technik (http://www.peak-system.com).
>
> (This is a 3.8-rc2 or -rc3 kernel, don't remember)
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
