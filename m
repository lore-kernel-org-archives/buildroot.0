From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 09:37:53 +0200
Subject: [Buildroot] AVR32  build broken.
In-Reply-To: <1190962428.5322.75.camel@elrond.atmel.sweden>
References: <1190854406.4933.78.camel@elrond.atmel.sweden>
	<20070927221216.GF20951@aon.at>
	<1190962428.5322.75.camel@elrond.atmel.sweden>
Message-ID: <1190965073.5322.89.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 08:53 +0200 skrev Ulf Samuelsson:
> fre 2007-09-28 klockan 00:12 +0200 skrev Bernhard Fischer:
> > On Thu, Sep 27, 2007 at 02:53:26AM +0200, Ulf Samuelsson wrote:
> > >The atngw100small also fails with the following error:
> > >
> > >configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
> > >make[2]: *** [configure-target-libiberty] Fel 1
> > >make[2]: *** Inv?ntar oavslutade jobb...
> > >make[1]: *** [all] Fel 2
> > >
> > >This is the same error you get when you try to build the ARM with
> > >softfloat.
> > 
> > I cannot reproduce this. I've double-checked that the sample arm926t
> > (integrator CP, IIRC) builds and works fine with and without softfloat
> > (after deleting that wrong uClibc-0.9.29-soft-fp.patch, of course).
> > 
> 
> soft-float patch now removed from trunk
> 
> > Can you reproduce this error with the provided defconfig in
> > target/device/ARM/integrator_whatever ?
> > 
> 
> 
> OK, Now I have built the integrator stuff as well,
> and it builds well with soft-float!
> Thanks for the tip.
> 
> The immediate difference I could see was
> that the integrator is built using "arm926ejs"
> instead of using "generic-arm" which I have used so far.
> I will try to rebuild the integrator modified for "generic-arm"
> and see how it goes.

Integrator still works with "generic-arm" instead of "arm926ejs"
Next thing to try is EABI instead of OABI.

Best Regards
Ulf Samuelsson

> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
