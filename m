From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:12:50 +0100
Subject: [Buildroot] [PATCH 01/12] arch: kill avr32
In-Reply-To: <20150214073707.12d1a361@free-electrons.com>
References: <cover.1423866603.git.yann.morin.1998@free.fr>
 <26bedb8c0497ac792a6bf89554e4178901d98d77.1423866603.git.yann.morin.1998@free.fr>
 <20150214073707.12d1a361@free-electrons.com>
Message-ID: <20150214091250.GB3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-14 07:37 +0100, Thomas Petazzoni spake thusly:
> On Fri, 13 Feb 2015 23:34:20 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/.defconfig b/.defconfig
> > index 77ab11a..585be55 100644
> > --- a/.defconfig
> > +++ b/.defconfig
> > @@ -6,7 +6,6 @@ BR2_HAVE_DOT_CONFIG=y
> >  # BR2_alpha is not set
> >  # BR2_arm is not set
> >  # BR2_armeb is not set
> > -# BR2_avr32 is not set
> >  # BR2_cris is not set
> >  # BR2_ia64 is not set
> >  BR2_i386=y
> > diff --git a/arch/Config.in b/arch/Config.in
> > index 890e7e2..6c8f328 100644
> > --- a/arch/Config.in
> > +++ b/arch/Config.in
> > @@ -53,21 +53,6 @@ config BR2_aarch64
> >  	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
> >  	  http://en.wikipedia.org/wiki/ARM
> >  
> > -config BR2_avr32
> > -	bool "AVR32"
> > -	select BR2_SOFT_FLOAT
> > -	# This architecture is obsolete and complicated to maintain to
> > -	# do the lack of upstream support in the major toolchain
> > -	# components. If you're interested by AVR32, contact the
> > -	# Buildroot community. Otherwise, its support will be removed
> > -	# by the 2015.02 release.
> > -	depends on BR2_DEPRECATED_SINCE_2014_08
> 
> Instead of moving things around, why not simply just add "depends on
> BR2_BROKEN" ?

OK, I'll respin shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
