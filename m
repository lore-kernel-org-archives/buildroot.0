From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 23:12:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090113000541.GA32708@cloud.net.au>
References: <20090109063009.8E640768C5@busybox.osuosl.org>
	<87hc48rg53.fsf@macbook.be.48ers.dk>
	<20090113000541.GA32708@cloud.net.au>
Message-ID: <1232057562.4757.64.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-13 klockan 11:05 +1100 skrev Hamish Moffatt:
> On Fri, Jan 09, 2009 at 10:19:04AM +0100, Peter Korsgaard wrote:
> > >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> > 
> >  ulf> Author: ulf
> >  ulf> Date: 2009-01-09 06:30:08 +0000 (Fri, 09 Jan 2009)
> >  ulf> New Revision: 24729
> > 
> >  ulf> Log:
> >  ulf> Make sure U-boot is built, if we do make uImage
> > 
> >  ulf> Modified:
> >  ulf>    trunk/buildroot/target/linux/Config.in.advanced
> > 
> > 
> >  ulf> Changeset:
> >  ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
> >  ulf> ===================================================================
> >  ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2009-01-08 23:01:50 UTC (rev 24728)
> >  ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-09 06:30:08 UTC (rev 24729)
> >  ulf> @@ -464,6 +464,7 @@
> >  ulf>  config BR2_LINUX_BIN_UIMAGE
> >  ulf>  	bool "uImage"
> >  ulf>  	depends on BR2_PACKAGE_LINUX
> >  ulf> +	select BR2_TARGET_UBOOT
> > 
> > Silently selecting something as big and with so many configuration
> > options as U-Boot isn't that nice - I think it would be nicer to
> > depend on UBOOT instead.
> 
> Isn't it possible(likely?) that users would have their own U-Boot or
> have a pre-built one and don't need to compile it with buildroot, yet
> still want to generate uImages?
> 

This ensures that mkimage is built.

U-Boot is built as a separate item so you do not have to use 
the u-boot binary created by this build-rule.

I tried first to just generate mkimage, but that did not
work as expected, and this will, but I will probably 
go back and try it once other things with higher priority
is fixed.


BR
Ulf Samuelsson


> Hamish
