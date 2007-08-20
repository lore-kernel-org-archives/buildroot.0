From: Benjamin Tietz <benjamin@micronet24.de>
Date: Mon, 20 Aug 2007 19:26:41 +0200
Subject: [Buildroot] How to change kernel version
In-Reply-To: <001201c7e291$2b8f5ee0$dcc4af0a@atmel.com>
References: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
	<001201c7e291$2b8f5ee0$dcc4af0a@atmel.com>
Message-ID: <20070820172641.GA4276@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 19, 2007 at 02:47:35PM +0200, Ulf Samuelsson wrote:
> ----- Original Message ----- 
> From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
> To: <buildroot@uclibc.org>
> Sent: Sunday, August 19, 2007 4:40 AM
> Subject: [Buildroot] How to change kernel version
> 
> 
> > Hi,
> > 
> >   I searched over the archives but I couldn't find anything about how
> > one could change the kernel version. The only available option for
> > AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> > drivers, so I would like to change it to 2.6.18 which actually works.
> > 
> > Kind Regards,
> >    Thiago A. Correa
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> 
> That is simple, you can't do it within buildroot!!!
Nope, it is possible, but thanks to ulf more difficult than necessary.

First you should edit buildroot/toolchain/kernel-headers/Config.in and
remove that "!BR2_avr32 &&" on the kernelversion you want to build.

Afterwards fetch the correct patchfile from www.avr32linux.org and save
it in the same dir buildroot/toolchain/kernel-headers under a name
like linux-2.6.18-avr32.patch

afterwards it should do, what you expect. I hope I didn't forget
anything.

best regards
Benjamin
