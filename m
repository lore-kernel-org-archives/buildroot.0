From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 15:11:14 +0200
Subject: [Buildroot] [noMMU] How to generate FLAT executable for busybox?
In-Reply-To: <CAFRkauBReYkcyUzaOdHk586wNm3vgP0Uaztv3vgvfvz608NidA@mail.gmail.com>
References: <1375076435.4630.2.camel@phoenix>
 <CAFRkauAXEpeZu6PNDvR2TiU9D=EidiaREJCFTjCP1BqrX0Y8zA@mail.gmail.com>
 <CAFRkauBReYkcyUzaOdHk586wNm3vgP0Uaztv3vgvfvz608NidA@mail.gmail.com>
Message-ID: <20130731151114.481b6485@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 31 Jul 2013 21:05:56 +0800, Axel Lin wrote:

> Just try to figure out if any platform can build FLAT executable.
> So I just tested build for blackfin (BR2_bfin).
> ( I don't have any customization for this blackfin build test,
> only run make menuconfig and select blackfin. Test with current git tree. )
> 
> I thought I should have a FLAT executable, however it produces ELF executable.
> $ file output/target/bin/busybox
> output/target/bin/busybox: setuid ELF 32-bit LSB executable, Analog
> Devices Blackfin, version 1 (SYSV), statically linked, stripped

Yeah, that's broken.

> BTW, I found BR2_ELF2FLT is invisible for BR2_bfin.
> 
> package/elf2flt/Config.in.host:
> config BR2_PACKAGE_HOST_ELF2FLT
>         bool "Enable elf2flt support?"
>         depends on BR2_arm || BR2_sh || BR2_sparc
> 
> Does this mean blackfin does not need elf2flt tool?

No, it means that the internal toolchain handling of FLAT binaries and
elf2flt is broken.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
