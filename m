From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 May 2016 17:42:29 +0200
Subject: [Buildroot] [PATCH v2 2/4] toolchain: add bfin support
In-Reply-To: <20160528153349.7a4e1cee@free-electrons.com>
References: <20160513121557.GA30570@waldemar-brodkorb.de>
 <20160528153349.7a4e1cee@free-electrons.com>
Message-ID: <20160528154229.GI22609@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 13 May 2016 14:15:57 +0200, Waldemar Brodkorb wrote:
> 
> > -config BR2_GCC_TARGET_CPU
> > +config BR2_TARGET_CPU
> 
> This seems wrong. Why are you doing this?

In the first patch I disabled --with-cpu for gcc and bfin, as gcc
does not support --with-cpu on bfin. You could use
-mcpu=$(BR2_TARGET_CPU) to optimize code for a specific Bfin CPU,
that is the reason the second version of the patch renamed
the config symbols for a later use.
 
> > +	string "Target CPU"
> 
> And this?
> 
> >  	default bf606		if BR2_bf606
> >  	default bf607		if BR2_bf607
> >  	default bf608		if BR2_bf608
> > @@ -98,7 +99,7 @@ config BR2_GCC_TARGET_CPU
> >  	default bf549		if BR2_bf549
> >  	default bf561		if BR2_bf561
> >  
> > -config BR2_GCC_TARGET_CPU_REVISION
> > +config BR2_TARGET_CPU_REVISION
> 
> Ditto here.
> 
> At the very least, it needs to be explained in the commit log,
> including the impact on the Blackfin external toolchain support.

I thought it has no impact on the external toolchain.
Is BR2_GCC_TARGET_CPU used in any way for external toolchains?

> So you essentially broke this code by renaming the options.

Not broke, disabled it here my intention :=)
 
So how we go further with the internal Bfin toolchain stuff?

best regards
 Waldemar
