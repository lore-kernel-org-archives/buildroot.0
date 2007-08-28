From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 28 Aug 2007 02:29:20 +0100
Subject: [Buildroot] How to change kernel version
In-Reply-To: <1188212038.7840.14.camel@localhost.localdomain>
References: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
	<1188212038.7840.14.camel@localhost.localdomain>
Message-ID: <d6cda7730708271829t4385308ew5e2a08330ea9c73b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> >    I searched over the archives but I couldn't find anything about how
> > one could change the kernel version. The only available option for
> > AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> > drivers, so I would like to change it to 2.6.18 which actually works.
>
> You could also attack the problem with the 2.6.22 kernel. AFAIK the bug
> is not in the MMC driver, but the MMC core. A small change seems to
> correct the problem for AVR32.
>
> See this thread for patch and information:
>
> http://avr32linux.org/archives/kernel/2007-August/000240.html

Nope, this patch doesn't work on either of my sdcards, and have been
reported on avrfreaks as working just sometimes. One of them being the
one that came with the STK1000.

>
> Also, if your kernel is just booting too fast for the MMC layer to
> detect the partitions, adding "rootwait=1" to the bootargs in u-boot
> will let the kernel wait for the root partition to pop up.
>

There already :(

I'm hoping that 2.6.23-rc3 changes to MMC has fixed it. But
unfortunally using make menuconfig in buildroot and changing options
at the "Linux Experimental" does nothing at all (at least in AVR32)
