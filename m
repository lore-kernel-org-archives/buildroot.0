From: Benjamin Tietz <benjamin@micronet24.de>
Date: Tue, 21 Aug 2007 19:18:10 +0200
Subject: [Buildroot] How to change kernel version
In-Reply-To: <d6cda7730708201113q266f0ce4o37e25d073d9047ba@mail.gmail.com>
References: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
	<001201c7e291$2b8f5ee0$dcc4af0a@atmel.com>
	<20070820172641.GA4276@firebird.dresden.micronet24.de>
	<d6cda7730708201113q266f0ce4o37e25d073d9047ba@mail.gmail.com>
Message-ID: <20070821171810.GA4205@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2007 at 07:13:11PM +0100, Thiago A. Corr?a wrote:
> Thanks Benjamin. I tried with .20 but had build errors for some weird
> reason. Didn't try .18 that I know is working since I was told the
> minimum would be .19, but will give this a shot.
> 
> Right now I am trying to build the whole thing with .22, so I would
> only have to find a way to fix the kernel.

Another thing would be to use the git-repository of H. Skinnemoen
git://git.kernel.org/pub/scm/linux/kernel/git/hskinnemoen/avr32-2.6.git
making a (soft-)link from your build_avr32/linux-2.6.22 to the directory
you fetched this in, you only have to "touch .unpacked; touch .patched"
int that dir and you can use it via the buildroot-environment.

> 
> On 8/20/07, Benjamin Tietz <benjamin@micronet24.de> wrote:
> > On Sun, Aug 19, 2007 at 02:47:35PM +0200, Ulf Samuelsson wrote:
> > > ----- Original Message -----
> > > From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
> > > To: <buildroot@uclibc.org>
> > > Sent: Sunday, August 19, 2007 4:40 AM
> > > Subject: [Buildroot] How to change kernel version
> > >
> > >
> > > > Hi,
> > > >
> > > >   I searched over the archives but I couldn't find anything about how
> > > > one could change the kernel version. The only available option for
> > > > AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> > > > drivers, so I would like to change it to 2.6.18 which actually works.
> > > >
> > > > Kind Regards,
> > > >    Thiago A. Correa
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at uclibc.org
> > > > http://busybox.net/mailman/listinfo/buildroot
> > >
> > > That is simple, you can't do it within buildroot!!!
> > Nope, it is possible, but thanks to ulf more difficult than necessary.
> >
> > First you should edit buildroot/toolchain/kernel-headers/Config.in and
> > remove that "!BR2_avr32 &&" on the kernelversion you want to build.
> >
> > Afterwards fetch the correct patchfile from www.avr32linux.org and save
> > it in the same dir buildroot/toolchain/kernel-headers under a name
> > like linux-2.6.18-avr32.patch
> >
> > afterwards it should do, what you expect. I hope I didn't forget
> > anything.
> >
> > best regards
> > Benjamin
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
