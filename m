From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 10:39:24 +0200
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
 <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
 <20140416095711.430764d9@skate>
 <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
Message-ID: <20140416103924.64cdc49f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 16 Apr 2014 17:12:01 +0900, Rohit Kumar wrote:

> > > i am using an ARM11 processor form Nexell (NXP2120)
> > > 32bit Embedded CPU : 700/800Mhz ARM1176 with
> > > 16KByte I-Cache, 16Kbyte D-cache with VFP(vector floating-point
> > processor)
> >
> > Ok.
> 
>  it is weird because when i use arm926t from the processor option, file
> system works.
> but as i shift to arm1176 it starts giving panic messages.

Ok, that is interesting. Did you compile your kernel with CONFIG_VFP=y ?

> > However, the kernel part of the configuration looks weird: it refers to
> > the kernel configuration file
> > board/atmel/at91sam9260ek/linux-3.9.config. Are you building a kernel
> > in Buildroot, but not using it for your platform?
> 
> i am not using kernel from the buildroot rather compiling the source i have
> with the toolchain generated.

Ok, but Buildroot is still building a kernel for you, so you're
spending time for nothing :)

> > Also, please enable CONFIG_DEBUG_USER=y in your kernel, and pass
> > user_debug=31 on your kernel command line. This should give more
> > details about the userspace crash.

Did you try this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
