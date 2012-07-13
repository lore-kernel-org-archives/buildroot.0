From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 23:03:04 +0200
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <CAM1vXnbQ8PFkT7rDvhC5kVEUv4Nxserx8CTQUFZz8TnoXh7skg@mail.gmail.com>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
 <20120709161602.GG3783@tarshish>
 <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
 <20120710102910.GA4206@sapphire.tkos.co.il>
 <20120710144610.2d5599aa@skate>
 <20120710125411.GC4206@sapphire.tkos.co.il>
 <CAM1vXnbQ8PFkT7rDvhC5kVEUv4Nxserx8CTQUFZz8TnoXh7skg@mail.gmail.com>
Message-ID: <20120713230304.4576d10a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 10 Jul 2012 17:13:16 +0200,
Mihajlo Jovanovi? <jovanovic.mihajlo@gmail.com> a ?crit :

> However, just for testing purposes, I have launched qemu with
> "console=tty1" and then I got correct output in terminal window, whereas in
> Qemu window there was Tux and outputs were finished with "Starting
> network...". Probably the reason for that is discrepancy between specifying
> "tty1" in Qemu invocation, and at the same time selecting "ttyAMA0" in
> menuconfig

You're confusing two different things:

 (1) The console=ttyXX kernel parameter. This tells the kernel were to
     output its messages, i.e all the messages displayed by kernel
     drivers and subsystems.

 (2) The ttyXX on which the getty program is run. getty is the userspace
     program that implements the login prompt. In Buildroot, it is
     started directly by Busybox init, as specified in the /etc/inittab
     file. The option in System configuration -> Port to run getty on
     adjust this tty.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
